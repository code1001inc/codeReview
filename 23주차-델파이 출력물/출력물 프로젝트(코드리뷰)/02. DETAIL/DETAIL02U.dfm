object DETAIL02: TDETAIL02
  Left = 0
  Top = 0
  Caption = 'DETAIL02'
  ClientHeight = 847
  ClientWidth = 1580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 0
    Top = 8
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = QuickRep1BeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      40.000000000000000000
      2970.000000000000000000
      40.000000000000000000
      2100.000000000000000000
      40.000000000000000000
      40.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 15
    PrinterSettings.ExtendedDuplex = 1
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 9
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRLoopBand1: TQRLoopBand
      Left = 95
      Top = 63
      Width = 764
      Height = 250
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = #47569#51008' '#44256#46357
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        661.458333333333300000
        2021.416666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickRep1
      PrintCount = 4
      PrintBefore = True
      object qrlblTITLE: TQRLabel
        Left = 2
        Top = 6
        Width = 265
        Height = 23
        Frame.Style = psClear
        Size.Values = (
          60.854166666666670000
          5.291666666666667000
          15.875000000000000000
          701.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = #9664' 2020 '#45380#46020' '#49440#48149' '#51221#44592#51216#44160#50504#45236' '#9654
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrtxtSUBTITLE: TQRRichText
        Left = 2
        Top = 28
        Width = 520
        Height = 21
        Size.Values = (
          55.562500000000000000
          5.291666666666667000
          74.083333333333330000
          1375.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = HANGEUL_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          #49457#55148#54840#51032' '#49440#48149#51221#44592#51216#44160#51004#47196' 3'#50900' 3'#51068' ~ 3'#50900' 14'#51068#44620#51648' '#50500#47000#50752' '#44057#51060' '#55092#54637#54633#45768#45796'.')
      end
      object qrlblCONTENT1: TQRLabel
        Left = 2
        Top = 186
        Width = 318
        Height = 16
        Frame.Style = psClear
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          492.125000000000000000
          841.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = #8251#51216#44160#44592#44036' '#45236' '#54616#47560#50976#54840'  1 '#45824#47564' '#44201#51068#50868#54637
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCONTENT2: TQRLabel
        Left = 2
        Top = 202
        Width = 318
        Height = 16
        Frame.Style = psClear
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          534.458333333333300000
          841.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = #8251'2020.03.15 '#48512#49328#48156#48512#53552' '#47588#51068' '#51221#49345#50868#54637
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCONTENT3: TQRLabel
        Left = 2
        Top = 218
        Width = 318
        Height = 16
        Frame.Style = psClear
        Size.Values = (
          42.333333333333330000
          5.291666666666667000
          576.791666666666700000
          841.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = #8251#49345#44592' '#50868#54637#51068#51221#51008' '#50696#44256' '#50630#51060' '#48320#44221#46112' '#49688' '#51080#49845#45768#45796'.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 3
        Top = 55
        Width = 38
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          145.520833333333300000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 2
        Top = 157
        Width = 40
        Height = 22
        Size.Values = (
          58.208333333333330000
          5.291666666666667000
          415.395833333333300000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = #19979#38364#30332
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 2
        Top = 132
        Width = 40
        Height = 22
        Size.Values = (
          58.208333333333330000
          5.291666666666667000
          349.250000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = #37340#23665#30332
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 8
      end
      object QRShape9: TQRShape
        Left = 2
        Top = 56
        Width = 1
        Height = 124
        Size.Values = (
          328.083333333333300000
          5.291666666666667000
          148.166666666666700000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlDEPTYEAR: TQRLabel
        Left = 7
        Top = 71
        Width = 30
        Height = 18
        Size.Values = (
          47.625000000000000000
          18.520833333333330000
          187.854166666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = #51216#44160
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 8
      end
      object qrlDEPTMNTH: TQRLabel
        Left = 7
        Top = 95
        Width = 30
        Height = 18
        Size.Values = (
          47.625000000000000000
          18.520833333333330000
          251.354166666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = #44592#44036
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 41
        Top = 56
        Width = 1
        Height = 124
        Size.Values = (
          328.083333333333300000
          108.479166666666700000
          148.166666666666700000
          2.645833333333333000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 3
        Top = 130
        Width = 38
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          343.958333333333300000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 3
        Top = 155
        Width = 38
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          410.104166666666700000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 3
        Top = 180
        Width = 38
        Height = 1
        Size.Values = (
          2.645833333333333000
          7.937500000000000000
          476.250000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBlack
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblSuject: TQRLabel
        Left = 47
        Top = 58
        Width = 706
        Height = 18
        Size.Values = (
          47.625000000000000000
          124.354166666666700000
          153.458333333333300000
          1867.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'S (SEONGHEE), H (HAMAYUU), '#19968' ('#55092#54637')'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = #44404#47548#52404
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlCenter
        FontSize = 8
      end
    end
  end
  object Query1: TFDQuery
    Connection = MainForm.MainDB
    FetchOptions.AssignedValues = [evMode, evItems, evRowsetSize, evCache, evRecordCountMode, evUnidirectional, evCursorKind, evLiveWindowParanoic, evDetailOptimize]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 1000
    FormatOptions.AssignedValues = [fvMaxStringSize]
    Left = 745
    Top = 9
  end
end
