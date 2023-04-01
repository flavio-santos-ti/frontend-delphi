unit Form.Main;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels,
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
  dxGDIPlusClasses, cxContainer;

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
    procedure FormActivate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HabilitaTela;
    procedure DesabilitaTela;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Form.Login, Storage.dm, Form.Pessoa;

procedure TFrmMain.BtnNovoClick(Sender: TObject);
begin

  if not Assigned( frmPessoa  ) then
  begin
    frmPessoa := TfrmPessoa.Create(self);
    FrmPessoa.Caption := 'Nova Pessoa';
    frmPessoa.ShowModal;
  end;

end;

procedure TFrmMain.BtnSairClick(Sender: TObject);
begin

  Self.DesabilitaTela;


end;

procedure TFrmMain.DesabilitaTela;
begin

  Self.GridPessoa.Visible := False;
  FrmMain.dxRibbonStatusBar1.Panels[0].Text := ' Usuário: Nenhum';

  Self.BtnNovo.Enabled    := False;
  Self.BtnExcluir.Enabled := False;
  Self.BtnAlterar.Enabled := False;
  Self.BtnSair.Enabled    := False;

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

procedure TFrmMain.HabilitaTela;
begin

  Self.BtnNovo.Enabled    := True;
  Self.BtnExcluir.Enabled := True;
  Self.BtnAlterar.Enabled := True;
  Self.BtnSair.Enabled    := True;

  Self.GridPessoa.Visible := True;
  FrmMain.dxRibbonStatusBar1.Panels[0].Text := ' Usuário: Flavio';

end;

end.
