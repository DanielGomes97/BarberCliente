unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  System.Skia, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Effects, FMX.Filter.Effects, FMX.StdCtrls,
  FMX.ListView, FMX.Controls.Presentation, FMX.Edit, FMX.Skia, FMX.ListBox,
  FMX.TabControl, FMX.Objects, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FMX.Ani, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  DateUtils, uLoading,
  IdTCPClient;

type
  TFrmPrincipal = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoCorpo: TLayout;
    TabCPrincipal: TTabControl;
    TabInicio: TTabItem;
    VertScrollBox1: TVertScrollBox;
    LoAgendamentoAtivo: TLayout;
    LstStatusAgendamento: TListBox;
    TabPesquisa: TTabItem;
    Layout15: TLayout;
    Layout20: TLayout;
    Rectangle5: TRectangle;
    EditPesquisa: TEdit;
    BtnPesquisar: TRectangle;
    Rectangle12: TRectangle;
    SkLabel3: TSkLabel;
    VertScrollBox2: TVertScrollBox;
    ListView1: TListView;
    TabAlertas: TTabItem;
    Label8: TLabel;
    TabPerfil: TTabItem;
    Label9: TLabel;
    LoTopo: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    LoRodape: TLayout;
    Rectangle3: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    LoInicio: TLayout;
    BtnInicio: TRectangle;
    Label2: TLabel;
    Layout8: TLayout;
    Rectangle6: TRectangle;
    LoPesquisar: TLayout;
    BtnPesquisa: TRectangle;
    Label3: TLabel;
    Layout6: TLayout;
    Rectangle8: TRectangle;
    LoAgendamento: TLayout;
    BtnAgendamento: TRectangle;
    Label4: TLabel;
    LoConfiguracao: TLayout;
    BtnConfiguracao: TRectangle;
    Label5: TLabel;
    Layout11: TLayout;
    Rectangle13: TRectangle;
    FDConexao: TFDConnection;
    StyleBook1: TStyleBook;
    Layout24: TLayout;
    Layout27: TLayout;
    RBarMenu: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Rectangle19: TRectangle;
    LblName: TSkLabel;
    Layout4: TLayout;
    LstProximo: TListBox;
    SkLabel2: TSkLabel;
    Layout5: TLayout;
    LstRecomendados: TListBox;
    Layout7: TLayout;
    SkLabel4: TSkLabel;
    FillRGBEffect1: TFillRGBEffect;
    FillRGBEffect2: TFillRGBEffect;
    FillRGBEffect3: TFillRGBEffect;
    FillRGBEffect4: TFillRGBEffect;
    FillRGBEffect5: TFillRGBEffect;
    VertScrollBox3: TVertScrollBox;
    Layout9: TLayout;
    Rectangle11: TRectangle;
    Layout3: TLayout;
    Label1: TLabel;
    procedure BtnVoltarClick(Sender: TObject);
    procedure BtnInicioClick(Sender: TObject);
    procedure BtnPesquisaClick(Sender: TObject);
    procedure BtnAgendamentoClick(Sender: TObject);
    procedure BtnConfiguracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LstStatusAgendamentoChange(Sender: TObject);
    procedure LstProximoItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure LstStatusAgendamentoItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure Rectangle19Click(Sender: TObject);

  private
    procedure MenuSelecionado(BtnEscolhido: TRectangle);
    procedure AddStatusAgendado(CodAgendamento: Integer; Loja, Descricao, Data, Horario: String; Valor: Double);
    procedure ListarStatusAgendado;
    procedure AdicionarRecomendado(CodLoja: Integer; NomeLoja, Descricao, Distancia, Imagem: String; Avaliacao: Double);
    procedure ListarRecomendados;
    procedure AnimaBarMenu(IrPara: TLayout);
    procedure AdicionarProximo(CodBarbearia: Integer; NomeLoja, Endereco, DistanciaKM, DistanciaMin, Imagem: String; Avaliacao: Double);
    procedure ListarProximoAVoce;
    procedure TerminateThread(Sender: TObject);
    procedure VerificarConexaoServidor;
    procedure ClickMenuOpcao(Sender: TObject);
    procedure MTblCriarCampos(FDOrigem, FDDestino: TFDMemtable);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses Funcoes, VariaveisGlobais, DataModulo.Global,
     fStatusAgendado, fRecomendados, fCalendarioDay, fLojaProxima, uPerfilLoja;

