unit UNotice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxTextEdit;

type
  TfrmNotice = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    btn_Sure: TButton;
    btn_Cancel: TButton;
    edtBuy: TEdit;
    Label1: TLabel;
    edtSale: TEdit;
    edtRate: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    lblMsg: TLabel;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SureClick(Sender: TObject);
    procedure edtBuyKeyPress(Sender: TObject; var Key: Char);
    procedure edtRateKeyPress(Sender: TObject; var Key: Char);
    procedure edtSaleKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Fstock: string;  //证券代码
    procedure GetNotice(sStockCode: string);
  end;

var
  frmNotice: TfrmNotice;

implementation

{$R *.dfm}

uses
  setStkSql, SQLiteTable3;

procedure TfrmNotice.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNotice.btn_SureClick(Sender: TObject);
var
  sDate: string;
  bSqlResult: Boolean;
begin
  //没有设置，则直接退出
  if (edtBuy.Text = '') and (edtSale.Text = '') and (edtRate.Text = '') then
    Exit;

  //设置股票提醒
  bSqlResult := SetStockNotice_sql(Fstock, edtBuy.Text, edtSale.Text, edtRate.Text);
  if not bSqlResult then
    MessageBox(Handle, '添加或修改股票提醒失败！', '错误', MB_OK + MB_ICONSTOP)
  else
  begin
    ModalResult := mrOK;
    MessageBox(Handle, '添加或修改股票提醒成功！', '提示', MB_OK + MB_ICONINFORMATION);
  end;

end;

procedure TfrmNotice.edtBuyKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then
    key := #0;
  if (key = '.') and ((Pos('.', edtBuy.Text) > 0) or (Length(edtBuy.Text) = 0)) then
    key := #0;
end;

procedure TfrmNotice.edtRateKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then
    key := #0;
  if (key = '.') and ((Pos('.', edtRate.Text) > 0) or (Length(edtRate.Text) = 0)) then
    key := #0;
end;

procedure TfrmNotice.edtSaleKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then
    key := #0;
  if (key = '.') and ((Pos('.', edtSale.Text) > 0) or (Length(edtSale.Text) = 0)) then
    key := #0;
end;

procedure TfrmNotice.GetNotice(sStockCode: string);
var
  SqlDb: TSQLiteDatabase;
  SqlTb: TSQLiteTable;
begin
  SqlDb := TSQLiteDatabase.Create('stock.db');
  if SqlDb.TableExists('stock_notice') then
  begin
    SqlTb := SqlDb.GetTable('select * from stock_notice where stkcode =' + QuotedStr(sStockCode));
    if SqlTb.Count > 0 then
    begin
      edtBuy.Text := SqlTb.FieldAsString(SqlTb.FieldIndex['stkbuy']);
      edtSale.Text := SqlTb.FieldAsString(SqlTb.FieldIndex['stksale']);
      edtRate.Text := SqlTb.FieldAsString(SqlTb.FieldIndex['stkrate']);
    end;
    SqlTb.Free;
  end;
  SqlDb.Free;
end;

end.

