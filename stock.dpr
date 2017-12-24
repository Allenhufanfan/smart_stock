program stock;

uses
  Vcl.Forms,
  stock_hq in 'stock_hq.pas' {Frm_stockhq},
  setStkSql in 'setStkSql.pas',
  USetStk in 'USetStk.pas' {FrmSetStk};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_stockhq, Frm_stockhq);
  Application.CreateForm(TFrmSetStk, FrmSetStk);
  Application.CreateForm(TFrmSetStk, FrmSetStk);
  Application.Run;
end.
