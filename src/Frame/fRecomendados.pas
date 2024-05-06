unit fRecomendados;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Layouts, System.Skia, FMX.Effects, FMX.Filter.Effects,
  FMX.Skia, FMX.Controls.Presentation;

type
  TFrameRecomendados = class(TFrame)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Image2: TImage;
    LblAvaliacao: TSkLabel;
    FillRGBEffect1: TFillRGBEffect;
    Layout5: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    BtnAgendar: TRectangle;
    Layout6: TLayout;
    Label1: TLabel;
    LblEndereco: TLabel;
    LblNomeLoja: TLabel;
    Layout10: TLayout;
    Rectangle5: TRectangle;
    Layout11: TLayout;
    LblDistanciaKM: TSkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
