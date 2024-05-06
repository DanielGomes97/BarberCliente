unit uLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.Skia, FMX.Skia, FMX.Objects, FMX.Edit, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Effects, FMX.Filter.Effects;

type
  TFrmLogin = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoTopo: TLayout;
    LoCorpo: TLayout;
    Layout5: TLayout;
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
    Layout8: TLayout;
    BtnEsqueciSenha: TLabel;
    LblLembrarSenha: TLabel;
    BtnLembrarSenha: TRectangle;
    ImgMarcado: TImage;
    BtnEntrar: TRectangle;
    Label7: TLabel;
    Layout1: TLayout;
    LblTitulo: TLabel;
    LblSubTitulo: TLabel;
    LoRodape: TLayout;
    Layout10: TLayout;
    SlblNovaConta: TSkLabel;
    Rectangle7: TRectangle;
    Label1: TLabel;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    procedure BtnLembrarSenhaClick(Sender: TObject);
    procedure Rectangle6Click(Sender: TObject);
    procedure BtnEntrarClick(Sender: TObject);
    procedure SlblNovaContaWords1Click(Sender: TObject);
    procedure Rectangle7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.fmx}

uses uPrincipal, uCadastroUsuario;

procedure TFrmLogin.BtnEntrarClick(Sender: TObject);
begin
    if BtnLembrarSenha.Tag = 1 then
       ShowMessage('Senha Lembrada no proximo login');

    if not(Assigned(FrmPrincipal)) then
       Application.CreateForm(TFrmPrincipal, FrmPrincipal);
    FrmPrincipal.Show;
end;

procedure TFrmLogin.BtnLembrarSenhaClick(Sender: TObject);
begin
    if BtnLembrarSenha.Tag = 0 then
    begin
        ImgMarcado.Visible := True;
        BtnLembrarSenha.Stroke.Kind := TBrushKind.None;
        BtnLembrarSenha.Fill.Kind := TBrushKind.Solid;
        BtnLembrarSenha.Fill.Color := $FF5731E8;
        BtnLembrarSenha.Tag := 1;
    end
    else
    begin
        ImgMarcado.Visible := False;
        BtnLembrarSenha.Stroke.Kind := TBrushKind.Solid;
        BtnLembrarSenha.Fill.Kind := TBrushKind.None;
        //BtnLembrarSenha.Fill.Color := $FFD2D2D2;

        BtnLembrarSenha.Tag := 0;
    end;
end;

procedure TFrmLogin.Rectangle6Click(Sender: TObject);
begin
    EditSenha.Password := NOT EditSenha.Password;
    ImgMostrarSenha.Visible := EditSenha.Password;
    ImgOcultarSenha.Visible := NOT EditSenha.Password;
end;

procedure TFrmLogin.Rectangle7Click(Sender: TObject);
begin
    if not(Assigned(FrmPrincipal)) then
       Application.CreateForm(TFrmPrincipal, FrmPrincipal);
    FrmPrincipal.Show;
end;

procedure TFrmLogin.SlblNovaContaWords1Click(Sender: TObject);
begin
    if not(Assigned(FrmCadastroUsuario)) then
       Application.CreateForm(TFrmCadastroUsuario, FrmCadastroUsuario);
    FrmCadastroUsuario.Show;
end;

end.
