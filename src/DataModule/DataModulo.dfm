object DM: TDM
  OnCreate = DataModuleCreate
  Height = 469
  Width = 518
  object FDTable1: TFDTable
    Left = 248
    Top = 32
  end
  object DataSource1: TDataSource
    Left = 352
    Top = 40
  end
  object FDQFuncionario: TFDQuery
    Connection = FDConexao
    Left = 80
    Top = 248
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConexaoAfterConnect
    BeforeConnect = FDConexaoBeforeConnect
    Left = 72
    Top = 64
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 280
    Top = 296
  end
end
