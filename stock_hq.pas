unit stock_hq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Vcl.StdCtrls, IdHTTP, DateUtils,
  qstring, qjson, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, dxNavBar,
  dxNavBarBase, dxNavBarCollns, cxLookAndFeels, cxLookAndFeelPainters,
  dxStatusBar, dxBarBuiltInMenu, cxPC, Vcl.Menus, Vcl.Grids, StrUtils, Vcl.OleCtrls,
  SHDocVw, SHDocVw_EWB, EwbCore, EmbeddedWB,EwbTools;

type
  // 建立一个获取行情数据的线程
  TRevThread = class(TThread)
  private
    Fstockname_strs: TStrings;
    Fstocprice_strs: TStrings;
    nColumn: Integer;
    FidHttp_stock: TIdHTTP;
    Fresh_time: Integer;
    Fthread_stock: string;
  protected
    procedure Execute; override;
  public
    constructor Create(stockname_strs: TStrings; time: Integer);
    procedure SplitString(sHTML_Text: string);
    procedure UpdateGrid;
  end;

type
  TFrm_stockhq = class(TForm)
    Strgrid_stock: TStringGrid;
    bbStart: TButton;
    bbStop: TButton;
    IdHTTP1: TIdHTTP;
    edt_fresh: TEdit;
    lbl: TLabel;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    StringGrid_wudang: TStringGrid;
    lbl_stock: TLabel;
    cxPageControl: TcxPageControl;
    cxTab_hq: TcxTabSheet;
    cxTab_smart: TcxTabSheet;
    nbMain: TdxNavBar;
    Panel1: TPanel;
    ListView1: TListView;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Timer1: TTimer;
    dxStatusBar1: TdxStatusBar;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    EmbeddedWB1: TEmbeddedWB;
    procedure FormCreate(Sender: TObject);
    procedure bbStartClick(Sender: TObject);
    procedure bbStopClick(Sender: TObject);
    procedure EmbeddedWB1Click(Sender: TObject; Button: TMouseButton; Shift:
        TShiftState; X, Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Strgrid_stockClick(Sender: TObject);
    procedure Strgrid_stockDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid_wudangDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Fstockname_strs: TStrings;
    FStock_thread: TRevThread;
    FSelect_stock: string;        //选中的股票代码
    FSelect_stock_price: string; //昨日价格
    sUrl_GetStock: string;
    bFirst_Select: Boolean;
    procedure bt_status(Fstatus: Boolean);
    procedure CreateNav(sType: string; Ajson: TQJson);
    function GetHTML(Url: string): string;
    procedure GetStock(Url: string);
    procedure GetStockType;
    function GetUnixTime: string;
    procedure ItemClick(Sender: TObject);
    //Unicode转中文编码
    function UnicodeToChinese(inputstr: string): string; overload;
    procedure Updlistview(Ajson: TQJson);
    procedure WMSysCommand(var msg: TMessage); message WM_SYSCOMMAND;
    procedure GetChart();

    { Public declarations }
  end;

var
  Frm_stockhq: TFrm_stockhq;

implementation

{$R *.dfm}

procedure TFrm_stockhq.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW); {不在任务栏显示}
  Fstockname_strs := TStringList.Create;

  //设置列表行情显示
  Strgrid_stock.ColCount := 7;
  Strgrid_stock.Cells[1, 0] := '代码';
  Strgrid_stock.Cells[2, 0] := '名称';
  Strgrid_stock.Cells[3, 0] := '当前价';
  Strgrid_stock.Cells[4, 0] := '涨跌幅';
  Strgrid_stock.Cells[5, 0] := '更新时间';
  Strgrid_stock.Cells[6, 0] := '昨日收盘价';
  Strgrid_stock.ColWidths[1] := 60;
  Strgrid_stock.ColWidths[4] := 120;
  Strgrid_stock.ColWidths[5] := 100;
  Strgrid_stock.ColWidths[0] := -1;
  Strgrid_stock.ColWidths[6] := -1;

  //五档行情
  StringGrid_wudang.RowHeights[0] := 0;
  StringGrid_wudang.ColWidths[1] := 60;
  StringGrid_wudang.Cells[0, 1] := '卖五';
  StringGrid_wudang.Cells[0, 2] := '卖四';
  StringGrid_wudang.Cells[0, 3] := '卖三';
  StringGrid_wudang.Cells[0, 4] := '卖二';
  StringGrid_wudang.Cells[0, 5] := '卖一';
  StringGrid_wudang.Cells[0, 6] := '买一';
  StringGrid_wudang.Cells[0, 7] := '买二';
  StringGrid_wudang.Cells[0, 8] := '买三';
  StringGrid_wudang.Cells[0, 9] := '买四';
  StringGrid_wudang.Cells[0, 10] := '买五';

  bt_status(False);
  cxPageControl.ActivePage := cxTab_hq;
  ListView1.Clear;

  ListView1.Columns.Clear;
  for i := 0 to 6 do
  begin
    ListView1.Columns.Add;
    ListView1.Columns.Items[i].Width := 100;
    ListView1.Columns.Items[i].Alignment := taCenter;
  end;
  ListView1.Columns.Items[1].Caption := '代码';
  ListView1.Columns.Items[2].Caption := '名称';
  ListView1.Columns.Items[3].Caption := '当前价';
  ListView1.Columns.Items[4].Caption := '涨跌幅';
  ListView1.Columns.Items[5].Caption := '涨跌幅1';
  ListView1.Columns.Items[6].Caption := '入选时间';
  ListView1.Columns.Items[6].Width := 150;
  ListView1.Columns.Items[0].Width := 0;
  ListView1.Columns.Items[5].Width := 0;
  Listview1.ViewStyle := vsreport;
  Listview1.GridLines := False;

  GetStockType;
