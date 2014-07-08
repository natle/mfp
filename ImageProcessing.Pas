Unit ImageProcessing;

Interface

type Proc = Procedure(var Bitmap: TBitmap; A,B,C,D: Word)
	 TColorMap = array [1..3,1..3] of TColor;

Function BColor (var Bitmap: TBitmap; X1,Y1,Height,Width: Word): TColorMap;
Procedure SetColorBlock (var Bitmap: TBitmap; ColorMap: TColorMap; X1,Y1,Height,Width: Word);

Inplementation

Function BColor (var Bitmap: TBitmap; X1,Y1,Height,Width: Word): TColorMap;
var i,j: Word;
begin
	for i:=1 to 3 do
	begin
		for j:=1 to 3 do
		begin
			BColor[i,j]:=Bitmap.Canvas.Pixels[X+(i-1)*Width+1,Y+(j-1)*Height+1];
		end;
	end;
end;

Procedure SetColorBlock (var Bitmap: TBitmap; ColorMap: TColorMap; X1,Y1,Height,Width: Word);
var i,j: Word;
	L: Boolean;
begin
	L:=false;
	for i:=1 to 3 do
		for j:=1 to 3 do
		begin
		if (ColorMap[i,j]=ColorMap[2,2]) and (i<>2) and (j<>2) then L:=true;
		end;
	if L then Bitmap.FillRect(X1,Y1,X1+Height-1,Y1+Width-1);
end;

end.