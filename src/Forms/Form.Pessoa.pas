unit Form.Pessoa;

interface

uses
  Http,
  Models,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinVisualStudio2013Blue, Vcl.Menus, cxMaskEdit, cxTextEdit, cxLabel,
  Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxGroupBox, System.ImageList,
  Vcl.ImgList, cxImageList, dxActivityIndicator, Vcl.WinXPanels,
  dxLayoutContainer, cxClasses, dxLayoutControl
  ;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction );
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Operacao : TOperacao;
  end;

var
  FrmPessoa: TFrmPessoa;

implementation

{$R *.dfm}

uses Storage, Form.Main;

procedure TFrmPessoa.BtnCancelarClick(Sender: TObject);
begin

  Close;

end;

procedure TFrmPessoa.BtnCepClick(Sender: TObject);
var
  LCep : TCepModel;
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
var
  LPessoaCreate : TPessoaRequestCreateModel;
  LPessoaUpdate : TPessoaRequestUpdateModel;
  LMsgErro : String;
begin

  if ( Self.Operacao = Http.Post ) then
  begin
    with LPessoaCreate do
    begin
      Nome        := Self.EditNome.Text;
      Sobrenome   := Self.EditSobrenome.Text;
      Cep         := Self.EditCep.Text;
      Logradouro  := Self.EditLogradouro.Text;
      Numero      := Self.EditNumero.Text;
      Complemento := Self.EditComplemento.Text;
      Bairro      := Self.EditBairro.Text;
      Municipio   := Self.EditMunicipio.Text;
      UF          := Self.EditUF.Text;
    end;

    LMsgErro := Http.TPessoa.Post( LPessoaCreate, dm.fdmPessoa );

    if ( LMsgErro <> EmptyStr ) then
    begin
      MessageDlg('Falha de processamento interno - StatusCode: ' + LMsgErro
      , mtError, [mbOK], 0, mbOK );
      Exit;
    end;
  end else
  if ( Self.Operacao = Http.Put ) then
  begin
    with LPessoaUpdate do
    begin
      Id          := dm.fdmPessoa.FieldByName('Id').AsLargeInt;
      Nome        := Self.EditNome.Text;
      Sobrenome   := Self.EditSobrenome.Text;
      Cep         := Self.EditCep.Text;
      Logradouro  := Self.EditLogradouro.Text;
      Numero      := Self.EditNumero.Text;
      Complemento := Self.EditComplemento.Text;
      Bairro      := Self.EditBairro.Text;
      Municipio   := Self.EditMunicipio.Text;
      UF          := Self.EditUF.Text;
    end;

    LMsgErro := Http.TPessoa.Put( LPessoaUpdate, dm.fdmPessoa );

    if ( LMsgErro <> EmptyStr ) then
    begin
      MessageDlg('Falha de processamento interno - StatusCode: ' + LMsgErro
      , mtError, [mbOK], 0, mbOK );
      Exit;
    end;
  end;

  FrmMain.HabilitaTela;

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

  if Self.Operacao <> Http.Get then
    Self.EditNome.SetFocus;

end;

procedure TFrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
  FrmPessoa := Nil;

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


procedure TFrmPessoa.FormShow(Sender: TObject);
var
  i : Integer;
begin

  for i := 0 to ComponentCount -1 do
  begin

    if Self.Operacao = Http.Get then
    begin
      if Components[i] is TcxTextEdit then
        TcxTextEdit(Components[i]).Properties.ReadOnly := True;
    end;

  end;

  if Self.Operacao = Http.Get then
  begin
    Self.BtnCep.Enabled := False;
    Self.BtnCancelar.Visible := False;
    Self.BtnSalvar.Caption := 'Ok';
  end else
  begin
    Self.BtnCep.Enabled := True;
    Self.BtnCancelar.Visible := True;
    Self.BtnSalvar.Caption := 'Salvar';
  end;

  if Self.Operacao <> Http.Post then
  begin

    with dm.fdmPessoa do
    begin
      Self.EditNome.Text        := FieldByName('Nome').AsString;
      Self.EditSobrenome.Text   := FieldByName('Sobrenome').AsString;
      Self.EditCep.Text         := FieldByName('Cep').AsString;
      Self.EditLogradouro.Text  := FieldByName('Logradouro').AsString;
      Self.EditNumero.Text      := FieldByName('Numero').AsString;
      Self.EditComplemento.Text := FieldByName('Complemento').AsString;
      Self.EditBairro.Text      := FieldByName('Bairro').AsString;
      Self.EditMunicipio.Text   := FieldByName('Municipio').AsString;
      Self.EditUF.Text          := FieldByName('UF').AsString;
    end;

  end;

end;

end.
