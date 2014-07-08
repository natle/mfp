unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ToolWin, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    SaveAsButton: TToolButton;
    PrintButton: TToolButton;
    ImageList: TImageList;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    Image: TImage;
    ToolButton2: TToolButton;
    WidthEdit: TEdit;
    HeightEdit: TEdit;
    ToolButton4: TToolButton;
    Label2: TLabel;
    ToolButton6: TToolButton;
    ProportionButton: TCheckBox;
    ColorNumBox: TComboBox;
    Label3: TLabel;
    CellWidth: TEdit;
    ColorDetection: TRadioGroup;
    ApplyButton: TButton;
    CellHeigth: TEdit;
    Label4: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Scale: TTrackBar;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Bitmap: TBitmap;

implementation

{$R *.dfm}

+procedure Pixelization(Bitmap: TBitmap; Hor, Ver: Word);
 +  function Min(A, B: Integer): Integer;
 +  begin
 +    if A < B then
 +      Result := A
 +    else
 +      Result := B;
 +  end;
 +
 +type
 +  TRGB = record
 +    B, G, R: Byte;
 +  end;
 +  pRGB = ^TRGB;
 +
 +var
 +  i, j, x, y, xd, yd,
 +    rr, gg, bb, h, hx, hy: Integer;
 +  Dest: pRGB;
 +begin
 +  Bitmap.PixelFormat := pf24Bit;
 +  if (Hor = 1) and (Ver = 1) then
 +    Exit;
 +  xd := (Bitmap.Width - 1) div Hor;
 +  yd := (Bitmap.Height - 1) div Ver;
 +  for i := 0 to xd do
 +    for j := 0 to yd do
 +    begin
 +      h := 0;
 +      rr := 0;
 +      gg := 0;
 +      bb := 0;
 +      hx := Min(Hor * (i + 1), Bitmap.Width - 1);
 +      hy := Min(Ver * (j + 1), Bitmap.Height - 1);
 +      for y := j * Ver to hy do
 +      begin
 +        Dest := Bitmap.ScanLine[y];
 +        Inc(Dest, i * Hor);
 +        for x := i * Hor to hx do
 +        begin
 +          Inc(rr, Dest^.R);
 +          Inc(gg, Dest^.G);
 +          Inc(bb, Dest^.B);
 +          Inc(h);
 +          Inc(Dest);
 +        end;
 +      end;
 +      Bitmap.Canvas.Brush.Color := RGB(rr div h, gg div h, bb div h);
 +      Bitmap.Canvas.FillRect(Rect(i * Hor, j * Ver, hx + 1, hy + 1));
 +    end;
 +end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Bitmap:=TBitmap.Create;
  SaveButton.Enabled:=false;
  SaveAsButton.Enabled:=False;
  PrintButton.Enabled:=False;
  ApplyButton.Enabled:=False;
end;

procedure TForm1.OpenButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
 +    Bitmap.LoadFromFile(OpenDialog.FileName);
 +    Bitmap.PixelFormat:=pf8bit;
 +    Pixelization(b1,8,16);
 +    Image.Canvas.Draw(0,0,Bitmap);
  end;
end;

end.
