unit uCadastroUsuario;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.Skia, FMX.Skia, FMX.Ani, FMX.Objects, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl;

type
  TFrmCadastroUsuario = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoTopo: TLayout;
    LoCorpo: TLayout;
    Layout5: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Layout6: TLayout;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    LblEmailID: TLabel;
    EditEmail: TEdit;
    Layout7: TLayout;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    LblSenha: TLabel;
    EditSenha: TEdit;
    Rectangle6: TRectangle;
    ImgMostrarSenha: TImage;
    ImgOcultarSenha: TImage;
    TabItem2: TTabItem;
    Layout2: TLayout;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Label1: TLabel;
    Edit1: TEdit;
    TabItem3: TTabItem;
    Layout3: TLayout;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Label2: TLabel;
    Edit2: TEdit;
    Layout4: TLayout;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Label3: TLabel;
    Edit3: TEdit;
    Layout8: TLayout;
    BtnProximo: TRectangle;
    Label7: TLabel;
    BtnVoltar: TRectangle;
    Label4: TLabel;
    Layout1: TLayout;
    LblTitulo: TLabel;
    LblSubTitulo: TLabel;
    Layout9: TLayout;
    Rectangle13: TRectangle;
    FloatAnimationBarra: TFloatAnimation;
    LoRodape: TLayout;
    Layout10: TLayout;
    SlblNovaConta: TSkLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadastroUsuario: TFrmCadastroUsuario;

implementation

{$R *.fmx}

end.
