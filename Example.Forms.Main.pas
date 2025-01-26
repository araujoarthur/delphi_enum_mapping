unit Example.Forms.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.TypInfo, Example.Code;

type
  TForm1 = class(TForm)
    cbStrings: TComboBox;
    memoOutput: TMemo;
    btnGetFromString: TButton;
    btnEnum0: TButton;
    btnEnum1: TButton;
    btnEnum2: TButton;
    btnEnum3: TButton;
    btnEnum4: TButton;
    procedure btnGetFromStringClick(Sender: TObject);
    procedure btnEnum0Click(Sender: TObject);
    procedure btnEnum1Click(Sender: TObject);
    procedure btnEnum2Click(Sender: TObject);
    procedure btnEnum3Click(Sender: TObject);
    procedure btnEnum4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnEnum0Click(Sender: TObject);
var
  Enum: EnumCars;
begin
  Enum := ecVolkswagen;
  memoOutput.Lines.Add(Format('0 - ecVolkswagen - %s', [TEnumMapping.EnumToString<EnumCars>(Enum)]));
end;

procedure TForm1.btnEnum1Click(Sender: TObject);
var
  Enum: EnumCars;
begin
  Enum := ecChevrolet;
  memoOutput.Lines.Add(Format('1 - ecChevrolet - %s', [TEnumMapping.EnumToString<EnumCars>(Enum)]));
end;


procedure TForm1.btnEnum2Click(Sender: TObject);
var
  Enum: EnumCars;
begin
  Enum := ecFord;
  memoOutput.Lines.Add(Format('2 - ecFord - %s', [TEnumMapping.EnumToString<EnumCars>(Enum)]));
end;

procedure TForm1.btnEnum3Click(Sender: TObject);
var
  Enum: EnumCars;
begin
  Enum := ecRenault;
  memoOutput.Lines.Add(Format('3 - ecRenault - %s', [TEnumMapping.EnumToString<EnumCars>(Enum)]));
end;

procedure TForm1.btnEnum4Click(Sender: TObject);
var
  Enum: EnumCars;
begin
  Enum := ecBMW;
  memoOutput.Lines.Add(Format('4 - ecBMW - %s', [TEnumMapping.EnumToString<EnumCars>(Enum)]));
end;

procedure TForm1.btnGetFromStringClick(Sender: TObject);
var
  Enum: EnumCars;
begin
  var cbStr_Text: String := cbStrings.Text;
  Enum := TEnumMapping.StringToEnum<EnumCars>(cbStr_Text);

  memoOutput.Lines.Add(Format('%d - %s', [Ord(Enum), GetEnumName(TypeInfo(EnumCars), Ord(Enum))]));
end;

end.
