unit Http;

interface

uses
  Dtos,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.SysUtils,
  System.Classes,
  djson;

type
  TCep = class
  public
    { Public declarations }
    class function Get( AValue: String ): TCepDto;
  end;


implementation

{ TCep }

class function TCep.Get(AValue: String): TCepDto;
var
  LCep        : String;
  LRequest    : TNetHTTPClient;
  LServer     : IHTTPResponse;
  LJson       : TStringStream;
  LEndPoint   : String;
  LStatusCode : Integer;
  LResponse   : String;
  LObjJSon    : TdJSON;
begin

  LCep := StringReplace(AValue, '-', '', [rfReplaceAll]);

  LEndPoint := 'https://viacep.com.br/ws/'+LCep+'/json/';

  LJson    := TStringStream.Create('', TEncoding.UTF8);
  LRequest := TNetHTTPClient.Create( Nil );

  LServer := LRequest.Get( LEndPoint, LJson  );
  LStatusCode := LServer.StatusCode;

  if ( LStatusCode = 200 ) then
  begin
    LResponse := LJson.DataString;
    LObjJSon := TdJSON.Parse( LResponse );
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

end.
