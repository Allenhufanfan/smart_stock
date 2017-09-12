program Project1;

uses
  Vcl.Forms,
  GetHttps in 'GetHttps.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '选股策略';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
