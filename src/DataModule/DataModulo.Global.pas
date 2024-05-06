unit DataModulo.Global;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, System.IOUtils, System.JSON,
  //importante importar no projeto....
  {$IFDEF MSWINDOWS} FireDAC.VCLUI.Wait, {$ENDIF}
  DataSet.Serialize,
  DataSet.Serialize.Config,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D;

type
  TDM = class(TDataModule)
    FDQFuncionario: TFDQuery;
    FDConexao: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDTabLojas: TFDMemTable;
    FDTabLojascodloja: TIntegerField;
    FDTabLojasnome: TStringField;
    FDTabLojasendereco: TStringField;
    FDTabLojasCidade: TStringField;
    FDTabLojasestado: TStringField;
    FDTabLojascep: TStringField;
    FDTabLojaslatitude: TFloatField;
    FDTabLojaslongitude: TFloatField;
    FDTabLojasfoto: TStringField;
    FDTabLojasativo: TStringField;
    FDTabLojasdcadastro: TDateTimeField;
    FDTabLojastseguidores: TIntegerField;
    FDTabLojaspontuacaomedia: TFloatField;
    FDMTblLoja: TFDMemTable;
    FDMTblFuncionario: TFDMemTable;
    TabFuncDisponivel: TFDMemTable;
    FDMTblLojaSelecionada: TFDMemTable;
    TabFuncHorario: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    procedure ListarFuncionario(CodLoja: Integer);
    procedure ListarLojas;
    procedure ListarFuncionariosDisponiveis(CodLoja, DiaSemana: Integer);
    procedure ListarHorariosDoFuncionario(CodFuncionario, DiaSemana: Integer);
  end;

var
  DM: TDM;
//const

    // Comando para acessar dados no Android
    // android:usesCleartextTraffic="true"

implementation

uses VariaveisGlobais;

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
    TDataSetSerializeConfig.GetInstance.CaseNameDefinition := cndLower;
    FDConexao.Connected := True;
end;

//procedure TDM.FDConexaoAfterConnect(Sender: TObject);
//begin
    {FDConexao.ExecSQL('CREATE TABLE IF NOT EXISTS ' +
                          'Loja (' +
                          'CodLoja INTEGER NOT NULL PRIMARY KEY, '+
                          'Nome VARCHAR(100), '+
                          'Endereco VARCHAR(255), '+
                          'Cidade VARCHAR(100), '+
                          'Estado VARCHAR(50), '+
                          'CEP VARCHAR(10), '+
                          'Latitude DECIMAL(10, 8), '+
                          'Longitude DECIMAL(11, 8), '+
                          'Foto VARCHAR(100), '+
                          'Ativo VARCHAR(1),  '+
                          'DCadatro DATE,     '+
                          'TSeguidores INT )');  }
//end;

//procedure TDM.FDConexaoBeforeConnect(Sender: TObject);
//begin
    //FDConexao.DriverName := 'SQLite';
    //
    //{$IFDEF MSWINDOWS}
    //    FDConexao.Params.Values['Database'] := 'E:\Delphi\Projetos\AppBarbearia\Servidor\DB\CyrusBarber.sqlite3';
        //FDConexao.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\DB\CyrusBarber.sqlite3';
    //{$ELSE}
    //    FDConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'CyrusBarber.sqlite3');
    //{$ENDIF}

    //{$IFDEF MSWINDOWS}
    //    FDConexao.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\CyrusBarber.sqlite3';
    //{$ELSE}
    //    FDConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'CyrusBarber.sqlite3');
    //{$ENDIF}
//end;

procedure TDM.ListarFuncionario(CodLoja: Integer);
var
  Resp: IResponse;
begin
    FDMTblFuncionario.FieldDefs.Clear;
    Resp := TRequest.New.BaseURL(Base_URL)
            .Resource('/funcionarios')
            .Accept('application/json')
            .Adapters(TDataSetSerializeAdapter.New(FDMTblFuncionario))
            .Get;
    if Resp.StatusCode <> 200 then
       raise Exception.Create('Erro ao consultar funcionarios ' + resp.Content);
end;

procedure TDM.ListarFuncionariosDisponiveis(CodLoja, DiaSemana: Integer);
var
  resp: IResponse;
begin
    TabFuncDisponivel.FieldDefs.Clear;
    resp := TRequest.New.BaseURL(Base_URL)
            .Resource('/funcionario/Disponivel')
            .AddParam('CodLoja',   CodLoja.ToString)
            .AddParam('DiaSemana', DiaSemana.ToString)
            .Accept('application/json')
            .Adapters(TDataSetSerializeAdapter.New(TabFuncDisponivel))
            .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create('Erro ao consultar dados: ' + resp.Content);
end;

{
SELECT HorarioInicio, HorarioTermino, PauseInicio, PauseTermino, IntervaloAgendamento FROM FuncionarioHorario
      WHERE cODfUNCIONARIO = 1 AND DiaSemana = 2
}

procedure TDM.ListarHorariosDoFuncionario(CodFuncionario, DiaSemana: Integer);
var
  resp: IResponse;
begin
    TabFuncHorario.FieldDefs.Clear;
    resp := TRequest.New.BaseURL(Base_URL)
            .Resource('/funcionario/Horario')
            .AddParam('CodFuncionario',  CodFuncionario.ToString)
            .AddParam('DiaSemana', DiaSemana.ToString)
            .Accept('application/json')
            .Adapters(TDataSetSerializeAdapter.New(TabFuncHorario))
            .Get;

    if resp.StatusCode <> 200 then
        raise Exception.Create('Erro ao consultar dados: ' + resp.Content);
end;


procedure TDM.ListarLojas;
var
  Resp : IResponse;
begin
    FDMTblLoja.FieldDefs.Clear;
    Resp := TRequest.New.BaseURL(Base_URL)
            .Resource('/lojas')
            .Accept('application/json')
            .Adapters(TDataSetSerializeAdapter.New(FDMTblLoja))
            .Get;
    if resp.StatusCode <> 200 then // Se a solicitação falhou, lança uma exceção informando o erro
       raise Exception.Create('Erro ao consultar lojas ' + resp.Content);
end;

end.
