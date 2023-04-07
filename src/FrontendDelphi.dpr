program FrontendDelphi;

uses
  Vcl.Forms,
  Form.Main in 'Forms\Form.Main.pas' {FrmMain},
  Form.Login in 'Forms\Form.Login.pas' {FrmLogin},
  Storage in 'Storage\Storage.pas' {dm: TDataModule},
  Form.Pessoa in 'Forms\Form.Pessoa.pas' {FrmPessoa},
  Models in 'Models.pas',
  Http in 'Http.pas',
  djson in 'djson.pas',
  Vcl.Consts in 'Vcl.Consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
