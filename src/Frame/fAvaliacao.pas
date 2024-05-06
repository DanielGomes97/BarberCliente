unit fAvaliacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFrameAvaliacao = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    RecImagem: TRectangle;
    Layout3: TLayout;
    LblDescricao: TLabel;
    Layout4: TLayout;
    LblNome: TSkLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    ImgStar1: TImage;
    ImgStar2: TImage;
    ImgStar3: TImage;
    ImgStar4: TImage;
    ImgStar5: TImage;
    LblData: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