{$R *.fmx}

procedure TFrmPrincipal.BtnAgendamentoClick(Sender: TObject);
begin
    MenuSelecionado(BtnAgendamento);
    TabCPrincipal.TabIndex := 2;
    AnimaBarMenu(LoAgendamento);
end;

procedure TFrmPrincipal.BtnPesquisaClick(Sender: TObject);
begin
    MenuSelecionado(BtnPesquisa);
    EditPesquisa.Text := '';
    TabCPrincipal.TabIndex := 1;
    AnimaBarMenu(LoPesquisar);
    EditPesquisa.SetFocus;
end;

procedure TFrmPrincipal.BtnInicioClick(Sender: TObject);
begin
    MenuSelecionado(BtnInicio);
    DM.FDMTblLoja.Filtered  := False;
    DM.FDMTblLoja.Filter    := '';
    DM.FDMTblLoja.Filtered  := True;
    ListarRecomendados;
    TabCPrincipal.TabIndex := 0;
    AnimaBarMenu(LoInicio);
end;

procedure TFrmPrincipal.MenuSelecionado(BtnEscolhido: TRectangle);
const
    Opacityy = 0.4;
begin
    BtnInicio.Opacity     := Opacityy;
    BtnPesquisa.Opacity     := Opacityy;
    BtnAgendamento.Opacity    := Opacityy;
    BtnConfiguracao.Opacity  := Opacityy;
    BtnEscolhido.Opacity  := 1;
end;

procedure TFrmPrincipal.Rectangle19Click(Sender: TObject);
begin
    VerificarConexaoServidor;
end;

procedure TFrmPrincipal.BtnConfiguracaoClick(Sender: TObject);
begin
    MenuSelecionado(BtnConfiguracao);
    TabCPrincipal.TabIndex := 3;
    AnimaBarMenu(LoConfiguracao);
end;

procedure TFrmPrincipal.BtnVoltarClick(Sender: TObject);
begin
    FrmPrincipal := NIL;
    Close;
end;

procedure TFrmPrincipal.VerificarConexaoServidor;
var
  TCPClient: TIdTCPClient;
begin
    TCPClient := TIdTCPClient.Create(nil);
    try
        try
            // Configurar o cliente TCP para conectar ao servidor
            TCPClient.Host := '192.168.0.129';
            TCPClient.Port := 3002;

            // Tentar conectar ao servidor
            TCPClient.ConnectTimeout := 3000; // Tempo limite de conexão (em milissegundos)
            TCPClient.Connect;
        except
            on E: Exception do
               ShowMessage('Não foi possível conectar ao servidor. Servidor está offline.');
        end;
    finally
        TCPClient.Free;
    end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
    MenuSelecionado(BtnInicio);
    TabCPrincipal.TabIndex := 0;

    ListarStatusAgendado;
    ListarProximoAVoce;

    //verificar se tem agendamento ativo..
    //FillRGBEffect3.Color := xCorRED;
end;

procedure TFrmPrincipal.AdicionarRecomendado(CodLoja: Integer;
                                             NomeLoja,
                                             Descricao,
                                             Distancia,
                                             Imagem: String;
                                             Avaliacao: Double);
var
  Item:  TListBoxItem;
  Frame: TFrameRecomendados;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstRecomendados);
    Item.Text := '';
    Item.Width := 200;
    Item.Margins.Right := 10;
    Item.Tag := CodLoja;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameRecomendados.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNomeLoja.Text := NomeLoja;
    Frame.LblEndereco.Text := Descricao;
    Frame.LblDistanciaKM.Text := Distancia;
    Frame.BtnAgendar.Tag := CodLoja; //armazenarCodigo
    Frame.BtnAgendar.OnClick   := ClickMenuOpcao;
    Frame.LblAvaliacao.Text := Avaliacao.ToString;
    CarregarImagemDaURL(ImageBackgroundURL+ Imagem, Frame.Rectangle2);
                        //ImageLogoURL+'foto1.jpg'
    LstRecomendados.AddObject(Item);
