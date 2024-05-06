unit fEquipe;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Controls.Presentation, FMX.Skia, FMX.Objects, FMX.Layouts;

type
  TFrameEquipe = class(TFrame)
    Layout1: TLayout;
    Layout2: TLayout;
    RecImagem: TRectangle;
    Layout3: TLayout;
    LblDescricao: TLabel;
    Layout4: TLayout;
    LblNome: TSkLabel;
    LblData: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
