unit setStkSql;

interface

uses
  System.SysUtils, SQLiteTable3, FoxmailMsgFrm;

//增加自选股
function SetStock_sql(sStkcode, sStkname, dStkpx: string): Boolean;

//删除自选股
function DelStock_sql(sStkcode: string): Boolean;

//设置自选股提醒
function SetStockNotice_sql(sStkcode, sStkBuy, sStkSale, sStkRate: string): Boolean;

//重置提醒标志
procedure ResetStockNoticeFlag_sql();

//获取提醒字段
function GetStockNotice_filed(sStkcode, sFiledname: string): string;

procedure ShowNotice(FMsg, Fstkcode, Ffiledname: string);

var
  SqlDb: TSQLiteDatabase;

implementation

function SetStock_sql(sStkcode, sStkname, dStkpx: string): Boolean;
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  sDate: string;
  Sqlstr: string;
begin
  Result := False;
  sDate := FormatdateTime('yyyy-mm-dd hh:mm', now);
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock') then
  begin
    //先判断记录是否存在，不存在插入，存在则更新
    SqlTb := SqlDb.GetTable('select * from stock where stkcode = ' + QuotedStr(sStkcode));
    if SqlTb.Count > 0 then
      Sqlstr := 'update stock set chosenpx = ' + dStkpx + ', ' + 'chosentime = ' + QuotedStr(sDate) + ' where stkcode = ' + QuotedStr(sStkcode)
    else
      Sqlstr := 'insert into stock values (' + QuotedStr(sStkcode) + ',' + QuotedStr(sStkname) + ',' + QuotedStr(sDate) + ',' + dStkpx + ')';
    try
      SqlDb.ExecSQL(UTF8Encode(Sqlstr));
    except
      Exit;
    end;
  end;
  Result := True;
end;

function DelStock_sql(sStkcode: string): Boolean;
var
  SqlTb: TSQLiteTable;
  Sqlstr: string;
begin
  Result := False;
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock') then
  begin
    //先判断记录是否存在，不存在插入，存在则更新
    SqlTb := SqlDb.GetTable('select * from stock where stkcode = ' + QuotedStr(sStkcode));
    if SqlTb.Count > 0 then
      Sqlstr := 'delete from stock where stkcode = ' + QuotedStr(sStkcode);
  end;
  try
    SqlDb.ExecSQL(UTF8Encode(Sqlstr));
  except
    Exit;
  end;
  Result := True;
end;

function SetStockNotice_sql(sStkcode, sStkBuy, sStkSale, sStkRate: string): Boolean;
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  Sqlstr: string;
begin
  Result := False;
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock_notice') then
  begin
    //先判断记录是否存在，不存在插入，存在则更新
    SqlTb := SqlDb.GetTable('select * from stock_notice where stkcode = ' + QuotedStr(sStkcode));
    if SqlTb.Count > 0 then
      Sqlstr := 'update stock_notice set stkbuy = ' + sStkBuy + ', stksale = ' + sStkSale + ', stkrate = ' + sStkRate + ' where stkcode = ' + QuotedStr(sStkcode)
    else
      Sqlstr := 'insert into stock_notice (stkcode,stkbuy,stksale,stkrate) values ('
                 + QuotedStr(sStkcode) + ',' + QuotedStr(sStkBuy) + ',' + QuotedStr(sStkSale) + ',' + QuotedStr(sStkRate) + ')';
    try
      SqlDb.ExecSQL(UTF8Encode(Sqlstr));
    except
      Exit;
    end;
  end;
  Result := True;
end;

procedure ResetStockNoticeFlag_sql();
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  Sqlstr: string;
begin
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock_notice') then
  begin
    //重置提醒标志
    Sqlstr := 'update stock_notice set buy_flag = ''0'', sale_flag = ''0'',rate_flag = ''0''';
    try
      SqlDb.ExecSQL(UTF8Encode(Sqlstr));
    except
      Exit;
    end;
  end;
end;

function GetStockNotice_filed(sStkcode, sFiledname: string): string;
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  Sqlstr: string;
begin
  Result := '0';
  SqlDb := TSQLiteDatabase.Create('stock.db');
  SqlTb := SqlDb.GetTable('select * from stock_notice where stkcode =' + QuotedStr(sStkcode));
  if SqlTb.Count > 0 then
  begin
    Result := SqlTb.FieldAsString(SqlTb.FieldIndex[sFiledname]);
  end;
  if Result = '' then
    Result := '0';
end;

procedure ShowNotice(FMsg, Fstkcode, Ffiledname: string);
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  Sqlstr: string;
begin
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock_notice') then
  begin
    //重置提醒标志
    Sqlstr := 'update stock_notice set ' + Ffiledname + '= ''1'' where stkcode =' + QuotedStr(Fstkcode);
    try
      SqlDb.ExecSQL(UTF8Encode(Sqlstr));
    except
      Exit;
    end;
  end;
  //弹出窗口
  ShowInfo(FMsg);
end;
end.

