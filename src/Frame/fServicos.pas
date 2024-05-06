unit fServicos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Skia, FMX.Effects, FMX.Filter.Effects, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation;

type
  TFrameServico = class(TFrame)
    Layout1: TLayout;
    LoLogo: TLayout;
    Rectangle1: TRectangle;
    RecImagem: TRectangle;
    Layout4: TLayout;
    Layout2: TLayout;
    Layout5: TLayout;
    Layout7: TLayout;
    LblNomeServico: TLabel;
    LblDescricao: TLabel;
    LblValor: TLabel;
    BtnReservarServico: TRectangle;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