end;

procedure TFrmPrincipal.MTblCriarCampos(FDOrigem, FDDestino: TFDMemtable);
var
  I: Integer;
begin
    if FDDestino.FieldCount > 0 then
       FDDestino.FieldDefs.Clear;
    for i := 0 to FDOrigem.FieldDefs.Count - 1 do
    begin
        FDDestino.FieldDefs.Add(FDOrigem.FieldDefs[i].Name,
                                FDOrigem.FieldDefs[i].DataType,
                                FDOrigem.FieldDefs[i].Size,
                                FDOrigem.FieldDefs[i].Required);
    end;

    // Crie os campos na segunda FDMemTable
    if NOT Assigned(FDDestino) then
       FDDestino.CreateDataSet;
    FDDestino.Open();
    FDDestino.EmptyDataSet;
end;


procedure TFrmPrincipal.ClickMenuOpcao(Sender: TObject);
var
  Frame: TFrameRecomendados;
  Btn: TRectangle;
  I: Integer;
begin
    Btn := Sender As TRectangle; //BtnAgendar := TRectangle(Sender);
    Frame := Btn.Parent as TFrameRecomendados;  //Capturar o frame clicado.
    DM.FDMTblLoja.Filtered  := False;
    DM.FDMTblLoja.Filter    := 'CodLoja = '+ IntToStr(Frame.BtnAgendar.Tag);
    DM.FDMTblLoja.Filtered  := True;

    if DM.FDMTblLoja.IsEmpty then
       Exit;
    DM.FDMTblLojaSelecionada.Append;
    for i := 0 to DM.FDMTblLoja.FieldCount - 1 do
        DM.FDMTblLojaSelecionada.Fields[i].Value := DM.FDMTblLoja.Fields[i].Value;
    DM.FDMTblLojaSelecionada.Post; //

    if NOT(Assigned(FrmPerfilLoja)) then
       Application.CreateForm(TFrmPerfilLoja, FrmPerfilLoja);
    CodigoLojaSelecionada := Frame.BtnAgendar.Tag;
    FrmPerfilLoja.Show;
end;

procedure TFrmPrincipal.AdicionarProximo(CodBarbearia: Integer;
                                         NomeLoja,
                                         Endereco,
                                         DistanciaKM,
                                         DistanciaMin,
                                         Imagem: String;
                                         Avaliacao: Double);
var
  Item:  TListBoxItem;
  Frame: TFrameLojaProxima;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstProximo);
    Item.Text := '';
    Item.Height := 80;
    Item.Margins.Bottom := 10;
    Item.Tag := CodBarbearia;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameLojaProxima.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNomeLoja.Text := NomeLoja;
    Frame.LblEndereco.Text := Endereco;
    Frame.LblDistanciaKM.Text := Distanciakm;
    Frame.LblDistanciaMin.Text := DistanciaMin;
    //Frame.LblAvaliacao.Text := Avaliacao.ToString;
    LstProximo.AddObject(Item);
end;

procedure TFrmPrincipal.AddStatusAgendado(CodAgendamento: Integer;
                                          Loja,
                                          Descricao,
                                          Data,
                                          Horario: String;
                                          Valor: Double);
var
  Item:  TListBoxItem;
  Frame: TFrameStatusAgendado;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstStatusAgendamento);
    Item.Text := '';
    Item.Height := 80;
    Item.Tag := CodAgendamento;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameStatusAgendado.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNomeLoja.Text := Loja;
    Frame.LblDescricaoService.Text := Descricao;
    Frame.LblData.Text := Data;
    Frame.LblHorario.Text := Horario;
    Frame.LblValor.Text := FormatCurr('R$ #,##0.00', Valor);
    LstStatusAgendamento.AddObject(Item);
end;

procedure TFrmPrincipal.AnimaBarMenu(IrPara: TLayout);
begin
    with FloatAnimation1 do
    begin
        StartValue := RBarMenu.Position.X;
        StopValue  := IrPara.Position.X;
        Duration   := 0.3;
        Start;
    end;
