unit Form.Pessoa;

interface

uses
  Http,
  Dtos,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Blue, Vcl.Menus, cxMaskEdit, cxTextEdit, cxLabel,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGroupBox, System.ImageList,
  Vcl.ImgList, cxImageList, dxActivityIndicator, Vcl.WinXPanels,
  dxLayoutContainer, cxClasses, dxLayoutControl;

type
  TFrmPessoa = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Bevel2: TBevel;
    BtnSalvar: TcxButton;
    BtnCancelar: TcxButton;
    cxLabel1: TcxLabel;
    EditNome: TcxTextEdit;
    cxLabel2: TcxLabel;
    EditSobrenome: TcxTextEdit;
    cxLabel3: TcxLabel;
    EditCep: TcxTextEdit;
    cxLabel4: TcxLabel;
    EditLogradouro: TcxTextEdit;
    BtnCep: TcxButton;
    cxLabel5: TcxLabel;
    EditNumero: TcxTextEdit;
    cxLabel6: TcxLabel;
    EditComplemento: TcxTextEdit;
    cxLabel7: TcxLabel;
    EditMunicipio: TcxTextEdit;
    cxLabel8: TcxLabel;
    EditBairro: TcxTextEdit;
    dxWait: TdxActivityIndicator;
    cxLabel9: TcxLabel;
    EditUF: TcxTextEdit;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EditCepKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCepClick(Sender: TObject);
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

procedure TFrmPessoa.BtnCepClick(Sender: TObject);
var
  LCep : TCepDto;
begin

  if ( Trim( Self.EditCep.Text ) <> EmptyStr ) then
  begin

    TThread.CreateAnonymousThread(
    procedure
    begin

      try
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dxWait.Parent  := Self.BtnCep;
          dxWait.Align   := TAlign.alClient;
          dxWait.Active  := True;
          dxWait.Visible := True;
        end);

        LCep := TCep.Get( Self.EditCep.Text );

        if ( LCep.StatusCode = 200 ) then
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            if LCep.Msg <> EmptyStr then
            begin
              MessageDlg('Falha de processamento interno - StatusCode: ' + LCep.StatusCode.ToString + #13+#10+#13+#10 +
              LCep.Msg, mtError, [mbOK], 0, mbOK );
            end;

            Self.EditLogradouro.Text  := LCep.Logradouro;
            Self.EditComplemento.Text := LCep.Complemento;
            Self.EditBairro.Text      := LCep.Bairro;
            Self.EditMunicipio.Text   := LCep.Municipio;
            Self.EditUF.Text          := LCep.UF;
          end);
        end else
        begin

          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            dxWait.Align   := TAlign.alNone;
            dxWait.Parent  := Self;
            dxWait.Active  := False;
            dxWait.Visible := False;
          end);

          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            MessageDlg('HTTP '+LCep.StatusCode.ToString+ LCep.Msg, mtError, [mbOK], 0, mbOK );
          end);

        end;

        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dxWait.Align   := TAlign.alNone;
          dxWait.Parent  := Self;
          dxWait.Active := False;
          dxWait.Visible := False;
          Self.EditLogradouro.SetFocus;
        end);

      except
        On E: Exception do
        begin
          TThread.Synchronize(TThread.CurrentThread,
          procedure
          begin
            MessageDlg('HTTP '+E.Message+ LCep.StatusCode.ToString, mtError, [mbOK], 0, mbOK );
            Exit;
          end);
        end;
      end;

    end).start;

  end;

end;

procedure TFrmPessoa.BtnSalvarClick(Sender: TObject);
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
      TcxTextEdit(Components[i]).Clear;

  end;

  dxWait.Active  := True;
  dxWait.Visible := False;
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
