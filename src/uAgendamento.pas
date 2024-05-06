unit uAgendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Skia,
  FMX.Memo.Types, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.Ani, FMX.Effects, FMX.Filter.Effects,
  FMX.Layouts, FMX.StdCtrls, FMX.ListView, FMX.Edit, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, FMX.ListBox, FMX.Skia, FMX.TabControl, FMX.Objects,
  DateUtils, uLoading;

type
  TFrmAgendamento = class(TForm)
    LoBase: TLayout;
    Rectangle1: TRectangle;
    LoCorpo: TLayout;
    LoRodape: TLayout;
    Layout5: TLayout;
    LstData: TListBox;
    Layout7: TLayout;
    SkLabel4: TSkLabel;
    LoTopo: TLayout;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Rectangle19: TRectangle;
    SkLabel1: TSkLabel;
    Layout3: TLayout;
    BtnBack: TRectangle;
    LoPro: TLayout;
    LstProfissional: TListBox;
    Layout4: TLayout;
    SkLabel2: TSkLabel;
    Layout6: TLayout;
    BtnContinuar: TRectangle;
    Label1: TLabel;
    LoHour: TLayout;
    LstHorario: TListBox;
    Layout9: TLayout;
    SkLabel3: TSkLabel;
    Layout10: TLayout;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    SkLabel5: TSkLabel;
    LblDataeHora: TSkLabel;
    LblNProfissional: TSkLabel;
    VertScrollBox1: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure LstDataItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure BtnBackClick(Sender: TObject);
    procedure LstHorarioItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure LstProfissionalItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    procedure AdicionarFrameCalendario(DataListada: TDate);
    procedure ListarDiaSemana;
    procedure ListarProfissional(CodLoja, DiaSemana: Integer);
    procedure AdicionarFrameHorario(CodBarbearia: Integer; Horario: TTime);
    procedure ListarHorario(CodFuncionario, DiaSemana: Integer);
    procedure AdicionarProfissional(CodFuncionario: Integer; Nome, Imagem: String);
    procedure ThreadAgendamentoTerminante(Sender: TObject);
    procedure SelecionarData(Item: TListBoxItem);
    function  GetWeekNumber(aDate: TDateTime): Integer;
    procedure SelecionarHorario(Item: TListBoxItem);
    procedure SelecionarProfissional(Item: TListBoxItem);
    { Private declarations }
  public
    { Public declarations }
     GDayWeek: Integer;
  end;

var
  FrmAgendamento: TFrmAgendamento;

implementation

uses DataModulo.Global,
     fCalendarioDay, fHorario, fProfissional;

{$R *.fmx}

{*************************************************************************************
                             OTHERS
*************************************************************************************}
procedure TFrmAgendamento.FormCreate(Sender: TObject);
begin
    ListarDiaSemana;
    GDayWeek := 0;
    BtnContinuar.Enabled := False;

    LoPro.Visible  := False;
    LoHour.Visible := False;
end;

procedure TFrmAgendamento.BtnBackClick(Sender: TObject);
begin
    Close;
    FrmAgendamento := nil;
end;

function TFrmAgendamento.GetWeekNumber(aDate: TDateTime): Integer;
begin
    Result := DayOfWeek(aDate);
end;

procedure TFrmAgendamento.ThreadAgendamentoTerminante(Sender: TObject);
begin
    if Assigned(TThread(Sender).FatalException) then
       ShowMessage(Exception(TThread(Sender).FatalException).Message);
    TLoading.Hide;
end;

{*************************************************************************************
                             DIA SEMANA
*************************************************************************************}
procedure TFrmAgendamento.ListarDiaSemana;  //LISTAGEM DOS ITEMS NO FRAME
var
  DataAtual, dataFinal: TDateTime;
  Th: TThread;
begin
    LstData.Items.Clear; // Limpa o conteúdo do Lst
    TLoading.Show(FrmAgendamento, 'Carregando');
    dataAtual   := now;   // Define a data atual como a data inicial
    dataFinal   := IncDay(dataAtual, 10);

    Th := TThread.CreateAnonymousThread(procedure
    begin
        TThread.Synchronize(TThread.CurrentThread, procedure
        begin
            while dataAtual <= dataFinal do // Loop através do intervalo de datas
            begin
                AdicionarFrameCalendario(dataAtual);
                dataAtual := IncDay(dataAtual); // Avança para o próximo dia
            end;
        end);
    end);
    Th.OnTerminate := ThreadAgendamentoTerminante;
    Th.Start;
