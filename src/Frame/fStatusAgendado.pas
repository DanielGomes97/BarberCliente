unit fStatusAgendado;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.Filter.Effects;

type
  TFrameStatusAgendado = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    Layout3: TLayout;
    Layout4: TLayout;
    LblAgendado: TSkLabel;
    LblData: TSkLabel;
    LblHorario: TSkLabel;
    Layout5: TLayout;
    LblNomeLoja: TSkLabel;
    Label10: TSkLabel;
    LblValor: TSkLabel;
    Layout6: TLayout;
    Image1: TImage;
    LblDescricaoService: TSkLabel;
    Layout7: TLayout;
    Image2: TImage;
    FillRGBEffect1: TFillRGBEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
