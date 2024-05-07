unit fDetalhesAgendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  System.Skia, FMX.Objects, FMX.Layouts, FMX.Skia, FMX.Controls.Presentation;

type
  TFrameDetalhesAgendamento = class(TFrame)
    Layout1: TLayout;
    RecImagem: TRectangle;
    Layout3: TLayout;
    LblDescricao: TLabel;
    LblNome: TSkLabel;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle1: TRectangle;
    Layout15: TLayout;
    Rectangle2: TRectangle;
    Label9: TLabel;
    Layout16: TLayout;
    Rectangle3: TRectangle;
    Label10: TLabel;
    LblServico: TLabel;
    Layout17: TLayout;
    Rectangle4: TRectangle;
    Label12: TLabel;
    LblProfissional: TLabel;
    Layout18: TLayout;
    Rectangle5: TRectangle;
    Label14: TLabel;
    LblValor: TLabel;
    Layout19: TLayout;
    Rectangle6: TRectangle;
    Label16: TLabel;
    LblData: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