end;

procedure TFrmAgendamento.AdicionarFrameCalendario(DataListada: TDate);
var
  Item:  TListBoxItem;
  Frame: TFrameCalendarioDay;
  //NumeroDiaSemana: Integer;
  //NumeroDia, NomeSemana: String;
begin
    //NumeroDia   := FormatDateTime('dd', DataListada);
    //NomeSemana  := Format('%s', [FormatDateTime('dddd', DataListada)]);
    //NumeroDiaSemana := GetWeekNumber(DataListada);
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstData);
    Item.Text := '';
    Item.Height := 75;
    item.Width  := 100;
    Item.Margins.Right  := 8;
    Item.TagString := DateToStr(DataListada); //NumeroDia;
    Item.Tag := GetWeekNumber(DataListada);
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameCalendarioDay.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Left;
    Frame.LblNumeroDia.Text := FormatDateTime('dd', DataListada);//NumeroDia;
    Frame.LblNomeDia.Text := Format('%s', [FormatDateTime('dddd', DataListada)]);//NomeSemana;
    LstData.AddObject(Item);
end;

procedure TFrmAgendamento.LstDataItemClick(const Sender: TCustomListBox;  //AO CLICAR NO FRAME.
  const Item: TListBoxItem);
begin
    try
        if Item.TagString = '' then
           exit;
        SelecionarData(Item);
    except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro: ' + E.Message);
        end;
    end;
end;

procedure TFrmAgendamento.SelecionarData(Item: TListBoxItem);  //AO CLICAR NO FRAME..
var
  i     : Integer;
  Frame : TFrameCalendarioDay;
begin
    for I := 0 to LstData.Count - 1 do
    begin
        Frame := LstData.ItemByIndex(I).FindComponent('FrameCalendarioDay') as TFrameCalendarioDay;
        Frame.RBackground.Fill.Color := $FF24242C;
    end;
    Frame := Item.FindComponent('FrameCalendarioDay') as TFrameCalendarioDay;
    Frame.RBackground.Fill.Color := $FF5731E8;
    LblDataeHora.Words.Items[1].Text := Item.TagString;
                              //DM.FDMTblLojaSelecionada.FieldByName('Descricao').AsString
    ListarProfissional(DM.FDMTblLojaSelecionada.FieldByName('CodLoja').AsInteger, Item.Tag); //
    ListarHorario(0, 0);
    BtnContinuar.Enabled := False;
    LoPro.Visible  := True;
    LoHour.Visible := False;
end;


{*************************************************************************************
                            PROFISSIONAL
*************************************************************************************}
procedure TFrmAgendamento.ListarProfissional(CodLoja, DiaSemana: Integer);
begin
    try
        LstProfissional.Items.Clear;
        GDayWeek := DiaSemana;
        DM.ListarFuncionariosDisponiveis(CodLoja, DiaSemana);
        with DM.TabFuncDisponivel do
        begin
            while NOT DM.TabFuncDisponivel.Eof do
            begin
                AdicionarProfissional(FieldByName('CodFuncionario').AsInteger,
                                      FieldByName('Nome').AsString,
                                      '');
                Next;
            end;
        end;
    except on ex: Exception do
        ShowMessage('Erro ao listar funcionarios' + ex.Message);
    end;
end;

procedure TFrmAgendamento.AdicionarProfissional(CodFuncionario: Integer; Nome, Imagem: String);
var
  Item:  TListBoxItem;
  Frame: TFrameProfissional;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstProfissional);
    Item.Text := '';
    Item.Height := 105;
    Item.Width := 105;
    Item.Margins.Right := 7;
    Item.Tag := CodFuncionario;
    Item.TagString := Nome;
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameProfissional.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.LblNome.Text := Nome;
    LstProfissional.AddObject(Item);
end;

procedure TFrmAgendamento.LstProfissionalItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    try
        if Item.TagString = '' then
           exit;
        SelecionarProfissional(Item);
    except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro: ' + E.Message);
        end;
    end;
