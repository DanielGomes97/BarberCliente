unit uPerfilLoja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Skia, FMX.Layouts, FMX.ListBox,
  FMX.Objects, FMX.TabControl, FMX.Effects, FMX.Filter.Effects, FMX.Ani,
  uLoading;

type
  TFrmPerfilLoja = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoCorpo: TLayout;
    LoTopo: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Layout3: TLayout;
    BtnVoltar: TRectangle;
    LblNomeBarbearia: TSkLabel;
    ImgVoltar: TImage;
    LoRodape: TLayout;
    Rectangle4: TRectangle;
    HorzScrollBox2: THorzScrollBox;
    VertScrollBox2: TVertScrollBox;
    Layout18: TLayout;
    TabCMenu: TTabControl;
    TabServico: TTabItem;
    LstServico: TListBox;
    TabInformacao: TTabItem;
    VertScrollBox1: TVertScrollBox;
    Layout28: TLayout;
    Layout29: TLayout;
    Label8: TLabel;
    LblEndereco: TLabel;
    Layout39: TLayout;
    Rectangle17: TRectangle;
    Label25: TLabel;
    Layout17: TLayout;
    Rectangle7: TRectangle;
    Layout22: TLayout;
    Layout26: TLayout;
    Label10: TLabel;
    Layout31: TLayout;
    Label16: TLabel;
    Label31: TLabel;
    Layout37: TLayout;
    Label32: TLabel;
    Label33: TLabel;
    Layout43: TLayout;
    Label34: TLabel;
    Label35: TLabel;
    Layout49: TLayout;
    Label36: TLabel;
    Label37: TLabel;
    Layout51: TLayout;
    Label38: TLabel;
    Label39: TLabel;
    Layout53: TLayout;
    Label40: TLabel;
    Label41: TLabel;
    Layout55: TLayout;
    Label42: TLabel;
    Label43: TLabel;
    Layout16: TLayout;
    Layout30: TLayout;
    Label4: TLabel;
    HorzScrollBox3: THorzScrollBox;
    Rectangle10: TRectangle;
    Label19: TLabel;
    Rectangle11: TRectangle;
    Label20: TLabel;
    Rectangle12: TRectangle;
    Label21: TLabel;
    Rectangle13: TRectangle;
    Label22: TLabel;
    Rectangle14: TRectangle;
    Label23: TLabel;
    Layout32: TLayout;
    Layout33: TLayout;
    Label6: TLabel;
    HorzScrollBox4: THorzScrollBox;
    Image5: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Layout36: TLayout;
    Rectangle15: TRectangle;
    Layout38: TLayout;
    Rectangle16: TRectangle;
    TabEquipe: TTabItem;
    LstEquipe: TListBox;
    TabAvaliacao: TTabItem;
    LstAvaliacao: TListBox;
    Layout2: TLayout;
    ImageBackground: TImage;
    Layout19: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle3: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    ImgStar1: TImage;
    ImgStar2: TImage;
    ImgStar3: TImage;
    ImgStar4: TImage;
    ImgStar5: TImage;
    LblStarAvalicao: TLabel;
    Layout48: TLayout;
    ImageLogo: TRectangle;
    Layout47: TLayout;
    Layout57: TLayout;
    Rectangle18: TRectangle;
    GridPanelLayout5: TGridPanelLayout;
    Layout58: TLayout;
    Layout59: TLayout;
    Label9: TLabel;
    LblTotalClientes: TLabel;
    Layout60: TLayout;
    Layout61: TLayout;
    Label18: TLabel;
    LblTotalSeguidores: TLabel;
    Layout62: TLayout;
    Layout63: TLayout;
    Label26: TLabel;
    LblTotalAvalicao: TLabel;
    Layout24: TLayout;
    Layout25: TLayout;
    Label15: TLabel;
    LblDescricao: TLabel;
    BtnSeguir: TRectangle;
    Label3: TLabel;
    Layout8: TLayout;
    Rectangle5: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Layout12: TLayout;
    BtnServicos: TRectangle;
    Label13: TLabel;
    Layout13: TLayout;
    Rectangle23: TRectangle;
    Layout9: TLayout;
    BtnPromocao: TRectangle;
    Label1: TLabel;
    Layout10: TLayout;
    Rectangle20: TRectangle;
    Layout11: TLayout;
    BtnInformacoes: TRectangle;
    Label2: TLabel;
    Layout14: TLayout;
    Rectangle21: TRectangle;
    Layout15: TLayout;
    BtnEquipe: TRectangle;
    Label7: TLabel;
    Layout20: TLayout;
    Rectangle22: TRectangle;
    Layout21: TLayout;
    BtnAvaliacoes: TRectangle;
    Label5: TLabel;
    Layout23: TLayout;
    Rectangle24: TRectangle;
    procedure BtnServicosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnSeguirClick(Sender: TObject);
    procedure BtnPromocaoClick(Sender: TObject);
    procedure BtnInformacoesClick(Sender: TObject);
    procedure BtnEquipeClick(Sender: TObject);
    procedure BtnAvaliacoesClick(Sender: TObject);
  private
    procedure AdicionarServico(CodServico: Integer; NomeServico, Descricao: String; Valor: Currency; Imagem: String = '');
    procedure ListarServicos;
    procedure MenuSelecionado(BtnEscolhido: TRectangle);
    procedure AdicionarEquipe(Nome, Descricao, Data: String; Imagem: String = '');
    procedure ListarEquipe;
    procedure AdicionarAvaliacao(Nome, Descricao, Data: String; Pontuacao: Single; Imagem: String = '');
    procedure ListarAvaliacao;
    procedure ClickBtnServico(Sender: TObject);
    procedure TerminateThread(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerfilLoja: TFrmPerfilLoja;

implementation

uses Funcoes, fServicos, fEquipe, fAvaliacao, uAgendamento, DataModulo.Global,
     VariaveisGlobais;

{$R *.fmx}

procedure TFrmPerfilLoja.TerminateThread(Sender : TObject);
begin
    if Assigned(TThread(Sender).FatalException) then
       ShowMessage(Exception(TThread(Sender).FatalException).Message);
    TLoading.Hide;
end;

procedure TFrmPerfilLoja.ListarEquipe;
var
  Th: TThread;
begin
    TLoading.Show(FrmPerfilLoja, 'Aguarde...');
    LstEquipe.Items.Clear;
    Th := TThread.CreateAnonymousThread(procedure
    begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
            AdicionarEquipe('John Mercedezzzz',
                             'Sou barbeiro desde meus 15 anos, atualmente estou com 50 e faço com muito amor e inovação',
                             '28/03/2024',
                             '');
            AdicionarEquipe('John Mercedezzzz',
                             'Sou barbeiro desde meus 15 anos, atualmente estou com 50 e faço com muito amor e inovação',
                             '28/03/2024',
                             '');
            AdicionarEquipe('John Mercedezzzz',
                             'Sou barbeiro desde meus 15 anos, atualmente estou com 50 e faço com muito amor e inovação',
                             '28/03/2024',
                             '');
        end);
    end);
    th.OnTerminate := TerminateThread;
    th.Start;
