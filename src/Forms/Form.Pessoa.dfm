object FrmPessoa: TFrmPessoa
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'FrmPessoa'
  ClientHeight = 362
  ClientWidth = 426
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
    Top = 311
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 0
    ExplicitTop = 258
    ExplicitWidth = 348
    DesignSize = (
      426
      51)
    Height = 51
    Width = 426
    object Bevel2: TBevel
      Left = 3
      Top = 3
      Width = 420
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 96
      ExplicitTop = 0
      ExplicitWidth = 50
    end
    object cxButton1: TcxButton
      Left = 339
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
      OnClick = cxButton1Click
      ExplicitLeft = 261
    end
    object BtnCancelar: TcxButton
      Left = 246
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
      ExplicitLeft = 168
    end
  end
  object cxLabel1: TcxLabel
    Left = 26
    Top = 25
    Caption = 'Nome'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditNome: TcxTextEdit
    Left = 26
    Top = 45
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Text = 'EditNome'
    Height = 25
    Width = 126
  end
  object cxLabel2: TcxLabel
    Left = 159
    Top = 25
    Caption = 'Sobrenome'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditSobrenome: TcxTextEdit
    Left = 159
    Top = 45
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Text = 'EditSobrenome'
    Height = 25
    Width = 241
  end
  object cxLabel3: TcxLabel
    Left = 26
    Top = 76
    Caption = 'Cep'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditCep: TcxTextEdit
    Left = 26
    Top = 95
    AutoSize = False
    ParentFont = False
    Properties.MaxLength = 9
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Text = 'EditCep'
    OnKeyPress = EditCepKeyPress
    Height = 25
    Width = 103
  end
  object cxLabel4: TcxLabel
    Left = 138
    Top = 75
    Caption = 'Logradouro'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object EditLogradouro: TcxTextEdit
    Left = 138
    Top = 95
    AutoSize = False
    ParentFont = False
    Style.BorderStyle = ebsOffice11
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Text = 'EditLogradouro'
    Height = 25
    Width = 262
  end
end
