program FrontendDelphi;

uses
  Vcl.Forms,
  Form.Main in 'Forms\Form.Main.pas' {FrmMain},
  Form.Login in 'Forms\Form.Login.pas' {FrmLogin},
  Storage.dm in 'Storage\Storage.dm.pas' {dm: TDataModule},
  Form.Pessoa in 'Forms\Form.Pessoa.pas' {FrmPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
