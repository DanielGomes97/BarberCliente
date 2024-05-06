unit Funcoes;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
   FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
   FireDAC.Phys, FireDAC.FMXUI.Wait, FMX.ListBox, FMX.Layouts,
   FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Data.DB,
   FireDAC.Comp.Client, FireDac.Stan.Param,
   FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
   FMX.ListView, FMX.Platform, FMX.VirtualKeyboard, System.DateUtils,
   System.Net.HttpClient, System.Net.URLClient;


   //function AtualizaDataSelecionada(Incrementar: Boolean): String;
   //function AtualizaTextoMes: String;
   //function NumeroMesString(Numero: Word): String;
   //function RetornaMesAno(Data: TDateTime): String;
   //function IncrementaNovoCodigo(Tbl: TDataSet; Codigo: String): Integer;
   //function VerificaExisteDescricao(Tabela, CampoPesquisa, Parametro: String): Boolean;
   //function VerificaExisteCodigo(Tabela, CampoPesquisa: String; Parametro: Integer): Boolean;
   //function RecuperaDescricao(Tabela, Descricao, Codigo: String;  Parametro: Integer = 0): String;
   //procedure AlimentaCboVG(LVCombo: TListView; Tabela, Codigo, Descricao: String);
   //function ApagaRegistro(Tabela, Codigo: String; Parametro: Integer): Boolean;
   procedure EsconderTeclado;
   procedure MostrarTeclado(Controle: TFmxObject);
   function VerificaTecladoAtivo: Boolean;
   function ReturnDayName(aValue: Integer): String;
   procedure CarregarImagemDaURL(const URL: string; Componente: TControl);

implementation

uses {DataModulo.Global, }VariaveisGlobais;

function ReturnDayName(aValue: Integer): String;
begin
    if aValue = 1 then      Result := 'Domingo'
    else if aValue = 2 then Result := 'Segunda-feira'
    else if aValue = 3 then Result := 'Terça-feira'
    else if aValue = 4 then Result := 'Quarta-feira'
    else if aValue = 5 then Result := 'Quinta-feira'
    else if aValue = 6 then Result := 'Sexta-feira'
    else if aValue = 7 then Result := 'Sábado'
    else                    Result := 'Fechado';
end;

procedure CarregarImagemDaURL(const URL: string; Componente: TControl);
var
  HTTPClient: THTTPClient;
  Stream: TMemoryStream;
  Bitmap: TBitmap;
  ImagemPadrao: TBitmap;
begin
    HTTPClient := THTTPClient.Create;
    Stream := TMemoryStream.Create;
    Bitmap := TBitmap.Create;
    ImagemPadrao := TBitmap.Create;
    try
        try // Tente carregar a imagem da URL
            HTTPClient.Get(URL, Stream);
            Stream.Position := 0;
            Bitmap.LoadFromStream(Stream);
        except
            // Se ocorrer um erro ao carregar a imagem da URL, carregue a imagem padrão
            if Componente.Width < 200 then   //logo
               ImagemPadrao.LoadFromFile(ImageLogoURL + 'NotFound.png')
            else                             //bg
               ImagemPadrao.LoadFromFile(ImageBackgroundURL + 'NotFound.jpg');
            Bitmap.Assign(ImagemPadrao);
        end;
        // Verifique se o componente é um TImage ou TRectangle e atribua a imagem apropriada
        if Componente is TImage then
           TImage(Componente).Bitmap.Assign(Bitmap)
        else if Componente is TRectangle then
           TRectangle(Componente).Fill.Bitmap.Bitmap.Assign(Bitmap);
    finally
        HTTPClient.Free;
        Stream.Free;
        Bitmap.Free;
        ImagemPadrao.Free;
    end;
end;

