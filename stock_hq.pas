unit stock_hq;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Vcl.StdCtrls, IdHTTP, DateUtils,
  qjson, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, dxNavBar,
  dxNavBarCollns, cxLookAndFeels, cxLookAndFeelPainters, Winapi.ShellAPI,
  dxStatusBar, dxBarBuiltInMenu, cxPC, Vcl.Menus, Vcl.Grids, StrUtils, dxBar,
  cxClasses, Vcl.OleCtrls, SHDocVw, SQLiteTable3, Vcl.ActnList;

type
  // 建立一个获取行情数据的线程
  TRevThread = class(TThread)
  private
    Fstocprice_strs: TStrings;
    nColumn: Integer;
    FidHttp_stock: TIdHTTP;
    Fresh_time: Integer;
    Fthread_stock: string;
  protected
    procedure Execute; override;
  public
    constructor Create(time: Integer);
    procedure SplitString(sHTML_Text: string);
    procedure UpdateGrid;
    //弹窗提醒
    procedure SetNotice(Fstkcode, Fstkname, Fcurrent_Price, Fchange_rate: string);
  end;

type
  TFrm_stockhq = class(TForm)
    Strgrid_stock: TStringGrid;
    IdHTTP1: TIdHTTP;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Exit1: TMenuItem;
    StringGrid_wudang: TStringGrid;
    lbl_stock: TLabel;
    nbMain: TdxNavBar;
    Panel1: TPanel;
    lv_Smart: TListView;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Timer1: TTimer;
    dxStatusBar: TdxStatusBar;
    Panel5: TPanel;
    Panel6: TPanel;
    dxBarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarBtn_stock: TdxBarLargeButton;
    dxBarBtn_smart: TdxBarLargeButton;
    dxBarBtn_refresh: TdxBarLargeButton;
    dxBarBtn_set: TdxBarLargeButton;
    cxPageControl: TcxPageControl;
    cxTab_stock: TcxTabSheet;
    cxTab_Smart: TcxTabSheet;
    cxTab_set: TcxTabSheet;
    Panel4: TPanel;
    lbl: TLabel;
    bbStart: TButton;
    bbStop: TButton;
    edt_fresh: TEdit;
    Panel7: TPanel;
    dxBarSubItem1: TdxBarSubItem;
    Panel8: TPanel;
    btn_min: TButton;
    btn_day: TButton;
    Button3: TButton;
    btn_close: TButton;
    Panel9: TPanel;
    Check_Kflag: TCheckBox;
    Timer_k: TTimer;
    PP_stk: TPopupMenu;
    itInsert: TMenuItem;
    itUpd: TMenuItem;
    itDelete: TMenuItem;
    ActionList: TActionList;
    Act_Add: TAction;
    Act_Upd: TAction;
    Act_Del: TAction;
    PP_Smart: TPopupMenu;
    MenuItem1: TMenuItem;
    Act_Smart: TAction;
    Act_browser: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    WebBrowser: TWebBrowser;
    N3: TMenuItem;
    Act_Noitce: TAction;
    procedure Act_AddExecute(Sender: TObject);
    procedure Act_browserExecute(Sender: TObject);
    procedure Act_DelExecute(Sender: TObject);
    procedure Act_NoitceExecute(Sender: TObject);
    procedure Act_SmartExecute(Sender: TObject);
    procedure Act_UpdExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbStartClick(Sender: TObject);
    procedure bbStopClick(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure btn_dayClick(Sender: TObject);
    procedure btn_minClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure dxBarBtn_refreshClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure lv_SmartCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Strgrid_stockClick(Sender: TObject);
    procedure Strgrid_stockDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringGrid_wudangDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure dxBarBtn_stockClick(Sender: TObject);
    procedure dxBarBtn_smartClick(Sender: TObject);
    procedure dxBarBtn_setClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer_kTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Fstockname_strs: TStrings;
    FStock_thread: TRevThread;
    FSelect_stock: string;        //选中的股票代码
    FSelect_stock_price: string; //昨日价格
    sUrl_GetStock: string;
    bFirst_Select: Boolean;
    procedure bt_status(Fstatus: Boolean);
    procedure CreateNav(sType: string; Ajson: TQJson);
    procedure GetChart(sUrl: string; flag: Integer);
    procedure GetStock(Url: string);
    procedure GetStockType;
    procedure Updlistview(Ajson: TQJson);
    procedure ItemClick(Sender: TObject);
    procedure WMSysCommand(var msg: TMessage); message WM_SYSCOMMAND;
    function GetHTML(Url: string): string;
    function GetUnixTime: string;
    //Unicode转中文编码
    function UnicodeToChinese(inputstr: string): string; overload;
  end;

var
  Frm_stockhq: TFrm_stockhq;
  SqlDb: TSQLiteDatabase;

implementation

{$R *.dfm}
uses
  setStkSql, USetStk, UNotice;

procedure TFrm_stockhq.Act_AddExecute(Sender: TObject);
begin
  frmSetStk := TFrmSetStk.Create(self);
  try
    frmSetStk.edt__stk.Text := '';
    frmSetStk.edt_stkname.Text := '';
    frmSetStk.edt_px.Text := '';
    if frmSetStk.ShowModal = mrCancel then
      Exit;
  finally
    frmSetStk.Free;
  end;
  dxBarBtn_refreshClick(nil);
end;

procedure TFrm_stockhq.Act_browserExecute(Sender: TObject);
var
  sUrl: string;
  Rowindex: integer;
  sStkCode: string;  //证券代码
begin
  if cxPageControl.ActivePage = cxTab_stock then
  begin
    Rowindex := Strgrid_stock.Row; //获取行索引
    if Rowindex > 0 then
    begin
      sStkCode := Strgrid_stock.Cells[1, Rowindex];
    end;
  end
  else if cxPageControl.ActivePage = cxTab_Smart then
  begin
    if lv_Smart.Selected = nil then
    begin
      MessageBox(Handle, '请选择要打开的证券！', '提示', MB_OK + MB_ICONINFORMATION);
      Exit;
    end;
    sStkCode := lv_Smart.Selected.SubItems.Strings[0];
  end;
  if sStkCode < '600000' then
    sUrl := 'https://xueqiu.com/S/SZ' + sStkCode
  else
    sUrl := 'https://xueqiu.com/S/SH' + sStkCode;
  //打开浏览器
  ShellExecute(Handle, nil, PChar(sUrl), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrm_stockhq.Act_DelExecute(Sender: TObject);
var
  Rowindex: integer;
  sStkCode: string;  //证券名称
begin
  Rowindex := Strgrid_stock.Row; //获取行索引
  if Rowindex > 0 then
  begin
    sStkCode := Strgrid_stock.Cells[1, Rowindex];
    DelStock_sql(sStkCode);
  end;
  dxBarBtn_refreshClick(nil);
end;

procedure TFrm_stockhq.Act_NoitceExecute(Sender: TObject);
var
  Rowindex: integer;
  sStkName: string;  //证券名称
  sStkCode: string;  //证券名称
  sChosenPx: string; //入选价格
  sMsg: string;
begin
  Rowindex := Strgrid_stock.Row; //获取行索引
  if Rowindex > 0 then
  begin
    sStkCode := Strgrid_stock.Cells[1, Rowindex];
    sStkName := Strgrid_stock.Cells[2, Rowindex];
    sChosenPx := Strgrid_stock.Cells[6, Rowindex];
    sMsg := sStkName + '(' + sStkCode + ')当前价：' + sChosenPx;
    frmNotice := TfrmNotice.Create(self);
    try
      frmNotice.Fstock := sStkCode;
      frmNotice.lblMsg.Caption := smsg;
      frmNotice.GetNotice(sStkCode);
      if frmNotice.ShowModal = mrCancel then
        Exit;
    finally
      frmNotice.Free;
    end;
  end;
end;

procedure TFrm_stockhq.Act_SmartExecute(Sender: TObject);
var
  sStkName: string;  //证券名称
  sStkCode: string;  //证券代码
  sChosenPx: string; //入选价格
  bSqlResult: Boolean;
begin
  if lv_Smart.Selected = nil then
  begin
    MessageBox(Handle, '请选择要添加的证券！', '提示', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  sStkCode := lv_Smart.Selected.SubItems.Strings[0];
  sStkName := lv_Smart.Selected.SubItems.Strings[1];
  sChosenPx := lv_Smart.Selected.SubItems.Strings[2];
  bSqlResult := SetStock_sql(sStkCode, sStkName, sChosenPx);
  if bSqlResult then
  begin
    MessageBox(Handle, '添加证券成功！', '提示', MB_OK + MB_ICONINFORMATION);
      //刷新
    dxBarBtn_refreshClick(nil);
  end
  else
    MessageBox(Handle, '添加证券失败！', '错误', MB_OK + MB_ICONSTOP)
end;

procedure TFrm_stockhq.Act_UpdExecute(Sender: TObject);
var
  Rowindex: integer;
  sStkName: string;  //证券名称
  sStkCode: string;  //证券名称
  sChosenPx: string; //入选价格
begin
  Rowindex := Strgrid_stock.Row; //获取行索引
  if Rowindex > 0 then
  begin
    sStkCode := Strgrid_stock.Cells[1, Rowindex];
    sStkName := Strgrid_stock.Cells[2, Rowindex];
    sChosenPx := Strgrid_stock.Cells[6, Rowindex];

    frmSetStk := TFrmSetStk.Create(self);
    try
      frmSetStk.edt__stk.Text := sStkCode;
      frmSetStk.edt_stkname.Text := sStkName;
      frmSetStk.edt_px.Text := sChosenPx;
      if frmSetStk.ShowModal = mrCancel then
        Exit;
    finally
      frmSetStk.Free;
    end;
  end;
end;

procedure TFrm_stockhq.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW); {不在任务栏显示}
  Fstockname_strs := TStringList.Create;
  SqlDb := TSQLiteDatabase.Create('stock.db');
  //设置列表行情显示
  Strgrid_stock.ColCount := 9;
  Strgrid_stock.RowCount := 9;
  Strgrid_stock.Cells[1, 0] := '代码';
  Strgrid_stock.Cells[2, 0] := '名称';
  Strgrid_stock.Cells[3, 0] := '当前价';
  Strgrid_stock.Cells[4, 0] := '涨跌幅';
  Strgrid_stock.Cells[5, 0] := '累计涨跌幅';
  Strgrid_stock.Cells[6, 0] := '入选价格';
  Strgrid_stock.Cells[7, 0] := '入选时间';
  Strgrid_stock.Cells[8, 0] := '昨日收盘价';
  //Strgrid_stock.ColWidths[1] := 60;
  Strgrid_stock.ColWidths[0] := 0;
  Strgrid_stock.ColWidths[4] := 100;
  Strgrid_stock.ColWidths[5] := 75;
  Strgrid_stock.ColWidths[7] := 140;
  Strgrid_stock.ColWidths[8] := -1;

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
  cxPageControl.ActivePage := cxTab_stock;
  lv_Smart.Clear;

  lv_Smart.Columns.Clear;
  for i := 0 to 9 do
  begin
    lv_Smart.Columns.Add;
    lv_Smart.Columns.Items[i].Width := 75;
    lv_Smart.Columns.Items[i].Alignment := taCenter;
  end;
  lv_Smart.Columns.Items[1].Caption := '代码';
  lv_Smart.Columns.Items[2].Caption := '名称';
  lv_Smart.Columns.Items[3].Caption := '当前价';
  lv_Smart.Columns.Items[4].Caption := '涨跌幅';
  lv_Smart.Columns.Items[5].Caption := '涨跌幅1';

  lv_Smart.Columns.Items[6].Caption := '累计涨跌幅';
  lv_Smart.Columns.Items[6].Width := 80;
  lv_Smart.Columns.Items[7].Caption := '入选价格';
  //ListView1.Columns.Items[6].Width := 150;
  lv_Smart.Columns.Items[8].Caption := '入选时间';
  lv_Smart.Columns.Items[8].Width := 140;

  lv_Smart.Columns.Items[9].Caption := '所属主题';
  //ListView1.Columns.Items[6].Width := 150;
  lv_Smart.Columns.Items[0].Width := 0;
  lv_Smart.Columns.Items[5].Width := 0;
  lv_Smart.ViewStyle := vsreport;
  lv_Smart.GridLines := False;

  lbl_stock.Font.Color := RGB(0, 85, 162);
  GetStockType;

  //重置股票提醒标志
  ResetStockNoticeFlag_sql;

  //启动
  dxBarBtn_refreshClick(nil);
end;

procedure TFrm_stockhq.bbStartClick(Sender: TObject);
var
  i: Integer;
  txt: TextFile;
  s: string;
  path: string;
  SqlTb: TSQLiteTable;
begin
  {
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
  }
  //通过sqlite数据库获取自选股数据
  Fstockname_strs.Clear;
  SqlTb := SqlDb.GetTable('select * from stock');
  SqlTb.MoveFirst;
  while not SqlTb.EOF do
  begin
    Fstockname_strs.Add(SqlTb.FieldAsString(SqlTb.FieldIndex['stkcode']));
    SqlTb.Next;
  end;
  //Fstockname_strs.CommaText := s;
  for i := 0 to Fstockname_strs.Count - 1 do
  begin
    Strgrid_stock.Cells[1, i + 1] := Fstockname_strs[i];
    if StrToInt(Fstockname_strs[i]) < 600000 then
      Fstockname_strs[i] := 'sz' + Fstockname_strs[i]
    else
      Fstockname_strs[i] := 'sh' + Fstockname_strs[i];
  end;

  Strgrid_stock.RowCount := Fstockname_strs.Count + 1;

  Fstockname_strs.Add('sh000001'); //上证指数
  Fstockname_strs.Add('sz399001'); //深证指数
  Fstockname_strs.Add('sz399006'); //创业板指数
  FStock_thread := TRevThread.Create(StrToInt(edt_fresh.Text));
  FStock_thread.FreeOnTerminate := True;
  FStock_thread.Resume;

  //获取选股策略
  GetStockType;
  bt_status(True);
end;

procedure TFrm_stockhq.bbStopClick(Sender: TObject);
var
  i: Integer;
begin
  if (FStock_thread <> nil) then
  begin
    if FStock_thread.Suspended then
      FStock_thread.Resume;
    FStock_thread.Terminate;
    FStock_thread := nil;
  end;
  for i := 1 to Strgrid_stock.RowCount - 1 do //不清除表头
    Strgrid_stock.Rows[i].Clear;
  Fstockname_strs.Clear;
  nbMain.Items.Clear;
  //lv_Smart.Clear;
  bt_status(False);
end;

procedure TFrm_stockhq.btn_closeClick(Sender: TObject);
begin
  Panel7.Visible := False;
end;

procedure TFrm_stockhq.btn_dayClick(Sender: TObject);
begin
  GetChart(FSelect_stock, 2);
end;

procedure TFrm_stockhq.btn_minClick(Sender: TObject);
begin
  GetChart(FSelect_stock, 1);
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

procedure TFrm_stockhq.Button3Click(Sender: TObject);
begin
  GetChart(FSelect_stock, 3);
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

procedure TFrm_stockhq.dxBarBtn_refreshClick(Sender: TObject);
begin
  bbStop.OnClick(Sender);
  bbStart.OnClick(Sender);
end;

procedure TFrm_stockhq.dxBarBtn_setClick(Sender: TObject);
begin
  cxPageControl.ActivePage := cxTab_set;
end;

procedure TFrm_stockhq.dxBarBtn_smartClick(Sender: TObject);
begin
  cxPageControl.ActivePage := cxTab_Smart;
end;

procedure TFrm_stockhq.dxBarBtn_stockClick(Sender: TObject);
begin
  cxPageControl.ActivePage := cxTab_stock;
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
begin
  //dxBarBtn_refreshClick(nil);
end;

procedure TFrm_stockhq.GetChart(sUrl: string; flag: Integer);
var
  s_market: string;
begin
{
  //新浪K线图行情
  if StrToInt(sUrl) < 600000 then
    //sUrl := 'http://image.sinajs.cn/newchart/min/n/sz' + sUrl + '.gif'
    sUrl := 'sz' + sUrl
  else
    sUrl := 'sh' + sUrl;
    //sUrl := 'http://image.sinajs.cn/newchart/min/n/sh' + sUrl + '.gif';
  if flag = 1 then    //分时图
    sUrl := 'http://image.sinajs.cn/newchart/min/n/' + sUrl + '.gif'
  else if flag = 2 then   //日K
    sUrl := 'http://image.sinajs.cn/newchart/daily/' + sUrl + '.gif'
  else  //周K
    sUrl := 'http://image.sinajs.cn/newchart/weekly/n/' + sUrl + '.gif';
}
  //东方财富网K线图行情
  if StrToInt(sUrl) < 600000 then
  begin
    s_market := '2';
  end
  else
    s_market := '1';

  if flag = 1 then    //分时图
    sUrl := 'http://pifm.eastmoney.com/EM_Finance2014PictureInterface/Index.aspx?id=' + sUrl + s_market + '&imageType=r&token=44c9d251add88e27b65ed86506f6e5da'
  else if flag = 2 then   //日K
    sUrl := 'http://pifm.eastmoney.com/EM_Finance2014PictureInterface/Index.aspx?ID=' + sUrl + s_market + '&UnitWidth=-6&imageType=KXL&EF=&Formula=RSI&AT=&&type=&token=44c9d251add88e27b65ed86506f6e5da'
  else //周K
    sUrl := 'http://pifm.eastmoney.com/EM_Finance2014PictureInterface/Index.aspx?ID=' + sUrl + s_market + '&UnitWidth=-6&imageType=KXL&EF=&Formula=RSI&AT=&&type=W&token=44c9d251add88e27b65ed86506f6e5da';

  WebBrowser.Navigate(sUrl);
  Timer_k.Enabled := True;
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
  sHTML: string;
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
  sType: string;
  i: Integer;
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
  lv_Smart.Items.Clear;
  bFirst_Select := True;
end;

procedure TFrm_stockhq.lv_SmartCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  item.listview.Canvas.Font.Size := 10;
  item.listview.Canvas.Font.Name := '微软雅黑';
  //涨跌幅
  if StrToFloat(Item.SubItems.Strings[4]) > 0 then
    item.listview.Canvas.Font.Color := clRed
  else if (StrToFloat(Item.SubItems.Strings[4]) < 0) then
    item.listview.Canvas.Font.Color := clGreen;
end;

procedure TFrm_stockhq.Strgrid_stockClick(Sender: TObject);
var
  Rowindex: integer;
begin
  Rowindex := Strgrid_stock.Row; //获取行索引
  if Rowindex > 0 then
  begin
    FSelect_stock := Strgrid_stock.Cells[1, Rowindex];
    if (Check_Kflag.Checked) and (FSelect_stock <> '') then
    begin
      Panel7.Visible := True;
      GetChart(FSelect_stock, 1);
    end;
  end;
end;

procedure TFrm_stockhq.Strgrid_stockDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
  r: TRect;
begin
  Str := Strgrid_stock.Cells[ACol, ARow];
  r := Bounds(Rect.Left - 1, Rect.Top - 1, Rect.Width + 2, Rect.Height + 2);

  with Strgrid_stock.Canvas do
  begin
    if (gdSelected in State) then
      Brush.Color := RGB(203, 226, 253)
    else
      Brush.Color := clWhite;
    FillRect(Rect);
    Pen.Width := 1;
    Pen.Color := clWhite;
    Rectangle(r);

    Font.Size := 10;
    Font.Name := '微软雅黑';
    //Font.Style := [fsBold];  //加粗
    //if (ARow > 0) and (Acol <> 5) and (Acol <> 1) then
    if (ARow > 0) then
    begin
      if (CompareStr(Strgrid_stock.Cells[3, ARow], Strgrid_stock.Cells[8, ARow]) > 0) then
        Font.Color := clred //涨|字体颜色为红的
      else if (CompareStr(Strgrid_stock.Cells[3, ARow], Strgrid_stock.Cells[8, ARow]) < 0) then
        Font.Color := clGreen //跌|字体颜色为绿的
      //else
      //  Font.Color := clGreen;
    end
    else
      Font.Color := clBlack;
    TextRect(Rect, Str, [tfCenter, tfVerticalCenter, tfSingleLine]);
  end;
end;

procedure TFrm_stockhq.StringGrid_wudangDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  Str: string;
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

procedure TFrm_stockhq.Timer_kTimer(Sender: TObject);
begin
{
   Timer_k.Enabled := False;
   GetChart();
   Timer_k.Enabled := True;

}
  if (Check_Kflag.Checked) and (Panel7.Visible) then
  begin
    WebBrowser.Refresh;
  end;

  //定时刷新选股策略
  nbMain.Items.Clear;
  GetStockType;
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
  chosenChangeRate, chosenPx, categoryName: string;
  i: Integer;
begin
  //openPx : 今开
  //changeRate:涨跌幅
  //code：股票代码
  //codeType：市场类型
  //turnoverRate: 换手率
  //changePx:
  //type:
  //lowPx: 最低价
  //pClosePx：昨收
  //name：股票名称
  //currPx：当前价
  //highPx：最高价
  //chosenTime：入选时间
  //chosenChangeRate: 累计涨跌幅
  //chosenPx:  入选价格
  //categoryName: 所属主题
  Stockid := Ajson.ValueByName('code', '');
  Stockid := LeftStr(Stockid, 6);
  StockName := Ajson.ValueByName('name', '');
  CurrPx := Format('%.2f', [Ajson.ItemByName('currPx').AsFloat]);
  ChangeRate := Format('%.2f%s', [(Ajson.ItemByName('changeRate').AsFloat) * 100, '%']);
  chosenTime := Ajson.ValueByName('chosenTime', '');
  //chosenChangeRate := Format('%.2f%s', [(Ajson.ItemByName('chosenChangeRate').AsFloat) * 100, '%']);
  chosenChangeRate := Ajson.ValueByName('chosenChangeRate', '0');
  chosenPx := Ajson.ValueByName('chosenPx', '0');
  categoryName := Ajson.ValueByName('categoryName', '');

  if chosenChangeRate = '0' then
  begin
    chosenChangeRate := '——';
  end
  else
  begin
    chosenChangeRate := Format('%.2f%s', [StrToFloat(chosenChangeRate) * 100, '%']);
  end;

  if chosenPx = '0' then
    chosenPx := '——';

  if categoryName = '' then
  begin
    lv_Smart.Columns.Items[6].Width := 80;
    lv_Smart.Columns.Items[7].Width := 75;
    lv_Smart.Columns.Items[9].Width := 0;
  end
  else
  begin
    lv_Smart.Columns.Items[6].Width := 0;
    lv_Smart.Columns.Items[7].Width := 0;
    lv_Smart.Columns.Items[9].Width := 80;
  end;

  if not (bFirst_Select) then
  begin
    //更新数据
    //锁住listview防止刷新
    //LockWindowUpdate(Self.ListView1.Handle);
    lv_Smart.Items.BeginUpdate;
    try
      with lv_Smart do
      begin
        for i := 0 to Items.Count - 1 do
        begin
          if (Stockid = Items.Item[i].SubItems.Strings[0]) then
          begin
            Items.Item[i].SubItems.Strings[2] := CurrPx;
            Items.Item[i].SubItems.Strings[3] := ChangeRate;
            Items.Item[i].SubItems.Strings[5] := chosenChangeRate;
            Items.Item[i].SubItems.Strings[6] := chosenPx;
            Items.Item[i].SubItems.Strings[7] := chosenTime;
            Items.Item[i].SubItems.Strings[8] := categoryName;
          end;
        end;
      end;
    finally
      lv_Smart.Items.EndUpdate;
      //解锁listview
      //LockWindowUpdate(0);
    end;
  end
  else
  begin
    //增加数据
    with lv_Smart.items.add do
    begin
      subitems.add(Stockid);
      subitems.add(StockName);
      subitems.add(CurrPx);
      subitems.add(ChangeRate);
      subItems.add(Ajson.ItemByName('changeRate').AsString);
      subitems.add(chosenChangeRate);
      subitems.add(chosenPx);
      subitems.add(chosenTime);
      subitems.add(categoryName);
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

constructor TRevThread.Create(time: Integer);
begin
  inherited Create(True);
  Fstocprice_strs := TStringList.Create;
  //输出文件中带有空格，自动被分割，导致错误
  Fstocprice_strs.StrictDelimiter := True;
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
      for i := 0 to Frm_stockhq.Fstockname_strs.Count - 1 do
      begin
        nColumn := i;
        url := 'http://hq.sinajs.cn/?list=' + Frm_stockhq.Fstockname_strs[i];

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

procedure TRevThread.SetNotice(Fstkcode, Fstkname, Fcurrent_Price, Fchange_rate: string);
var
  FNotice_Buyflag: string;
  FNotice_Saleflag: string;
  FNotice_Rateflag: string;
  sMsg: string;
  sDate: string;
begin
  sDate := FormatdateTime('yyyy-mm-dd hh:mm', now);
  FNotice_Buyflag := GetStockNotice_filed(Fstkcode, 'stkbuy');
  FNotice_Saleflag := GetStockNotice_filed(Fstkcode, 'stksale');
  FNotice_Rateflag := GetStockNotice_filed(Fstkcode, 'stkrate');
  if (FNotice_Buyflag = '0') and (FNotice_Saleflag = '0') and (FNotice_Rateflag = '0') then
    Exit;

  if (FNotice_Buyflag >= Fcurrent_Price) and (FNotice_Buyflag <> '0') then
  begin
    sMsg := '自选股' + Fstkname + '(' + Fstkcode + ') 于' + sDate + ' 达到' + Fcurrent_Price + ',低于购买目标价' + FNotice_Buyflag + ',请及时关注';
    ShowNotice(sMsg, Fstkcode, 'buy_flag');
  end;

  if (FNotice_Saleflag <= Fcurrent_Price) and (FNotice_Saleflag <> '0')  then
  begin
    sMsg := '自选股' + Fstkname + '(' + Fstkcode + ') 于 ' + sDate + ' 达到' + Fcurrent_Price + ',超过卖出目标价' + FNotice_Saleflag+ ',请及时关注';
    ShowNotice(sMsg, Fstkcode, 'sale_flag');
  end;

  if (StrToFloat(FNotice_Rateflag) <= Abs(StrToFloat(Fchange_rate))) and (FNotice_Rateflag <> '0') then
  begin
    sMsg := '自选股' + Fstkname + '(' + Fstkcode + ') 于 ' + sDate + ' 达到' + Fcurrent_Price + ',涨跌幅为' + Fchange_rate + '%,' + '超过' + FNotice_Rateflag + '%' + ',请及时关注';
    ShowNotice(sMsg, Fstkcode, 'rate_flag');
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
  SqlTb: TSQLiteTable;
  Change_percent: string;
  Current_Price: string;
  Yest_Price: string;
  Change_amt: Double;
  Change_Rate: string;
  Change_flag: string;
  ChosenTime: string; //入选时间
  ChosenChangeRate: string; //累计涨跌幅
  ChosenPx: string; //入选价格
begin
  Current_Price := Format('%.2f', [StrToFloat(Fstocprice_strs[3])]);  //当前价格
  Yest_Price := Format('%.2f', [StrToFloat(Fstocprice_strs[2])]);  //昨日价格
  Frm_stockhq.Strgrid_stock.Cells[2, nColumn + 1] := Fstocprice_strs[0];  //股票名称
  Frm_stockhq.Strgrid_stock.Cells[3, nColumn + 1] := Current_Price;  //当前价格
  Frm_stockhq.Strgrid_stock.Cells[8, nColumn + 1] := Yest_Price;  //昨日价格
  Change_amt := StrToFloat(Fstocprice_strs[3]) - StrToFloat(Fstocprice_strs[2]);
  Change_Rate := Format('%.2f', [Change_amt * 100 / StrToFloat(Fstocprice_strs[2])]);
  if (Change_amt > 0) then
    Change_flag := '+';
  Change_percent := Format('%s%.2f%s%s%s', [Change_flag, Change_amt, '(', Change_Rate, '%)']);
  Frm_stockhq.Strgrid_stock.Cells[4, nColumn + 1] := Change_percent;  //涨跌幅
  //Frm_stockhq.Strgrid_stock.Cells[5, nColumn + 1] := FormatDateTime('hh时nn分ss秒', now());

  //读取db文件更新ChosenTim: string; //入选时间 ChosenChangeRate: string;//累计涨跌幅 ChosenPx: string; //入选价格
  SqlTb := SqlDb.GetTable('select * from stock where stkcode =' + QuotedStr(Fthread_stock));
  if SqlTb.Count > 0 then
  begin
    ChosenTime := SqlTb.FieldAsString(SqlTb.FieldIndex['chosentime']);
    ChosenPx := SqlTb.FieldAsString(SqlTb.FieldIndex['chosenpx']);
    ChosenChangeRate := Format('%.2f%s', [(StrToFloat(Fstocprice_strs[3]) - StrToFloat(ChosenPx)) * 100 / StrToFloat(ChosenPx), '%']);
    Frm_stockhq.Strgrid_stock.Cells[5, nColumn + 1] := ChosenChangeRate;
    Frm_stockhq.Strgrid_stock.Cells[6, nColumn + 1] := ChosenPx;
    Frm_stockhq.Strgrid_stock.Cells[7, nColumn + 1] := ChosenTime;
  end;
  //更新刷新时间
  Frm_stockhq.dxStatusBar.Panels[7].Text := FormatDateTime('hh:nn:ss', now());

  //更新五档行情
  if Frm_stockhq.FSelect_stock = Fthread_stock then
  begin
    Frm_stockhq.lbl_stock.Caption := Fstocprice_strs[0] + '(' + Frm_stockhq.FSelect_stock + ')';
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

  //提醒功能
  SetNotice(Fthread_stock, Fstocprice_strs[0], Current_Price, Change_Rate);

  //更新状态栏指数
  if Fthread_stock = '000001' then      //上证指数
  begin
    Frm_stockhq.dxStatusBar.Panels[1].Text := Current_Price + ' ' + Change_percent;
    if (Change_amt > 0) then
      Frm_stockhq.dxStatusBar.Panels[1].PanelStyle.Font.Color := clRed
    else if (Change_amt < 0) then
      Frm_stockhq.dxStatusBar.Panels[1].PanelStyle.Font.Color := clGreen;
  end
  else if Fthread_stock = '399001' then //深证指数
  begin
    Frm_stockhq.dxStatusBar.Panels[3].Text := Current_Price + ' ' + Change_percent;
    if (Change_amt > 0) then
      Frm_stockhq.dxStatusBar.Panels[3].PanelStyle.Font.Color := clRed
    else if (Change_amt < 0) then
      Frm_stockhq.dxStatusBar.Panels[3].PanelStyle.Font.Color := clGreen;
  end
  else if Fthread_stock = '399006' then //创业板指数
  begin
    Frm_stockhq.dxStatusBar.Panels[5].Text := Current_Price + ' ' + Change_percent;
    if (Change_amt > 0) then
      Frm_stockhq.dxStatusBar.Panels[5].PanelStyle.Font.Color := clRed
    else if (Change_amt < 0) then
      Frm_stockhq.dxStatusBar.Panels[5].PanelStyle.Font.Color := clGreen;
  end;
end;

end.

