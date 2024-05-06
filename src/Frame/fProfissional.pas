unit fProfissional;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, FMX.Layouts;

type
  TFrameProfissional = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    LblNome: TSkLabel;
    RecBackground: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