{function AtualizaDataSelecionada(Incrementar: Boolean): String;
begin
    if Incrementar then
    begin
        if xNumeroMes = 12 then
        begin
            xNumeroMes := 1;
            Inc(xNumeroAno);
        end
        else
           Inc(xNumeroMes);
    end
    else //decrementar
    begin
        if xNumeroMes = 1 then
        begin
            xNumeroMes := 12;
            Dec(xNumeroAno);
        end
        else
           Dec(xNumeroMes);
    end;
    Result := AtualizaTextoMes+ ' de '+xNumeroAno.ToString;
end; }
 {
function AtualizaTextoMes: String;
begin
    if xNumeroMes = 1 then       Result := 'Janeiro'
    else if xNumeroMes = 2 then  Result := 'Fevereiro'
    else if xNumeroMes = 3 then  Result := 'Março'
    else if xNumeroMes = 4 then  Result := 'Abril'
    else if xNumeroMes = 5 then  Result := 'Maio'
    else if xNumeroMes = 6 then  Result := 'Junho'
    else if xNumeroMes = 7 then  Result := 'Julho'
    else if xNumeroMes = 8 then  Result := 'Agosto'
    else if xNumeroMes = 9 then  Result := 'Setembro'
    else if xNumeroMes = 10 then Result := 'Outubro'
    else if xNumeroMes = 11 then Result := 'Novembro'
    else if xNumeroMes = 12 then Result := 'Dezembro'
    else Result := '';
end; }
       {
function NumeroMesString(Numero: Word): String;
begin
    if xNumeroMes = 1 then       Result := '01'
    else if xNumeroMes = 2 then  Result := '02'
    else if xNumeroMes = 3 then  Result := '03'
    else if xNumeroMes = 4 then  Result := '04'
    else if xNumeroMes = 5 then  Result := '05'
    else if xNumeroMes = 6 then  Result := '06'
    else if xNumeroMes = 7 then  Result := '07'
    else if xNumeroMes = 8 then  Result := '08'
    else if xNumeroMes = 9 then  Result := '09'
    else if xNumeroMes = 10 then Result := '10'
    else if xNumeroMes = 11 then Result := '11'
    else if xNumeroMes = 12 then Result := '12'
    else Result := '';
end;    }
      {
function RetornaMesAno(Data: TDateTime): String;
var
  Mes, Ano: Word;
begin
    Result := '';
    if Data.ToString <> '' then
    begin
        Mes := MonthOf(Data);
        Ano := YearOf(Data);

        Result := NumeroMesString(Mes) + '-' + Ano.ToString;
    end;
end;   }
      {
function IncrementaNovoCodigo(Tbl: TDataSet; Codigo: String): Integer;
var
  NovoCodigo: Integer;
begin
    Tbl.DisableControls;
    Tbl.Last;
    NovoCodigo := Tbl.FieldByName(Codigo).AsInteger + 1;
    Tbl.EnableControls;
    if not (Tbl.State in [dsInsert]) then
       Tbl.Insert;

    Tbl.FieldByName(Codigo).AsInteger := NovoCodigo;
    result := NovoCodigo;
end; }

       {
function VerificaExisteDescricao(Tabela, CampoPesquisa, Parametro: String): Boolean;
begin
    with FDQConsulta do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '+CampoPesquisa+' FROM '+Tabela+' WHERE '+CampoPesquisa+' =:pPesquisa');
        Params.ParamByName('pPesquisa').AsString := Parametro;
        Open();

        if RecordCount > 0 then
            Result := True
        else
            Result := False;
    end;
end;

function VerificaExisteCodigo(Tabela, CampoPesquisa: String; Parametro: Integer): Boolean;
begin
    with FDQConsulta do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '+CampoPesquisa+' FROM '+Tabela+' WHERE '+CampoPesquisa+' =:pCodigo');
        Params.ParamByName('pCodigo').AsInteger := Parametro;
        Open();

        if RecordCount > 0 then
            Result := True
        else
            Result := False;
    end;
end;

function RecuperaDescricao(Tabela, Descricao, Codigo: String;  Parametro: Integer = 0): String;
begin
    Result := '';
    with FDQConsulta do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '+ Descricao +' FROM '+ Tabela +' WHERE '+ Codigo +' =:pCodigo');
        Params.ParamByName('pCodigo').AsInteger := Parametro;
        Open();

        if RecordCount > 0 then
            Result := FieldByName(Descricao).AsString
        else
            Result := '';
    end;
end;

procedure AlimentaCboVG(LVCombo: TListView; Tabela, Codigo, Descricao: String);
var
  xCount: Integer;
begin
    with FDQConsulta do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ' + Codigo + ', ' + Descricao + ' FROM ' + Tabela);
        Open();

        LVCombo.Visible := true;
        LVCombo.BeginUpdate;
        LVCombo.Items.Clear;
        xCount := 1;

        LVCombo.Items.Add.Text := 'Adicionar uma nova categoria';
        LVCombo.Items.Item[0].Tag := 0;
        First;
        while not EOF do
        begin
            LVCombo.Items.Add.Text := FieldByName(Descricao).AsString;
            LVCombo.Items.Item[xCount].Tag := FieldByName(Codigo).AsInteger;
            Inc(xCount);
            Next;
        end;
        LVCombo.EndUpdate;
    end;
end;

function ApagaRegistro(Tabela, Codigo: String; Parametro: Integer): Boolean;
begin
    with FDQConsulta do
    begin
        try
        begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM ' +Tabela+ ' WHERE '+Codigo+' =:CodParametro');
            Params.ParamByName('CodParametro').AsInteger := Parametro;
            ExecSQL;
            Result := True;
        end
        except
            on E: Exception do
                Result := False;
        end;
    end;
end;   }

//*********************************************************
procedure MostrarTeclado(Controle: TFmxObject);
begin
    if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService) then
    begin
        var VirtualKeyboardService := IFMXVirtualKeyboardService(TPlatformServices.Current.GetPlatformService(IFMXVirtualKeyboardService));
        VirtualKeyboardService.ShowVirtualKeyboard(Controle);
    end;
end;

function VerificaTecladoAtivo: Boolean;
begin
    Result := False;
    if KeyBoardEstaVisivel then // Oculta o teclado virtual, se estiver visível
       Result := True;
end;

//EsconderTeclado;  //Key := 0; // Evita que o evento "Back" padrão seja acionado
procedure EsconderTeclado;
begin
    if VerificaTecladoAtivo then
    begin
        if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService) then
        begin
          var VirtualKeyboardService := IFMXVirtualKeyboardService(TPlatformServices.Current.GetPlatformService(IFMXVirtualKeyboardService));
          VirtualKeyboardService.HideVirtualKeyboard;
        end;
    end;
end;

end.
