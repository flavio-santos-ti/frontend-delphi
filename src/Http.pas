unit Http;

interface

uses
  Models,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.SysUtils,
  System.Classes,
  djson,
  System.JSON,

  Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TOperacao = ( Post, Put, Get );

type
  TCep = class
  public
    { Public declarations }
    class function Get( AValue: String ): TCepModel;
  end;

type
  TPessoa = class
  public
    { Public declarations }
    class procedure Get( ASource: TFDMemTable );
    class function Post( ARequestModel : TPessoaRequestCreateModel; ASource: TFDMemTable ): String;
    class function Delete( AId: Int64; ASource: TFDMemTable ): String;
    class function Put( ARequestModel : TPessoaRequestUpdateModel; ASource: TFDMemTable ): String;
  end;


implementation

{ TCep }

class function TCep.Get(AValue: String): TCepModel;
var
  LCep          : String;
  LEndPoint     : String;
  LJsonResponse : TStringStream;
  LHttpClient   : TNetHTTPClient;
  LServerResult : IHTTPResponse;
  LStatusCode   : Integer;
  LResponseStr  : String;
  LObj          : TJSONObject;
  LErro         : Boolean;
  LObjJSon      : TdJSON;
  LJSonValue : TJSonValue;
begin

  LCep := StringReplace(AValue, '-', '', [rfReplaceAll]);

  LEndPoint := 'https://viacep.com.br/ws/'+LCep+'/json/';

  LJsonResponse := TStringStream.Create('', TEncoding.UTF8);
  LHttpClient   := TNetHTTPClient.Create( Nil );

  LServerResult := LHttpClient.Get( LEndPoint, LJsonResponse  );
  LStatusCode := LServerResult.StatusCode;

  if ( LStatusCode = 200 ) then
  begin
    LResponseStr := LJsonResponse.DataString;

    LObj := TJSONObject.ParseJSONValue( LResponseStr ) as TJSONObject;

    if LObj.TryGetValue('erro', LErro ) then
    begin
      Result.StatusCode := LStatusCode;
      Result.Msg        := 'Houve uma falha de processamento na api ViaCep.';
      Exit;
    end;

    LObjJSon := TdJSON.Parse( LResponseStr );

    Result.StatusCode  := LStatusCode;
    Result.Logradouro  := LObjJSon['logradouro'].AsString;
    Result.Complemento := LObjJSon['complemento'].AsString;
    Result.Bairro      := LObjJSon['bairro'].AsString;
    Result.Municipio   := LObjJSon['localidade'].AsString;
    Result.UF          := LObjJSon['uf'].AsString;
  end else
  begin
    Result.StatusCode := LStatusCode;
    Result.Msg := 'Falha ao tentar consumir a API via CEP';
  end;

end;

{ TPessoa }

class function TPessoa.Delete(AId: Int64; ASource: TFDMemTable): String;
var
  LEndPoint     : String;
  LJsonResponse : TStringStream;
  LHttpClient   : TNetHTTPClient;
  LServerResult : IHTTPResponse;
  LStatusCode   : Integer;
  LPessoa       : TdJSON;
begin
  Result := EmptyStr;

  LEndPoint := 'http://localhost:5000/api/v1/Pessoa/'+AId.ToString;
  LJsonResponse := TStringStream.Create('', TEncoding.UTF8);

  LHttpClient   := TNetHTTPClient.Create( Nil );
  LHttpClient.ContentType := 'application/json';
  LHttpClient.AcceptEncoding := 'UTF-8';

  LServerResult := LHttpClient.Delete( LEndPoint, LJsonResponse );
  LStatusCode   := LServerResult.StatusCode;

  if ( LStatusCode = 500 ) then
  begin
    Result := 'Internal Server Error 500: '+#13+#10+#13+#10+ LEndPoint;
    Exit;
  end;

  if ( LStatusCode = 400 ) then
  begin
    Result := 'Bad Request 400: '+#13+#10+#13+#10 + LEndPoint +#13+#10+#13+#10+#13+#10;
    Exit;
  end;

  if ( LStatusCode = 200 ) then
  begin
    LPessoa := TdJSON.Parse( LJsonResponse.DataString );
    ASource.Delete;
  end;

end;

class procedure TPessoa.Get( ASource: TFDMemTable );
var
  LEndPoint     : String;
  LJsonResponse : TStringStream;
  LHttpClient   : TNetHTTPClient;
  LServerResult : IHTTPResponse;
  LStatusCode   : Integer;
  LResponseStr  : String;
  LObj          : TJSONObject;
  LErro         : Boolean;
  LPessoas      : TdJSON;
  LPessoa       : TdJSON;
  LObjJSon      : TdJSON;
