unit fLojaProxima;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Effects, FMX.Filter.Effects, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TFrameLojaProxima = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Rectangle1: TRectangle;
    Layout8: TLayout;
    Layout3: TLayout;
    LblNomeLoja: TLabel;
    Layout6: TLayout;
    GridPanelLayout1: TGridPanelLayout;
    ImgStar1: TImage;
    ImgStar2: TImage;
    ImgStar3: TImage;
    ImgStar4: TImage;
    ImgStar5: TImage;
    Layout4: TLayout;
    LblDistanciaKM: TLabel;
    LblEndereco: TLabel;
    LblDistanciaMin: TLabel;
    Layout5: TLayout;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
