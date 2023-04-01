object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 309
  ClientWidth = 348
  Color = 16774642
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 348
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 79
      Width = 348
      Height = 2
      Align = alBottom
      Shape = bsBottomLine
      ExplicitTop = 31
      ExplicitWidth = 687
    end
    object StaticText1: TStaticText
      Left = 25
      Top = 17
      Width = 123
      Height = 36
      Caption = 'Bem Vindo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 258
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    DesignSize = (
      348
      51)
    Height = 51
    Width = 348
    object Bevel2: TBevel
      Left = 3
      Top = 3
      Width = 342
      Height = 2
      Align = alTop
      Shape = bsTopLine
      ExplicitLeft = 96
      ExplicitTop = 0
      ExplicitWidth = 50
    end
    object cxButton1: TcxButton
      Left = 261
      Top = 7
      Width = 82
      Height = 40
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Entrar'
      LookAndFeel.NativeStyle = False
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      OnClick = cxButton1Click
    end
    object BtnSair: TcxButton
      Left = 168
      Top = 7
      Width = 82
      Height = 40
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Sai&r'
      LookAndFeel.NativeStyle = False
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      OnClick = BtnSairClick
    end
  end
  object EditLogin: TcxTextEdit
    Left = 51
    Top = 125
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
    Text = 'EditLogin'
    Height = 25
    Width = 241
  end
  object EditSenha: TcxTextEdit
    Left = 51
    Top = 188
    AutoSize = False
    ParentFont = False
    Properties.EchoMode = eemPassword
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
    TabOrder = 3
    Text = 'EditSenha'
    Height = 25
    Width = 241
  end
  object cxLabel1: TcxLabel
    Left = 51
    Top = 105
    Caption = 'Usu'#225'rio'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 51
    Top = 168
    Caption = 'Senha'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 24
    Top = 264
  end
end
