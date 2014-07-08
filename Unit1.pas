unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, gifimage;

type
  TForm1 = class(TForm)
    img1: TImage;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure PixelsEffect(Bitmap: TBitmap; Hor, Ver: Word);

var
  Form1: TForm1;
  b1:TBitmap;

implementation

{$R *.dfm}
 //{$R png.RES}

procedure PixelsEffect(Bitmap: TBitmap; Hor, Ver: Word);
  function Min(A, B: Integer): Integer;
  begin
    if A < B then
      Result := A
    else
      Result := B;
  end;

type
  TRGB = record
    B, G, R: Byte;
  end;
  pRGB = ^TRGB;

var
  i, j, x, y, xd, yd,
    rr, gg, bb, h, hx, hy: Integer;
  Dest: pRGB;
begin
  Bitmap.PixelFormat := pf24Bit;
  if (Hor = 1) and (Ver = 1) then
    Exit;
  xd := (Bitmap.Width - 1) div Hor;
  yd := (Bitmap.Height - 1) div Ver;
  for i := 0 to xd do
    for j := 0 to yd do
    begin
      h := 0;
      rr := 0;
      gg := 0;
      bb := 0;
      hx := Min(Hor * (i + 1), Bitmap.Width - 1);
      hy := Min(Ver * (j + 1), Bitmap.Height - 1);
      for y := j * Ver to hy do
      begin
        Dest := Bitmap.ScanLine[y];
        Inc(Dest, i * Hor);
        for x := i * Hor to hx do
        begin
          Inc(rr, Dest^.R);
          Inc(gg, Dest^.G);
          Inc(bb, Dest^.B);
          Inc(h);
          Inc(Dest);
        end;
      end;
      Bitmap.Canvas.Brush.Color := RGB(rr div h, gg div h, bb div h);
      Bitmap.Canvas.FillRect(Rect(i * Hor, j * Ver, hx + 1, hy + 1));
    end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var g1:TGIFImage;
  i,j,k:integer;
begin
  //img1.Picture.LoadFromFile('d:\Downloads\wallpaper.bmp');
    b1:=tbitmap.Create;
    b1.loadfromfile('d:\ddd.bmp');
    b1.PixelFormat:=pf8bit;
    pixelseffect(b1,8,8);
    img1.Canvas.Draw(0,0,b1);
end;

end.
