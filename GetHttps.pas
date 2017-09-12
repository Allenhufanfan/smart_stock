unit GetHttps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, Vcl.StdCtrls, IdHTTP, DateUtils,
  qstring, qjson, Vcl.ComCtrls, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxNavBar, dxNavBarBase, dxNavBarCollns;

type
  TForm1 = class(TForm)
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP1: TIdHTTP;
    ListView2: TListView;
    Timer1: TTimer;
    Panel1: TPanel;
    ListView1: TListView;
    Panel2: TPanel;
    StaticText1: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sUrl_GetStock: string;
    bFirst_Select: Boolean;
    function GetUnixTime: string;
    //Unicode转中文编码
    function UnicodeToChinese(inputstr: string): string; overload;
    function GetHTML(Url: string): string;
    procedure GetStockType();
    procedure GetStock(Url: string);
    procedure Updlistview(Ajson: TQJson);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  i: Integer;
begin
  ListView1.Clear;

  ListView1.Columns.Clear;
  for i := 0 to 5 do
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
  ListView1.Columns.Items[0].Width := 0;
  ListView1.Columns.Items[5].Width := 0;
  Listview1.ViewStyle := vsreport;
  Listview1.GridLines := False;

  for i := 0 to 4 do
  begin
    ListView2.Columns.Add;
    ListView2.Columns.Items[i].Alignment := taCenter;
  end;
  ListView2.Columns.Items[0].Width := 0;
  ListView2.Columns.Items[1].Width := 0;
  ListView2.Columns.Items[3].Width := 0;
  ListView2.Columns.Items[4].Width := 0;
  ListView2.Columns.Items[2].Width := 120;
  ListView2.Columns.Items[1].Caption := 'type';
  ListView2.Columns.Items[2].Caption := '选股类型';
  ListView2.Columns.Items[3].Caption := 'description';
  ListView2.Columns.Items[4].Caption := 'successRate';

  Listview2.ViewStyle := vsreport;
  Listview2.GridLines := true;

  GetStockType;

  ListView2.Items[0].Selected := True;
  ListView2.OnClick(Sender);
end;

function TForm1.GetHTML(Url: string): string;
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

procedure TForm1.GetStock(Url: string);
//解析json
var
  AJson, AJson_Result: TQJson;
  sHTML, Stockid, StockName, ChangeRate, CurrPx: string;
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

procedure TForm1.GetStockType;
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

      for j := 0 to AJson_list.Count - 1 do
      begin
        with listview2.items.add do
        begin
          sTypeid := AJson_list[j].ValueByName('id', '');
          sTypename := AJson_list[j].ValueByName('name', '');
          sDescription := AJson_list[j].ValueByName('description', '');
          SsuccessRate := AJson_list[j].ValueByName('successRate', '0');
          if sSuccessRate = 'null' then
            sSuccessRate := '0';
          SubItems.Add(sTypeid);
          subitems.Add(sTypename);
          SubItems.Add(sDescription);
          SubItems.Add(SsuccessRate);
        end;
      end;
    end;
  finally
    AJson.Free;
  end;
end;

function TForm1.GetUnixTime: string;
begin
  Result := IntToStr((DateTimeToUnix(Now) - 8 * 60 * 60) * 1000);
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  item.listview.Canvas.Font.Size := 10;
  item.listview.Canvas.Font.Name := '微软雅黑';
  //涨跌幅
  if StrToFloat(Item.SubItems.Strings[4]) > 0 then
    item.listview.Canvas.Font.Color := clRed
  else if (StrToFloat(Item.SubItems.Strings[4]) < 0) then
    item.listview.Canvas.Font.Color := clBlue;
end;

procedure TForm1.ListView2Click(Sender: TObject);
var
  sIndex, sUnixTime: string;
  fRate: Double;
begin
  {
  //获取智能选股列
  //URL :='https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/list?_=1504541751959&callback=jsonp1'
  //平安智能选股为https协议
  Url := 'https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/detail?id=1&orderBy=changeRate&sort=1&ps=30&_=' + sUnixTime + '&callback=jsonp1';
  //同花顺智能选股
  //Url := 'http://comment.10jqka.com.cn/znxg/formula_stocks_pc.json?_='+ sUnixTime;
  }
  sIndex := listview2.Selected.SubItems.Strings[0];
  StaticText1.Caption := listview2.Selected.SubItems.Strings[2];
  fRate := StrToFloat(listview2.Selected.SubItems.Strings[3]);
  Label2.Caption := Format('%d%s', [Trunc(fRate * 100), '%']);
  if fRate < 0.6 then
    Label2.Font.Color := clBlue
  else if (fRate >= 0.6) and (fRate < 0.7) then
    Label2.Font.Color := RGB(255, 136, 0)
  else
    Label2.Font.Color := clRed;
  sUnixTime := GetUnixTime;
  sUrl_GetStock := 'https://stock.pingan.com.cn/quotation/v1/h5/bull/smart/detail?id=' + sIndex + '&orderBy=changeRate&sort=1&ps=30&_=' + sUnixTime + '&callback=jsonp1';
  Timer1.Interval := 100;
  Timer1.Enabled := False;
  Timer1.Enabled := True;
  //Timer1.Interval := 10000;
  ListView1.Items.Clear;
  bFirst_Select := True;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  try
    GetStock(sUrl_GetStock);
  except
    Timer1.Enabled := False;
  end;
end;

function TForm1.UnicodeToChinese(inputstr: string): string;
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

procedure TForm1.Updlistview(Ajson: TQJson);
var
  Stockid, StockName, ChangeRate, CurrPx: string;
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
      SubItems.Add(Ajson.ItemByName('changeRate').AsString);
    end;
  end;
end;

end.