end;

procedure TFrmPerfilLoja.ListarAvaliacao;
var
  Th: TThread;
begin
    TLoading.Show(FrmPerfilLoja, 'Aguarde...');
    LstAvaliacao.Items.Clear;
    Th := TThread.CreateAnonymousThread(procedure
    begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
            AdicionarAvaliacao('Pablo escobar',
                             'Excelente loja, organizada e o atendimento de qualidade, super indico!',
                             '28/03/2024',
                             4.8,
                             '');
            AdicionarAvaliacao('Pablo escobar',
                             'Excelente loja, organizada e o atendimento de qualidade, super indico!',
                             '28/03/2024',
                             4.8,
                             '');
            AdicionarAvaliacao('Pablo escobar',
                             'Excelente loja, organizada e o atendimento de qualidade, super indico!',
                             '28/03/2024',
                             4.8,
                             '');
            AdicionarAvaliacao('Pablo escobar',
                             'Excelente loja, organizada e o atendimento de qualidade, super indico!',
                             '28/03/2024',
                             4.8,
                             '');
            AdicionarAvaliacao('Pablo escobar',
                             'Excelente loja, organizada e o atendimento de qualidade, super indico!',
                             '28/03/2024',
                             4.8,
                             '');
        end);
    end);
    th.OnTerminate := TerminateThread;
    th.Start;
