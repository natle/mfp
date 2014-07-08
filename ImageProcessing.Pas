Unit ImageProcessing;

Interface

type Proc = Procedure(var Bitmap: TBitmap; A,B,C,D: Word)

Procedure FImage (var Bitmap: TBitmap; PHeight,PWidth: Word; Determinant: Proc);
Procedure ColorCenterDetectAndFill (var Bitmap: TBitmap; X1,X2,Y1,Y2: Word);

Inplementation

Procedure ColorCenterDetectAndFill (var Bitmap: TBitmap; X1,X2,Y1,Y2: Word);
var i,j: Word;
begin
	
end;


Procedure FImage(var Bitmap: TBitmap; PHeight,PWidth: Word; Determinant: Proc);
var i,j,Height,Width,X1,X2,Y1,Y2: Word;
begin
	Height:=Bitmap.Height;
	Width:=Bitmap.Width;
	i:=1;
	j:=1;
	while Heigth>i*PHeight do
	begin
		while Width>j*PWidth do
		begin
			X1:=(j-1)*PWidth;
			Y1:=(i-1)*PHeight;
			X2:=X1+PWidth;
			Y2:=Y2+PHeight;
			Determinant(Bitmap,X1,X2,Y1,Y2);
		end;
	end;
	X1:=(j-1)*PWidth;
	Y1:=(i-1)*PHeight;
	PHeight:=Height-(i-1)*PHeight;
	PWidth:=Width-(j-1)*PWidth;
	X2:=X1+PWidth;
	Y2:=Y2+PHeight;
	Determinant(Bitmap,X1,X2,Y1,Y2);
end;

end.