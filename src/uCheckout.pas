unit uCheckout;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Skia, FMX.ListBox,
  FMX.Objects, fDetalhesAgendamento, uLoading;

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
    BtnVoltar: TRectangle;
    ImgVoltar: TImage;
    procedure AdicionarResumo(CodServico: Integer;
                                       NomeLoja,
                                       Descricao,
                                       DescricaoServico,
                                       NomeProfissional,
                                       DataAgendamento,
                                       Imagem: String;
                                       Valor: Double);
    procedure FormCreate(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
  private
    procedure ListarResumo;
    procedure TerminateThread(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCheckout: TFrmCheckout;

implementation

{$R *.fmx}


procedure TFrmCheckout.BtnVoltarClick(Sender: TObject);
begin
    Close;
    FrmCheckout := nil;
end;

procedure TFrmCheckout.FormCreate(Sender: TObject);
begin
    ListarResumo;
end;

procedure TFrmCheckout.ListarResumo;
var
  Th: TThread;
begin
    TLoading.Show(FrmCheckout, 'Aguarde...');
    LstResumo.Items.Clear;
    Th := TThread.CreateAnonymousThread(procedure
    begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
            AdicionarResumo(1,
                           'NomeBarber',
                           'nossa barbearia é...........',
                           'Corte do Jaca e barba',
                           'Daniel',
                           '08/05/2024 às 15:30',
                           '',
                           50.4);
        end);
    end);
    th.OnTerminate := TerminateThread;
    th.Start;
end;

procedure TFrmCheckout.TerminateThread(Sender : TObject);
begin
    if Assigned(TThread(Sender).FatalException) then
       ShowMessage(Exception(TThread(Sender).FatalException).Message);
    TLoading.Hide;
end;

procedure TFrmCheckout.AdicionarResumo(CodServico: Integer;
                                       NomeLoja,
                                       Descricao,
                                       DescricaoServico,
                                       NomeProfissional,
                                       DataAgendamento,
                                       Imagem: String;
                                       Valor: Double);
var
  Item:  TListBoxItem;
  Frame: TFrameDetalhesAgendamento;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstResumo);
    Item.Text := '';
    Item.Width := 460;
    Item.Height := 275;
    Item.Margins.Right := 10;
    Item.Tag := CodServico;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameDetalhesAgendamento.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNome.Text := NomeLoja;
    Frame.LblDescricao.Text := Descricao;
    Frame.LblServico.Text := DescricaoServico;
    Frame.LblProfissional.Text := NomeProfissional;
    Frame.LblData.Text := DataAgendamento;
    Frame.LblValor.Text := FormatCurr('R$ #,##0.00', Valor);

    //Frame.BtnAgendar.Tag := CodLoja; //armazenarCodigo
    //Frame.BtnAgendar.OnClick   := ClickMenuOpcao;
    //CarregarImagemDaURL(ImageBackgroundURL+ Imagem, Frame.Rectangle2);
    LstResumo.AddObject(Item);
end;

end.
