object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Frontend Delphi'
  ClientHeight = 497
  ClientWidth = 777
  Color = 16774642
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 79
      Width = 777
      Height = 2
      Align = alBottom
      Shape = bsBottomLine
      ExplicitTop = 31
      ExplicitWidth = 687
    end
    object StaticText1: TStaticText
      Left = 29
      Top = 23
      Width = 226
      Height = 36
      Caption = 'Cadastro de Pessoas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
  object dxRibbonStatusBar1: TdxRibbonStatusBar
    Left = 0
    Top = 474
    Width = 777
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.SkinName = 'VisualStudio2013Blue'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object GridPessoa: TcxGrid
    Left = 0
    Top = 137
    Width = 777
    Height = 337
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    LookAndFeel.SkinName = 'VisualStudio2013Blue'
    object cxView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      FilterBox.CustomizeDialog = False
      FindPanel.InfoText = 'Digite o texto a pesquisar'
      FindPanel.ShowClearButton = False
      FindPanel.ShowCloseButton = False
      FindPanel.ShowFindButton = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = '<Nenhuma informa'#231#227'o encontrada>'
      OptionsView.DataRowHeight = 25
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 25
      Styles.Header = cxStyle1
      object cxViewId: TcxGridDBColumn
        DataBinding.FieldName = 'Id'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0000'
        HeaderAlignmentHorz = taCenter
        Width = 40
      end
      object cxViewNome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        Width = 90
      end
      object cxViewSobrenome: TcxGridDBColumn
        DataBinding.FieldName = 'Sobrenome'
        Width = 220
      end
      object cxViewCep: TcxGridDBColumn
        DataBinding.FieldName = 'Cep'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object cxViewLogradouro: TcxGridDBColumn
        DataBinding.FieldName = 'Logradouro'
        Width = 220
      end
      object cxViewNumero: TcxGridDBColumn
        DataBinding.FieldName = 'Numero'
        Width = 80
      end
      object cxViewComplemento: TcxGridDBColumn
        DataBinding.FieldName = 'Complemento'
        Width = 130
      end
      object cxViewBairro: TcxGridDBColumn
        DataBinding.FieldName = 'Bairro'
        Width = 150
      end
      object cxViewMunicipio: TcxGridDBColumn
        Caption = 'Munic'#237'pio'
        DataBinding.FieldName = 'Municipio'
        Width = 220
      end
      object cxViewUF: TcxGridDBColumn
        DataBinding.FieldName = 'UF'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 30
      end
      object cxViewDataInclusao: TcxGridDBColumn
        Caption = 'Data de cadastro'
        DataBinding.FieldName = 'DataInclusao'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
        HeaderAlignmentHorz = taCenter
        Width = 160
      end
      object cxViewDataAlteracao: TcxGridDBColumn
        Caption = #218'ltima altera'#231#227'o'
        DataBinding.FieldName = 'DataAlteracao'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
        HeaderAlignmentHorz = taCenter
        Width = 160
      end
    end
    object GridPessoaLevel1: TcxGridLevel
      GridView = cxView
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 777
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = -48
    ExplicitTop = 65
    object Bevel2: TBevel
      AlignWithMargins = True
      Left = 692
      Top = 3
      Width = 2
      Height = 48
      Align = alRight
      Shape = bsLeftLine
      ExplicitLeft = 313
      ExplicitTop = 0
      ExplicitHeight = 35
    end
    object Bevel3: TBevel
      AlignWithMargins = True
      Left = 100
      Top = 3
      Width = 2
      Height = 48
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 89
      ExplicitTop = 0
      ExplicitHeight = 35
    end
    object Bevel4: TBevel
      AlignWithMargins = True
      Left = 188
      Top = 3
      Width = 2
      Height = 48
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 194
      ExplicitTop = 0
      ExplicitHeight = 35
    end
    object Bevel5: TBevel
      AlignWithMargins = True
      Left = 276
      Top = 3
      Width = 2
      Height = 48
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 313
      ExplicitTop = 0
      ExplicitHeight = 35
    end
    object Bevel6: TBevel
      Left = 0
      Top = 54
      Width = 777
      Height = 2
      Align = alBottom
      Shape = bsBottomLine
      ExplicitTop = 31
      ExplicitWidth = 687
    end
    object Bevel7: TBevel
      AlignWithMargins = True
      Left = 364
      Top = 3
      Width = 2
      Height = 48
      Align = alLeft
      Shape = bsLeftLine
      ExplicitLeft = 375
      ExplicitTop = 0
    end
    object BtnSair: TcxButton
      Left = 697
      Top = 0
      Width = 80
      Height = 54
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Sai&r'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000001974455874536F6674776172650041646F626520496D616765526561
        647971C9653C00000011744558745469746C65005065726D697373696F6E3BAC
        69E97A0000028849444154785E7592CF4B545F18C69F73E79A4416042D84A471
        D2FA5A999506064509266A8BFA038A56D142088368910E522D0A5AB4FAE2A25C
        B48A4849B3DA2884440E5A5891639AE14859B471D4993BCEFD71CEB9A7F75C1D
        31B5030FCFE5E5BE9FE739976B2AA5A00F632C3092D974ADB54E194673D6762B
        6693734C70EFB3954EFD1FEB7BDE07C025A9DC9E89BF8F79B5E5765BD1CEA268
        E9EE3022BB8A20A4C4E897AF75C3231FEB00762FD6D7730B804D526B01A10B97
        AF34141616B694EFDB83896F0974F6BC82F025CA4A4B70F470056CDBB99E9A3F
        F96EECFD9B5E007C2D204F28A3AD341236C627A7D0D5F3A2DF5A98EBF0956F4C
        27A62FD59FAEAD8D1487597C6CBC1540FF8680B495292B290EE369F74BA4E693
        1DF1E1019DC40E56D718938944EDD9C67A28C6F602C8276105C0E86840C6B20A
        5CD781E3BAA0E5C1DC3D47E9B9B2AA122603A4945B3480560CA5949F6B600CDE
        6DECCDCFCB020351440F29DC283FF3534A1F424BF890E21378EC036E1EF191FE
        EF58D7C50743A700B83940283F2F74BCAAF921A0248903BE0B48926F03822417
        C933344EE1C99D47D5BAF16A00D5C1D252B26B65B9BDF33BB940D3B96D80A767
        0EE02CC2F364B043C20A40D785CC2C27F1E0E51FBF2C285F02A108E04E004203
        6C701E00D86A0093820022057836C09DA0414325B514BA992080A5E7A4ECC60D
        B806B8F304B0747A00793D9282921C3507A60047CF6D28D786E09BD6015850CB
        4B2E250917F1440693330E14A5C76780F2CD1694E70204F0B8B9FE0A1EF7A19C
        59026482F4FD3BB278DC6C826D2D0EBE8BFCED072D14C185285807100B19F7ED
        B3FBDD27B890E00413812BF2246846CE20E4764801A46D3E04C05B0D70CEB7C7
        1A977F5123D7EA1FAE480E6991843F444C7452F6AD885E0000000049454E44AE
        426082}
      OptionsImage.Layout = blGlyphTop
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnSairClick
    end
    object BtnNovo: TcxButton
      Left = 0
      Top = 0
      Width = 97
      Height = 54
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Novo'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000023744558745469746C65004164643B46696C653B41646446696C653B
        426172733B526962626F6E3B15DCAA0A000002E049444154785E65927F689555
        18C73FE7BDEFBDCDFD52BBCAC6AC3FC67E68615830DB168DB491DBAC086566B8
        612B35D655D141121B42E48FFE501B28669BD860FB4316CE864284DA2854C28A
        A9685413993437595DC7D6DDDAEEDEF73DE7E9EECD3B821D78CEF71C9E733E7C
        9F874701EAD0A99F7A14AC061004115080117F4766540C82C218F7FBBD91B272
        11310036A0C4C8EA0FB63D0F0002B387B9570E9EF86115A00066019E18109876
        34028800BE26210A0152420AED19E600B4A301D02290FC0C042C0502CA02E3E7
        66201680DADF550180E5033C0D08227E801226E27F71E9D6715A7BDEE6F0F9B5
        B47E5BC737D78FF1F4B22040A0697D37C6083EC0D506010C0AA5147F446FD0F6
        5D84901DA0BAE4431AD79D65434283B6CDCDE801229F9656D98134CB73CDFF1D
        8018884DFE49F7B583BCF94223E52B6A387FB593C6935B3877A583179757B0B1
        AC81F9E194F6773E2ECA3B50DBA32CC0725C8D08584AB8FA6B27CFE5AE21279C
        C368FC37EEDEEF636BE58984DE233A758B507A8CA2C2F28CB405A13D40C0F64B
        987560B8DD7F859AAA77F9BCFB10030F1E20C092AC4C3C2D34B79D263B2B8392
        E26C8C31AF033BFF2B41FB0E40C1586C84096ED27F7F906DAFB5B06FEB693C23
        EC4FE8F186AF181A1C6378FA471C47870165270188F85DB55506A3B128E90B27
        3976760B087C12F992A6CF3622C0FCC57146C727884FE991E41C589E0101DF66
        414E31BFDFF985C295634C7B717ABF7E824599F3F05CCDCA37061081A1BE2013
        31E722602C00ED6904782C6853595C4B6FEF20EEDFA96871487B7C92CD1F5591
        16FE07573B8C465DFAAE3B93C3F7C69B010D90FAD6FB1D976B779F914DBBCEC8
        919397E5687B8754EF79561ABE7846F65DCC97E69FF3129A27DB5B0A645DC372
        5DB2FEC95A20F4EA8EC2D9694C0516000B813090BDB464D14B2FD7E57655D6E7
        3FAC8C14C89AFAFC91559B73BB9E2A5B5C0ACC0354457D3E4A4448AEC44310B8
        D072573D0207937D0204701F8579E5BD3C01F817E1E75F4F0B44B2A300000000
        49454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnNovoClick
    end
    object BtnExcluir: TcxButton
      Left = 105
      Top = 0
      Width = 80
      Height = 54
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Excluir'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        6100000025744558745469746C650052656D6F76655069766F744669656C643B
        44656C6574653B52656D6F76653B768CC6910000020849444154785E85926B48
        935100860F855F53C8A01BA821A8350A216B35A2162D14095611D42A8A0505B2
        08D12E643F4A2BE8C6A08BA51526F647A83FC92408A21F927C4A971F1544422B
        8C925A48514841FFDECE03479A143978C6CB7B61DFBE738CFB4CB5786F36ADED
        07B4F326CF9D080C6D88FAA31D1705683C974D961BEF456C8D9F6D4FE9D7B33E
        101ACF6605F09FDCB398FCFE9A959D1F52CD1A4B5FD7584FBB7EFABD1AB97C56
        8F6A238380C623A343D76E6EB235EE5166A757875B334D75FADAD1A26FDD29FD
        E8BBADE1F3C7018D47263A74D9B8ADC9B3145A8A6EAD587AE5554342A3979AF4
        A5F3A4BEA7DB008D27323A74D9B8AD99E2FECB0C4B4957A8AAED79729B3E9DAE
        57F65C23A0854746C7753DB73580C8E7B1BA97851E3F4D6ED7C8D13ABD3FB40B
        D0C223A343D76D269C734157D5928127F50965538D7AB77F87DEEEDD02683C91
        D1A1FBD73DB85AB9D81FD813D7E713490DEF8B2BB37BA31EAC8B021A8F4C74E8
        4EB807178295FEC3ADEBF5F1C04E6512310DC56B74AF3AA26365C16B80C623A3
        43D76EFEDC8353E50BEFDEAF8DEAF5E66ABD8C45D4BB2AAC23A50B78616580C6
        23A343F74CF9A241B6C67DCD393C6FFE8D9E704877968774B0A482A32AB6CC02
        341E199DE6D2202F73AEDB1A6FFC1E341455B402DA1D55009CCECD8B9DE78D1F
        E134CB74F76B33D1846480CEC9A1904DEE4950CAC304B4F3FE950772F3DF1917
        4D283193A12E0000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnExcluirClick
    end
    object BtnAlterar: TcxButton
      Left = 193
      Top = 0
      Width = 80
      Height = 54
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Alterar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000002A744558745469746C6500436F6E746163743B436172643B496E666F
        3B44657461696C3B506572736F6E3B45646974E1B19358000002CD4944415478
        5E8D926D68950514C77FCF73EFDDDDD85CD2749BC16D88DB6D7A21175A1F4AC5
        B581A2CEC4F483F5218228661F221711ED83B516D134F08B4C1B66374D4A054B
        6C11B4DA1B342C6C8CB9BBC56A2FB77413692ABBCF7DEEF3728EAB8BBB1F84E8
        077F381CF8FFCFE1700C72E46AE03FFA0AE802000401E3D30B892EC3306AF91F
        88F8DD2FEE8ED501722F807FCCCF3744B90FBDBF3C7D7174336000B90D441514
        E6D31E5F7DDB47626C0A116175B4825DDB37611A060A14E607701C0130BADE79
        023BE564035CC747513C5F181EF903D7F50018FD6D126FCB5384824104C17595
        4879182054FFEECFFEB9C6356A02641C1755304D93F535D5F8BEFCAB9A471F21
        1408202A38E90C937DC7C9FBF139E28D6B5A81FCBDED2386091876C643145065
        6DAC7231A0BAAA025F05CBB298B97C82B0DD4BEDC12F59B7B1EAC0E19D91F781
        BC6C80EDA0A2789E30317D1D0055652A39C3DCAD3BCC2E980BDD3E5636B4E14E
        1CE1EFABBFA396FB3A100E02A46D175F95F69317F8F3AF1B28A0227C7DA91B73
        E226D16563ACDA7384F4481B97E3DD505AC6E48DE431C05BDC4004A693B38808
        E2FB38199B6DD1EB543E304274C17CE797F718E8F81EB7B884CF3FB972F2E8D0
        ED66C00E666FE022AA7CD4BA1F01BC8CC5F80F47294A25A8DED7CECD9E6606CF
        0FE02C5DCED9F860FCD478AA19B8F5C2436109026259E9AE032D9D750A88E7F1
        7895B076BE9F58533BD73A9B18BE748574E1839C3F331C3F3361BD0DCCED2BCB
        13D1DCAF878082AC288D6D78257EF1E30F34951CD0CE972BF48B5763BA27927F
        0A5801E401E6B325215E7A381F547551FD6D4F0294D6D4374D0FFDF49D7EF6E1
        5BDA525BA9BB56844F03E54020D1F134898E5A762E0DF05A65214172605B2E80
        3935FA6B64C333BD336EE67677B17FEDECEC7CA60F98DB5E1CF0DF68EAC90E04
        96149818AACA3DBE79F331761C1A0C0325800958400A70B61699AA0A0A840206
        AB4AC32C5F12E22EEA6E67219E18CBD10000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnAlterarClick
      ExplicitLeft = 209
      ExplicitTop = -4
    end
    object BtnVisualizar: TcxButton
      Left = 281
      Top = 0
      Width = 80
      Height = 54
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Visualizar'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000B744558745469746C65005A6F6F6D3BCF09FEBC0000031E49444154
        785E5D927D4CD56514C73FBFBB2B17EE1616662F1AADC65896DAD28C6B5B618E
        DDA5D692B5E9DD5A7FB8295191035B866EC4767B21B8542CF205AC01BA962F68
        775C823285340B7053181B866E603559C9205E065C2FF7F77B9ED3EDD9AE7F74
        B6EF39DB77E7F9EC9C3D071131FAE4CB9FA9AE3F0F60AD797A436AB0A67D4FC5
        BE337D95FB3BE73FF8FCF4E5F7422D7B573C919B06584A0BFF0FCB085C2B57AF
        4BFBB0F6F42FC7227D32F2F79468AD65E4AF493916E995B250EBAFD98FE67801
        ABB5C0472421AAEABB3B43877AA42AA11F2F0C4953F345F9FADB4B3236794B42
        4DBDF26AD959A93ED22BA31351693AD12345A50DEF036E11A1FDAD75B811D6EF
        7ECD07806DDBD436FC4960F393D4370F90917117EF6C7F9C9AB621EA5B07D9E6
        7F849E4B57B701155CA970B4D6B894D600CCC56CE6E33613535132167A191A99
        66D58A4C3470C7D2A5FC7E739AF4742FB1F9F87D808B781CA504971241044CC2
        22C52D8C8ECF90957927751D7FD0D81F47CDDCE4E1250B194BF873B3B3A300B7
        015A09602058968BC7B217D376A69F573666939D3ECBE46037990B66D9FA5C16
        27235D092FFA00E0B1D67E6C1980D61A1130B22CF2729733FECF04275BBAD8B8
        EA1E42053E9E5FB998E6E69F98BAD1CFE67B2F53FDC2F29D40EA96C62ECBE528
        4110348252E0F178D8B9DDCFFD8B526938FC0385C507A8FBAA05D7F8209BBC17
        C979F6219EF13D18FCC8BF6C0F90E656CA4C008201D90A523CA9BCB4C9C78B1B
        D6A01CC7ACE66887FEB0878EC877E4F9B37062B1F2902745B99280C2A25244C3
        B973DD14BCF92E9DE77B10CBCD85EE3E8A7695F3DBE030BE400103DA476B7880
        9CA7EE66515ACA6EF38D5A0B5A3482F0CDF153ECFFA292A3C7C3067CF444987D
        B5951C3C7404F7020F4B720384CF0E070F1CBC624F45E3A7DC5A69B488195534
        98894C5506A0940322C6570257AF4FD2786DAC866B639F02FFAD201880792004
        B6E6B3E3F562025BF211D1A6EE282C31BE5670FDC634C07CF5FA653375F9ABA3
        D61B656D52B5D79FBC8564248F0B536E7BC2DBC1EF39FCD9CB5E11B905E0B6ED
        584749B03DCF348B8524DBCD5D88A94920088EED74020A13F02F6091C585D250
        35850000000049454E44AE426082}
      OptionsImage.Layout = blGlyphTop
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
      TabOrder = 4
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = BtnVisualizarClick
      ExplicitLeft = 385
      ExplicitTop = -4
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'VisualStudio2013Blue'
    Left = 320
    Top = 128
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 11534656
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000053549444154785EB5957B4C53571CC75717B28D506DCB2DA8C1A95131
          214EF0BD6C7F287B245343742E3A1F0CD03ADC90A89BE886056A7779284AC507
          088AF860554185296CE8321C38662D828210DF031FD3888080149457BE3BBF9B
          9BA60C6935176FF2C939BFC739DFEFBD3DBDF70D0056FAB8643186430B376D3F
          5CB879C7110B4173CA51ADAF45005E0ABB0636E89387E9E2F66D3A9A5D80EA27
          9D3DA01CD5A8E7751918B0569B187FF65C296ED7B72323EB34749BD2089A0B39
          AA510FF5F6B7019966A5CE7FF7BE13B859FB0C6191DB316F51C8CEC143DE9D41
          D09C72544B493F01EAA535FD69C0292038A2F8EA030B76A566C2EF8BE5092C37
          82C1898CA01CD5A8877A694D7F1A7867F1B2704BE5DD662C0FD563D8F0B1E358
          CE99F1A688F3508F515E9A908DA01EEAA535FD69C0657EC03A945737824616AB
          6C7F6771AEFA5F8F4B7F1A90CF5DB81AA537EB4123C562DE418F7403B2F2F8C9
          7E3712A73DBAB57D1A5E055A436B690F29069CAE19A63CBA7F6C29DA6BCFA2BB
          F516BADB6A1C70075D963B787A3D1F35194BEA680F29069CAF6D998467F772D0
          D55CC6A86094DB877A5AAA1835A8371F04ED21C5804B559C0FDA1F64A1B3C184
          CEA64B56FE2A3881597382099A53CE86CBE8B6FC833A533A680F2906E415FC7B
          7876D788E7F7B2D0F1B8081D0D25E87C528A597383316DFA1282E694B322F434
          55E27EAE0EB487240397A2BCD076FB005A2A63D0766B1F9EFF9B87F6478598CD
          44DF9FEE4F084FA1A3EE02DA1F9F176A420F8B5BEE94E1D0C71F25A58DF5C48E
          C1EE3FF5F1B1B26FE062B8272C37F6A2C9FC3D9A4B7FC4D38A5858AEA7E2CF5F
          7662A69F06B3E72C4761DE5E764E4EA1AD3A53A8B5DE4C4757EB431484CEC66F
          E3C7E3AE568B7C3626BABBF164E2950C98C246C1529584C673DF8A84A0A97815
          9A4C61C8DEBD06C7773363177568366B855C4B793C3A1BAFA3CCB01E79DEE351
          C3C42BA74EA591E25E261C1A285E3D1C4FCB13D150B0AC1751DF0522724D208B
          3502CD257A7646AEA22476297299587544042E7A79215BA9C091491351A9D309
          F96D6E6AAB0987068A423CD05C9680BAD3FEA8CB5FD28379F30208216EFC5B8B
          F6FA2A98F9409CF4F6C6EDC8489899F871A512316A2EDDCFC5E5C3345FDFAC2B
          CCC4491F1F1844130E0D9C0D1E8227E61DCC8006B5B90B507B6A7E2FEA7E5FC1
          0EDD155CD0FB23C7C71B37A2A2503C6E1CFE183810296A0E8BE4F2494C47B950
          2E9F6C9C3841A8E74C6026D49C60C2EE7BE07490DBE3D2D84FD16032A0D1148B
          C6F3FC0BE96C7988D4D1A3714DA743213B70F90A85C061950A5B382EF907A5D2
          93468AA94E7DA963C6908893DD3761C2678396FEEACFD59F09E0608FA6EA72A4
          4D718571E448E428953825729291E1AA42929AA39162AA0B7DD1AEAAAD4CE32D
          BBDF02F1D33B82E1E9002FC694B8199F5C4EE3381C737545766F843CD5F52AD5
          36DADBD1139089269CC557AADC0E83A2930E6CCDCC2F42DAD721D8C3448EA8D5
          C8B48162CAEB954A1277A5BB7774065E16596C8A9137E61680AEB8E49FB147F3
          0D529858869B1B8C0C1A29DE6823DED7BFC01E2F148FDC96CEEFCF3E03BAE253
          0FA3A8A40214477F30DD9CCC44F7BBBB83469D42D14B5CAA0159585C12BFE768
          5E0F718A57466C4E64F561510A45A241A5EA435C9A01D9CAA8047E57464E0F71
          8A9785F124C631E4E2411B4CA3ADB85403B2A075B1BC21FD580F714D783C1685
          6A6DEF7400C3499C3B59C5251A907D191AC96F4E31F6105FBC464F450F3B772A
          22DD80D3E72B3658C50BCD15E0771EC4CCAF5619586DA0ED9DBE2E036FCF0C5A
          0B5B7C17ACB0BE541CCB4937408F57CDF010196AFBD8A51AF80F9940FAF78D94
          CE730000000049454E44AE426082}
      end>
  end
  object DataSource1: TDataSource
    DataSet = dm.fdmPessoa
    OnDataChange = DataSource1DataChange
    Left = 440
    Top = 216
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 384
    Top = 24
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
    end
  end
end
