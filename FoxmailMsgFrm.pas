unit FoxmailMsgFrm;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

const
  SInformation = '提示';
  SWarning = '警告';
  SError = '错误';
  SSysMsg = '系统消息';

type
  TMsgKind = (mkInfo, mkWarning, mkError, mkSysMsg);

  TShowPos = (spLeft, spRight, spRightTop, spRightBottom);

{ TMsgForm }

  TMsgForm = class(TForm)
    lblMsg: TLabel;
    imgWarning: TImage;
    lblIcon: TLabel;
    imgError: TImage;
    imgInfo: TImage;
    imgSysMsg: TImage;
    procedure FormCreate(Sender: TObject);
    procedure tmFadeInTimer(Sender: TObject);
    procedure tmDelayTimer(Sender: TObject);
    procedure tmFadeOutTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FMsg: string;
    Bmp: TBitmap;
    FMsgKind: TMsgKind;
    StartColor, EndColor: TColor;
    FMsgPos: TShowPos;
    InTimer: Integer;
    InValue: Integer;
    InDraw: Boolean;
    tmFadeIn: TTimer;
    tmFadeOut: TTimer;
    tmDelay: TTimer;
    FOnFormClick: TThreadMethod;
    procedure SetMsg(const Value: string);
    procedure WMEraseBkgnd(var Msg: TWMEraseBkgnd); message WM_ERASEBKGND;
    procedure SetMsgKind(const Value: TMsgKind);
    procedure SetMsgPos(const Value: TShowPos);
    procedure CreateTimers;
  protected
    function CalcRect(MaxWidth: Integer; const ACap: string; AData: Pointer):
      TRect;
    procedure DrawBk;
    procedure CreateParams(var Params: TCreateParams); override;
  public
    property Msg: string read FMsg write SetMsg;
    property MsgKind: TMsgKind read FMsgKind write SetMsgKind;
    property MsgPos: TShowPos read FMsgPos write SetMsgPos;
    property OnFormClick: TThreadMethod read FOnFormClick write FOnFormClick;
  end;

procedure ShowMsg(const Info: string; Kind: TMsgKind = mkInfo; OnMsgFormClick: TThreadMethod=nil); overload;
procedure ShowInfo(const Info: string);
procedure ShowWarning(const Info: string);
procedure ShowError(const Info: string);
procedure ShowSysMsg(const Info: string);

var
  ShowPos: TShowPos = spRightBottom;
  ShowDelay: Integer = 5;

  InfoStartColor: TColor = clWhite;
  InfoEndColor: TColor = $00F0E080;
  WarningStartColor: TColor = clWhite;
  WarningEndColor: TColor = $008080F0;
  ErrorStartColor: TColor = clWhite;
  ErrorEndColor: TColor = $000000FF;

implementation

{$R *.DFM}

var
  ThisList: TThreadList;

function GetWorkRect: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0)
end;

procedure CleanUp;
var
  iLoop: Integer;
begin
  for iLoop := ThisList.LockList.Count - 1 downto 0 do
    TForm(ThisList.LockList.Items[iLoop]).Free;
end;

procedure ShowMsg(const Info: string; Kind: TMsgKind=mkInfo; OnMsgFormClick: TThreadMethod=nil);
var
  H: Integer;
begin
  with TMsgForm.Create(nil) do
  begin
    OnFormClick := OnMsgFormClick;
    Msg := '  ' + Info;
    MsgKind := Kind;
    MsgPos := ShowPos;
    H := CalcRect(lblMsg.Width, Info, nil).Bottom - lblMsg.Height;
    if H > 0 then
    begin
      lblMsg.Height := lblMsg.Height + H;
      Height := Height + H;
    end;
    ShowWindow(Handle, SW_SHOWNOACTIVATE); // 窗体不活跃
    //SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE or
    //  SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOOWNERZORDER); // 窗体显示在任务栏后面
    FormShow(nil);
  end;
end;

procedure ShowInfo(const Info: string);
begin
  ShowMsg(Info, mkInfo);
end;

procedure ShowWarning(const Info: string);
begin
  ShowMsg(Info, mkWarning);
end;

procedure ShowError(const Info: string);
begin
  ShowMsg(Info, mkError);
end;

procedure ShowSysMsg(const Info: string);
begin
  ShowMsg(Info, mkSysMsg);
end;

{ TMsgForm }

