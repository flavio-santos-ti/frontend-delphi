unit Models;

interface

type
  TPessoaRequestCreateModel = record
    Nome        : String;
    Sobrenome   : String;
    Cep         : String;
    Logradouro  : String;
    Numero      : String;
    Complemento : String;
    Bairro      : String;
    Municipio   : String;
    UF          : String;
  end;

type
  TPessoaRequestUpdateModel = record
    Id          : Int64;
    Nome        : String;
    Sobrenome   : String;
    Cep         : String;
    Logradouro  : String;
    Numero      : String;
    Complemento : String;
    Bairro      : String;
    Municipio   : String;
    UF          : String;
  end;

type
  TCepModel = record
    StatusCode      : Integer;
    Msg             : String;
    Cep             : String;
    Logradouro      : String;
    Complemento     : String;
    Bairro          : String;
    Municipio       : String;
    UF              : String;
  end;


implementation

end.
