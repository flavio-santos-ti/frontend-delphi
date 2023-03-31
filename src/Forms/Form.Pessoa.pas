unit Form.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Blue, Vcl.Menus, cxMaskEdit, cxTextEdit, cxLabel,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGroupBox;

type
  TFrmPessoa = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Bevel2: TBevel;
    cxButton1: TcxButton;
    BtnCancelar: TcxButton;
    cxLabel1: TcxLabel;
    EditNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    EditSobrenome: TcxTextEdit;
    cxLabel3: TcxLabel;
    EditCep: TcxTextEdit;
    cxLabel4: TcxLabel;
    EditLogradouro: TcxTextEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditCepKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

{$R *.dfm}

procedure TFrmPessoa.BtnCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmPessoa.cxButton1Click(Sender: TObject);
begin

  Close;
end;

procedure TFrmPessoa.EditCepKeyPress(Sender: TObject; var Key: Char);
begin

 if Key = #8 then
      exit;

 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
 begin
   key := #0;
 end;

 if Length(EditCep.Text) = 5 then
 begin
   EditCep.Text := EditCep.Text + '-';
   EditCep.Selstart := Length(EditCep.text);
 end;


end;

procedure TFrmPessoa.FormActivate(Sender: TObject);
begin

  Self.EditNome.SetFocus;

end;

procedure TFrmPessoa.FormCreate(Sender: TObject);
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

end;

procedure TFrmPessoa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

  if ( Key = #27 )  then
  begin
    Self.BtnCancelarClick( Sender );
  end;

end;

end.