procedure TMsgForm.FormCreate(Sender: TObject);
begin
  Left := -300;
  Top := Screen.Height + 300;
  with ThisList.LockList do
  try
    Add(Self);
  finally
    ThisList.UnlockList;
  end;
  Bmp := TBitmap.Create;
  Bmp.PixelFormat := pf24Bit;
  CreateTimers;
  tmFadeIn.Enabled := True;
end;

procedure TMsgForm.FormShow(Sender: TObject);
begin
  case MsgPos of
    spLeft:
      begin
        Top := (GetWorkRect.Bottom - Height) div 2;
        Left := GetWorkRect.Left + 1 - Width;
      end;
    spRight:
      begin
        Top := (GetWorkRect.Bottom - Height) div 2;
        Left := GetWorkRect.Right - 1;
      end;
    spRightTop:
      begin
        Top := GetWorkRect.Top + 1 - Height;
        Left := GetWorkRect.Right - Width;
      end;
  else
    begin
      Top := GetWorkRect.Bottom - 1;
      Left := GetWorkRect.Right - Width - 6;
    end;
  end;
  tmDelay.Interval := ShowDelay * 1000;
  DrawBk;
end;

procedure TMsgForm.FormDestroy(Sender: TObject);
begin
  Bmp.Free;
  with ThisList.LockList do
  try
    Delete(IndexOf(Self));
  finally
    ThisList.UnlockList;
  end;
end;

procedure TMsgForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmFadeIn.Enabled := False;
  tmDelay.Enabled := False;
  tmFadeOut.Enabled := False;
  Action := caFree; // 关闭时释放
end;

procedure TMsgForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or WS_BORDER;
  Params.ExStyle := WS_EX_DLGMODALFRAME or WS_EX_TOPMOST;
end;

procedure TMsgForm.FormClick(Sender: TObject);
begin
  if Assigned(FOnFormClick) then
  begin
    tmDelayTimer(Self);
    FOnFormClick;
  end else
    tmDelayTimer(Self);
end;

procedure TMsgForm.WMEraseBkgnd(var Msg: TWMEraseBkgnd);
begin
  Bitblt(Msg.DC, 0, 0, ClientWidth, ClientHeight, Bmp.Canvas.Handle, 0, 0,
    SRCCOPY);
  Msg.Result := 1; // 已处理
end;

procedure TMsgForm.tmFadeInTimer(Sender: TObject);
begin
  Inc(InTimer);
  InValue := 1 + InTimer * 3 div 11;
  case MsgPos of
    spLeft:
      begin
        if Left >= GetWorkRect.Left then
        begin
          tmFadeIn.Enabled := False;
          tmDelay.Enabled := True;
        end
        else if Left - InValue >= GetWorkRect.Left then
          Left := GetWorkRect.Left
        else
          Left := Left + InValue;
      end;
    spRight:
      begin
        if Left <= GetWorkRect.Right - Width then
        begin
          tmFadeIn.Enabled := False;
          tmDelay.Enabled := True;
        end
        else if Left + InValue <= GetWorkRect.Right - Width then
          Left := GetWorkRect.Right - Width
        else
          Left := Left - InValue;
      end;
    spRightTop:
      begin
        if Top >= GetWorkRect.Top then
        begin
          tmFadeIn.Enabled := False;
          tmDelay.Enabled := True;
        end
        else if Top - InValue >= GetWorkRect.Top then
          Top := GetWorkRect.Top
        else
          Top := Top + InValue;
      end;
  else
    begin
      if Top + Height <= GetWorkRect.Bottom then
      begin
        tmFadeIn.Enabled := False;
        tmDelay.Enabled := True;
      end
      else if Top + Height + InValue <= GetWorkRect.Bottom then
        Top := GetWorkRect.Bottom - Height
      else
        Top := Top - InValue;
    end;
  end;
end;

procedure TMsgForm.tmDelayTimer(Sender: TObject);
begin
  tmFadeIn.Enabled := False;
  tmDelay.Enabled := False;
  tmFadeOut.Enabled := True;
end;

procedure TMsgForm.tmFadeOutTimer(Sender: TObject);
begin
  if InTimer > 0 then
    Dec(InTimer);
  InValue := 1 + InTimer * 3 div 11;
  case MsgPos of
    spLeft:
      begin
        Left := Left - InValue;
        if Left <= GetWorkRect.Left + 2 - Width then
        begin
          tmFadeOut.Enabled := False;
          Close;
        end;
      end;
    spRight:
      begin
        Left := Left + InValue;
        if Left >= GetWorkRect.Right - 2 then
        begin
          tmFadeOut.Enabled := False;
          Close;
        end;
      end;
    spRightTop:
      begin
        Top := Top - InValue;
        if Top <= GetWorkRect.Top + 1 - Height then
        begin
          tmFadeOut.Enabled := False;
          Close;
        end;
      end;
  else
    begin
      Top := Top + InValue;
      if Top >= GetWorkRect.Bottom - 2 then
      begin
        tmFadeOut.Enabled := False;
        Close;
      end;
    end;
  end;
