object DM: TDM
  OnCreate = DataModuleCreate
  Height = 469
  Width = 518
  object FDQFuncionario: TFDQuery
    Connection = FDConexao
    Left = 40
    Top = 96
  end
  object FDConexao: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 160
    Top = 24
  end
  object FDTabLojas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 96
    object FDTabLojascodloja: TIntegerField
      FieldName = 'codloja'
    end
    object FDTabLojasnome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object FDTabLojasendereco: TStringField
      FieldName = 'endereco'
      Size = 255
    end
    object FDTabLojasCidade: TStringField
      FieldName = 'Cidade'
      Size = 100
    end
    object FDTabLojasestado: TStringField
      FieldName = 'estado'
      Size = 100
    end
    object FDTabLojascep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object FDTabLojaslatitude: TFloatField
      FieldName = 'latitude'
    end
    object FDTabLojaslongitude: TFloatField
      FieldName = 'longitude'
    end
    object FDTabLojasfoto: TStringField
      FieldName = 'foto'
      Size = 100
    end
    object FDTabLojasativo: TStringField
      FieldName = 'ativo'
      Size = 1
    end
    object FDTabLojasdcadastro: TDateTimeField
      FieldName = 'dcadastro'
    end
    object FDTabLojastseguidores: TIntegerField
      FieldName = 'tseguidores'
    end
    object FDTabLojaspontuacaomedia: TFloatField
      FieldName = 'pontuacaomedia'
    end
  end
  object FDMTblLoja: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 232
  end
  object FDMTblFuncionario: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 240
  end
  object TabFuncDisponivel: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 296
    Top = 312
  end
  object FDMTblLojaSelecionada: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 64
    Top = 304
  end
  object TabFuncHorario: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 344
    Top = 96
  end
end
