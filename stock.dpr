program stock;

uses
  Vcl.Forms,
  stock_hq in 'stock_hq.pas' {Frm_stockhq};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_stockhq, Frm_stockhq);
  Application.Run;
end.