end;

procedure TMsgForm.SetMsg(const Value: string);
begin
  FMsg := Value;
  lblMsg.Caption := FMsg;
end;

procedure TMsgForm.SetMsgKind(const Value: TMsgKind);
begin
  FMsgKind := Value;
  case FMsgKind of
    mkError:
      begin
        imgError.Visible := True;
        lblIcon.Caption := SError;
        StartColor := ColorToRGB(ErrorStartColor);
        EndColor := ColorToRGB(ErrorEndColor);
      end;
    mkWarning:
      begin
        imgWarning.Visible := True;
        lblIcon.Caption := SWarning;
        StartColor := ColorToRGB(WarningStartColor);
        EndColor := ColorToRGB(WarningEndColor);
      end;
    mkSysMsg:
      begin
        imgSysMsg.Visible := True;
        lblIcon.Caption := SSysMsg;
        StartColor := ColorToRGB(InfoStartColor);
        EndColor := ColorToRGB(InfoEndColor);
      end;
  else
    begin
      imgInfo.Visible := True;
      lblIcon.Caption := SInformation;
      StartColor := ColorToRGB(InfoStartColor);
      EndColor := ColorToRGB(InfoEndColor);
    end;
  end;
end;

procedure TMsgForm.SetMsgPos(const Value: TShowPos);
begin
  FMsgPos := Value;
end;

procedure TMsgForm.CreateTimers;
begin
  tmFadeIn := TTimer.Create(Self);
  with tmFadeIn do
  begin
    Enabled := False;
    Interval := 15;
    OnTimer := tmFadeInTimer;
  end;
  tmFadeOut := TTimer.Create(Self);
  with tmFadeOut do
  begin
    Enabled := False;
    Interval := 15;
    OnTimer := tmFadeOutTimer;
  end;
  tmDelay := TTimer.Create(Self);
  with tmDelay do
  begin
    Enabled := False;
    Interval := 5000;
    OnTimer := tmDelayTimer;
  end;
end;

function TMsgForm.CalcRect(MaxWidth: Integer; const ACap: string;
  AData: Pointer): TRect;
begin
  Result := Rect(0, 0, MaxWidth, 0);
  DrawText(lblMsg.Canvas.Handle, PChar(ACap), -1, Result, DT_CALCRECT or DT_LEFT
    or DT_WORDBREAK or DT_NOPREFIX or DrawTextBiDiModeFlagsReadingOnly);
end;

procedure TMsgForm.DrawBk;
type
  PRGBArray = ^TRGBArray;
  TRGBArray = array[Byte] of TRGBTriple;
var
  PLine: PRGBArray;
  x, y: Integer;
  ARect: TRect;
  RowInc: Integer;
  sr, sg, sb, er, eg, eb: Integer;
begin
  if InDraw then Exit;
  InDraw := True;
  Bmp.Width := ClientWidth;
  Bmp.Height := ClientHeight;
  sr := GetRValue(StartColor);
  sg := GetGValue(StartColor);
  sb := GetBValue(StartColor);
  er := GetRValue(EndColor);
  eg := GetGValue(EndColor);
  eb := GetBValue(EndColor);
  PLine := PRGBArray(Bmp.ScanLine[0]);
  for x := 0 to Bmp.Width - 1 do
  begin
    PLine[x].rgbtRed := sr + (er - sr) * x div Bmp.Width;
    PLine[x].rgbtGreen := sg + (eg - sg) * x div Bmp.Width;
    PLine[x].rgbtBlue := sb + (eb - sb) * x div Bmp.Width;
  end;
  RowInc := (Bmp.Width * 3 + 3) div 4 * 4;
  for y := 1 to Bmp.Height - 1 do
    Move(PLine^, Bmp.ScanLine[y]^, RowInc);
  ARect := Rect(0, 0, Width, Height);
  Frame3D(Bmp.Canvas, ARect, $777777, $777777, 1);
  InDraw := False;
  Refresh;
end;

initialization
  ThisList := TThreadList.Create;

finalization
  CleanUp;
  FreeAndNil(ThisList);

end.