end;

procedure TFrmAgendamento.SelecionarProfissional(Item: TListBoxItem);
var
  i     : Integer;
  Frame : TFrameProfissional;
begin
    for I := 0 to LstProfissional.Count - 1 do
    begin
        Frame := LstProfissional.ItemByIndex(I).FindComponent('FrameProfissional') as TFrameProfissional;
        Frame.RecBackground.Fill.Color := $FF24242C;
    end;
    Frame := Item.FindComponent('FrameProfissional') as TFrameProfissional;
    Frame.RecBackground.Fill.Color := $FF5731E8;
    LblNProfissional.Words.Items[1].Text := Item.TagString;

    ListarHorario(Item.Tag, GDayWeek);
    LoHour.Visible := True;
end;

{*************************************************************************************
                             HORÁRIO
*************************************************************************************}
procedure TFrmAgendamento.ListarHorario(CodFuncionario, DiaSemana: Integer);
var
  Horario, HoraInicial, HoraFinal: TTime;
begin
    try
        LstHorario.Items.Clear;
        DM.ListarHorariosDoFuncionario(CodFuncionario, DiaSemana);
        with DM.TabFuncHorario do
        begin
            if RecordCount > 0 then
            begin
                HoraInicial := StrToTime(FieldByName('HorarioInicio').AsString);
                HoraFinal   := StrToTime(FieldByName('HorarioTermino').AsString);
                Horario := HoraInicial;  //

                while Horario <= HoraFinal do
                begin
                    //if FieldByName('TemPause').AsString = 'S' then
                    // begin
                    if (Horario < StrToTime(FieldByName('PauseInicio').AsString)) or (Horario > StrToTime(FieldByName('PauseTermino').AsString)) then
                       AdicionarFrameHorario(FieldByName('CodFuncionario').AsInteger, Horario);
                    // end;
                    Horario := IncMinute(Horario, FieldByName('IntervaloAgendamento').AsInteger); // Adiciona tempo em minutos ao horário atual
                end;
            end;
        end;

    except on ex: Exception do
        ShowMessage('Erro ao listar horarios do funcionario' + ex.Message);
    end;
end;

procedure TFrmAgendamento.SelecionarHorario(Item: TListBoxItem);
var
  i     : Integer;
  Frame : TFrameHorario;
begin
    for I := 0 to LstHorario.Count - 1 do
    begin
        Frame := LstHorario.ItemByIndex(I).FindComponent('FrameHorario') as TFrameHorario;
        Frame.RecBackground.Fill.Color := $FF24242C;
    end;
    Frame := Item.FindComponent('FrameHorario') as TFrameHorario;
    Frame.RecBackground.Fill.Color := $FF5731E8;
    LblDataeHora.Words.Items[3].Text := Item.TagString;
    BtnContinuar.Enabled := True;
end;

procedure TFrmAgendamento.AdicionarFrameHorario(CodBarbearia: Integer; Horario: TTime);
var
  Item:  TListBoxItem;
  Frame: TFrameHorario;
begin
    //item vazio na listbox...
    Item := TListBoxItem.Create(LstHorario);
    Item.Text := '';
    Item.Height := 40;
    Item.Width := 90;
    Item.Margins.Bottom := 10;
    Item.Margins.Right := 5;
    Item.Tag := CodBarbearia;
    Item.TagString := FormatDateTime('hh:mm', Horario);//FormatDateTime('hh:nn:ss', Horario);
    Item.Selectable := false;

    //criar o frame...
    Frame := TFrameHorario.Create(Item);
    Frame.Parent := Item;
    Frame.Align := TAlignLayout.Client;
    Frame.HitTest := False;
    Frame.LblHora.Text := FormatDateTime('hh:mm', Horario); // Exibe o horário no formato hh:mm

    LstHorario.AddObject(Item);
end;

procedure TFrmAgendamento.LstHorarioItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
    try
        if Item.TagString = '' then
           exit;
        SelecionarHorario(Item);
    except
        on E: Exception do
        begin
          ShowMessage('Ocorreu um erro: ' + E.Message);
        end;
    end;
end;

end.
