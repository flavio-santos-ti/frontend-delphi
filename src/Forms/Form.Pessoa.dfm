object FrmPessoa: TFrmPessoa
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'FrmPessoa'
  ClientHeight = 356
  ClientWidth = 525
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 305
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 10
    DesignSize = (
      525
      51)
    Height = 51
    Width = 525
    object Bevel2: TBevel
      Left = 3
      Top = 3
      Width = 519
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 96
      ExplicitTop = 0
      ExplicitWidth = 50
    end
    object BtnSalvar: TcxButton
      Left = 438
      Top = 7
      Width = 82
      Height = 40
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      OnClick = BtnSalvarClick
    end
    object BtnCancelar: TcxButton
      Left = 345
      Top = 7
      Width = 82
      Height = 40
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Cancelar'
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      OnClick = BtnCancelarClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 26
    Top = 35
    Caption = 'Nome'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditNome: TcxTextEdit
    Left = 26
    Top = 57
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Text = 'EditNome'
    Height = 30
    Width = 126
  end
  object cxLabel2: TcxLabel
    Left = 159
    Top = 35
    Caption = 'Sobrenome'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditSobrenome: TcxTextEdit
    Left = 159
    Top = 57
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Text = 'EditSobrenome'
    Height = 30
    Width = 343
  end
  object cxLabel3: TcxLabel
    Left = 26
    Top = 88
    Caption = 'Cep'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditCep: TcxTextEdit
    Left = 26
    Top = 110
    AutoSize = False
    ParentFont = False
    Properties.MaxLength = 9
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Text = 'EditCep'
    OnKeyPress = EditCepKeyPress
    Height = 30
    Width = 103
  end
  object cxLabel4: TcxLabel
    Left = 169
    Top = 88
    Caption = 'Logradouro'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditLogradouro: TcxTextEdit
    Left = 169
    Top = 110
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Text = 'EditLogradouro'
    Height = 30
    Width = 333
  end
  object BtnCep: TcxButton
    Left = 127
    Top = 111
    Width = 29
    Height = 28
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      610000000B744558745469746C65005A6F6F6D3BCF09FEBC0000035A49444154
      785E7D936B4C1C7514C57F33BBB0BBBC7641046A2AD0D242B616ABB605D41462
      7996F8819268254693A6311AF41BA6180214A4055A959AC6588DB18FB0049342
      237DA821585B405AB1A948080F53A3B5B42C9447175876766699BF5308899F3C
      C9B92737B9E7E4DE0F1721C40A01D3C79F77EC38F54D5FFBD9B6FEFB67DB6F8A
      33E7FA27BF6AE9B950FB514B26100C486BF3D547DB015869720BF759BE7475D7
      B67D37A88EFE392516BD7E616045476E4F0AD7F9FEC0E1A6F39FEEC8C87500B2
      E1E1FDDA16D660FAA2F9DAE1CEEE31A16ACBE287BE7F44F5C95FC581DAABA2CA
      D04BBD7F0BEF922A5ABFFD4594D7B95A011B2095967F0D80FCC9C94BDBA31CF6
      83BBD236D2E41AA4F3C63D0AD2E229CE4B25608DA2A3D7CDF1D62172B2B6E270
      D85F2B39F0E11EC0E4F3F901904342EC155B926383AEDE9A60CAE3A766FF76E2
      9F70101F63E3796734492949B83D1A3FDD9CE099D44482ADF652204851140064
      1D9196B83E8A1F6F8DB3775722F37EC1AC6F9939839884618064E77A6E0C4FB2
      31218E40403C07981545E5C25BE9C89AA6AFB35ACD3C58505892830C73803925
      C0BCA61B5C263C44223A3204AFAA116C09C6AF6A9180E1D3305BACC88AE29F5A
      F269C6908D2BB73D8CCDAA3C547566D4004B0822224CE8928AC36165EEA11763
      F579004D0BA0EB3AF2C282B767E48F09763A63989D79C0A8C7CFC8829F2509C2
      C34D58424CDC754FB32DE9318686FFC2E75B1C00960D1845204FBAC74F5DECFC
      8DF4CD51C44698718FDFC32C544243C1A72A0C8EDE415AD6D8141B46C7C51E3C
      3313CD802684BE1220019637DEFDECF453290925050569FC7EDF38C3ED61DAD8
      22CE6E2525CEC106870D97EB32E18B6344DEF9BEFE83CBC34781C573FB5FD065
      40FDB9ABB9B4EFFAC089A6136D3AD3D3BCEC5CC77BBB9DE427C7B078779C63C7
      CE10ED1DA2B67433D9D9CF561CC9771E04425F39DD27AFFD810C583372DECECB
      2EAAE8CA2D3EA4E4141F12D945556A6661D9B56D19FB4A2AB3363474D7BF2AC4
      40A3B85EBF5754BF94DC08D8FFFB4C1260066C4038605F2561800588284B7FB2
      BEABB25088DE32D1539927EAF2B71E917617D5201020745851C12A044820B1DA
      5FE9689081B0779E8EAB28CCDA549E9F9380CB35E6E5FFD0F2FA4E1A3213A87B
      319E9A8CF8B55323DE4C7EBCEE78EE16AD714F6ACBBF059CA12764F2DBD90000
      000049454E44AE426082}
    TabOrder = 3
    OnClick = BtnCepClick
  end
  object cxLabel5: TcxLabel
    Left = 26
    Top = 143
    Caption = 'Numero'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditNumero: TcxTextEdit
    Left = 26
    Top = 165
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Text = 'EditNumero'
    Height = 30
    Width = 87
  end
  object cxLabel6: TcxLabel
    Left = 124
    Top = 143
    Caption = 'Complemento'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditComplemento: TcxTextEdit
    Left = 124
    Top = 165
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Text = 'EditComplemento'
    Height = 30
    Width = 169
  end
  object cxLabel7: TcxLabel
    Left = 26
    Top = 196
    Caption = 'Munic'#237'pio'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditMunicipio: TcxTextEdit
    Left = 26
    Top = 218
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Text = 'EditMunicipio'
    Height = 30
    Width = 408
  end
  object cxLabel8: TcxLabel
    Left = 304
    Top = 143
    Caption = 'Bairro'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditBairro: TcxTextEdit
    Left = 304
    Top = 165
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Text = 'EditBairro'
    Height = 30
    Width = 198
  end
  object dxWait: TdxActivityIndicator
    Left = 8
    Top = 282
    Width = 48
    Height = 44
    PropertiesClassName = 'TdxActivityIndicatorCircularDotsProperties'
  end
  object cxLabel9: TcxLabel
    Left = 449
    Top = 196
    Caption = 'UF'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditUF: TcxTextEdit
    Left = 449
    Top = 218
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 9
    Text = 'EditUF'
    Height = 30
    Width = 53
  end
end