end;

procedure TFrm_stockhq.bbStartClick(Sender: TObject);
var
  i: Integer;
  txt: TextFile;
  s: string;
  path: string;
  Sstock_name: TStrings;
begin
  //获取股票代码
  path := ExtractFilePath(Application.ExeName);
  try
    AssignFile(txt, path + '\stock.txt');
    Reset(txt);
    Readln(txt, s);
    CloseFile(txt);
  except
    ShowMessage('获取股票代码失败');
    Exit;
  end;

  Fstockname_strs.CommaText := s;

  for i := 0 to Fstockname_strs.Count - 1 do
  begin
    Strgrid_stock.Cells[1, i + 1] := Fstockname_strs[i];
    if StrToInt(Fstockname_strs[i]) < 600000 then
      Fstockname_strs[i] := 'sz' + Fstockname_strs[i]
    else
      Fstockname_strs[i] := 'sh' + Fstockname_strs[i];
  end;
  //默认加入上证指数
  Strgrid_stock.Cells[1, Fstockname_strs.Count + 1] := '000001';
  Fstockname_strs.Add('sh000001');
  Strgrid_stock.RowCount := Fstockname_strs.Count + 1;

  FStock_thread := TRevThread.Create(Fstockname_strs, StrToInt(edt_fresh.Text));
  FStock_thread.FreeOnTerminate := True;
  FStock_thread.Resume;

  bt_status(True);
end;

procedure TFrm_stockhq.bbStopClick(Sender: TObject);
begin
  if (FStock_thread <> nil) then
  begin
    if FStock_thread.Suspended then
      FStock_thread.Resume;
    FStock_thread.Terminate;
    FStock_thread := nil;
  end;
  bt_status(False);
end;

procedure TFrm_stockhq.bt_status(Fstatus: Boolean);
begin
  if Fstatus then
  begin
    bbStart.Enabled := False;
    bbStop.Enabled := True;
    edt_fresh.Enabled := False;
  end
  else
  begin
    bbStart.Enabled := True;
    bbStop.Enabled := False;
    edt_fresh.Enabled := True;
  end;
end;

procedure TFrm_stockhq.CreateNav(sType: string; Ajson: TQJson);
var
  aBarItem: TdxNavBarItem;
  aBarGroup: TdxNavBargroup;
  i, j: Integer;
begin
  for i := 0 to nbMain.Groups.Count - 1 do
  begin
    if sType = nbMain.Groups.Items[i].Caption then
    begin
      for j := 0 to Ajson.Count - 1 do
      begin
        aBarItem := nbMain.Items.Add;
        aBarItem.Caption := Ajson[j].ValueByName('name', '');
        aBarItem.Tag := Ajson[j].ItemByName('id').AsInteger;
        aBarItem.OnClick := ItemClick;
        nbMain.Groups.Items[i].CreateLink(aBarItem);
      end;
      Exit;
    end;
  end;

  aBarGroup := nbMain.Groups.Add;
  aBarGroup.Caption := sType;
  for j := 0 to Ajson.Count - 1 do
  begin
    aBarItem := nbMain.Items.Add;
    aBarItem.Caption := Ajson[j].ValueByName('name', '');
    aBarItem.Tag := Ajson[j].ItemByName('id').AsInteger;
    aBarItem.OnClick := ItemClick; //绑定事件
    aBarGroup.CreateLink(aBarItem);
  end;
