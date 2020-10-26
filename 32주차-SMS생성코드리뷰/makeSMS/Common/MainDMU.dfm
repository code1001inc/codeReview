object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 381
  Width = 487
  object MainDB: TFDConnection
    Params.Strings = (
      'Database=211.221.3.61:1521/pkinc'
      'User_Name=pkf01'
      'Password=pkf01'
      'CharacterSet=UTF8'
      'DriverID=Ora')
    Left = 41
    Top = 25
  end
  object QMASTER: TFDQuery
    Connection = MainDB
    Left = 105
    Top = 25
  end
  object QLOG: TFDQuery
    Connection = MainDB
    Left = 169
    Top = 25
  end
  object QCOMMON: TFDQuery
    Connection = MainDB
    Left = 225
    Top = 25
  end
  object QBILL: TFDQuery
    Connection = MainDB
    Left = 297
    Top = 25
  end
  object QALRIM: TFDQuery
    Connection = MainDB
    Left = 353
    Top = 33
  end
end
