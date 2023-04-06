unit Http;

interface

uses
  Dtos,
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
  TCep = class
  public
    { Public declarations }
    class function Get( AValue: String ): TCepDto;
  end;

type
  TPessoa = class
  public
    { Public declarations }
    class procedure Get( ASource: TFDMemTable );
  end;


implementation

{ TCep }

class function TCep.Get(AValue: String): TCepDto;
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

  end else
  begin

  end;

end;

end.
