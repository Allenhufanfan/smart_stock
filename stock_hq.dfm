object Frm_stockhq: TFrm_stockhq
  Left = 390
  Top = 165
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26497#36895#34583#29275
  ClientHeight = 644
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar: TdxStatusBar
    Left = 0
    Top = 624
    Width = 796
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = #19978#35777#25351#25968#65306
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 145
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = #28145#35777#25351#25968#65306
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 145
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = #21019#19994#26495#25351#65306
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 145
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clWindowText
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Text = #26356#26032#26102#38388#65306
        Width = 60
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clBlue
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 145
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
  end
  object cxPageControl: TcxPageControl
    Left = 0
    Top = 60
    Width = 796
    Height = 564
    Align = alClient
    TabOrder = 5
    Properties.ActivePage = cxTab_stock
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 560
    ClientRectLeft = 4
    ClientRectRight = 792
    ClientRectTop = 4
    object cxTab_stock: TcxTabSheet
      Caption = #33258#36873#32929
      ImageIndex = 0
      TabVisible = False
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 556
        Align = alClient
        TabOrder = 0
        object Strgrid_stock: TStringGrid
          Left = 1
          Top = 1
          Width = 581
          Height = 336
          Margins.Right = 1
          Align = alClient
          ColCount = 4
          DefaultColWidth = 60
          DefaultDrawing = False
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          GridLineWidth = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentFont = False
          PopupMenu = PP_stk
          TabOrder = 0
          OnClick = Strgrid_stockClick
          OnDrawCell = Strgrid_stockDrawCell
          ExplicitHeight = 325
        end
        object Panel6: TPanel
          Left = 582
          Top = 1
          Width = 205
          Height = 336
          Align = alRight
          TabOrder = 1
          ExplicitLeft = 586
          ExplicitTop = -3
          ExplicitHeight = 341
          object lbl_stock: TLabel
            AlignWithMargins = True
            Left = 4
            Top = 6
            Width = 197
            Height = 22
            Margins.Top = 5
            ParentCustomHint = False
            Align = alTop
            Alignment = taCenter
            BiDiMode = bdLeftToRight
            Caption = #32929#31080#20195#30721
            Color = clBtnFace
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = #24494#36719#38597#40657
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            ExplicitTop = 5
          end
          object Label3: TLabel
            Left = 16
            Top = 291
            Width = 35
            Height = 16
            Caption = #20170#24320':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 16
            Top = 314
            Width = 35
            Height = 16
            Caption = #26152#25910':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 108
            Top = 291
            Width = 35
            Height = 16
            Caption = #26368#39640':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 108
            Top = 314
            Width = 35
            Height = 16
            Caption = #26368#20302':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl_todayopen: TLabel
            Left = 55
            Top = 291
            Width = 8
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_close: TLabel
            Left = 55
            Top = 314
            Width = 8
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_high: TLabel
            Left = 149
            Top = 292
            Width = 8
            Height = 13
            Font.Charset = GB2312_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_low: TLabel
            Left = 149
            Top = 314
            Width = 8
            Height = 13
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = [fsBold]
            ParentFont = False
          end
          object StringGrid_wudang: TStringGrid
            Left = 3
            Top = 31
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
        object Panel7: TPanel
          Left = 1
          Top = 337
          Width = 786
          Height = 218
          Align = alBottom
          TabOrder = 2
          Visible = False
          object Panel8: TPanel
            Left = 1
            Top = 1
            Width = 82
            Height = 216
            Align = alLeft
            TabOrder = 0
            ExplicitHeight = 227
            object btn_min: TButton
              Left = 3
              Top = 30
              Width = 75
              Height = 25
              Caption = #20998#26102
              TabOrder = 0
              OnClick = btn_minClick
            end
            object btn_day: TButton
              Left = 3
              Top = 61
              Width = 75
              Height = 25
              Caption = #26085'K'
              TabOrder = 1
              OnClick = btn_dayClick
            end
            object Button3: TButton
              Left = 3
              Top = 92
              Width = 75
              Height = 25
              Caption = #21608'K'
              TabOrder = 2
              OnClick = Button3Click
            end
            object btn_close: TButton
              Left = 3
              Top = 123
              Width = 75
              Height = 25
              Caption = #20851#38381
              TabOrder = 3
              OnClick = btn_closeClick
            end
          end
          object Panel9: TPanel
            Left = 83
            Top = 1
            Width = 702
            Height = 216
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 227
            object WebBrowser: TWebBrowser
              Left = 1
              Top = 1
              Width = 700
              Height = 214
              Align = alClient
              TabOrder = 0
              ExplicitLeft = 2
              ExplicitTop = 2
              ExplicitHeight = 225
              ControlData = {
                4C000000594800001E1600000000000000000000000000000000000000000000
                000000004C000000000000000000000001000000E0D057007335CF11AE690800
                2B2E12620E000000000000004C0000000114020000000000C000000000000046
                8000000000000000000000000000000000000000000000000000000000000000
                00000000000000000100000000000000000000000000000000000000}
            end
          end
        end
      end
    end
    object cxTab_Smart: TcxTabSheet
      Caption = #36873#32929#31574#30053
      ImageIndex = 1
      TabVisible = False
      object nbMain: TdxNavBar
        Left = 0
        Top = 0
        Width = 158
        Height = 556
        Align = alLeft
        Constraints.MinWidth = 120
        ActiveGroupIndex = -1
        TabOrder = 0
        View = 16
      end
      object Panel1: TPanel
        Left = 158
        Top = 0
        Width = 630
        Height = 556
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object lv_Smart: TListView
          Left = 1
          Top = 1
          Width = 628
          Height = 489
          Align = alClient
          Columns = <>
          ColumnClick = False
          HideSelection = False
          RowSelect = True
          PopupMenu = PP_Smart
          TabOrder = 0
          ViewStyle = vsReport
          OnCustomDrawItem = lv_SmartCustomDrawItem
        end
        object Panel2: TPanel
          Left = 1
          Top = 490
          Width = 628
          Height = 65
          Align = alBottom
          BevelOuter = bvNone
          BorderStyle = bsSingle
          TabOrder = 1
          object StaticText1: TStaticText
            Left = 81
            Top = 0
            Width = 543
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
    object cxTab_set: TcxTabSheet
      Caption = #31995#32479#35774#32622
      ImageIndex = 2
      TabVisible = False
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 788
        Height = 91
        Align = alTop
        BevelOuter = bvSpace
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object lbl: TLabel
          Left = 144
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
          Left = 375
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
          Left = 494
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
          Left = 239
          Top = 14
          Width = 97
          Height = 21
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Ctl3D = True
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          Text = '1'
        end
        object Check_Kflag: TCheckBox
          Left = 223
          Top = 56
          Width = 97
          Height = 17
          Caption = ' '#24320#21551'K'#32447#22270
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          State = cbChecked
          TabOrder = 3
        end
      end
    end
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
    Hint = #26497#36895#34583#29275
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
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1]
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
    Left = 97
    Top = 173
  end
  object dxBarManager: TdxBarManager
    AllowReset = False
    Scaled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      #40664#35748)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeIcons = True
    ImageOptions.StretchGlyphs = False
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    ShowHint = False
    ShowHintForDisabledItems = False
    UseBarHintWindow = False
    UseF10ForMenu = False
    UseSystemFont = True
    Left = 302
    Top = 171
    DockControlHeights = (
      0
      0
      60
      0)
    object dxBarManager1Bar1: TdxBar
      AllowQuickCustomizing = False
      Caption = #33258#23450#20041' 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 651
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #24494#36719#38597#40657
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarBtn_stock'
        end
        item
          Visible = True
          ItemName = 'dxBarBtn_smart'
        end
        item
          Visible = True
          ItemName = 'dxBarBtn_refresh'
        end
        item
          Visible = True
          ItemName = 'dxBarBtn_set'
        end>
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = True
      Visible = True
      WholeRow = False
    end
    object dxBarBtn_stock: TdxBarLargeButton
      Caption = #33258#36873#32929#31080
      Category = 0
      Hint = #33258#36873#32929#31080
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000010000000100000002000000030000000300000004000000050000
        0005000000040000000300000001000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000010000000100000002000000030000
        00040000000500000007000000080000000A0305061707090B200507091D0101
        01110000000B0000000800000004000000010000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000010000000200000004000000050000000700000008000000080000
        000A0000000C000000100203041D283946754C6E87C34C7492D3426888CE273E
        53A205080A480000002400000014000000080000000100000000000000000000
        0000000000000000000000000000000000000000000100000001000000020000
        000400000006000000080000000B0000000F0000001206080B2619242D531F2D
        386919252F630A0D11460B1117534E789CEE6F9EC2FF5F93BCFF5588B2FF4775
        9DFF14212D980000004C00000033000000160000000500000000000000000000
        0000000000000000000000000001000000020000000400000006000000090000
        000A000000120305061C0304051F0000001C0305062C385770B3739DBDF85684
        ABFD3E6B96FC254260E40D1825A0436E95F37CA9CBFF5C8DB5FF4E7FA9FF4E7E
        A7FF1A2B39930000004100000032000000180000000600000000000000000000
        000000000001000000020000000300000004000000080000000D00000013121B
        2346425A6DA340627FC733536FC41C2D3E990910176F4B7598EB709FC1FF5A8C
        B4FF3A6794FF1B3D65FD102133B6406B92F176A6C9FF6296BFFF5689B4FF4D7E
        A8FF1E31407C0000001B000000160000000A0000000300000000000000000000
        0000000000020101010811171C34212E375B1E2B35611119205002020332324F
        6AB5719EC0FF5888AFFF3D6B98FF254A74FF112235BD40698EED73A1C3FF5485
        ADFF366392FF1B3D68FB15273AA2406A93EC7AAACEFF6195C0FF578BB7FF5487
        B2FF2035466D0000000300000004000000020000000000000000000000000000
        0000000000000F181F355B84A1DB75A2C2FC4B7BA4FC365E85F4142435AF2F51
        6ED07AA8CAFF6494BAFF396998FF1D4370FF15283EB33F6991EB7EAED0FF5F92
        BBFF3A6A9BFF204774FA1A2D418E3E6992E77EAECFFF6497BEFF5486B1FF578A
        B5FF233848690000000000000000000000000000000000000000000000000000
        0000000000001826304A6497BBF970A4C8FF5285B0FF285180FF213F5ED93459
        7AD56EA1C6FF6498C0FF3F6F9DFF1D416FFE182E459C49749AE675A8CCFF5E93
        BCFF3D6C9CFF244C7DFA1F334784426D94E37BA9CAFF6396BEFF5487B1FF5486
        B1FF253A4C6A0000000000000000000000000000000000000000000000000000
        0000000000001929344F6A9DC0FA6B9EC3FF4F81ABFF214A7BFF2B4E70CC3B62
        85CB74A7CCFF5F95BEFF4071A0FF214A7CFE1F375096457198E678A7CBFF598B
        B5FF3A6A9AFF275282FB23384D7F406A92E079A8C9FF6598BFFF5587B2FF5587
        B1FF273D4F6F000000000000000000000000000000000000000003170F240124
        1537000000001E2E3B586896B9FF608DAFFF4B79A0FF33608DFF365B7CCA3E67
        8AC880AFCFFF6091B8FF3C6B99FF275283FE253F599746729BE780B0D1FF6194
        BCFF3E70A2FF2A5688FB253A4F7C436C93DD72A4CAFF699EC7FF5D91BCFF578A
        B5FF2B4357780000000000000000000000000000000000000000000C07130053
        308000341D500F171E31375775C73F688DF44B7498F7537A9AEE2A4359903E65
        87C374A6CAFF679BC2FF4374A1FF2B5685FE28435E99477196EA6390B2FF5380
        A6FF45739CFF3B6895FF253B4F7C436D93DA7EACCEFF6394BAFF5081ABFF588B
        B5FF314A5E810000000000000000000000000000000000000000000000000012
        0A1B006B3DA5003D235E080B0D160F18223A1A252E411E25293205080B11436A
        8ABF70A3C8FF5F93BBFF42729EFF2C5889FF243C527E2B465EA33F688CEF466F
        94F7587E9DF33D5D79C516222E4F456F92D979A7CAFF6799C1FF5588B3FF5587
        B1FF344E64880000000000000000000000000000000000000000000000000000
        0000001F1230007F49C60046286D000000000000000000000000020406084870
        90C083B1D3FF6395BDFF40709EFF305E8FFF20354768030304060E161E33121D
        283E222A2F390B0D0F13070B0F19456F95DA79A8CCFF689BC3FF5689B4FF5689
        B4FF36546C950000000000000000000000000000000000000000000000000000
        000000000000002F1B49008F52DF00522F8000060309000000000406070A4C74
        93C176A6C9FF6397BFFF44739FFF366290FF23384A6900000000000000000312
        0A1C0103010600000000090D11194C789DD977ABD1FF6FA6CFFF649AC5FF5D92
        BDFF3C5C749E0000000000000000000000000000000000000000000000000000
        0000000000000000000000442769009A58F0005C358F0009050E0405080A4D74
        94C673A0C3FF5B8CB3FF4877A1FF44739FFF24394B6A00000000041B112B057C
        48C706553288030A0610090C10164A7496DA739EBEFF5D8AAEFF507FA5FF5282
        A9FF3D5D77A80102020200000000000000000000000000000000000000000000
        00000000000000000000000201030055318400A35EFC00663A9E03130E1F3350
        6CAF497499FF4A7599FF4F7A9EFF477296F61B293755010B0510057242B400A1
        5CFF00A05CFE056C3FAB082017342E465E9B40688CF0416B8FF7567C9EF64B6F
        8DE0203140690000000000000000000000000000000000000000000000000000
        00000000000000000000000000000008050D006A3DA300A55FFF007141B00A23
        1F411D2A39602C43578A3D505E811D273149050B0B150461389700A35DFF00A3
        5DFF00A35DFF00A35DFF03854DD30839255D10192138111B2640232C33401519
        1C23010101020000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000100919007B46BD00A55FFF0079
        45BC00190D26000000000000000000000000064F2F7B01A25DFC01A25DFA0867
        3DA004824BCA00A45EFF00A25DFF029756F004502E80030D0713000000000000
        0000040505080406050A00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000001F122F008B4FD500A5
        5EFF00824ACA0021133400000000053F2662029C5AF200A55FFF05623A97060A
        081007181025066A3FA501A15EFB00A35DFF00A15CFF047444B8062216360503
        040507402863083A245900000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000002E1A460096
        56E700A55FFF00894FD50452317F039557E700A660FF056F42AB050F0B180504
        040604030405060B0911064E2F78029757EA00A45EFF00A45EFF038D53DC0855
        3483049557E5057043AC04060509000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000042
        2665009E5BF300A65FFF00A660FF00A660FF047C49BF07171023050304050404
        040705050508050405070504050706301E4A03854ECE00A65FFF00A660FF01A7
        60FF00A760FF039356E0061B122A020102020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000001
        01020154318100A65FFD00A760FF038850CF0621153204020304040404070404
        04070404040704040407040404070402030407191127056D40A701A560FC00A7
        61FF00A861FF01A660FC063C255B030203030303030501010101000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000008050C02693DA1039356DF062A1A400402030404040407040404070404
        04070404040704040407040404070504040704040406044C2D7401A55FFB00A8
        61FF00A861FF00A861FF06663D9C050505080404040701010102000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000001100A1806251839040404060404040704040407040404070202
        02040303030504040407040404070504040605331F4E019455E000A35EF701A3
        5EF801A761FE00A861FF039255DE061810250403040501010102000000000000
        0000000000000000000000000000000000000000000000000000010101010202
        0204020202040201020202010202040404070404040704040407030303050000
        000000000000010101020302020404040406061710230428193D032C1A430431
        1E4B054027620354317F025E378F051D132C0503040501010102000000000000
        0000000000000000000000000000000000000000000000000000000000000202
        0203040404070404040704040407040404070404040704040407020202030000
        0000000000000000000000000000010101010201020202010202030203030302
        0303030203030402030404030405050404070404040701010102000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000010101020202020303030305040404070404040704040406010101010000
        0000000000000000000000000000000000000000000001010101010101020303
        0305040404060404040704040407040404070303030501010101000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000010101010202020301010102000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000010101020202020403030305010101020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = dxBarBtn_stockClick
      AutoGrayScale = False
    end
    object dxBarBtn_smart: TdxBarLargeButton
      Caption = #31574#30053#36873#32929
      Category = 0
      Hint = #31574#30053#36873#32929
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000201
        01022720172C6251396E977C58A9C09E6ED8E8D0B2F6FFFFFFFFFFFFFFFFEAF0
        F5F64B93CFD81A63A0A91341686E071A2A2C0001020200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000002010102342B1E3A876F
        4F97C9A575E1E2BA84FDE4BB85FFE4BA83FFEFD6B5FFFFFFFFFFFFFFFFFFDDEE
        FDFF3FA0F2FF2995F1FF2A95EFFD2584D5E119598F970B23373A000001010000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000019140E1C7D66478CD3AC7AECE4BB
        84FFE4BA83FFE4BA83FFE4BA83FFE3B981FFEFD7B7FFFFFFFFFFFFFFFFFFAAD5
        F9FF2B97F1FF2A96F1FF2A96F1FF2A96F1FF2995F1FF3B95E0EC7681898B1A1A
        1A1A000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000332A1E39B09168C5EBCCA3FFF2DFC6FFF4E3
        CCFFF0DABDFFEDD2AFFFEBCCA3FFEDD2AFFFF9EFE3FFFFFFFFFFEEF7FEFF5CAF
        F4FF2795F1FF2A96F1FF2A96F1FF2A96F1FF2795F1FF56ACF4FFF2F9FFFFC0BA
        B3C230281E350000000000000000000000000000000000000000000000000000
        000000000000000000003F332546C5A072DCEDD2AEFFFDFAF6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFFFEFDFBFFFFFEFEFFFFFFFFFFF6FAFEFF84C2F7FF2B96
        F1FF2A96F1FF2A96F1FF2A96F1FF2A96F1FF2795F1FF55ABF4FFF1F9FFFFF9EE
        E0FFC3A275D93D32234400000000000000000000000000000000000000000000
        0000000000002F271C35C4A172DBE5BD88FFF7EBDCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7EBFCFF75BBF6FF2C97F1FF2895
        F1FF2895F1FF2995F1FF2A96F1FF2A96F1FF2895F1FF43A3F3FFE6F3FFFFFBF2
        E6FFE6BF8CFFC29F70D92F271C35000000000000000000000000000000000000
        000017130E1AAD8E65C2E4BB85FFE4BB85FFF5E6D2FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6FBFEFFA2D1F9FF41A1F3FF2493F1FF2C97F1FF3C9F
        F2FF47A4F3FF41A1F3FF2E98F1FF2795F1FF2996F1FF359CF2FFD0E8FCFFFFFC
        F7FFEACA9FFFE4BA83FFAD8E65C217130E1A0000000000000000000000000101
        01017C66488BE4BB85FFE4BB84FFE8C495FFF9F0E4FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F9FEFF82C1F7FF2A96F1FF40A1F2FF80C0F7FFB8DCFAFFB3D9
        FAFF99CDF8FFBFDFFBFFB9DDFAFF65B3F5FF2C97F1FF2A96F1FFAFD7FAFFFFFF
        FFFFF2DFC5FFE4BB84FFE4BB85FF7C66488B010101010000000000000000342B
        1E3AD3AD7BECE4BB85FFE4BA83FFF0D8B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF92C9F8FF2D97F1FF75BBF6FFD9ECFCFFFFFFFFFFC7E4FBFF47A4
        F3FF2B97F1FF49A6F3FFCFE7FCFFF4F9FEFF79BDF6FF2594F1FF87C4F7FFFFFF
        FFFFFAF1E6FFE6BF8DFFE4BB84FFD3AD7BEC342B1E3A0000000002010102876F
        4F97E4BB85FFE4BB85FFE5BC87FFF6E9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD4EAFCFF45A3F3FF94CAF8FFF7FBFEFFFFFFFFFFFAFDFFFF6BB6F5FF2594
        F1FF2A96F1FF2594F1FF7DBFF6FFFFFFFFFFE5F2FDFF4DA7F3FF53AAF4FFF1F8
        FFFFFEFAF6FFE9C79BFFE4BA84FFE4BB85FF876F4F97020101022720172CC9A5
        75E1E4BB85FFE4BA83FFE5BC87FFF6E9D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF8EC8F8FF88C4F7FFFBFDFFFFFFFFFFFFFFFFFFFFEEF7FEFF4FA8F3FF2895
        F1FF2A96F1FF2694F1FF67B4F5FFFAFDFFFFFFFFFFFF9ECFF9FF369CF2FFD2E9
        FCFFFFFFFEFFEDD1ADFFE4BA83FFE4BB85FFC9A575E12720172C6251396EE2BA
        84FDE5BD88FFECD0ABFFF4E4CFFFFDFBF7FFFFFFFFFFFFFFFFFFFFFFFFFFEEF6
        FEFF93CAF8FFEEF7FEFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFFFF6DB7F5FF2593
        F1FF2995F1FF2794F1FF97CCF8FFFFFFFFFFFFFFFFFFDEEFFDFF41A1F3FFAED7
        FAFFFFFFFFFFF0DABDFFE4BA83FFE4BB85FFE2BA84FD6251396E977C58A9E4BB
        84FFE7C291FFFBF5EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6EB
        FCFFD3E9FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAE5FCFF56AC
        F4FF3C9FF2FF75BBF6FFE9F4FEFFFFFFFFFFFFFFFFFFFAFDFFFF69B5F5FFA4D2
        F9FFFFFFFFFFF4E4CFFFE4BB85FFE4BB85FFE4BB85FF977C58A9C19E71D8E4BB
        85FFE4BC87FFF5E5D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFFDDF0
        FAFFFBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6
        FEFFDDEEFDFFF7FBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CC6F7FFA4D2
        F9FFFFFFFFFFF8EDDFFFE5BD89FFE4BB85FFE4BB85FFC19E71D8DCB480F6E4BB
        85FFE4BA84FFE8C698FFFAF3EAFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFDFFC3EE
        E5FFEBF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFABD6F9FFA7D4
        F9FFFFFFFFFFFAF3EAFFE6C18FFFE4BB84FFE4BB85FFDCB480F6E4BB85FFE4BB
        85FFE4BB85FFE4BA83FFECCEA7FFFCF8F3FFFFFFFFFFFFFFFFFFFFFFFFFFDBF5
        EFFFA1E4D5FFF5FCFAFFF8FDFCFFD1F2EBFFA8E6D8FF8DDFCCFF91E0CEFFAAE7
        D9FFD0F2EAFFFDFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5E2FBFFADD7
        FAFFFFFFFFFFFCF7F1FFE7C394FFE4BA84FFE4BB85FFE4BB85FFE4BB85FFE4BB
        85FFE4BB85FFE4BB85FFE4BA84FFEFD6B5FFFFFDFBFFF6FDFBFFE8F9F5FFFFFF
        FFFFA4E5D6FF91E0CEFFD9F4EEFF93E1CFFF65D3BAFF51CEB1FF52CEB2FF6FD6
        BFFFBCECE1FFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E8FCFFBDDF
        FBFFFFFFFFFFFCF8F3FFE8C597FFE4BA84FFE4BB85FFE4BB85FFDCB480F6E4BB
        85FFE4BB85FFE4BB85FFE4BB84FFE6C08EFFFBF2E8FFEAFAF7FF85DCC8FFE7F8
        F4FFF0FBF8FF6DD6BEFF9CE3D3FFFBFEFDFFF5FCFAFFE8F9F5FFE9F9F5FFFAFE
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF6FEFFE6F3
        FDFFFFFFFFFFFDFAF6FFE9C79BFFE4BA84FFE4BB85FFDCB480F6C19E71D8E4BB
        85FFE4BB85FFE4BB85FFE4BA83FFEED3B0FFFEFDFBFFF8FDFCFF6DD6BEFF8CDF
        CCFFFFFFFFFFCAF0E7FF55CFB3FFA7E6D8FFFFFFFFFFFFFFFFFFFFFFFFFFDFF6
        F1FFB5EADEFFA9E7D9FF9BE3D2FFA9E7D8FFC0EDE3FFF2FBF9FFFFFFFFFFFEFE
        FFFFFFFFFFFFFCF9F4FFE8C698FFE4BA84FFE4BB85FFC19E71D8977C58A9E4BB
        85FFE4BB85FFE4BB85FFE4BA84FFF2DFC6FFFFFFFFFFFFFFFFFF8EDFCDFF48CB
        ADFFD9F4EEFFFFFFFFFFB7EBDFFF56CFB4FFA4E5D6FFFAFDFDFFFFFFFFFFC7EF
        E6FF79D9C3FF55CFB3FF50CEB1FF56CFB3FF8ADECBFFE9F9F5FFFFFFFFFFFFFF
        FFFFFFFFFFFFFCF7F1FFE7C394FFE4BA84FFE4BB85FF977C58A96251396EE2BA
        84FDE4BB85FFE4BB85FFE4BA83FFEFD6B6FFFFFFFFFFFFFFFFFFCAF0E7FF46CB
        ACFFAFE8DBFFF3FCFAFFEFFAF8FFCBF0E8FF70D7BFFF8DDFCCFFDCF5EFFFFBFE
        FDFFF8FDFCFFEBF9F6FFEAF9F6FFEDFAF7FFFCFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFAF2E8FFE6C08EFFE4BB84FFE2BA84FD6251396E2720172CC9A5
        75E1E4BB85FFE4BB85FFE4BA83FFEACBA1FFFEFCF9FFFFFFFFFFFDFEFEFF95E1
        D0FF96E1D0FFE1F6F2FF8ADECBFFEBF9F6FFF3FCFAFFB8EBDFFFA5E6D7FFCDF1
        E9FFECFAF6FFFCFEFEFFD9F4EEFFDFF6F1FFF9FDFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF6E8D5FFE4BC86FFE4BB85FFC9A575E12720172C02010102876F
        4F97E4BB85FFE4BB85FFE4BB84FFE6C08EFFFAF2E8FFFFFFFFFFFFFFFFFFF3FC
        FAFFD5F3ECFFFCFEFDFF82DCC7FF76D8C2FFF1FBF9FFFFFFFFFFF2FBF9FFF6FC
        FBFFFFFFFFFFFEFFFFFFB2E9DDFF59D0B5FF74D8C1FFC3EEE4FFFCFEFEFFFFFF
        FFFFFFFFFFFFF0D8BAFFE4BA83FFE4BB85FF876F4F970201010200000000342B
        1E3AD3AD7BECE4BB85FFE4BB85FFE4BB84FFF3E0C8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD1F2EBFF4ACCAEFF9BE3D2FFFFFFFFFFDAF5EEFF8BDE
        CBFFC7EFE6FFFDFEFEFFFFFFFFFFBFEDE2FF5ED2B7FF46CBACFF9AE2D2FFF6FD
        FCFFFDF8F2FFE9C79AFFE4BA84FFD3AD7BEC342B1E3A00000000000000000201
        01027D67498CE4BB85FFE4BB85FFE4BA84FFEAC99EFFFCF9F3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFFFFFFA7E6D8FF56CFB4FFD7F4EDFFFFFFFFFF9BE3
        D3FF47CBADFF8FDFCDFFEEFAF7FFFFFFFFFFEBF9F6FFB4EADEFF93E1CFFFDFF7
        F2FFF4E0C7FFE4BB85FFE4BB85FF7D67498C0201010200000000000000000000
        000019150F1CB09067C5E4BB85FFE4BB85FFE4BB85FFF1DCBFFFFFFFFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFEFFB9EBE0FFCCF1E8FFFFFFFFFFF6FD
        FBFF91E0CEFF3EC9A9FF7CDAC5FFF1FBF9FFFFFFFFFFFFFFFFFFFFFFFFFFF8EE
        E1FFE7C292FFE4BB84FFB09067C519150F1C0000000000000000000000000000
        000000000000342B1E3AC6A374DEE4BB85FFE4BB85FFE5BE8AFFF3E0C7FFFEFD
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFF
        FFFFF9FDFCFFB8EBDFFF73D8C1FFB5EADEFFFFFFFFFFFFFFFFFFF8EDDFFFE9C7
        9AFFE4BA84FFC5A173DC332A1E39000000000000000000000000000000000000
        0000000000000000000041362649C6A374DEE4BB85FFE4BB84FFE5BC87FFEDD3
        B0FFF9EFE2FFFEFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF8FEFDFFEEF9F5FFF9F2E8FFF1DBBEFFE6C18FFFE4BA
        84FFC4A172DB3F33254600000000000000000000000000000000000000000000
        0000000000000000000000000000342B1E3AB09067C5E4BB85FFE4BB85FFE4BA
        83FFE6BF8DFFECCEA7FFF2DEC4FFF5E6D3FFF8EEE0FFF8EEE1FFF8EEE1FFF8EE
        E1FFF6E9D7FFF4E3CDFFF2DDC2FFEDD0AAFFE6C190FFE4BA84FFE4BB84FFAD8E
        65C22F271C350000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000019150F1C7D67498CD3AD7BECE4BB
        85FFE4BB84FFE4BA83FFE4BA84FFE4BB86FFE5BD89FFE5BD89FFE5BD89FFE5BD
        89FFE4BC87FFE4BB84FFE4BA83FFE4BA83FFE4BB84FFD3AD7BEC7C66488B1713
        0E1A000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000002010102342B1E3A876F
        4F97C9A575E1E2BA84FDE4BB85FFE4BB85FFE4BB85FFE4BB85FFE4BB85FFE4BB
        85FFE4BB85FFE4BB85FFE2BA84FDC9A575E1876F4F97342B1E3A010101010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000201
        01022720172C6251396E977C58A9C19E71D8DCB480F6E4BB85FFE4BB85FFDCB4
        80F6C19E71D8977C58A96251396E2720172C0201010200000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = psCaption
      OnClick = dxBarBtn_smartClick
      AutoGrayScale = False
    end
    object dxBarBtn_refresh: TdxBarLargeButton
      Caption = #21047#26032
      Category = 0
      Hint = #21047#26032
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000000000000001010001010000010000000000000000000000000000
        00000000000000000000000000000B08030E3B2D114B6E541F8B9B772BC2AF86
        31DAB08631DAAF8631DA98742ABE6A511E8634280F4307050209000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000004736145967501D820907030C00000000000000000000
        0000000000000B08030E4837145B957229B9C69837F2D5A23AFFD7A43AFFD8A4
        3AFFD8A53AFFD8A43AFFD7A43AFFD5A23AFFC49636EF8D6C27AF392C10490302
        0104000000000000000000000000000000000000000000000000000000000000
        0000000000000000000081622399D6A33AFF664E1D7E01010002000000000000
        00002E240D3B916F29B3D19F39FBD8A53BFFDAA63BFFDAA63BFFDAA63BFFDAA6
        3BFFDAA63BFFDAA63BFFDAA63BFFDAA63BFFD5A23AF9BF9133E2A67F2ECB644D
        1C7E140F06190000000000000000000000000000000000000000000000000000
        00000000000004030105967329B1DBA73CFFCD9C38F4513E1765050402075340
        1868BD9135E6D9A53BFFDBA73CFFDAA63CFFDAA63CFFDAA63CFFDAA63CFFDAA6
        3CFFDAA63CFFDAA63CFFD7A43BFCA07A2BBB473613531913071D1611061A2B21
        0C361F1809270000000000000000000000000000000000000000000000000000
        0000000000000B08030DA9812FC6DBA73CFFDBA73CFFBF9236E58C6B28ADCE9E
        3AF6DBA73CFFDBA73CFFDBA73CFFDBA73CFFDBA73CFFDBA73CFFDBA73CFFDBA7
        3CFFDBA73CFFBA8D33D85B45196A0D0A040F0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000001712071CBE9135DDDCA83DFFDCA83DFFDCA83DFFDAA73DFFDCA8
        3DFFDCA83DFFDCA83DFFDCA83DFFDCA83DFFDCA83DFFDCA83DFFDCA83DFFD6A3
        3BF88A6926A0221A092700000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000251C0B2CCA9A39EADDA93EFFDDA93EFFDDA93EFFDDA93EFFDDA9
        3EFFDDA93EFFDDA93EFFDDA93EFFDDA93EFFDDA93EFFDDA93EFFC69838E55944
        1967060502070000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000382B1041D6A43DF7DEAA3FFFDEAA3FFFDEAA3FFFDEAA3FFFDEAA
        3FFFDEAA3FFFDEAA3FFFDEAA3FFFDEAA3FFFDEAA3FFFB78C34D23A2C11430000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000004F3C175CDDA940FEDEAA40FFDEAA40FFDEAA40FFDEAA40FFDEAA
        40FFDEAA40FFDEAA40FFDEAA40FFDEAA40FFB48A34CF2A200C30000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000644C1D73DFAB41FFDFAB41FFDFAB41FFDFAB41FFDFAB41FFDFAB
        41FFDFAB41FFDFAB41FFDFAB41FFC09338DB30250E3700000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000007F622593E0AC42FFE0AC42FFE0AC42FFE0AC42FFE0AC42FFE0AC
        42FFE0AC42FFE0AC42FFE0AC42FF775B23890000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008869299BE1AD43FFE1AD43FFE1AD43FFE1AD43FFE1AD43FFE1AD
        43FFE1AD43FFE1AD43FFE1AD43FFC3963AE23529114100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000201010294722CA8E2AE43FFE2AE43FFE2AE43FFE2AE43FFE2AE43FFE2AE
        43FFE2AE43FFE2AE43FFE2AE43FFE1AD43FFB28937D0231B0B2B000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000523F195DCE9F3EE7DDAA42F8E3AF44FFE3AF44FFE3AF44FFE3AF
        44FFE3AF44FFE3AF44FFE3AF44FFE3AF44FFE1AE44FF9D7930B8140F06180000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000002010102261E0C2B3D2F124455421A605D481C69725823808667
        29968667299692712CA4A98233BEAE8735C4C4963BDBC4973CDE3E3013490000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000002010102070602080B08030C1712071A1A14081D050402060000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000050402061712081D1510
        071A0907030B0605020801010102000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000003E301349BE933CDEBC92
        3BDBA88236C4A27E35BE8C6D2EA480632A96735A27875A461F6A59461E695140
        1C603A2D1444231B0C2902010102000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000016110719A98235BDE5B1
        47FFE5B248FFE6B249FFE6B24AFFE6B34AFFE6B34BFFE6B34CFFE6B34DFFE5B3
        4DFFDEAE4CF8CCA046E54C3C1B57000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000029200D2EBE93
        3CD3E6B248FFE7B349FFE8B44AFFE9B54BFFEAB64CFFEBB64DFFEBB74EFFECB8
        4EFFEDB94FFFEDB950FF997834A7020101020000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000003F31
        1446CFA041E4E7B349FFE8B44AFFE9B54BFFEAB64CFFEAB64DFFEBB74EFFECB8
        4FFFEDB950FFEEBA50FF9272329C000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000084662A93E7B34AFFE8B44BFFE9B54BFFEAB64CFFEBB74DFFEBB74EFFECB8
        4FFFEDB950FFEEBA51FF7A602A83000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000002B22
        0E34C0963EDAE8B44AFFE8B44BFFE9B54CFFEAB64CFFEBB74DFFECB84EFFECB8
        4FFFEDB950FFEEBA51FF624D2169000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000281F0D30B38B
        39CEE6B249FFE8B44AFFE9B54BFFE9B54CFFEAB64DFFEBB74DFFECB84EFFEDB9
        4FFFEDB950FFEDB951FE57441E5D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000362A1141B48B39D0E5B2
        48FFE7B349FFE8B44AFFE9B54BFFEAB64CFFEAB64DFFEBB74EFFECB84FFFEDB9
        4FFFEEBA50FFE7B44EF73D301541000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000005040206513F1A62C69A3FE5E5B148FFE7B3
        49FFE7B34AFFE8B44BFFE9B54BFFEAB64CFFEBB74DFFEBB74EFFECB84FFFEDB9
        50FFEEBA51FFDCAC4BEB2A210E2D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000001E170A2580642999D9A744F8E5B147FFE6B248FFE7B3
        49FFE8B44AFFE8B44BFFE9B54CFFEAB64CFFEBB74DFFECB84EFFECB84FFFEDB9
        50FFEEBA51FFCFA247DD1A15091C000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000C09040F52401A64B78E38D7E1AE45FFE5B147FFE5B147FFE6B248FFE7B3
        49FFE8B44AFFE9B54BFFE9B54CFFEAB64DFFE3B14AF6A07D35ADD6A747E6EDB9
        50FFEEBA51FFBA9140C60C0A040D000000000000000000000000000000000000
        00000000000000000000000000001E1709262A200D34140F06191712071D4334
        15529B7830B9DAA943FCE3AF45FFE4B046FFE5B147FFE6B248FFE6B248FFE7B3
        49FFE8B44AFFE9B54BFFEAB64CFFD2A345E5614B206906050207604B2067E5B3
        4DF5EEBA51FFA8833AB305040205000000000000000000000000000000000000
        0000000000000000000000000000140F0619674F1F7EA98233CABF933AE2D6A5
        40F9E0AD43FFE3AF44FFE3AF45FFE4B046FFE5B147FFE6B248FFE7B349FFE7B3
        4AFFE8B44BFFE5B24AFBA48035B3342911390000000000000000030201037B60
        2A84EFBB51FF8E6F319700000000000000000000000000000000000000000000
        00000000000000000000000000000000000005030105403113499B772EB1D3A2
        3FEFE2AE44FFE3AF45FFE4B046FFE4B046FFE5B147FFE6B248FFE7B349FFDCAB
        46F2A88336B953411B5B0D0A040E000000000000000000000000000000000B09
        040C7A5F2A824C3B1A5100000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000907030A3B2D
        1243775B2486AB8434C0C3963CDAC4973DDAC4973DDAAE8736C17C6027894435
        164B0D0A040E0000000000000000000000000000000000000000000000000000
        0000010100010101000100000000000000000000000000000000}
      OnClick = dxBarBtn_refreshClick
      AutoGrayScale = False
    end
    object dxBarBtn_set: TdxBarLargeButton
      Caption = #31995#32479#35774#32622
      Category = 0
      Hint = #31995#32479#35774#32622
      Visible = ivAlways
      LargeGlyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        00000000000000000000010101180404044C0A0A0A7405050563000000090000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000001A1A1A6B6B6B6BE86C6B6BF7363636DB030303310000
        0000000000100000002700000007000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0002000000120000000C2A2A2A74C0C0C0FDBEBEBEFF6D6D6DFD141414820000
        001B2525258D242424D3040404670000000D0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000505
        053A101010AE0707079927272797C1C1C1FAD8D8D8FFB5B5B5FF373737C53939
        399CCBCBCBF5A5A5A5FF444444EC080808680000000200000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000103D3D
        3DA3707070FF424242FD353535EDB7B7B7F9E2E3E2FFC3C3C3FF545454F5BABA
        BAF5FFFFFFFFF7F7F7FF9C9C9CFE181717730000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000060606218282
        82D0C0C0C0FFA2A1A2FF969696FFD8D8D8FFECECECFFE8E8E8FFCBCBCBFFF0F0
        F0FFFFFFFFFFF7F7F7FF828282EB0A0A0A3A0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000033636
        3666B8B8B8F5CECECEFFDADADAFFECECECFFFAFAFAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFAFAFAFFD4D4D4FF3F3F3FA8000000140000000300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000101
        01094A4A4A89C4C4C4F8E6E6E6FFF8F8F8FFECECECFDD4D4D4E9F3F3F3F9FFFF
        FFFFF5F5F5FF838283FF1E1E1ED00C0C0C980505057F02020248000000090000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000060404
        04311E1E1E92ADADADF3F1F1F1FFE6E6E6FF888888F42121215E5F5F5F7FECEC
        ECF5FFFFFFFFCDCDCDFFA8A8A8FF979897FE747474FD292929DC0001002E0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000707072D6C6C
        6BC9A8A8A8FDD0D0D0FFF5F4F5FFC0C0C0FF737373F8131313640000000E9696
        96BAFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFE4E4E4FF4C4C4CF6020202450000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000080808208D8D
        8DD3D0D0D0FFDCDCDCFFF4F3F4FFC7C7C7FF747474FF343434CE0000004B4E4E
        4E9CF8F8F8FFFFFFFFFFF9F9F9FFF7F7F7FDD5D5D5EE4F4F4FBC0102012B0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000043636
        366E979797D3ACACACE1E2E2E2F9EDEDEDFF818181FF3E3E3EFE1F1F1FE48989
        89E5FEFEFEFFFDFDFDFFAAAAAAFF525252CC2323234C06060611000000100000
        001E000000240000000500000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000407070715111111369E9E9ED4F6F6F6FFE2E3E2FF919191FFA0A0A0FFF2F2
        F2FFFFFFFFFFFBFBFBFF8A8B8BFF1A1A1AEB010101730302015F100C09AB1610
        0DC9090705C70000003400000000000000000000000000000000000000070000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000F0F0F3EAFAFAFE8E7E6E6FFF7F7F6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE8E8E8FF868686FF1B1B1BEC433126EA755542FF7958
        45FF2F221BFF0201019D0000000F000000000000000201010130040303890000
        00530000000D0000000000000000000000000000000000000000000000000000
        0000000000001E1E1E5CBFBFBFF8DADADAFFBABABAF1C7C7C7ECFBFBFBFFF9F9
        F9FFBDBDBDFFD6D7D7FBFEFEFEFEE0E0E0FF444443DD7D5B47EDD39A78FFC892
        72FF523B2EFF0C0806EA0000003D000000050604035837281FCC463328FD0C08
        06E9020101910000002300000000000000000000000000000000000000000000
        0000000000000808081B6F6F6FA69A9A9AD92B2B2B5F3A3A3A81E6E6E6FDF5F5
        F5FF7A7A7AFD403D3BE2A5A1A0FA979797F718181890805D48D6E1A580FFE3A5
        81FF996F57FF19130FFA0202018B0705046A513B2DE3A1755BFFA5795EFF4935
        29FF150F0CF70201015A00000000000000000000000000000000000000000000
        000000000000000000000404040F0B0B0B20000000001212122FB9B9B9E3E3E3
        E3FF686666FD4C372CF82F231CFF1C1713FE050302E9523B2EE8D99E7BFFE5A7
        83FFBE8A6CFF32241CFF100C09F7412F25F2BA886AFFD89E7BFFD49A78FFB080
        64FF261B15D60000002300000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000053E3E3E716869
        69AE463C36DBA77A5FFE9C7258FF805D49FF30231BFF503B2EFDCA9373FFE5A7
        82FFD69C7AFF906952FF6E503EFF9A7057FFDEA27EFFE2A580FFDFA37FFF936B
        53FD0B08067B0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        000833251C84B28266F9D99E7BFFD69C7AFFA3775DFFBD896BFFDFA37FFFE2A5
        81FFE3A581FFE3A681FFDFA37FFFDFA37FFFE2A581FFE2A581FFC69071FF402F
        24E1000000380000001500000010000000060000000100000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000201010D49362A97B08064FAD89D7BFFE1A480FFE3A681FFE3A581FFE4A6
        82FFE3A681FFE3A681FFE3A681FFE3A581FFE3A681FFDBA07DFF5C4334FF0705
        03ED030201B0050403BC010100AB0000008D000000590000000B000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000F0F0B09885A4132EEAD7E62FFD69D7AFFE1A480FFE2A581FFC28D
        6EF2997057C09E745AC2C59070E8E2A580FFE3A581FFE3A681FFA4775DFF3325
        1DFF523C2EFF654939FF423025FF33251DFF120D0AD600000027000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0002060504664B372AF0715240FF936B53FFBC896BFFD39A78FFB78568FF2A1F
        18DF020201400403020B21181338996F57C1E1A480FFE3A681FFE0A480FFB684
        67FFC99372FFD49B79FFBE8A6CFFA5785EFF2E211AE90000003C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000B30221AB5725340FF8C664FFF946C54FFA5785EFFB88668FF5E4535FF0302
        01FD030101BE00000056000000281C151065BE8A6CF0E4A682FFE3A581FFE3A6
        81FFE4A782FFE4A682FFDEA27EFFCA9373FF3C2C21F40000004F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00012017127C71523FFF7E5C47FF88634DFF946B53FFA2765CFF634838FF0805
        04FF070504FF080605F01E1511DB423025E2AC7E62FBE5A782FFE3A581FFE0A4
        80FFCF9776FFD19877FCC69071F49D7259DD30231BAE0000002F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000060403243F2E23AC5B4333D7654939DF765643EF8F6851FF8C664FFF3123
        1BFF080504FF110C09FF4F392DFF6A4D3CFFBA886AFFE4A782FFE4A782FFCC95
        74FF3B2A21FE271C16E61F17127D090705220100000800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000010101090604031907050423261C15997A5845FF8A644EFF8460
        4AFF4D382BFF443227FF755542FF996F57FFC48F6FFFD29977FFDBA07DFFB383
        66FF37281FFF100B09FD000000BD0000002A0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000E392920B9745441FF7C5A46FF8460
        4AFF8B654EFF8F6851FF996F56FFA3775DFFAC7D61FFB48366FFBC896AFFB987
        69FFA77A5FFF5B4233FF090605FE000000810000000300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000302022350392CDD6E503EFF715240FF6C4F
        3DFB6A4D3CE77F5D48FB89634DFF8F6851FF8D6750FF7D5B47EE8C6650EFA779
        5EFFAD7E62FF8D6750FF2B1F18FF020201960000000600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000101010E2D21198F5D4334EF604536F42C20
        199F0B0806394B362AC87B5945FF7D5B46FF3F2D23FF0A0706931A130F57664A
        3AC78B654EF3956C54FF493529D7030201420000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000001000007110C0A41120D0A450201
        010C000000001D15106F694C3BF9755542FF4B362AFF05030274000000000503
        03131A130F442B1F188109070532000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000002010112392920AD614637EC423025E704030255000000000000
        0000000000000000000100000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000503031B0F0B08360B08063801010011000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = dxBarBtn_setClick
      AutoGrayScale = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = #26032#24314#23376#39033#30446
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
  end
  object Timer_k: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer_kTimer
    Left = 161
    Top = 143
  end
  object PP_stk: TPopupMenu
    Left = 451
    Top = 225
    object itInsert: TMenuItem
      Action = Act_Add
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
        25D0522C17931209053000000009000000010000000000000000000000000000
        00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
        6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
        0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
        82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
        2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
        59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
        47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
        45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
        6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
        44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
        83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
        47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
        8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
        F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
        A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
        D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
        ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
        3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
        9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
        3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
        6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
        3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
        3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
        5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
        0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
        CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
        00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
        B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
        000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
        60CD6C543F8B16110D2200000003000000010000000000000000}
    end
    object itUpd: TMenuItem
      Action = Act_Upd
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00020000000900000012000000180000001A0000001A00000018000000100000
        0005000000010000000000000000000000000000000000000000000000020000
        000D3524146A936338E5A56B3AFFA36938FFA16736FF9D6233FB633E20B70805
        022800000006000000010000000000000000000000000000000000000008442F
        1D78C18B59FEE1AC76FFE4C296FFB5793BFFB5793CFFB5793CFFAD7239FF7E50
        2AD80302042A00000006000000010000000000000000000000000000000DB07D
        4EF3E6B17AFFE9B47DFFE9B47DFFE7C79DFFB67A3DFFB57A3DFFB57A3DFF6953
        7BFF090E5ED50001052800000006000000010000000000000000000000086A4E
        329DEFD7B3FFE9B47DFFE9B47DFFE9B47DFFEACDA4FFB57B3EFF735C86FF313F
        CCFF2935B8FF0B1161D501010627000000050000000100000000000000010000
        000C745538A5F2DDBBFFE9B47DFFE9B47DFFE9B47DFFD1CEE1FF3443CEFF3443
        CDFF3443CEFF2C39BAFF0D1463D4010106260000000500000001000000000000
        00020000000B76583BA4F5E2C1FFE9B47DFFB5A9B8FF829FF1FFB1C9F5FF3949
        D1FF3A4AD1FF3A49D1FF303FBDFF111767D30101062500000005000000000000
        0000000000010000000B785B3DA3E9E1D2FF87A3F2FF87A4F1FF87A3F2FFB9D0
        F7FF3E50D5FF3E50D5FF3F50D5FF3545C2FF141B6AD201010622000000000000
        000000000000000000010000000A2C386FA2C9E2F9FF8CA8F3FF8DA8F3FF8CA8
        F3FFC0D8F9FF4457D9FF4356D9FF4456D9FF3949C2FF141A61C2000000000000
        000000000000000000000000000100000009303D74A1CFE7FBFF92ADF3FF91AD
        F4FF92ADF4FFC6DEFAFF495EDBFF495DDCFF475AD7FF232F8BF0000000000000
        00000000000000000000000000000000000100000008334177A0D4ECFCFF97B2
        F5FF97B2F4FF97B3F5FFCCE4FBFF4A5FDAFF3141A4F6090C214A000000000000
        000000000000000000000000000000000000000000010000000736457A9FD8F0
        FDFF9DB7F5FF9CB7F5FFD9F1FEFF6B81CAF50B0E234700000006000000000000
        0000000000000000000000000000000000000000000000000001000000063947
        7D9EDBF3FEFFDBF3FFFF677FCFF513192C440000000500000001000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00053543728E4F63AACD151A2D40000000040000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0001000000030000000400000002000000000000000000000000}
    end
    object itDelete: TMenuItem
      Action = Act_Del
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000030000
        000B000000120000001300000013000000140000001400000014000000140000
        0014000000140000001500000015000000140000000D000000030000000B1C11
        6CC3261796FF271696FF261695FF261594FF251594FF251594FF241394FF2412
        93FF241292FF231292FF231192FF231191FF190C68C50000000C0000000F2B1C
        9BFF384AD3FF2637CEFF3042D2FF4254D9FF3646D4FF2437CCFF2434CCFF3444
        D3FF3C4ED6FF2A3ACEFF202FC9FF1E2CC9FF251595FF000000120000000F3121
        A0FF4356D7FF374BD5FF3F4BCBFF2827ABFF363CBEFF3E4FD6FF3D4ED5FF353A
        BEFF2827ABFF3B45C9FF2F41D0FF2332CCFF291A99FF000000120000000E3529
        A5FF4E62DBFF444FCCFF605DBDFFEDEDF8FF8B89CEFF383CBCFF383CBBFF8B89
        CEFFEDEDF8FF5F5DBDFF3D47C9FF293ACEFF2D1F9EFF000000110000000D392F
        ABFF596FDFFF2722A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
        EDFFF3E9E2FFECE6EBFF2721A5FF2F42D1FF3326A3FF0000000F0000000C4036
        B1FF657AE2FF3135B7FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
        E2FFEADAD1FF7F6FACFF2E31B6FF3549D5FF372CA9FF0000000E0000000B453D
        B6FF6E83E5FF485EDCFF393BB7FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
        E5FF897DB8FF3739B6FF4054D9FF3D51D7FF3C33AFFF0000000D0000000A4A44
        BCFF788FE8FF6077E3FF4B4BBBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
        E8FF9087C5FF4949BAFF596FDFFF4359DAFF423AB4FF0000000C00000009504C
        C2FF92A7EEFF5655BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
        EAFFFAF5F2FF8F89CAFF5453BCFF6278E2FF4943B9FF0000000B000000086B6A
        D0FFADC1F4FF2A1E9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
        D8FFF4ECE7FFE5D9DCFF2A1D9BFF8B9EEBFF6563C9FF0000000A000000077577
        D6FFB1C6F5FF6E77D1FF5747A1FFCCB6BCFF7A68A8FF4E4CB7FF4F4EB8FF7A68
        A8FFCBB5BCFF5746A1FF6B75D0FF8EA1ECFF706ED0FF0000000900000006797B
        DAFFB5CAF6FF93A7EEFF7079D2FF2E229BFF5453BBFF93A7EEFF93A7EEFF5555
        BCFF2E219BFF6F77D1FF91A4EDFF90A3EDFF7475D4FF00000008000000057D80
        DEFFB9CDF6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CC
        F6FFB7CBF6FFB6CBF6FFB5C9F6FFB5C9F6FF787AD8FF00000006000000036062
        A6C08184E1FF8183E0FF8083E0FF7F83DFFF7F83DFFF7F82DFFF7E81DFFF7E81
        DEFF7D81DEFF7D80DEFF7D7FDEFF7C7FDDFF5C5EA3C100000004000000000000
        0002000000030000000400000004000000040000000400000004000000040000
        0004000000040000000400000005000000050000000300000001}
    end
    object N3: TMenuItem
      Action = Act_Noitce
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000714F3AB79B6A4DFF99684BFF976549FF956346FF946044FF925D42FF915B
        3FFF8F5A3DFF8D583CFF8C563AFF643C28B70000000000000000000000000000
        00009F7153FFC19B71FFCCA777FFC9A270FFC69C69FFC39763FFC0945DFFBE8F
        57FFBB8C52FFBA894EFFAC7946FF8D563AFF0000000000000000000000000000
        0000A17356FFD2B285FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB9884EFF8D573CFF0000000000000000000000000000
        0000A37658FFD6B88CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBB8C53FF8F5A3DFF0000000000000000000000000000
        0000A6795CFFDABD94FFFFFFFFFFFFFFFFFFFFFFFFFF8B8BD3FFB6B6E4FFFFFF
        FFFFFFFFFFFFFFFFFFFFBE8F57FF915B3FFF0000000000000000000000000000
        0000A97C5EFFDDC29BFFFFFFFFFFFFFFFFFF8B8BD3FF1A1AA9FF3232B2FFF4F4
        FBFFFFFFFFFFFFFFFFFFC1935DFF925E41FF0000000000000000000000000000
        0000AB7F61FFDFC7A2FFFFFFFFFF8B8BD3FF1A1AA9FF1A1AA9FF1A1AA9FF7878
        CAFFF7F7F7FFFFFFFFFFC39863FF936044FF0000000000000000000000000000
        0000AC8263FFE3CCA8FFFFFFFFFF8E8ED5FF5353BEFFC9C9EBFF8585CCFF1C1C
        AAFFC2C2DFFFFFFFFFFFC69D69FF956345FF0000000000000000000000000000
        0000AF8567FFE5D1AEFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FFD0D0D0FF7A7A
        C0FF3F3FB3FFFCFCFEFFC9A270FF976549FF0000000000000000000000000000
        0000B08869FFE7D5B3FFFFFFFFFFFFFFFFFFDADADAFFBBBBBBFFC2C2C2FFC8C8
        C8FF7676BDFF9999D9FFCCA777FF99684BFF0000000000000000000000000000
        0000B38A6CFFEAD9B8FFFFFFFFFFD3D3D3FFABABABFFB0B0B0FFB5B5B5FFBBBB
        BBFFC2C2C2FF9999D9FFBC9D83FF9C6A4EFF0000000000000000000000000000
        0000B48D6FFFEBDBBDFFBDBDBDFF767474FF6E6D6DFF646764FF5F5E5EFF5858
        58FF535353FFA6A6A6FFAD948CFF9D6E50FF0000000000000000000000000000
        0000B79071FFDFC9ABFF868686FF7D7D7DFFB4B5B4FFAAABAAFFA0A0A0FF9595
        95FF585858FF545353FFC8A57FFFA07053FF0000000000000000000000000000
        0000896C56BDB79071FFB58D6EFFB38B6CFF7D7D7CFFB4B5B4FFAAABAAFF6464
        64FFA87C5EFFA6795BFFA47659FF785540BD0000000000000000000000000000
        0000000000000000000000000000000000005E5B5EB27D7C7DFF747674FF4D4C
        4CB2000000000000000000000000000000000000000000000000}
    end
    object N1: TMenuItem
      Action = Act_browser
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000001000000050000000B0000
        001000000011000000110000000D000000070000000200000000000000000000
        00000000000000000000000000000000000303020111341B146E683528C8773D
        2DE5884332FF743929E6622E21CA2F1610730301011500000004000000000000
        0000000000010000000500000010100907387F4738E1AE7F71FFBB9F94FF7458
        4DFF4E3023FF74584CFFB99D92FFA67467FF713729E00D06052B000000000000
        00020000000C0C0A054A9D8779DAA16D5CFED9C2BBFFEAE0D9FF8D7162FF9C7F
        6FFF706159FF917667FF7C6154FFE1D4CDFFC8ACA2FF5F2D20C5000000030102
        011711241499474127FDDBC9BAFFB58574FFF5EEEBFFF3E9E5FF755342FF907C
        71FF000000FF6B5D54FF72503EFFECE2DDFFDFD0CAFF7E3D2CF50000000C122B
        17AA256140FF49916FFFCDCCBEFFC09889FFE6D6D0FFF9F5F2FF9C8173FFEFE8
        CBFF938075FF9C7F6FFF917566FFF3ECE8FFD1BBB3FF623023C407110A4F2058
        36FF558B68FF60714DFFB3AC91FFE3D0C4FFBC9280FFCDAC9FFFDCCAC3FFA287
        7AFF836352FFA2877AFFDAC7C0FFC19B8FFF763D2EDE0E0705282C2B1AB25E6C
        4DFF968455FFCA955FFFDBAA71FFF1DCBFFFDDDED2FFC3B8ACFFB69989FFB28B
        7BFFB07C6AFFB08373FFA57969F63B27216E0201010D00000003926443E8CB9A
        69FFD3A16AFFE6BB80FFEAC48EFFEDCD9EFFA3B9A1FFBEEADCFFC1DDCFFFD1DA
        D0FFD4D8CEFFD6D8CEFFB3ADA0F50000000F000000010000000060593CFA6782
        5DFFC4B07BFFECC996FFF2D9B3FFF2DAB5FFBCC6A7FF98B79DFFC4C7A7FFE8C9
        95FF7D966DFF53AF8BFF345A3DFA0000000C0000000000000000275B3FE74FAE
        8BFF819C72FFF2DDB9FFF5E3C3FFF5E4C5FFF6E3C5FFEBE0C2FFAAC4ADFFA0BE
        A4FF67CBA8FF57C19EFF33583FE80000000A0000000000000000184C37AD4BAA
        87FF7BA077FFF7E8CDFFF7EAD0FFF8EBD3FFF8ECD3FFF8ECD3FFC7D7C2FFB5E0
        CFFF6FE3C2FF54BC9CFF2C3D2CAE000000060000000000000000091E1645477D
        5EFFBCBC8DFFCEDAC4FFC5DDCDFFD9E5D4FFFAF2DEFFFAF2DEFFF6EEDBFFD2DF
        C9FF6CC09EFF469B7BFF171A1247000000020000000000000000000000044147
        3499B2A47BFF8BC6A9FFD4F8EEFFD3E7DBFFFCF7E9FFFCF7E8FFD0E5D8FF93D6
        BCFF55BFA1FF2752409A00000005000000000000000000000000000000010504
        030A36402F814EA889FA8ADFC9FFC3E0CFFFFDFAEEFFFAF3E1FFB7C5A6FF519C
        7DFA235647820102010800000001000000000000000000000000000000000000
        0000000000020D201A32357C68AF599677E5D2AF88FFBC9D7AE68D755BAF1A1A
        1433000000030000000000000000000000000000000000000000}
    end
  end
  object ActionList: TActionList
    Left = 383
    Top = 319
    object Act_Add: TAction
      Caption = #33258#36873#22686#21152'(&A)'
      OnExecute = Act_AddExecute
    end
    object Act_Upd: TAction
      Caption = #33258#36873#20462#25913'(&U)'
      OnExecute = Act_UpdExecute
    end
    object Act_Del: TAction
      Caption = #33258#36873#21024#38500'(&D)'
      OnExecute = Act_DelExecute
    end
    object Act_Smart: TAction
      Caption = #28155#21152#21040#33258#36873'(&A)'
      OnExecute = Act_SmartExecute
    end
    object Act_browser: TAction
      Caption = #38634#29699#32593#25171#24320'(&B)'
      OnExecute = Act_browserExecute
    end
    object Act_Noitce: TAction
      Caption = #32929#20215#25552#37266'(&N)'
      OnExecute = Act_NoitceExecute
    end
  end
  object PP_Smart: TPopupMenu
    Left = 122
    Top = 257
    object MenuItem1: TMenuItem
      Action = Act_Smart
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
        25D0522C17931209053000000009000000010000000000000000000000000000
        00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
        6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
        0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
        82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
        2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
        59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
        47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
        45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
        6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
        44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
        83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
        47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
        8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
        F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
        A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
        D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
        ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
        3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
        9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
        3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
        6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
        3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
        3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
        5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
        0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
        CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
        00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
        B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
        000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
        60CD6C543F8B16110D2200000003000000010000000000000000}
    end
    object N2: TMenuItem
      Action = Act_browser
      AutoHotkeys = maManual
      AutoLineReduction = maManual
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000001000000050000000B0000
        001000000011000000110000000D000000070000000200000000000000000000
        00000000000000000000000000000000000303020111341B146E683528C8773D
        2DE5884332FF743929E6622E21CA2F1610730301011500000004000000000000
        0000000000010000000500000010100907387F4738E1AE7F71FFBB9F94FF7458
        4DFF4E3023FF74584CFFB99D92FFA67467FF713729E00D06052B000000000000
        00020000000C0C0A054A9D8779DAA16D5CFED9C2BBFFEAE0D9FF8D7162FF9C7F
        6FFF706159FF917667FF7C6154FFE1D4CDFFC8ACA2FF5F2D20C5000000030102
        011711241499474127FDDBC9BAFFB58574FFF5EEEBFFF3E9E5FF755342FF907C
        71FF000000FF6B5D54FF72503EFFECE2DDFFDFD0CAFF7E3D2CF50000000C122B
        17AA256140FF49916FFFCDCCBEFFC09889FFE6D6D0FFF9F5F2FF9C8173FFEFE8
        CBFF938075FF9C7F6FFF917566FFF3ECE8FFD1BBB3FF623023C407110A4F2058
        36FF558B68FF60714DFFB3AC91FFE3D0C4FFBC9280FFCDAC9FFFDCCAC3FFA287
        7AFF836352FFA2877AFFDAC7C0FFC19B8FFF763D2EDE0E0705282C2B1AB25E6C
        4DFF968455FFCA955FFFDBAA71FFF1DCBFFFDDDED2FFC3B8ACFFB69989FFB28B
        7BFFB07C6AFFB08373FFA57969F63B27216E0201010D00000003926443E8CB9A
        69FFD3A16AFFE6BB80FFEAC48EFFEDCD9EFFA3B9A1FFBEEADCFFC1DDCFFFD1DA
        D0FFD4D8CEFFD6D8CEFFB3ADA0F50000000F000000010000000060593CFA6782
        5DFFC4B07BFFECC996FFF2D9B3FFF2DAB5FFBCC6A7FF98B79DFFC4C7A7FFE8C9
        95FF7D966DFF53AF8BFF345A3DFA0000000C0000000000000000275B3FE74FAE
        8BFF819C72FFF2DDB9FFF5E3C3FFF5E4C5FFF6E3C5FFEBE0C2FFAAC4ADFFA0BE
        A4FF67CBA8FF57C19EFF33583FE80000000A0000000000000000184C37AD4BAA
        87FF7BA077FFF7E8CDFFF7EAD0FFF8EBD3FFF8ECD3FFF8ECD3FFC7D7C2FFB5E0
        CFFF6FE3C2FF54BC9CFF2C3D2CAE000000060000000000000000091E1645477D
        5EFFBCBC8DFFCEDAC4FFC5DDCDFFD9E5D4FFFAF2DEFFFAF2DEFFF6EEDBFFD2DF
        C9FF6CC09EFF469B7BFF171A1247000000020000000000000000000000044147
        3499B2A47BFF8BC6A9FFD4F8EEFFD3E7DBFFFCF7E9FFFCF7E8FFD0E5D8FF93D6
        BCFF55BFA1FF2752409A00000005000000000000000000000000000000010504
        030A36402F814EA889FA8ADFC9FFC3E0CFFFFDFAEEFFFAF3E1FFB7C5A6FF519C
        7DFA235647820102010800000001000000000000000000000000000000000000
        0000000000020D201A32357C68AF599677E5D2AF88FFBC9D7AE68D755BAF1A1A
        1433000000030000000000000000000000000000000000000000}
    end
  end
end