end;

procedure TFrmPrincipal.ListarProximoAVoce;
begin
    LstProximo.Items.Clear;
    AdicionarProximo(1,
                     'Nome barbearia universal',
                     'Barba, Cabelo e Bigode',
                     '1.7 kms',
                     '12min',
                      '',
                      3.3);
    AdicionarProximo(2,
                     'Nome barbearia da rua',
                     'Nossa barbearia é a nova sensação do momento, aproveite nossos serviços!',
                     '0.7 kms',
                     '12min',
                     '',
                     4.3);
    AdicionarProximo(1,
                     'Nome barbearia universal',
                     'Barba, Cabelo e Bigode',
                     '1.7 kms',
                     '12min',
                     '',
                     3.3);
    AdicionarProximo(2,
                     'Nome barbearia da rua',
                     'Nossa barbearia é a nova sensação do momento, aproveite nossos serviços!',
                     '0.7 kms',
                     '12min',
                     '',
                     4.3);
    AdicionarProximo(1,
                     'Nome barbearia universal',
                     'Barba, Cabelo e Bigode',
                     '1.7 kms',
                     '12min',
                     '',
                     3.3);
    AdicionarProximo(2,
                     'Nome barbearia da rua',
                     'Nossa barbearia é a nova sensação do momento, aproveite nossos serviços!',
                     '0.7 kms',
                     '12min',
                     '',
                     4.3);
end;

procedure TFrmPrincipal.ListarRecomendados;
var
  Th: TThread;
  aEndereco: String;
begin
    TLoading.Show(FrmPrincipal, 'Aguarde...');
    LstRecomendados.Items.Clear;
    Th := TThread.CreateAnonymousThread(procedure
    begin
        DM.ListarLojas;
        if DM.FDMTblLojaSelecionada.FieldCount = 0 then
           MTblCriarCampos(DM.FDMTblLoja, DM.FDMTblLojaSelecionada);
        while NOT DM.FDMTblLoja.EOF do
        begin
            aEndereco := DM.FDMTblLoja.FieldByName('Endereco').AsString + ', ' + DM.FDMTblLoja.FieldByName('Numero').AsString + ' - ' +
                         DM.FDMTblLoja.FieldByName('Cidade').AsString + ', ' +
                         DM.FDMTblLoja.FieldByName('CEP').AsString;
            TThread.Synchronize(TThread.CurrentThread, procedure
            begin
                AdicionarRecomendado(DM.FDMTblLoja.FieldByName('codloja').AsInteger,
                                     DM.FDMTblLoja.FieldByName('Nome').AsString,
                                     aEndereco,
                                     '1.5km',
                                     DM.FDMTblLoja.FieldByName('ImageURL').AsString,
                                     DM.FDMTblLoja.FieldByName('pontuacaomedia').AsFloat);
            end);
            DM.FDMTblLoja.Next;
        end;
    end);
    th.OnTerminate := TerminateThread;
    th.Start;
end;

procedure TFrmPrincipal.TerminateThread(Sender : TObject);
begin
    if Assigned(TThread(Sender).FatalException) then
       ShowMessage(Exception(TThread(Sender).FatalException).Message);
    TLoading.Hide;
end;

procedure TFrmPrincipal.ListarStatusAgendado;
begin
    LstStatusAgendamento.Items.Clear;
    AddStatusAgendado(1,
                      'Agendamento confirmado!',
                      '1x Barba, Cabelo e Bigode',
                      '24/03',
                      '19:30',
                      35.00);
end;

procedure TFrmPrincipal.LstProximoItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
begin
    if NOT(Assigned(FrmPerfilLoja)) then
       Application.CreateForm(TFrmPerfilLoja, FrmPerfilLoja);
    FrmPerfilLoja.Show;
end;

procedure TFrmPrincipal.LstStatusAgendamentoChange(Sender: TObject);
begin
    BtnAgendamento.OnClick(Sender);
end;

procedure TFrmPrincipal.LstStatusAgendamentoItemClick( const Sender: TCustomListBox; const Item: TListBoxItem);
begin
    BtnAgendamento.OnClick(Sender);
end;


end.
