unit USetStk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls, Vcl.ExtCtrls, cxTextEdit;

type
  TFrmSetStk = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    btn_Sure: TButton;
    btn_Cancel: TButton;
    edt_stkname: TcxTextEdit;
    edt__stk: TLabeledEdit;
    edt_px: TLabeledEdit;
    IdGetStk: TIdHTTP;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SureClick(Sender: TObject);
    procedure edt_pxKeyPress(Sender: TObject; var Key: Char);
    procedure edt__stkChange(Sender: TObject);
    procedure edt__stkKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure GetStock(sStkcode: string);
    //Unicodeת���ı���
    function UnicodeToChinese(inputstr: string): string;
    { Public declarations }
  end;

var
  FrmSetStk: TFrmSetStk;

implementation

uses setStkSql;
{$R *.dfm}

procedure TFrmSetStk.btn_CancelClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmSetStk.btn_SureClick(Sender: TObject);
var
  sDate : string;
  bSqlResult : Boolean;
begin
   if (edt_stkname.Text = '') or (edt_px.Text = '')  then
   begin
     MessageBox(Handle, '��������ȷ��֤ȯ���룡', '��ʾ', MB_OK + MB_ICONSTOP);
     edt__stk.SetFocus;
     Exit;
   end;

   bSqlResult := SetStock_sql(edt__stk.Text, edt_stkname.Text, edt_px.Text);
   if not bSqlResult then
     MessageBox(Handle, '��ӻ��޸�֤ȯʧ�ܣ�', '����', MB_OK + MB_ICONSTOP)
   else
   begin
      ModalResult := mrOK;
      MessageBox(Handle, '��ӻ��޸�֤ȯ�ɹ���', '��ʾ', MB_OK + MB_ICONINFORMATION);
   end;
end;

procedure TFrmSetStk.edt_pxKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '.', #8]) then
    key := #0;
  if (key = '.') and ((Pos('.', edt_px.Text) > 0) or (Length(edt_px.Text) = 0)) then
    key := #0;
end;

procedure TFrmSetStk.edt__stkChange(Sender: TObject);
begin
  if (Length(Trim(edt__stk.Text)) = 6) then
    GetStock(Trim(edt__stk.Text));
end;

procedure TFrmSetStk.edt__stkKeyPress(Sender: TObject; var Key: Char);
begin
  if (Length(Trim(edt__stk.Text)) > 5) and not (Key = #08) then
    key := #0;
end;

procedure TFrmSetStk.GetStock(sStkcode: string);
var
  sHTML, URL, sUnixTime: string;
  sStkprice_strs: TStrings;
  i: Integer;
begin
  sStkprice_strs := TStringList.Create;
  sStkprice_strs.StrictDelimiter := True;

  if StrToInt(sStkcode) < 600000 then
    sStkcode := 'sz' + sStkcode
  else
    sStkcode := 'sh' + sStkcode;
  try
    //ͨ�����������ȡ֤ȯ����/֤ȯ����/��ǰ�۸�
    URL := 'http://hq.sinajs.cn/?list=' + sStkcode;
    sHTML := IdGetStk.Get(url);

    //�ָ��ַ���ȡ����������
    i := Pos('"', sHTML);
    sHTML := Copy(sHTML, i + 1, Length(sHTML) - i - 3);
    if sHTML <> '' then
    begin
      sStkprice_strs.CommaText := sHTML;
      edt_stkname.Text := sStkprice_strs[0];
      edt_px.Text := Format('%.2f', [StrToFloat(sStkprice_strs[3])]);
    end
    else
    begin
      edt_stkname.Text := '';
      edt_px.Text := '';
      MessageBox(Handle, '֤ȯ���벻���ڣ�', '��ʾ', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    sStkprice_strs.Free;
  end;
end;

function TFrmSetStk.UnicodeToChinese(inputstr: string): string;
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
    top := Copy(inputstr, 1, index); // ȡ�� �����ַ�ǰ�� �� unic ������ַ���������
    temp := Copy(inputstr, index + 1, 6); // ȡ�����룬���� \u,��\u4e3f
    Delete(temp, 1, 2);
    Delete(inputstr, 1, index + 6);
    Result := Result + top + WideChar(StrToInt('$' + temp));
  end;
end;

end.
