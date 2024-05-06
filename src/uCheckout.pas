unit uCheckout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Skia, FMX.ListBox,
  FMX.Objects;

type
  TFrmCheckout = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoCorpo: TLayout;
    Layout2: TLayout;
    LstResumo: TListBox;
    Layout4: TLayout;
    SkLabel2: TSkLabel;
    LoTopo: TLayout;
    Rectangle2: TRectangle;
    Layout3: TLayout;
    Rectangle3: TRectangle;
    SkLabel1: TSkLabel;
    LoRodape: TLayout;
    Layout6: TLayout;
    Layout10: TLayout;
    SkLabel5: TSkLabel;
    Layout11: TLayout;
    Layout12: TLayout;
    LblDataeHora: TSkLabel;
    Layout14: TLayout;
    LblNProfissional: TSkLabel;
    Layout15: TLayout;
    Rectangle4: TRectangle;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCheckout: TFrmCheckout;

implementation

{$R *.fmx}

end.
