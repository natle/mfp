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
    Image1: TImage;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


end.