begin

  LEndPoint := 'http://localhost:5000/api/v1/Pessoa';

  LJsonResponse := TStringStream.Create('', TEncoding.UTF8);
  LHttpClient   := TNetHTTPClient.Create( Nil );

  LServerResult := LHttpClient.Get( LEndPoint, LJsonResponse  );
  LStatusCode   := LServerResult.StatusCode;

  if ( LStatusCode = 200 ) then
  begin
    LResponseStr := LJsonResponse.DataString;

    LPessoas := TdJSON.Parse( LResponseStr );

    ASource.EmptyDataSet;

    try
      for LPessoa in LPessoas do
      begin
        with ASource do
        begin
          Append;
          FieldByName('Id').AsLargeInt        := LPessoa['id'].AsInt64;
          FieldByName('Nome').AsString        := LPessoa['nome'].AsString;
          FieldByName('Sobrenome').AsString   := LPessoa['sobrenome'].AsString;
          FieldByName('Cep').AsString         := LPessoa['cep'].AsString;
          FieldByName('Logradouro').AsString  := LPessoa['logradouro'].AsString;
          FieldByName('Numero').AsString      := LPessoa['numero'].AsString;
          FieldByName('Complemento').AsString := LPessoa['complemento'].AsString;
          FieldByName('Bairro').AsString      := LPessoa['bairro'].AsString;
          FieldByName('Municipio').AsString   := LPessoa['municipio'].AsString;
          FieldByName('UF').AsString          := LPessoa['uf'].AsString;
          FieldByName('DataInclusao').AsDateTime := LPessoa['dataInclusao'].AsDateTime;
          FieldByName('DataAlteracao').AsDateTime := LPessoa['dataAlteracao'].AsDateTime;
          Post;
        end;
      end;
    finally
      LPessoas.Free;
    end;

  end;

end;

class function TPessoa.Put(ARequestModel: TPessoaRequestUpdateModel; ASource: TFDMemTable): String;
var
  LEndPoint     : String;
  LObjJson      : TJSONObject;
  LJsonResponse : TStringStream;
  LJsonBody     : TStringStream;
  LHttpClient   : TNetHTTPClient;
  LServerResult : IHTTPResponse;
  LStatusCode   : Integer;
  LPessoa       : TdJSON;
begin

  Result := EmptyStr;

  LObjJson := TJSONObject.Create();
  LObjJson.AddPair(TJSONPair.Create('Id', TJSONNumber.Create( ARequestModel.Id )));
  LObjJson.AddPair(TJSONPair.Create('Nome', TJSONString.Create( ARequestModel.Nome )));
  LObjJson.AddPair(TJSONPair.Create('Sobrenome', TJSONString.Create( ARequestModel.Sobrenome )));
  LObjJson.AddPair(TJSONPair.Create('Cep', TJSONString.Create( ARequestModel.Cep )));
  LObjJson.AddPair(TJSONPair.Create('Logradouro', TJSONString.Create( ARequestModel.Logradouro )));
  LObjJson.AddPair(TJSONPair.Create('Numero', TJSONString.Create( ARequestModel.Numero )));
  LObjJson.AddPair(TJSONPair.Create('Complemento', TJSONString.Create( ARequestModel.Complemento )));
  LObjJson.AddPair(TJSONPair.Create('Bairro', TJSONString.Create( ARequestModel.Bairro )));
  LObjJson.AddPair(TJSONPair.Create('Municipio', TJSONString.Create( ARequestModel.Municipio )));
  LObjJson.AddPair(TJSONPair.Create('UF', TJSONString.Create( ARequestModel.UF )));

  LEndPoint := 'http://localhost:5000/api/v1/Pessoa';
  LJsonResponse := TStringStream.Create('', TEncoding.UTF8);
  LJsonBody     := TStringStream.Create( LObjJson.ToString , TEncoding.UTF8);
  LHttpClient   := TNetHTTPClient.Create( Nil );
  LHttpClient.ContentType := 'application/json';
  LHttpClient.AcceptEncoding := 'UTF-8';


  LServerResult := LHttpClient.Put( LEndPoint, LJsonBody, LJsonResponse  );
  LStatusCode   := LServerResult.StatusCode;

  if ( LStatusCode = 500 ) then
  begin
    Result := 'Internal Server Error 500: '+#13+#10+#13+#10+ LEndPoint;
    Exit;
  end;

  if ( LStatusCode = 400 ) then
  begin
    Result := 'Bad Request 400: '+#13+#10+#13+#10 + LEndPoint +#13+#10+#13+#10+#13+#10;
    Exit;
  end;

  if ( LStatusCode = 200 ) then
  begin
    LPessoa := TdJSON.Parse( LJsonResponse.DataString );

    with ASource do
    begin
      Edit;
      FieldByName('Id').AsLargeInt        := LPessoa['id'].AsInt64;
      FieldByName('Nome').AsString        := LPessoa['nome'].AsString;
      FieldByName('Sobrenome').AsString   := LPessoa['sobrenome'].AsString;
      FieldByName('Cep').AsString         := LPessoa['cep'].AsString;
      FieldByName('Logradouro').AsString  := LPessoa['logradouro'].AsString;
      FieldByName('Numero').AsString      := LPessoa['numero'].AsString;
      FieldByName('Complemento').AsString := LPessoa['complemento'].AsString;
      FieldByName('Bairro').AsString      := LPessoa['bairro'].AsString;
      FieldByName('Municipio').AsString   := LPessoa['municipio'].AsString;
      FieldByName('UF').AsString          := LPessoa['uf'].AsString;
      FieldByName('DataInclusao').AsDateTime := LPessoa['dataInclusao'].AsDateTime;
      FieldByName('DataAlteracao').AsDateTime := LPessoa['dataAlteracao'].AsDateTime;
      Post;
    end;
  end;