end;

procedure TFrm_stockhq.EmbeddedWB1Click(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
  Panel7.Visible := False;
end;

procedure TFrm_stockhq.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_stockhq.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Tag := Ord(WindowState);
  TrayIcon1.Visible := True;
  TrayIcon1.SetDefaultIcon;
  Hide;
  CanClose := False;
end;

procedure TFrm_stockhq.FormShow(Sender: TObject);
var
  i: Integer;
begin
{
  ListView1.Clear;

  ListView1.Columns.Clear;
  for i := 0 to 6 do
  begin
    ListView1.Columns.Add;
    ListView1.Columns.Items[i].Width := 100;
    ListView1.Columns.Items[i].Alignment := taCenter;
  end;
  ListView1.Columns.Items[1].Caption := '代码';
  ListView1.Columns.Items[2].Caption := '名称';
  ListView1.Columns.Items[3].Caption := '当前价';
  ListView1.Columns.Items[4].Caption := '涨跌幅';
  ListView1.Columns.Items[5].Caption := '涨跌幅1';
  ListView1.Columns.Items[6].Caption := '入选时间';
  ListView1.Columns.Items[6].Width := 150;
  ListView1.Columns.Items[0].Width := 0;
  ListView1.Columns.Items[5].Width := 0;
  Listview1.ViewStyle := vsreport;
  Listview1.GridLines := False;

  GetStockType;
}
end;

procedure TFrm_stockhq.GetChart;
var
  Url: string;
begin
  if StrToInt(FSelect_stock) < 600000 then
    Url := 'sz' + FSelect_stock
  else
    Url := 'sh' + FSelect_stock;
  EmbeddedWB1.Navigate('http://image.sinajs.cn/newchart/min/n/' + Url + '.gif');
  Panel7.Visible := True;
end;

function TFrm_stockhq.GetHTML(Url: string): string;
var
  s_HTML: string;
  i: Integer;
begin
  try
    s_HTML := IdHTTP1.Get(Url);
    s_HTML := UnicodeToChinese(s_HTML);
    i := Pos('(', s_HTML);
    s_HTML := Copy(s_HTML, i + 1, Length(s_HTML) - i - 1);
    Result := s_HTML;
  except
    Result := '';
  end;
end;

procedure TFrm_stockhq.GetStock(Url: string);
//解析json
var
  AJson, AJson_Result: TQJson;
  sHTML, Stockid, StockName, ChangeRate, CurrPx: string;
  fRate: Double;
  i: Integer;
begin
  sHTML := GetHTML(sUrl_GetStock);
  if sHTML = '' then
    Exit;
  AJson := TQJson.Create;
  try
    AJson.Parse(sHTML);
    if AJson.AsString = '' then
      Exit;
    //获取失败，则直接退出
    if AJson.ItemByName('errmsg').AsString <> 'success' then
      Exit;
    StaticText1.Caption := AJson.ItemByName('result').ItemByName('name').AsString + ':' + #30#13 + AJson.ItemByName('result').ItemByName('description').AsString;
    fRate := AJson.ItemByName('result').ItemByName('successRate').AsFloat;
    if fRate > 0 then
    begin
      Panel3.Visible := True;
      Label2.Caption := Format('%d%s', [Trunc(fRate * 100), '%']);
      if fRate < 0.6 then
        Label2.Font.Color := clBlue
      else if (fRate >= 0.6) and (fRate < 0.7) then
        Label2.Font.Color := RGB(255, 136, 0)
      else
        Label2.Font.Color := clRed;
    end
    else
      Panel3.Visible := False;
    AJson_Result := AJson.ItemByName('result').ItemByName('stocks');
    for i := 0 to AJson_Result.Count - 1 do
    begin
      //更新记录
      Updlistview(AJson_Result[i]);
    end;
  finally
    AJson.Free;
  end;
  bFirst_Select := False;
  Timer1.Interval := 10000;
end;

procedure TFrm_stockhq.GetStockType;
var
  sHTML, URL, sUnixTime: string;
  AJson, AJson_Result, AJson_list: TQJson;
  sTypeid, sType, sTypename, sDescription, sSuccessRate: string;
  i, j: Integer;
begin
  sUnixTime := GetUnixTime();
  //获取智能选股列
  URL := 'https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/list?_=' + sUnixTime + '&callback=jsonp1';
  sHTML := GetHTML(URL);
  if sHTML = '' then
    Exit;
  //解析json
  AJson := TQJson.Create;
  try
    AJson.Parse(sHTML);
    if AJson.AsString = '' then
      Exit;
    //获取失败，则直接退出
    if AJson.ItemByName('errmsg').AsString <> 'success' then
      Exit;
    AJson_Result := AJson.ItemByName('result');
    for i := 0 to AJson_Result.Count - 1 do
    begin
      AJson_list := AJson_Result[i].ItemByName('list');
      sType := AJson_Result[i].ItemByName('type').AsString;
      CreateNav(sType, AJson_list);
    end;
  finally
    AJson.Free;
  end;
end;

function TFrm_stockhq.GetUnixTime: string;
begin
  Result := IntToStr((DateTimeToUnix(Now) - 8 * 60 * 60) * 1000);
end;

procedure TFrm_stockhq.ItemClick(Sender: TObject);
var
  sUnixTime: string;
  sIndex: string;
begin
  {
  //获取智能选股列
  //URL :='https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/list?_=1504541751959&callback=jsonp1'
  //平安智能选股为https协议
  Url := 'https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/detail?id=1&orderBy=changeRate&sort=1&ps=30&_=' + sUnixTime + '&callback=jsonp1';
  //同花顺智能选股
  //Url := 'http://comment.10jqka.com.cn/znxg/formula_stocks_pc.json?_='+ sUnixTime;
  }
  sUnixTime := GetUnixTime;
  sIndex := IntToStr((Sender as TdxNavBarItem).Tag);
  sUrl_GetStock := 'https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/detail?id=' + sIndex + '&orderBy=changeRate&sort=1&ps=30&_=' + sUnixTime + '&callback=jsonp1';
  Timer1.Interval := 100;
  Timer1.Enabled := False;
  Timer1.Enabled := True;
  ListView1.Items.Clear;
  bFirst_Select := True;
end;

procedure TFrm_stockhq.ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  item.listview.Canvas.Font.Size := 10;
  item.listview.Canvas.Font.Name := '微软雅黑';
  //涨跌幅
  if StrToFloat(Item.SubItems.Strings[4]) > 0 then
    item.listview.Canvas.Font.Color := clRed
  else if (StrToFloat(Item.SubItems.Strings[4]) < 0) then
    item.listview.Canvas.Font.Color := clBlue;
end;

procedure TFrm_stockhq.Strgrid_stockClick(Sender: TObject);
var
  Rowindex: integer;
begin
  Rowindex := Strgrid_stock.Row; //获取行索引
  FSelect_stock := Strgrid_stock.Cells[1, Rowindex];
  GetChart;
end;

procedure TFrm_stockhq.Strgrid_stockDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
  r: TRect;
begin
  Str := Strgrid_stock.Cells[ACol, ARow];
  with Strgrid_stock do
  begin
    Canvas.Font.Size := 10;
    Canvas.Font.Name := '微软雅黑';
    if (ARow > 0) and (Acol <> 5) and (Acol <> 1) then
    begin
      if (Strgrid_stock.Cells[4, ARow] <> '') and (CompareStr(Strgrid_stock.Cells[3, ARow], Strgrid_stock.Cells[6, ARow]) > 0) then
        Strgrid_stock.Canvas.Font.Color := clred //涨|字体颜色为红的
      else
        Strgrid_stock.Canvas.Font.Color := clGreen; //跌|字体颜色为绿的
    end
    else
      Strgrid_stock.Canvas.Font.Color := clBlack;
    Canvas.FillRect(Rect);
    DrawText(Canvas.Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER); //文字居中
  end;
end;

procedure TFrm_stockhq.StringGrid_wudangDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
  r: TRect;
begin
  Str := StringGrid_wudang.Cells[ACol, ARow];
  with StringGrid_wudang do
  begin
    //Canvas.Font.Size := 10;
    Canvas.Font.Name := '微软雅黑';
    if (ARow > 0) and (Acol = 1) then
    begin
      if (CompareStr(Cells[1, ARow], FSelect_stock_price) > 0) then
        Canvas.Font.Color := clred //涨|字体颜色为红的
      else
        Canvas.Font.Color := clGreen; //跌|字体颜色为绿的
    end
    else
      Canvas.Font.Color := clBlack;
    Canvas.FillRect(Rect);
    DrawText(Canvas.Handle, PChar(Str), Length(Str), Rect, DT_CENTER or DT_SINGLELINE or DT_VCENTER); //文字居中
  end;
end;

procedure TFrm_stockhq.Timer1Timer(Sender: TObject);
begin
  try
    GetStock(sUrl_GetStock);
  except
    Timer1.Enabled := False;
  end;
end;

procedure TFrm_stockhq.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := True;
  Show;
  WindowState := TWindowState(Tag);
  SetForegroundWindow(Handle);
end;

function TFrm_stockhq.UnicodeToChinese(inputstr: string): string;
var
  index: Integer;
  temp, top, last: string;
begin
  index := 1;
  while index >= 0 do
  begin
    index := Pos('\u', inputstr) - 1;
    if index < 0 then
    begin
      last := inputstr;
      Result := Result + last;
      Exit;
    end;
    top := Copy(inputstr, 1, index); // 取出 编码字符前的 非 unic 编码的字符，如数字
    temp := Copy(inputstr, index + 1, 6); // 取出编码，包括 \u,如\u4e3f
    Delete(temp, 1, 2);
    Delete(inputstr, 1, index + 6);
    Result := Result + top + WideChar(StrToInt('$' + temp));
  end;
end;

procedure TFrm_stockhq.Updlistview(Ajson: TQJson);
var
  Stockid, StockName, ChangeRate, CurrPx, chosenTime: string;
  i, nIndex: Integer;
begin
  //openPx : 今开
  //changeRate:涨跌幅
  //code：股票代码
  //codeType：市场类型
  //turnoverRate:
  //changePx:
  //type:
  //lowPx: 最低价
  //pClosePx：昨收
  //name：股票名称
  //currPx：当前价
  //highPx：最高价
  //chosenTime：入选时间
  Stockid := Ajson.ValueByName('code', '');
  StockName := Ajson.ValueByName('name', '');
  CurrPx := Format('%.2f', [Ajson.ItemByName('currPx').AsFloat]);
  ChangeRate := Format('%.2f%s', [(Ajson.ItemByName('changeRate').AsFloat) * 100, '%']);
  chosenTime := Ajson.ValueByName('chosenTime', '');
  if not (bFirst_Select) then
  begin
    //更新数据
    //锁住listview防止刷新
    LockWindowUpdate(Self.ListView1.Handle);
    ListView1.Items.BeginUpdate;
    try
      with ListView1 do
      begin
        for i := 0 to Items.Count - 1 do
        begin
          if (Stockid = Items.Item[i].SubItems.Strings[0]) then
          begin
            Items.Item[i].SubItems.Strings[2] := CurrPx;
            Items.Item[i].SubItems.Strings[3] := ChangeRate;
            Items.Item[i].SubItems.Strings[5] := chosenTime;
          end;
        end;
      end;
    finally
      ListView1.Items.EndUpdate;
      //解锁listview
      LockWindowUpdate(0);
    end;
  end
  else
  begin
    //增加数据
    with listview1.items.add do
    begin
      subitems.add(Stockid);
      subitems.add(StockName);
      subitems.add(CurrPx);
      subitems.add(ChangeRate);
      subItems.Add(Ajson.ItemByName('changeRate').AsString);
      subitems.add(chosenTime);
    end;
  end;
end;

procedure TFrm_stockhq.WMSysCommand(var msg: TMessage);
begin
  inherited;
  if Msg.WParam = SC_MINIMIZE then // 窗口收到最小化消息
  begin
    //SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_HIDEWINDOW);
    Hide; // 在任务栏隐藏程序
  end;
end;

constructor TRevThread.Create(stockname_strs: TStrings; time: Integer);
begin
  inherited Create(True);
  Fstockname_strs := TStringList.Create;
  Fstocprice_strs := TStringList.Create;
  //输出文件中带有空格，自动被分割，导致错误
  Fstocprice_strs.StrictDelimiter := True;
  Fstockname_strs := stockname_strs;
  Fresh_time := time;
  FidHttp_stock := TIdHTTP.Create(nil);
end;

procedure TRevThread.Execute;
var
  i: Integer;
  url, s: string;
begin
  inherited;
  try
    while not Terminated do
    begin
      for i := 0 to Fstockname_strs.Count - 1 do
      begin
        nColumn := i;
        url := 'http://hq.sinajs.cn/?list=' + Fstockname_strs[i];

         //使用代理服务器
        //IdHTTP1.ProxyParams.ProxyServer := '代理服务器地址';
        //IdHTTP1.ProxyParams.ProxyPort := '代理服务器端口';

        s := FidHttp_stock.Get(url);
        SplitString(s);
        Synchronize(UpdateGrid);
      end;
      sleep(Fresh_time * 1000);
    end;
  finally

  end;
end;

procedure TRevThread.SplitString(sHTML_Text: string);
var
  i: Integer;
  //strs: TStrings;
begin
  //获取当前股票代码
  i := Pos('=', sHTML_Text);
  Fthread_stock := Copy(sHTML_Text, 1, i - 1);
  Fthread_stock := RightStr(Fthread_stock, 6);

  //分割字符，取出行情数据
  i := Pos('"', sHTML_Text);
  sHTML_Text := Copy(sHTML_Text, i + 1, Length(sHTML_Text) - i - 3);
  Fstocprice_strs.CommaText := sHTML_Text;
end;

procedure TRevThread.UpdateGrid;

  function RoundClassic(R: string): int64;
  begin
    if (StrToInt(R) mod 100) > 0 then
      Result := StrToInt(R) div 100 + 1
    else
      Result := StrToInt(R) div 100;
  end;

var
  Change_percent: string;
  Change_amt: Double;
  Change_flag: string;
begin
  Frm_stockhq.Strgrid_stock.Cells[2, ncolumn + 1] := Fstocprice_strs[0];  //股票名称
  Frm_stockhq.Strgrid_stock.Cells[3, ncolumn + 1] := Format('%.2f', [StrToFloat(Fstocprice_strs[3])]);  //当前价格
  Frm_stockhq.Strgrid_stock.Cells[6, ncolumn + 1] := Format('%.2f', [StrToFloat(Fstocprice_strs[2])]);  //昨日价格
  Change_amt := StrToFloat(Fstocprice_strs[3]) - StrToFloat(Fstocprice_strs[2]);
  if (Change_amt > 0) then
    Change_flag := '+';
  Change_percent := Format('%s%.2f%s%.2f%s', [Change_flag, Change_amt, '(', Change_amt * 100 / StrToFloat(Fstocprice_strs[2]), '%)']);
  Frm_stockhq.Strgrid_stock.Cells[4, ncolumn + 1] := Change_percent;  //涨跌幅
  Frm_stockhq.Strgrid_stock.Cells[5, ncolumn + 1] := FormatDateTime('hh时nn分ss秒', now());

  //更新五档行情
  if Frm_stockhq.FSelect_stock = Fthread_stock then
  begin
    Frm_stockhq.lbl_stock.Caption := Fstocprice_strs[0] + #10 + Frm_stockhq.FSelect_stock;
    Frm_stockhq.FSelect_stock_price := Fstocprice_strs[2];

    //五档笔数  股数/100
    Frm_stockhq.StringGrid_wudang.Cells[2, 6] := inttostr(RoundClassic(Fstocprice_strs[10])); //买一笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 7] := inttostr(RoundClassic(Fstocprice_strs[12]));  //买二笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 8] := inttostr(RoundClassic(Fstocprice_strs[14]));  //买三笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 9] := inttostr(RoundClassic(Fstocprice_strs[16]));  //买四笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 10] := inttostr(RoundClassic(Fstocprice_strs[18])); //买五笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 1] := inttostr(RoundClassic(Fstocprice_strs[28]));  //卖五笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 2] := inttostr(RoundClassic(Fstocprice_strs[26])); //卖四笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 3] := inttostr(RoundClassic(Fstocprice_strs[24]));  //卖三笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 4] := inttostr(RoundClassic(Fstocprice_strs[22])); //卖二笔数
    Frm_stockhq.StringGrid_wudang.Cells[2, 5] := inttostr(RoundClassic(Fstocprice_strs[20]));  //卖一笔数

    //五档价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 6] := Fstocprice_strs[11]; //买一价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 7] := Fstocprice_strs[13]; //买二价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 8] := Fstocprice_strs[15]; //买三价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 9] := Fstocprice_strs[17]; //买四价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 10] := Fstocprice_strs[19]; //买五价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 1] := Fstocprice_strs[29]; //卖五价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 2] := Fstocprice_strs[27]; //卖四价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 3] := Fstocprice_strs[25]; //卖三价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 4] := Fstocprice_strs[23]; //卖二价格
    Frm_stockhq.StringGrid_wudang.Cells[1, 5] := Fstocprice_strs[21]; //卖一价格
  end;
end;

end.

