unit setStkSql;

interface

uses
  System.SysUtils, SQLiteTable3;

function SetStock_sql(sStkcode, sStkname, dStkpx: string): Boolean;

function DelStock_sql(sStkcode: string): Boolean;

var
  SqlDb: TSQLiteDatabase;

implementation

function SetStock_sql(sStkcode, sStkname, dStkpx: string): Boolean;
var
  SqlTb: TSQLiteTable;
  TableCreateStr: string;
  sDate : string;
  Sqlstr: string;
begin
  Result := False;
  sDate := FormatdateTime('yyyy-mm-dd hh:mm',now);
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

end.