end;

procedure TFrmPerfilLoja.ListarServicos;
var
  Th: TThread;
begin
    TLoading.Show(FrmPerfilLoja, 'Aguarde...');
    LstServico.Items.Clear;
    Th := TThread.CreateAnonymousThread(procedure
    begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
            AdicionarServico(1,
                             'Corte americano',
                             'Corte americano bastante usado na Zona oesteasdasdasdasdasdasdasdasdasdasdasdadasdasdsadasdas',
                             35.00,
                             '');
            AdicionarServico(1,
                             'Corte americano2',
                             'Corte americano bastante usado na Zona oeste',
                             35.00,
                             '');
            AdicionarServico(1,
                             'Corte americano3',
                             'Corte americano bastante usado na Zona oesteasdasdadasdasdasdasdasdasdasdas',
                             35.00,
                             '');
            AdicionarServico(1,
                             'Corte americano4',
                             'Corte americano bastante usado na Zona oeste',
                             35.00,
                             '');
        end);
    end);
    th.OnTerminate := TerminateThread;
    th.Start;
end;

procedure TFrmPerfilLoja.MenuSelecionado(BtnEscolhido: TRectangle);
const
    ColorInicial: TAlphaColor = $FF24242C;
begin
    BtnServicos.Fill.Color    := ColorInicial;
    BtnInformacoes.Fill.Color := ColorInicial;
    BtnPromocao.Fill.Color    := ColorInicial;
    BtnEquipe.Fill.Color      := ColorInicial;
    BtnAvaliacoes.Fill.Color  := ColorInicial;
    BtnEscolhido.Fill.Color   := $FF5731E8;
end;

procedure TFrmPerfilLoja.BtnPromocaoClick(Sender: TObject);
begin
    HorzScrollBox2.ViewportPosition := TPointF.Create(Layout9.Position.X + Layout9.Width - HorzScrollBox2.Width, 0);
    MenuSelecionado(BtnPromocao);
end;

procedure TFrmPerfilLoja.BtnInformacoesClick(Sender: TObject);
begin
    HorzScrollBox2.ViewportPosition := TPointF.Create(Layout11.Position.X + Layout11.Width - HorzScrollBox2.Width, 0);
    MenuSelecionado(BtnInformacoes);
end;

procedure TFrmPerfilLoja.BtnEquipeClick(Sender: TObject);
begin
    HorzScrollBox2.ViewportPosition := TPointF.Create(Layout15.Position.X + Layout15.Width - HorzScrollBox2.Width, 0);
    MenuSelecionado(BtnEquipe);
    TabCMenu.TabIndex := 2;
    ListarEquipe;
end;

procedure TFrmPerfilLoja.BtnAvaliacoesClick(Sender: TObject);
begin
    HorzScrollBox2.ViewportPosition := TPointF.Create(Layout21.Position.X + Layout21.Width - HorzScrollBox2.Width, 0);
    MenuSelecionado(BtnAvaliacoes);
    TabCMenu.TabIndex := 3;
    ListarAvaliacao;
end;

procedure TFrmPerfilLoja.BtnSeguirClick(Sender: TObject);
begin
    CarregarImagemDaURL(ImageLogoURL+'Logo1.jpg', ImageLogo);
    CarregarImagemDaURL(ImageBackgroundURL+'Image1.png', ImageBackground);