end;

class function TPessoa.Post(ARequestModel: TPessoaRequestCreateModel; ASource: TFDMemTable): String;
var
  LEndPoint     : String;
  LObjJson      : TJSONObject;
  LJsonResponse : TStringStream;
  LJsonBody     : TStringStream;
  LHttpClient   : TNetHTTPClient;
  LServerResult : IHTTPResponse;
  LStatusCode   : Integer;
  LPessoa       : TdJSON;
begin

  Result := EmptyStr;

  LObjJson := TJSONObject.Create();
  LObjJson.AddPair(TJSONPair.Create('Nome', TJSONString.Create( ARequestModel.Nome )));
  LObjJson.AddPair(TJSONPair.Create('Sobrenome', TJSONString.Create( ARequestModel.Sobrenome )));
  LObjJson.AddPair(TJSONPair.Create('Cep', TJSONString.Create( ARequestModel.Cep )));
  LObjJson.AddPair(TJSONPair.Create('Logradouro', TJSONString.Create( ARequestModel.Logradouro )));
  LObjJson.AddPair(TJSONPair.Create('Numero', TJSONString.Create( ARequestModel.Numero )));
  LObjJson.AddPair(TJSONPair.Create('Complemento', TJSONString.Create( ARequestModel.Complemento )));
  LObjJson.AddPair(TJSONPair.Create('Bairro', TJSONString.Create( ARequestModel.Bairro )));
  LObjJson.AddPair(TJSONPair.Create('Municipio', TJSONString.Create( ARequestModel.Municipio )));
  LObjJson.AddPair(TJSONPair.Create('UF', TJSONString.Create( ARequestModel.UF )));

  LEndPoint := 'http://localhost:5000/api/v1/Pessoa';
  LJsonResponse := TStringStream.Create('', TEncoding.UTF8);
  LJsonBody     := TStringStream.Create( LObjJson.ToString , TEncoding.UTF8);
  LHttpClient   := TNetHTTPClient.Create( Nil );
  LHttpClient.ContentType := 'application/json';
  LHttpClient.AcceptEncoding := 'UTF-8';


  LServerResult := LHttpClient.Post( LEndPoint, LJsonBody, LJsonResponse  );
  LStatusCode   := LServerResult.StatusCode;

  if ( LStatusCode = 500 ) then
  begin
    Result := 'Internal Server Error 500: '+#13+#10+#13+#10+ LEndPoint;
    Exit;
  end;

  if ( LStatusCode = 400 ) then
  begin
    Result := 'Bad Request 400: '+#13+#10+#13+#10 + LEndPoint +#13+#10+#13+#10+#13+#10;
    Exit;
  end;

  if ( LStatusCode = 200 ) then
  begin
    LPessoa := TdJSON.Parse( LJsonResponse.DataString );

    with ASource do
    begin
      Append;
      FieldByName('Id').AsLargeInt        := LPessoa['id'].AsInt64;
      FieldByName('Nome').AsString        := LPessoa['nome'].AsString;
      FieldByName('Sobrenome').AsString   := LPessoa['sobrenome'].AsString;
      FieldByName('Cep').AsString         := LPessoa['cep'].AsString;
      FieldByName('Logradouro').AsString  := LPessoa['logradouro'].AsString;
      FieldByName('Numero').AsString      := LPessoa['numero'].AsString;
      FieldByName('Complemento').AsString := LPessoa['complemento'].AsString;
      FieldByName('Bairro').AsString      := LPessoa['bairro'].AsString;
      FieldByName('Municipio').AsString   := LPessoa['municipio'].AsString;
      FieldByName('UF').AsString          := LPessoa['uf'].AsString;
      FieldByName('DataInclusao').AsDateTime := LPessoa['dataInclusao'].AsDateTime;
      FieldByName('DataAlteracao').AsDateTime := LPessoa['dataAlteracao'].AsDateTime;
      Post;
    end;
  end;

end;

end.
