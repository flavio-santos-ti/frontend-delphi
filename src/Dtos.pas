unit Dtos;

interface

type
  TPessoaDto = record
    StatusCode      : Integer;
    Msg             : String;
    Id              : Int64;
    Nome            : String;
    Sobrenome       : String;
    NomeCompleto    : String;
    Cep             : String;
    Logradouro      : String;
    Numero          : String;
    Complemento     : String;
    Bairro          : String;
    Municipio       : String;
    UF              : String;
    DataInclusaoStr : String;
    DataAlteracao   : TDateTime;
  end;

type
  TCepDto = record
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
