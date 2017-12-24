object FrmSetStk: TFrmSetStk
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #33258#36873#32929#35774#32622
  ClientHeight = 186
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 261
    Height = 186
    Align = alClient
    BorderStyle = bsSingle
    DoubleBuffered = False
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 0
    ExplicitHeight = 188
    object Label2: TLabel
      Left = 38
      Top = 64
      Width = 52
      Height = 13
      Caption = #35777#21048#21517#31216':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btn_Sure: TButton
      Left = 38
      Top = 142
      Width = 75
      Height = 25
      Caption = #30830#35748
      TabOrder = 3
      OnClick = btn_SureClick
    end
    object btn_Cancel: TButton
      Left = 141
      Top = 142
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 4
      OnClick = btn_CancelClick
    end
    object edt_stkname: TcxTextEdit
      Left = 95
      Top = 61
      Enabled = False
      StyleDisabled.Color = clWindow
      StyleDisabled.TextColor = clRed
      TabOrder = 1
      Width = 121
    end
    object edt__stk: TLabeledEdit
      Left = 95
      Top = 19
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #35777#21048#20195#30721':'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 0
      OnChange = edt__stkChange
      OnKeyPress = edt__stkKeyPress
    end
    object edt_px: TLabeledEdit
      Left = 95
      Top = 101
      Width = 121
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #25104#26412#20215#26684':'
      LabelPosition = lpLeft
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object IdGetStk: TIdHTTP
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
    Left = 13
    Top = 36
  end
end
