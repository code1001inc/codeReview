object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 279
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 72
    Top = 32
    object BASICMENU: TMenuItem
      Caption = #52636#47141#47932' 1'
      object BASICSUB01: TMenuItem
        Caption = #44592#48376' '#52636#47141
        OnClick = BASICSUB01Click
      end
      object BASICSUB02: TMenuItem
        Caption = 'LOOP '#52636#47141
        OnClick = BASICSUB02Click
      end
    end
    object DETAILMENU: TMenuItem
      Caption = #52636#47141#47932' 2'
      object DETAILSUB01: TMenuItem
        Caption = #47672#51648' ?'#48169#48277
        OnClick = DETAILSUB01Click
      end
      object DETAILSUB02: TMenuItem
        Caption = #46041#51201#49373#49457
        OnClick = DETAILSUB02Click
      end
    end
    object ETCMENU: TMenuItem
      Caption = #44592#53440
      object ETCSUB01: TMenuItem
        Caption = #52636#47141#47932' '#51060#48292#53944' '#54840#52636' '#49692#49436
        OnClick = ETCSUB01Click
      end
    end
  end
  object MainDB: TFDConnection
    Params.Strings = (
      'Database=211.221.3.61:1521/pkinc'
      'User_Name=pkf01'
      'Password=pkf01'
      'CharacterSet=UTF8'
      'DriverID=Ora')
    Left = 129
    Top = 33
  end
end
