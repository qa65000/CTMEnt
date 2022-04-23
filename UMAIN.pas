unit UMAIN;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, WUni232c;

type
  TForm1 = class(TForm)
    WUni232c1: TWUni232c;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CommandOut(Command : byte ;  Track : word);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.Button2Click(Sender: TObject);
begin
   wuni232c1.Open;
   CommandOut($0f,$0102);

end;

procedure TForm1.Button3Click(Sender: TObject);
begin

   wuni232c1.Open;
   CommandOut($0f,$0103);

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
    wuni232c1.Open;
   CommandOut($0f,$0104);

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   wuni232c1.Open;
   CommandOut($0f,$0105);

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
    wuni232c1.Open;
   CommandOut($0f,$0106);

end;

procedure TForm1.CommandOut(Command : byte ;  Track : word);
var
i : integer;
Sum : uint16;
CommandData : array[0..15] of byte;
begin
    CommandData[0] := $7e;  //          /* Start Code */
    CommandData[1] := $ff;  //        /* Version Code */
    CommandData[2] := $06;    //      /* Length */
    CommandData[3] := Command;  //     /* Command */
    CommandData[4] := $00;        //  /* Feeed Back Flag */
    CommandData[5] :=  (Track shr 8); //    /* Param High */
    CommandData[6] :=  (Track and $ff);  // /* Param Low */
    sum := 0;
     for I := 1 to 6 do
        Sum := sum - CommandData[i];

    CommandData[7] := (Sum shr 8);      ///* Sum High */
    CommandData[8] := (Sum and $ff);    ///* Sum Low */
    CommandData[9] :=  $EF;            ///* EndCode  */

     wuni232c1.Write(10,@CommandData);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    wuni232c1.Open;
   CommandOut($0f,$0101);

//
end;

end.
