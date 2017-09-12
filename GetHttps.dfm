object Form1: TForm1
  Left = 488
  Top = 219
  AlphaBlend = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #36873#32929#31574#30053
  ClientHeight = 592
  ClientWidth = 776
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ListView2: TListView
    Left = 0
    Top = 0
    Width = 125
    Height = 573
    Align = alLeft
    Columns = <>
    RowSelect = True
    TabOrder = 0
    OnClick = ListView2Click
    ExplicitLeft = 209
  end
  object Panel1: TPanel
    Left = 125
    Top = 0
    Width = 651
    Height = 573
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #24494#36719#38597#40657
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 334
    ExplicitWidth = 442
    object ListView1: TListView
      Left = 1
      Top = 1
      Width = 649
      Height = 506
      Align = alClient
      Columns = <>
      TabOrder = 0
      OnCustomDrawItem = ListView1CustomDrawItem
      ExplicitWidth = 440
    end
    object Panel2: TPanel
      Left = 1
      Top = 507
      Width = 649
      Height = 65
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 440
      object StaticText1: TStaticText
        Left = 81
        Top = 1
        Width = 567
        Height = 63
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
        ExplicitWidth = 358
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 80
        Height = 63
        Align = alLeft
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Label1: TLabel
          Left = 1
          Top = 1
          Width = 78
          Height = 19
          Align = alTop
          Alignment = taCenter
          Caption = #32508#21512#25104#21151#29575
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 65
        end
        object Label2: TLabel
          Left = 1
          Top = 20
          Width = 78
          Height = 42
          Align = alClient
          Alignment = taCenter
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #24494#36719#38597#40657
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 7
          ExplicitHeight = 31
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 573
    Width = 776
    Height = 19
    Panels = <
      item
        Text = #21019#19994#26495#25351#25968
        Width = 150
      end
      item
        Text = #19978#35777#25351#25968
        Width = 150
      end
      item
        Text = #24658#29983#25351#25968
        Width = 150
      end>
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
    Left = 62
    Top = 109
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
    Left = 61
    Top = 164
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 233
    Top = 264
  end
end
