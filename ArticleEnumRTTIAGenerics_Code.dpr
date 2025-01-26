program ArticleEnumRTTIAGenerics_Code;

uses
  Vcl.Forms,
  Example.Forms.Main in 'Example.Forms.Main.pas' {Form1},
  Example.Code in 'Example.Code.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