end;

procedure TFrmPerfilLoja.BtnVoltarClick(Sender: TObject);
begin
    Close;
    FrmPerfilLoja := nil;
end;

procedure TFrmPerfilLoja.BtnServicosClick(Sender: TObject);
begin
    HorzScrollBox2.ViewportPosition := TPointF.Create(Layout12.Position.X + Layout12.Width - HorzScrollBox2.Width, 0);
    MenuSelecionado(BtnServicos);
    TabCMenu.TabIndex := 0;
    ListarServicos;
end;

procedure TFrmPerfilLoja.FormCreate(Sender: TObject);
begin
    MenuSelecionado(BtnServicos);
    TabCMenu.TabIndex := 0;
    LblNomeBarbearia.Text := DM.FDMTblLojaSelecionada.FieldByName('Nome').AsString;
    LblDescricao.Text := DM.FDMTblLojaSelecionada.FieldByName('Descricao').AsString;
    LblEndereco.Text  := DM.FDMTblLojaSelecionada.FieldByName('Endereco').AsString + ', ' +
                         DM.FDMTblLojaSelecionada.FieldByName('Numero').AsString + ' - ' +
                         DM.FDMTblLojaSelecionada.FieldByName('Cidade').AsString + ', ' +
                         DM.FDMTblLojaSelecionada.FieldByName('CEP').AsString;
    ListarServicos;
end;

procedure TFrmPerfilLoja.AdicionarServico(CodServico: Integer; NomeServico, Descricao: String; Valor: Currency; Imagem: String = '');
var
  Item:  TListBoxItem;
  Frame: TFrameServico;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstServico);
    Item.Text := '';
    Item.Height := 120;
    Item.Margins.Bottom := 10;
    Item.Tag := CodServico;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameServico.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNomeServico.Text := NomeServico;
    Frame.LblDescricao.Text := Descricao;
    Frame.LblValor.Text := FormatCurr('R$ #,##0.00', Valor);
    Frame.BtnReservarServico.OnClick := ClickBtnServico;
    //Frame.RecImagem.fill.Bitmap :=
    LstServico.AddObject(Item);
end;

procedure TFrmPerfilLoja.ClickBtnServico(Sender: TObject);
//var
  //Layout : TLayout;
  //Frame  : TFrameServico;
begin
    //Layout := TRectangle(Sender).Parent as TLayout;
    //Frame := Layout.Parent as TFrameServico;

    if NOT(Assigned(FrmAgendamento)) then
       Application.CreateForm(TFrmAgendamento, FrmAgendamento);
    FrmAgendamento.Show;
end;

procedure TFrmPerfilLoja.AdicionarEquipe(Nome, Descricao, Data: String; Imagem: String = '');
var
  Item:  TListBoxItem;
  Frame: TFrameEquipe;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstEquipe);
    Item.Text := '';
    Item.Height := 85;
    Item.Margins.Top := 8;
    //Item.Tag := CodProfissional;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameEquipe.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNome.Text := Nome;
    Frame.LblDescricao.Text := Descricao;
    Frame.LblData.Text := Data;
    //Frame.RecImagem.fill.Bitmap :=

    LstEquipe.AddObject(Item);
end;

procedure TFrmPerfilLoja.AdicionarAvaliacao(Nome, Descricao, Data: String; Pontuacao: Single; Imagem: String = '');
var
  Item:  TListBoxItem;
  Frame: TFrameAvaliacao;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstAvaliacao);
    Item.Text := '';
    Item.Height := 85;
    Item.Margins.Top := 8;
    //Item.Tag := CodCliente;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameAvaliacao.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNome.Text := Nome;
    Frame.LblDescricao.Text := Descricao;
    Frame.LblData.Text := Data;
    //Frame.RecImagem.fill.Bitmap :=

    LstAvaliacao.AddObject(Item);
end;

end.
