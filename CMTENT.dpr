program CMTENT;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMAIN in 'UMAIN.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
