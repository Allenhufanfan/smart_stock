program stock;

uses
  Vcl.Forms,
  stock_hq in 'stock_hq.pas' {Frm_stockhq},
  setStkSql in 'setStkSql.pas',
  USetStk in 'USetStk.pas' {frmSetStk},
  UNotice in 'UNotice.pas' {frmNotice},
  FoxmailMsgFrm in 'FoxmailMsgFrm.pas' {MsgForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_stockhq, Frm_stockhq);
  Application.CreateForm(TfrmSetStk, frmSetStk);
  Application.CreateForm(TFrmSetStk, FrmSetStk);
  Application.CreateForm(TfrmNotice, frmNotice);
  Application.Run;
end.
