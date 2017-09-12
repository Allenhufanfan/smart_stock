object Frm_stockhq: TFrm_stockhq
  Left = 390
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #32929#31080#34892#24773
  ClientHeight = 662
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl: TcxPageControl
    Left = 0
    Top = 0
    Width = 774
    Height = 642
    Align = alClient
    DockSite = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = cxTab_hq
    Properties.CustomButtons.Buttons = <>
    ExplicitHeight = 570
    ClientRectBottom = 638
    ClientRectLeft = 4
    ClientRectRight = 770
    ClientRectTop = 30
    object cxTab_hq: TcxTabSheet
      Caption = #33258#36873#32929#34892#24773
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      ExplicitHeight = 536
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 60
        Align = alTop
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object lbl: TLabel
          Left = 69
          Top = 18
          Width = 82
          Height = 14
          Caption = #34892#24773#21047#26032#39057#29575'/s'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object bbStart: TButton
          Left = 300
          Top = 14
          Width = 75
          Height = 25
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Caption = #24320#22987
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          OnClick = bbStartClick
        end
        object bbStop: TButton
          Left = 419
          Top = 14
          Width = 75
          Height = 25
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Caption = #20572#27490
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          OnClick = bbStopClick
        end
        object edt_fresh: TEdit
          Left = 172
          Top = 18
          Width = 97
          Height = 22
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Ctl3D = True
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '3'
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 60
        Width = 766
        Height = 324
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 476
        object Strgrid_stock: TStringGrid
          Left = 1
          Top = 1
          Width = 515
          Height = 322
          Align = alClient
          ColCount = 4
          DefaultColWidth = 90
          DefaultDrawing = False
          RowCount = 1
          FixedRows = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
          ParentFont = False
          TabOrder = 0
          OnClick = Strgrid_stockClick
          OnDrawCell = Strgrid_stockDrawCell
          ExplicitHeight = 474
        end
        object Panel6: TPanel
          Left = 516
          Top = 1
          Width = 249
          Height = 322
          Align = alRight
          TabOrder = 1
          ExplicitHeight = 474
          object lbl_stock: TLabel
            Left = 89
            Top = 2
            Width = 64
            Height = 19
            ParentCustomHint = False
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = #32929#31080#20195#30721
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
          end
          object StringGrid_wudang: TStringGrid
            Left = 26
            Top = 50
            Width = 198
            Height = 255
            ColCount = 3
            DefaultDrawing = False
            RowCount = 11
            TabOrder = 0
            OnDrawCell = StringGrid_wudangDrawCell
            RowHeights = (
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24
              24)
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 384
        Width = 766
        Height = 224
        Align = alBottom
        TabOrder = 2
        object EmbeddedWB1: TEmbeddedWB
          Left = 1
          Top = 1
          Width = 764
          Height = 222
          Align = alClient
          TabOrder = 0
          Silent = False
          RegisterAsBrowser = True
          ZoomPercent = 20
          DisableCtrlShortcuts = 'N'
          UserInterfaceOptions = [EnablesFormsAutoComplete, EnableThemes]
          About = ' EmbeddedWB http://bsalsa.com/'
          PrintOptions.HTMLHeader.Strings = (
            '<HTML></HTML>')
          PrintOptions.Orientation = poPortrait
          OnClick = EmbeddedWB1Click
          ExplicitLeft = 168
          ExplicitTop = 104
          ExplicitWidth = 300
          ExplicitHeight = 150
          ControlData = {
            4C000000F64E0000F21600000000000000000000000000000000000000000000
            000000004C000000000000000000000001000000E0D057007335CF11AE690800
            2B2E12620C000000000000004C0000000114020000000000C000000000000046
            8000000000000000000000000000000000000000000000000000000000000000
            00000000000000000100000000000000000000000000000000000000}
        end
      end
    end
    object cxTab_smart: TcxTabSheet
      Caption = #36873#32929#31574#30053
      ImageIndex = 1
      ExplicitHeight = 536
      object nbMain: TdxNavBar
        Left = 0
        Top = 0
        Width = 158
        Height = 608
        Align = alLeft
        Constraints.MinWidth = 120
        ActiveGroupIndex = -1
        TabOrder = 0
        View = 16
        ExplicitHeight = 536
      end
      object Panel1: TPanel
        Left = 158
        Top = 0
        Width = 608
        Height = 608
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        ExplicitHeight = 536
        object ListView1: TListView
          Left = 1
          Top = 1
          Width = 606
          Height = 541
          Align = alClient
          Columns = <
            item
            end
            item
            end>
          TabOrder = 0
          OnCustomDrawItem = ListView1CustomDrawItem
          ExplicitHeight = 469
        end
        object Panel2: TPanel
          Left = 1
          Top = 542
          Width = 606
          Height = 65
          Align = alBottom
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          ExplicitTop = 470
          object StaticText1: TStaticText
            Left = 81
            Top = 0
            Width = 521
            Height = 61
            Align = alClient
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = #24494#36719#38597#40657
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Transparent = False
          end
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 81
            Height = 61
            Align = alLeft
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Label1: TLabel
              Left = 0
              Top = 0
              Width = 81
              Height = 19
              ParentCustomHint = False
              Align = alTop
              Alignment = taCenter
              BiDiMode = bdLeftToRight
              Caption = #32508#21512#25104#21151#29575
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              ExplicitWidth = 65
            end
            object Label2: TLabel
              Left = 0
              Top = 19
              Width = 81
              Height = 42
              ParentCustomHint = False
              Align = alClient
              Alignment = taCenter
              BiDiMode = bdLeftToRight
              Color = clWhite
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = #24494#36719#38597#40657
              Font.Style = []
              ParentBiDiMode = False
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              ExplicitWidth = 7
              ExplicitHeight = 31
            end
          end
        end
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 642
    Width = 774
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = #28145#22323#25351#25968#65306
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = #19978#35777#25351#25968#65306
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = #21019#19994#26495#25351#65306
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'by hufan'
      end>
    PaintStyle = stpsOffice11
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitTop = 570
  end
  object IdHTTP1: TIdHTTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 664
    Top = 8
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu1
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 608
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 8
    object Exit1: TMenuItem
      Caption = #36864#20986
      ImageIndex = 2
      OnClick = Exit1Click
    end
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv3
    SSLOptions.SSLVersions = [sslvSSLv3]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 86
    Top = 109
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 89
    Top = 168
  end
end
