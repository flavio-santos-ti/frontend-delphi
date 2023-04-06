unit Form.Login;

interface

uses
  Vcl.Dialogs,
  Http,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinDevExpressStyle, dxBevel, cxGroupBox, Vcl.Menus, cxButtons,
  dxBarBuiltInMenu, cxPC, cxTextEdit, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, cxLabel, cxMaskEdit,
  cxButtonEdit, System.ImageList, Vcl.ImgList, cxImageList,
  dxSkinDevExpressDarkStyle, dxSkinVisualStudio2013Blue, dxGDIPlusClasses;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    cxGroupBox1: TcxGroupBox;
    Bevel2: TBevel;
    cxButton1: TcxButton;
    BtnSair: TcxButton;
    EditLogin: TcxTextEdit;
    EditSenha: TcxTextEdit;
    Timer1: TTimer;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure BtnSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Form.Main, Storage.dm;

procedure TFrmLogin.BtnSairClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TFrmLogin.cxButton1Click(Sender: TObject);
begin

  if ( Self.EditLogin.Text <> 'flavio' )  then
  begin
    MessageDlg('Usuário ou senha inválida', mtError, [mbOK], 0, mbOK );
    Self.EditLogin.SetFocus;
    Exit;
  end;

  if ( Self.EditSenha.Text <> 'flavio' )  then
  begin
    MessageDlg('Senha ou usuário inválido', mtError, [mbOK], 0, mbOK );
    Self.EditSenha.SetFocus;
    Exit;
  end;

  Http.TPessoa.Get(dm.fdmPessoa);

  FrmMain.HabilitaTela;

  Close;

end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
  FrmLogin := Nil;

end;

procedure TFrmLogin.FormCreate(Sender: TObject);
var
  i : Integer;
begin

  Vcl.Dialogs.UseLatestCommonDialogs := False;

  for i := 0 to ComponentCount -1 do
  begin

    if Components[i] is TcxTextEdit then
    begin
      TcxTextEdit(Components[i]).Clear;
    end;

  end;

  Self.Timer1.Enabled := True;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin

  if ( Key = #13 ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

  if ( Key = #27 )  then
  begin
    Self.BtnSairClick( Sender );
  end;

end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin

  Self.EditLogin.Text := 'flavio';
  Self.EditLogin.SetFocus;
  Self.Timer1.Enabled := False;

end;

end.
