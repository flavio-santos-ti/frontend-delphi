unit Form.Main;

interface

uses
  Vcl.Dialogs,
  Http,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.WinXPanels,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC, cxClasses,
  dxSkinsForm, Data.DB, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  cxImageList, Vcl.StdCtrls, dxStatusBar, dxRibbonStatusBar, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLabel, cxCalendar, Vcl.Menus, cxButtons,
  dxGDIPlusClasses, cxContainer, cxCurrencyEdit;

type
  TFrmMain = class(TForm)
    dxSkinController1: TdxSkinController;
    cxImageList1: TcxImageList;
    Panel1: TPanel;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    DataSource1: TDataSource;
    GridPessoa: TcxGrid;
    cxView: TcxGridDBTableView;
    GridPessoaLevel1: TcxGridLevel;
    cxViewId: TcxGridDBColumn;
    cxViewNome: TcxGridDBColumn;
    cxViewSobrenome: TcxGridDBColumn;
    cxViewCep: TcxGridDBColumn;
    cxViewLogradouro: TcxGridDBColumn;
    cxViewNumero: TcxGridDBColumn;
    cxViewComplemento: TcxGridDBColumn;
    cxViewBairro: TcxGridDBColumn;
    cxViewMunicipio: TcxGridDBColumn;
    cxViewUF: TcxGridDBColumn;
    cxViewDataInclusao: TcxGridDBColumn;
    cxViewDataAlteracao: TcxGridDBColumn;
    Panel2: TPanel;
    BtnSair: TcxButton;
    Bevel2: TBevel;
    BtnNovo: TcxButton;
    Bevel3: TBevel;
    BtnExcluir: TcxButton;
    Bevel4: TBevel;
    BtnAlterar: TcxButton;
    Bevel5: TBevel;
    Bevel6: TBevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    BtnVisualizar: TcxButton;
    Bevel7: TBevel;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure DesabilitaButtons;
    procedure HabilitaButtons;
  public
    { Public declarations }
    procedure HabilitaTela;
    procedure DesabilitaTela;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Form.Login, Storage, Form.Pessoa;

procedure TFrmMain.BtnAlterarClick(Sender: TObject);
begin

  Self.DesabilitaButtons;

  if not Assigned( frmPessoa  ) then
  begin
    frmPessoa := TfrmPessoa.Create(self);
    FrmPessoa.Caption := 'Alteração Pessoa';
    FrmPessoa.Operacao := Http.Put;
    frmPessoa.ShowModal;
  end;

  Self.HabilitaButtons;

end;

procedure TFrmMain.BtnExcluirClick(Sender: TObject);
var
  LMsgErro : String;
begin

  Self.DesabilitaButtons;

  if MessageDlg('Deseja realmente excluir a pessoa ' + dm.fdmPessoa.FieldByName('Nome').AsString + '?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    LMsgErro := Http.TPessoa.Delete( dm.fdmPessoa.FieldByName('Id').AsLargeInt, dm.fdmPessoa );
  end;

  Self.HabilitaButtons;

end;

procedure TFrmMain.BtnNovoClick(Sender: TObject);
begin

  Self.DesabilitaButtons;

  if not Assigned( frmPessoa  ) then
  begin
    frmPessoa := TfrmPessoa.Create(self);
    FrmPessoa.Caption := 'Nova Pessoa';
    FrmPessoa.Operacao := Http.Post;
    frmPessoa.ShowModal;
  end;

  Self.HabilitaButtons;

end;

procedure TFrmMain.BtnSairClick(Sender: TObject);
begin

  Self.DesabilitaTela;


end;

procedure TFrmMain.BtnVisualizarClick(Sender: TObject);
begin

  Self.DesabilitaButtons;

  if not Assigned( frmPessoa  ) then
  begin
    frmPessoa := TfrmPessoa.Create(self);
    FrmPessoa.Caption := 'Alteração Pessoa';
    FrmPessoa.Operacao := Http.Get;
    frmPessoa.ShowModal;
  end;

  Self.HabilitaButtons;

end;

procedure TFrmMain.DataSource1DataChange(Sender: TObject; Field: TField);
begin

  Self.dxRibbonStatusBar1.Panels[1].Text := ' ' + dm.fdmPessoa.RecordCount.ToString + ' registro(s)';

end;

procedure TFrmMain.DesabilitaButtons;
begin
  Self.BtnNovo.Enabled    := False;
  Self.BtnExcluir.Enabled := False;
  Self.BtnAlterar.Enabled := False;
  Self.BtnSair.Enabled    := False;
end;

procedure TFrmMain.DesabilitaTela;
begin

  Self.GridPessoa.Visible := False;
  Self.dxRibbonStatusBar1.Panels[0].Text := ' Usuário: Nenhum';
  Self.dxRibbonStatusBar1.Panels[1].Text := EmptyStr;

  Self.BtnNovo.Enabled       := False;
  Self.BtnExcluir.Enabled    := False;
  Self.BtnAlterar.Enabled    := False;
  Self.BtnVisualizar.Enabled := False;
  Self.BtnSair.Enabled       := False;

  if not Assigned(frmLogin  ) then
  begin
    frmLogin := TfrmLogin.Create(self);
    frmLogin.ShowModal;
  end;

end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin

  Self.DesabilitaTela;

end;

procedure TFrmMain.HabilitaButtons;
begin

  Self.BtnNovo.Enabled       := True;
  Self.BtnExcluir.Enabled    := dm.fdmPessoa.RecordCount > 0;
  Self.BtnAlterar.Enabled    := dm.fdmPessoa.RecordCount > 0;
  Self.BtnVisualizar.Enabled := dm.fdmPessoa.RecordCount > 0;
  Self.BtnSair.Enabled    := True;
  Self.Refresh;

end;

procedure TFrmMain.HabilitaTela;
begin

  Self.GridPessoa.Visible := True;
  Self.dxRibbonStatusBar1.Panels[0].Text := ' Usuário: Flavio';
  Self.dxRibbonStatusBar1.Panels[1].Text := ' ' + dm.fdmPessoa.RecordCount.ToString + ' registro(s)';

  Self.HabilitaButtons;
end;

end.
