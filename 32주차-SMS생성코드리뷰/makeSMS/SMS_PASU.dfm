object SMS_PAS: TSMS_PAS
  Left = 0
  Top = 0
  Caption = 'SMS_PAS'
  ClientHeight = 757
  ClientWidth = 1666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1666
    Height = 41
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 750
    Width = 1666
    Height = 41
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 676
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 1659
    Top = 0
    Width = 185
    Height = 676
    TabOrder = 3
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 73
    Width = 1666
    Height = 684
    Align = alClient
    TabOrder = 4
    object Splitter1: TSplitter
      Left = 225
      Top = 0
      Width = 6
      Height = 680
      Color = clWhite
      ParentColor = False
      ExplicitLeft = 286
      ExplicitTop = -1
      ExplicitHeight = 491
    end
    object Splitter2: TSplitter
      Left = 1325
      Top = 0
      Width = 6
      Height = 680
      Align = alRight
      Color = clWhite
      ParentColor = False
      ExplicitLeft = 963
      ExplicitTop = -6
      ExplicitHeight = 491
    end
    object pnlHISTORY: TPanel
      Left = 0
      Top = 0
      Width = 225
      Height = 680
      Align = alLeft
      BevelOuter = bvNone
      Color = clWhite
      Ctl3D = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 0
      object Shape1: TShape
        Left = 224
        Top = 113
        Width = 1
        Height = 566
        Align = alRight
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 0
        ExplicitHeight = 581
      end
      object Shape2: TShape
        Left = 0
        Top = 679
        Width = 225
        Height = 1
        Align = alBottom
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitTop = 0
        ExplicitWidth = 691
      end
      object Shape4: TShape
        Left = 0
        Top = 113
        Width = 1
        Height = 566
        Align = alLeft
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 1
        ExplicitHeight = 576
      end
      object asgHIS: TAdvStringGrid
        Left = 1
        Top = 113
        Width = 223
        Height = 566
        Cursor = crDefault
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ColCount = 15
        Ctl3D = False
        DefaultRowHeight = 70
        DoubleBuffered = True
        DrawingStyle = gdsClassic
        FixedColor = 12615680
        RowCount = 4
        FixedRows = 2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #45208#45588#44256#46357
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing]
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnDblClick = asgHISDblClick
        GridFixedLineColor = clMedGray
        HoverRowCells = [hcNormal, hcSelected]
        OnGetAlignment = asgHISGetAlignment
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'Tahoma'
        ActiveCellFont.Style = [fsBold]
        ActiveCellColor = clNone
        Bands.Active = True
        Bands.PrimaryColor = clWhite
        Bands.SecondaryColor = 16316664
        BorderColor = clSilver
        ColumnSize.StretchColumn = 3
        ControlLook.FixedGradientFrom = 15395562
        ControlLook.FixedGradientTo = 15395562
        ControlLook.FixedGradientHoverFrom = clGray
        ControlLook.FixedGradientHoverTo = clWhite
        ControlLook.FixedGradientDownFrom = clGray
        ControlLook.FixedGradientDownTo = clSilver
        ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownHeader.Font.Color = clWindowText
        ControlLook.DropDownHeader.Font.Height = -11
        ControlLook.DropDownHeader.Font.Name = 'Tahoma'
        ControlLook.DropDownHeader.Font.Style = []
        ControlLook.DropDownHeader.Visible = True
        ControlLook.DropDownHeader.Buttons = <>
        ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
        ControlLook.DropDownFooter.Font.Color = clWindowText
        ControlLook.DropDownFooter.Font.Height = -11
        ControlLook.DropDownFooter.Font.Name = 'Tahoma'
        ControlLook.DropDownFooter.Font.Style = []
        ControlLook.DropDownFooter.Visible = True
        ControlLook.DropDownFooter.Buttons = <>
        EnhTextSize = True
        Filter = <>
        FilterDropDown.Font.Charset = DEFAULT_CHARSET
        FilterDropDown.Font.Color = clWindowText
        FilterDropDown.Font.Height = -11
        FilterDropDown.Font.Name = 'Tahoma'
        FilterDropDown.Font.Style = []
        FilterDropDown.TextChecked = 'Checked'
        FilterDropDown.TextUnChecked = 'Unchecked'
        FilterDropDownMultiCol = False
        FilterDropDownClear = '(All)'
        FilterEdit.TypeNames.Strings = (
          'Starts with'
          'Ends with'
          'Contains'
          'Not contains'
          'Equal'
          'Not equal'
          'Larger than'
          'Smaller than'
          'Clear')
        FixedColWidth = 80
        FixedRowHeight = 30
        FixedFont.Charset = DEFAULT_CHARSET
        FixedFont.Color = clBlack
        FixedFont.Height = -15
        FixedFont.Name = #45208#45588#44256#46357
        FixedFont.Style = [fsBold]
        Flat = True
        FloatFormat = '%.2f'
        HideFocusRect = True
        HoverButtons.Buttons = <>
        HoverButtons.Position = hbLeftFromColumnLeft
        HTMLSettings.ImageFolder = 'images'
        HTMLSettings.ImageBaseName = 'img'
        Multilinecells = True
        Navigation.AdvanceOnEnter = True
        PrintSettings.DateFormat = 'dd/mm/yyyy'
        PrintSettings.Font.Charset = DEFAULT_CHARSET
        PrintSettings.Font.Color = clWindowText
        PrintSettings.Font.Height = -11
        PrintSettings.Font.Name = 'Tahoma'
        PrintSettings.Font.Style = []
        PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
        PrintSettings.FixedFont.Color = clWindowText
        PrintSettings.FixedFont.Height = -11
        PrintSettings.FixedFont.Name = 'Tahoma'
        PrintSettings.FixedFont.Style = []
        PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
        PrintSettings.HeaderFont.Color = clWindowText
        PrintSettings.HeaderFont.Height = -11
        PrintSettings.HeaderFont.Name = 'Tahoma'
        PrintSettings.HeaderFont.Style = []
        PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
        PrintSettings.FooterFont.Color = clWindowText
        PrintSettings.FooterFont.Height = -11
        PrintSettings.FooterFont.Name = 'Tahoma'
        PrintSettings.FooterFont.Style = []
        PrintSettings.PageNumSep = '/'
        SearchFooter.FindNextCaption = 'Find &next'
        SearchFooter.FindPrevCaption = 'Find &previous'
        SearchFooter.Font.Charset = DEFAULT_CHARSET
        SearchFooter.Font.Color = clWindowText
        SearchFooter.Font.Height = -11
        SearchFooter.Font.Name = 'Tahoma'
        SearchFooter.Font.Style = []
        SearchFooter.HighLightCaption = 'Highlight'
        SearchFooter.HintClose = 'Close'
        SearchFooter.HintFindNext = 'Find next occurrence'
        SearchFooter.HintFindPrev = 'Find previous occurrence'
        SearchFooter.HintHighlight = 'Highlight occurrences'
        SearchFooter.MatchCaseCaption = 'Match case'
        SearchFooter.ResultFormat = '(%d of %d)'
        SelectionColor = 16776176
        ShowDesignHelper = False
        ShowFocusedSelectionColor = False
        SortSettings.DefaultFormat = ssAutomatic
        VAlignment = vtaCenter
        Version = '8.4.2.2'
        WordWrap = False
        ColWidths = (
          80
          60
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20
          20)
        RowHeights = (
          30
          30
          70
          70)
        object Memo1: TMemo
          Left = 46
          Top = 216
          Width = 185
          Height = 89
          Lines.Strings = (
            'Memo1')
          TabOrder = 4
          Visible = False
        end
      end
      object pnlHisTopArea: TPanel
        Left = 0
        Top = 0
        Width = 225
        Height = 113
        Align = alTop
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object pnlSearch: TPanel
          Left = 0
          Top = 45
          Width = 225
          Height = 68
          Align = alClient
          BevelOuter = bvNone
          Color = clWhite
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #45208#45588#44256#46357
          Font.Style = []
          ParentBackground = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          object Shape10: TShape
            Left = 224
            Top = 0
            Width = 1
            Height = 67
            Align = alRight
            Brush.Color = 15592941
            Pen.Color = clMedGray
            ExplicitLeft = 8
            ExplicitHeight = 581
          end
          object Shape11: TShape
            Left = 0
            Top = 67
            Width = 225
            Height = 1
            Align = alBottom
            Brush.Color = 15592941
            Pen.Color = clMedGray
            ExplicitTop = 0
            ExplicitWidth = 691
          end
          object Shape12: TShape
            Left = 0
            Top = 0
            Width = 1
            Height = 67
            Align = alLeft
            Brush.Color = 15592941
            Pen.Color = clMedGray
            ExplicitLeft = 8
            ExplicitTop = 1
          end
          object Label3: TLabel
            Left = 40
            Top = 14
            Width = 24
            Height = 15
            Caption = #51060#47492
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #45208#45588#44256#46357
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 16
            Top = 38
            Width = 48
            Height = 15
            Caption = #51204#54868#48264#54840
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #45208#45588#44256#46357
            Font.Style = []
            ParentFont = False
          end
          object edtVIZTUSNM: TEdit
            Left = 73
            Top = 11
            Width = 120
            Height = 22
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clWhite
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #45208#45588#44256#46357
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            Text = #54861#44600#46041
          end
          object edtTELENUMB: TEdit
            Left = 73
            Top = 35
            Width = 120
            Height = 22
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clWhite
            Ctl3D = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #45208#45588#44256#46357
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
          end
        end
        object pnlTopTitle: TPanel
          Left = 0
          Top = 0
          Width = 225
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = 7362381
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 1
          object Image3: TImage
            Left = 13
            Top = 14
            Width = 9
            Height = 16
            Center = True
            Picture.Data = {
              0A544A504547496D616765A2050000FFD8FFE1001845786966000049492A0008
              0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
              038D687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
              3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
              656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
              786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
              3D2241646F626520584D5020436F726520352E362D633133382037392E313539
              3832342C20323031362F30392F31342D30313A30393A30312020202020202020
              223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
              772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
              7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
              222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
              636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
              74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
              5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
              6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
              67696E616C446F63756D656E7449443D22786D702E6469643A37666466663838
              372D336365632D313334622D623064322D376533633032646664343132222078
              6D704D4D3A446F63756D656E7449443D22786D702E6469643A44343343314446
              433732434231314539424435353845324546314146304342412220786D704D4D
              3A496E7374616E636549443D22786D702E6969643A4434334331444642373243
              4231314539424435353845324546314146304342412220786D703A4372656174
              6F72546F6F6C3D2241646F62652050686F746F73686F70204343203230313720
              2857696E646F777329223E203C786D704D4D3A4465726976656446726F6D2073
              745265663A696E7374616E636549443D22786D702E6969643A61303332303666
              362D366365622D663634612D396262342D613337393034333836363061222073
              745265663A646F63756D656E7449443D2261646F62653A646F6369643A70686F
              746F73686F703A34636439363735632D366166652D313165392D613162362D63
              6165656361363963303965222F3E203C2F7264663A4465736372697074696F6E
              3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78706163
              6B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB00
              8400010101010101010101010101010101010101010101010101010101010101
              0101010101010101010101010102020202020202020202020303030303030303
              0303010101010101010201010202020102020303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              030303FFC00011080009000903011100021101031101FFC40073000003000000
              0000000000000000000000010508010002030000000000000000000000000008
              0900010A1000010402000603000000000000000000020103040500061272B3D3
              5595160737110002010204030900000000000000000001020300061104050771
              B255D122D2939416170838FFDA000C03010002110311003F00454745AA86AB0A
              BABA156C8D72456B24884CB0E479B1DC6108A54A2245179D785548CC954B8955
              5571E3DBF6FD9F1D9F0699A6419592D8932AA402A8C92A320264909183330EF3
              33627124938D65DEF8BE374E7DD3CEDC57167751CBEE241A8C809124A9365A54
              94810C20106348C8091C6802850001854EFF0017FA1BCF0FB177B98327B4BEBB
              7511E71EDA61BF277DEFE84DE913C34358FC1AF796C7A8EE4B4BF3B6A1C26E66
              ABDCEFDDDA171CA722D4B9822D342AFFD9}
          end
          object Label2: TLabel
            Left = 31
            Top = 11
            Width = 66
            Height = 20
            Caption = 'SMS'#51060#47141
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = #45208#45588#44256#46357
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel6: TPanel
            Left = 402
            Top = 8
            Width = 91
            Height = 28
            BevelOuter = bvNone
            TabOrder = 0
          end
          object Panel13: TPanel
            Left = 104
            Top = 0
            Width = 121
            Height = 45
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object Panel20: TPanel
              Left = 8
              Top = 8
              Width = 91
              Height = 28
              BevelOuter = bvNone
              TabOrder = 0
              object Shape16: TShape
                Left = 0
                Top = 0
                Width = 91
                Height = 28
                Align = alClient
                Brush.Color = 4863277
                Pen.Color = 7362381
                Shape = stRoundRect
                ExplicitLeft = 7
                ExplicitTop = 4
                ExplicitWidth = 75
                ExplicitHeight = 22
              end
              object spbSELHISTORY: TSpeedButton
                AlignWithMargins = True
                Left = 1
                Top = 0
                Width = 89
                Height = 28
                Cursor = crHandPoint
                Margins.Left = 1
                Margins.Top = 0
                Margins.Right = 1
                Margins.Bottom = 0
                Align = alClient
                Caption = #51312#54924
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #45208#45588#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = spbSELHISTORYClick
                ExplicitTop = -9
              end
            end
          end
        end
      end
    end
    object pnlPREVIEW: TPanel
      Left = 1331
      Top = 0
      Width = 331
      Height = 680
      Align = alRight
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object Shape3: TShape
        Left = 330
        Top = 45
        Width = 1
        Height = 634
        Align = alRight
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 0
        ExplicitHeight = 581
      end
      object Shape5: TShape
        Left = 0
        Top = 679
        Width = 331
        Height = 1
        Align = alBottom
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitTop = 0
        ExplicitWidth = 691
      end
      object Shape6: TShape
        Left = 0
        Top = 45
        Width = 1
        Height = 634
        Align = alLeft
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 1
        ExplicitHeight = 490
      end
      object Panel14: TPanel
        Left = 1
        Top = 45
        Width = 329
        Height = 634
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #45208#45588#44256#46357
        Font.Style = []
        ParentBackground = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object memTMPMSG: TMemo
          Left = 7
          Top = 5
          Width = 315
          Height = 611
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #45208#45588#44256#46357
          Font.Style = []
          Lines.Strings = (
            '000 '#45784' '#50808' 0'#47749#51032' '#50696#50557#51060' '#50756#47308#46104#50632#49845#45768#45796'.'
            ''
            '-'#50696#50557#48264#54840' : 2020-0401-001'
            '-'#48512#49328' '#52636#48156' : 2020'#45380' 05'#50900' 01'#51068
            '-'#49884#47784#45432#49464#53412' '#52636#48156' : 2020'#45380' 05'#50900' 02'#51068
            '-'#44208#51228#50696#51221#50868#51076' : 180,500'#50896
            ''
            #8251' '#53552#48120#45328' '#51060#50857#47308', '#44397#51228#44288#44305#50668#44061#49464' : '#44033' '#52636#48156#51648#50640#49436' '
            #49849#49440' '#45817#51068' '#54788#51109#51648#48520'('#54856#54168#51060#51648' '#50668#44061#50868#51076#52280#51312') '
            'https://www.pukwan.co.kr/WEB/003002/we'
            'bpassenger/mb002'
            ''
            #8251' '#50976#47448#54624#51613#47308' : '#44033' '#52636#48156#51648#50640#49436' '#49849#49440' '#45817#51068' '#54788#51109#51648#48520
            '('#54856#54168#51060#51648' '#44277#51648#52280#51312')   '
            'https://www.pukwan.co.kr/WEB/007004/we'
            'bcustomer/mf004/list/1'
            ''
            #8251' '#48512#49328' '#52636#48156' '#49688#49549#49884#44036
            #9312' '#49849#49440#44428' '
            '  - 13:00 ~ 17:30 '
            #9313' '#49688#54616#47932', '#51088#51204#44144' '
            '  - 15:00 ~ 17:00'
            '  * '#51088#51204#44144' '#49440#45236#48152#51077#49884' '#48324#46020' '#50868#51076#51669#49688
            #9314' '#49849#50857#52264', '#51060#47452#51088#46041#52264
            '  - 15:00 ~ 15:30'
            ''
            #8251' '#48512#49328' '#52636#48156' '#49849#49440#44428' '#49688#49549#49884#44036' '#45236#50640' '#49688#49549#51012' '#54616#51648' '#50506
            #51004#47732' '#50696#50557#51008' '#51088#46041' '#52712#49548' '#46121#45768#45796'.'
            ''
            #8251' '#47928#51032#51204#54868' : '#48512#44288#55036#47532' '#50668#44061#54016' 051-464-2700')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 331
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        Color = 7362381
        Ctl3D = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 1
        object Label7: TLabel
          Left = 31
          Top = 11
          Width = 64
          Height = 20
          Caption = #48120#47532#48372#44592
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -17
          Font.Name = #45208#45588#44256#46357
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Image2: TImage
          Left = 13
          Top = 14
          Width = 9
          Height = 16
          Center = True
          Picture.Data = {
            0A544A504547496D616765B6050000FFD8FFE1001845786966000049492A0008
            0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
            038D687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
            3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
            656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
            786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
            3D2241646F626520584D5020436F726520352E362D633133382037392E313539
            3832342C20323031362F30392F31342D30313A30393A30312020202020202020
            223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
            772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
            7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
            222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
            636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
            74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
            5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
            6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
            67696E616C446F63756D656E7449443D22786D702E6469643A37666466663838
            372D336365632D313334622D623064322D376533633032646664343132222078
            6D704D4D3A446F63756D656E7449443D22786D702E6469643A44343343314530
            303732434231314539424435353845324546314146304342412220786D704D4D
            3A496E7374616E636549443D22786D702E6969643A4434334331444646373243
            4231314539424435353845324546314146304342412220786D703A4372656174
            6F72546F6F6C3D2241646F62652050686F746F73686F70204343203230313720
            2857696E646F777329223E203C786D704D4D3A4465726976656446726F6D2073
            745265663A696E7374616E636549443D22786D702E6969643A61303332303666
            362D366365622D663634612D396262342D613337393034333836363061222073
            745265663A646F63756D656E7449443D2261646F62653A646F6369643A70686F
            746F73686F703A34636439363735632D366166652D313165392D613162362D63
            6165656361363963303965222F3E203C2F7264663A4465736372697074696F6E
            3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78706163
            6B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB00
            8400010101010101010101010101010101010101010101010101010101010101
            0101010101010101010101010102020202020202020202020303030303030303
            0303010101010101010201010202020102020303030303030303030303030303
            0303030303030303030303030303030303030303030303030303030303030303
            030303FFC00011080009000903011100021101031101FFC40078000101010000
            0000000000000000000000080109010002030000000000000000000000000008
            0900020A100000060101090000000000000000000001020304050600071172D3
            B49556170838110001030301040A030000000000000000010203040006070511
            12D294217172B2B35516561708380939FFDA000C03010002110311003F006ED2
            E97A628E9943D7E021EBEFA80FABED14211468C9C47CC3070C88A1E4A48CA10C
            9BC72F086151659411389C444476E66F320641CC123304FB9EE79FAA46C9F1B5
            47524A5D750F45790E9018600214D36D101B69A6C0404000020F4B74B56D4B01
            AB022E8BA2C584F596F424100A10A6DF6D4804BAE92085A960EF2D6ADAADE249
            3B6809E36F48BBD49D79C71B19B7CB7FB13F6F2B936F82833F41FD4AF361CC2B
            8AA69B7C4175DCB0732BE5F2D7F456DEED42F0D152C4FC49D5BAA4779559A78D
            D2809AFFD9}
        end
        object Panel16: TPanel
          Left = 402
          Top = 8
          Width = 91
          Height = 28
          BevelOuter = bvNone
          TabOrder = 0
        end
        object Panel7: TPanel
          Left = 210
          Top = 0
          Width = 121
          Height = 45
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object Panel10: TPanel
            Left = 8
            Top = 8
            Width = 91
            Height = 28
            BevelOuter = bvNone
            TabOrder = 0
            object Shape17: TShape
              Left = 0
              Top = 0
              Width = 91
              Height = 28
              Align = alClient
              Brush.Color = 4863277
              Pen.Color = 7362381
              Shape = stRoundRect
              ExplicitLeft = 7
              ExplicitTop = 4
              ExplicitWidth = 75
              ExplicitHeight = 22
            end
            object spbSENDSMS: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 0
              Width = 89
              Height = 28
              Cursor = crHandPoint
              Margins.Left = 1
              Margins.Top = 0
              Margins.Right = 1
              Margins.Bottom = 0
              Align = alClient
              Caption = #51204#49569
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = spbSENDSMSClick
              ExplicitTop = 6
            end
          end
        end
        object pnlCVRTFAIL: TPanel
          Left = 125
          Top = 11
          Width = 69
          Height = 22
          Margins.Top = 1
          Margins.Bottom = 1
          BevelOuter = bvNone
          Caption = #48320#54872' '#49892#54056
          Color = clRed
          Font.Charset = HANGEUL_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = #45208#45588#44256#46357
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
      end
    end
    object pnlTEMPLATE: TPanel
      Left = 231
      Top = 0
      Width = 1094
      Height = 680
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object Shape7: TShape
        Left = 1093
        Top = 45
        Width = 1
        Height = 635
        Align = alRight
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 0
        ExplicitHeight = 581
      end
      object Shape9: TShape
        Left = 0
        Top = 45
        Width = 1
        Height = 635
        Align = alLeft
        Brush.Color = 15592941
        Pen.Color = clMedGray
        ExplicitLeft = 8
        ExplicitTop = 1
        ExplicitHeight = 490
      end
      object Panel9: TPanel
        Left = 1
        Top = 45
        Width = 224
        Height = 635
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Shape24: TShape
          Left = 0
          Top = 634
          Width = 224
          Height = 1
          Align = alBottom
          Brush.Color = 15592941
          Pen.Color = clMedGray
          ExplicitTop = 8
          ExplicitWidth = 274
        end
        object Shape22: TShape
          Left = 223
          Top = 0
          Width = 1
          Height = 634
          Align = alRight
          Brush.Color = 15592941
          Pen.Color = clMedGray
          ExplicitLeft = 0
          ExplicitHeight = 274
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 21
          Height = 634
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
        end
        object stpFMH: TStackPanel
          Left = 21
          Top = 0
          Width = 202
          Height = 634
          Align = alClient
          BevelOuter = bvNone
          ControlCollection = <
            item
              Control = rdbDC01
              HorizontalPositioning = sphpLeft
              VerticalPositioning = spvpFill
            end>
          TabOrder = 1
          object rdbDC01: TRadioButton
            Left = 0
            Top = 0
            Width = 89
            Height = 27
            Align = alLeft
            Caption = '01. '#50696#50557
            TabOrder = 0
          end
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1094
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 1094
          Height = 45
          Align = alTop
          BevelOuter = bvNone
          Color = 7362381
          Ctl3D = False
          ParentBackground = False
          ParentCtl3D = False
          TabOrder = 0
          object Label4: TLabel
            Left = 31
            Top = 11
            Width = 85
            Height = 20
            Caption = #53596#54540#47551' '#49440#53469
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -17
            Font.Name = #45208#45588#44256#46357
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Image5: TImage
            Left = 13
            Top = 14
            Width = 9
            Height = 16
            Center = True
            Picture.Data = {
              0A544A504547496D616765A8050000FFD8FFE1001845786966000049492A0008
              0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
              038D687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
              3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
              656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
              786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
              3D2241646F626520584D5020436F726520352E362D633133382037392E313539
              3832342C20323031362F30392F31342D30313A30393A30312020202020202020
              223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
              772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
              7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
              222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
              636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
              74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
              5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
              6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
              67696E616C446F63756D656E7449443D22786D702E6469643A37666466663838
              372D336365632D313334622D623064322D376533633032646664343132222078
              6D704D4D3A446F63756D656E7449443D22786D702E6469643A44343443394242
              453732434231314539424435353845324546314146304342412220786D704D4D
              3A496E7374616E636549443D22786D702E6969643A4434344339424244373243
              4231314539424435353845324546314146304342412220786D703A4372656174
              6F72546F6F6C3D2241646F62652050686F746F73686F70204343203230313720
              2857696E646F777329223E203C786D704D4D3A4465726976656446726F6D2073
              745265663A696E7374616E636549443D22786D702E6969643A61303332303666
              362D366365622D663634612D396262342D613337393034333836363061222073
              745265663A646F63756D656E7449443D2261646F62653A646F6369643A70686F
              746F73686F703A34636439363735632D366166652D313165392D613162362D63
              6165656361363963303965222F3E203C2F7264663A4465736372697074696F6E
              3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F78706163
              6B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FFDB00
              8400010101010101010101010101010101010101010101010101010101010101
              0101010101010101010101010102020202020202020202020303030303030303
              0303010101010101010201010202020102020303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              030303FFC00011080009000903011100021101031101FFC40078000003000000
              0000000000000000000000010708010002030000000000000000000000000008
              090002071000010402000603000000000000000000020103040500061172B3D3
              9516560838110001020502000F01000000000000000001020300110405062107
              71B1D11272B2D2935494551617370838FFDA000C03010002110311003F00746A
              DAB684D685594D4D594D2F4D974D18C44E3457A1D9C37A28994E9C4624125F92
              04A6E386AA4A4AAAABC7063BCDE7255E4AF57D7BD508BF22A143452829B5054B
              98896A9093A25234948010FF00B07C1F6B18DACA2C771EA2B73FB76FDB9B2016
              DA5B552D2DA04BCF1208716E0256E38B254544926711DFA2FD50F9507987BBB9
              BBFB8F7A7C11EE87242F4F8C7F08FAEA7CDAFB50346FCA1B5725C759FC9917DD
              345C2D71262BB65FC237DE8D5F5D7108E11F0B023FFFD9}
          end
          object Panel19: TPanel
            Left = 818
            Top = 0
            Width = 276
            Height = 45
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object Label29: TLabel
              AlignWithMargins = True
              Left = 135
              Top = 14
              Width = 12
              Height = 15
              Alignment = taRightJustify
              Caption = #47749
              Color = clNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
            end
            object Label23: TLabel
              Left = 10
              Top = 14
              Width = 88
              Height = 15
              Caption = #9654' '#51204#49569#45824#49345#49688' : '
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              Transparent = True
            end
            object lblSMSTOTAL: TLabel
              AlignWithMargins = True
              Left = 125
              Top = 14
              Width = 8
              Height = 15
              Alignment = taRightJustify
              Caption = '0'
              Color = clNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Transparent = True
              Layout = tlCenter
            end
            object Panel17: TPanel
              Left = 171
              Top = 8
              Width = 91
              Height = 28
              BevelOuter = bvNone
              TabOrder = 0
              object Shape13: TShape
                Left = 0
                Top = 0
                Width = 91
                Height = 28
                Align = alClient
                Brush.Color = 4863277
                Pen.Color = 7362381
                Shape = stRoundRect
                ExplicitLeft = 7
                ExplicitTop = 4
                ExplicitWidth = 75
                ExplicitHeight = 22
              end
              object spbSELSMS: TSpeedButton
                AlignWithMargins = True
                Left = 1
                Top = 0
                Width = 89
                Height = 28
                Cursor = crHandPoint
                Margins.Left = 1
                Margins.Top = 0
                Margins.Right = 1
                Margins.Bottom = 0
                Align = alClient
                Caption = #51204#49569' LIST '#51312#54924
                Flat = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -12
                Font.Name = #45208#45588#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
                OnClick = spbSELSMSClick
                ExplicitLeft = -15
                ExplicitTop = -2
              end
            end
          end
          object Panel23: TPanel
            Left = 136
            Top = 8
            Width = 91
            Height = 28
            BevelOuter = bvNone
            TabOrder = 1
            object Shape8: TShape
              Left = 0
              Top = 0
              Width = 91
              Height = 28
              Align = alClient
              Brush.Color = 4863277
              Pen.Color = 7362381
              Shape = stRoundRect
              ExplicitLeft = 7
              ExplicitTop = 4
              ExplicitWidth = 75
              ExplicitHeight = 22
            end
            object spbRELOADLIST: TSpeedButton
              AlignWithMargins = True
              Left = 1
              Top = 0
              Width = 89
              Height = 28
              Cursor = crHandPoint
              Margins.Left = 1
              Margins.Top = 0
              Margins.Right = 1
              Margins.Bottom = 0
              Align = alClient
              Caption = #47532#49828#53944' '#49352#47196#44256#52840
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -12
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
              OnClick = spbRELOADLISTClick
              ExplicitLeft = -15
              ExplicitTop = -2
            end
          end
        end
      end
      object Panel18: TPanel
        Left = 225
        Top = 45
        Width = 868
        Height = 635
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel11: TPanel
          Left = 0
          Top = 0
          Width = 868
          Height = 420
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object asgFMB: TAdvStringGrid
            Left = 0
            Top = 0
            Width = 868
            Height = 420
            Cursor = crDefault
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            ColCount = 7
            Ctl3D = False
            DefaultColWidth = 30
            DefaultRowHeight = 30
            DrawingStyle = gdsClassic
            FixedColor = 528832347
            RowCount = 5
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #45208#45588#44256#46357
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            ParentCtl3D = False
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            OnGetEditText = asgFMBGetEditText
            OnKeyDown = asgFMBKeyDown
            OnKeyPress = asgFMBKeyPress
            GridFixedLineColor = clMedGray
            HoverRowCells = [hcNormal, hcSelected]
            OnGetAlignment = asgFMBGetAlignment
            OnClickCell = asgFMBClickCell
            OnCanEditCell = asgFMBCanEditCell
            OnGetEditorType = asgFMBGetEditorType
            OnEditCellDone = asgFMBEditCellDone
            OnSelectionChanged = asgFMBSelectionChanged
            ActiveCellFont.Charset = DEFAULT_CHARSET
            ActiveCellFont.Color = clWindowText
            ActiveCellFont.Height = -11
            ActiveCellFont.Name = 'Tahoma'
            ActiveCellFont.Style = [fsBold]
            Bands.Active = True
            Bands.PrimaryColor = clWhite
            Bands.SecondaryColor = 16316664
            BorderColor = clSilver
            ColumnSize.StretchColumn = 2
            ControlLook.FixedGradientFrom = 15395562
            ControlLook.FixedGradientTo = 15395562
            ControlLook.FixedGradientHoverFrom = clGray
            ControlLook.FixedGradientHoverTo = clWhite
            ControlLook.FixedGradientDownFrom = clGray
            ControlLook.FixedGradientDownTo = clSilver
            ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownHeader.Font.Color = clWindowText
            ControlLook.DropDownHeader.Font.Height = -11
            ControlLook.DropDownHeader.Font.Name = 'Tahoma'
            ControlLook.DropDownHeader.Font.Style = []
            ControlLook.DropDownHeader.Visible = True
            ControlLook.DropDownHeader.Buttons = <>
            ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
            ControlLook.DropDownFooter.Font.Color = clWindowText
            ControlLook.DropDownFooter.Font.Height = -11
            ControlLook.DropDownFooter.Font.Name = 'Tahoma'
            ControlLook.DropDownFooter.Font.Style = []
            ControlLook.DropDownFooter.Visible = True
            ControlLook.DropDownFooter.Buttons = <>
            EnhTextSize = True
            Filter = <>
            FilterDropDown.Font.Charset = DEFAULT_CHARSET
            FilterDropDown.Font.Color = clWindowText
            FilterDropDown.Font.Height = -11
            FilterDropDown.Font.Name = 'Tahoma'
            FilterDropDown.Font.Style = []
            FilterDropDown.TextChecked = 'Checked'
            FilterDropDown.TextUnChecked = 'Unchecked'
            FilterDropDownClear = '(All)'
            FilterEdit.TypeNames.Strings = (
              'Starts with'
              'Ends with'
              'Contains'
              'Not contains'
              'Equal'
              'Not equal'
              'Larger than'
              'Smaller than'
              'Clear')
            FixedColWidth = 40
            FixedRowHeight = 30
            FixedFont.Charset = DEFAULT_CHARSET
            FixedFont.Color = clBlack
            FixedFont.Height = -12
            FixedFont.Name = #45208#45588#44256#46357
            FixedFont.Style = [fsBold]
            Flat = True
            FloatFormat = '%.2f'
            HideFocusRect = True
            HoverButtons.Buttons = <>
            HoverButtons.Position = hbLeftFromColumnLeft
            HTMLSettings.ImageFolder = 'images'
            HTMLSettings.ImageBaseName = 'img'
            MouseActions.AutoSizeColOnDblClick = False
            PrintSettings.DateFormat = 'dd/mm/yyyy'
            PrintSettings.Font.Charset = DEFAULT_CHARSET
            PrintSettings.Font.Color = clWindowText
            PrintSettings.Font.Height = -11
            PrintSettings.Font.Name = 'Tahoma'
            PrintSettings.Font.Style = []
            PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
            PrintSettings.FixedFont.Color = clWindowText
            PrintSettings.FixedFont.Height = -11
            PrintSettings.FixedFont.Name = 'Tahoma'
            PrintSettings.FixedFont.Style = []
            PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
            PrintSettings.HeaderFont.Color = clWindowText
            PrintSettings.HeaderFont.Height = -11
            PrintSettings.HeaderFont.Name = 'Tahoma'
            PrintSettings.HeaderFont.Style = []
            PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
            PrintSettings.FooterFont.Color = clWindowText
            PrintSettings.FooterFont.Height = -11
            PrintSettings.FooterFont.Name = 'Tahoma'
            PrintSettings.FooterFont.Style = []
            PrintSettings.PageNumSep = '/'
            SearchFooter.FindNextCaption = 'Find &next'
            SearchFooter.FindPrevCaption = 'Find &previous'
            SearchFooter.Font.Charset = DEFAULT_CHARSET
            SearchFooter.Font.Color = clWindowText
            SearchFooter.Font.Height = -11
            SearchFooter.Font.Name = 'Tahoma'
            SearchFooter.Font.Style = []
            SearchFooter.HighLightCaption = 'Highlight'
            SearchFooter.HintClose = 'Close'
            SearchFooter.HintFindNext = 'Find next occurrence'
            SearchFooter.HintFindPrev = 'Find previous occurrence'
            SearchFooter.HintHighlight = 'Highlight occurrences'
            SearchFooter.MatchCaseCaption = 'Match case'
            SearchFooter.ResultFormat = '(%d of %d)'
            SelectionColor = 16704470
            ShowDesignHelper = False
            ShowFocusedSelectionColor = False
            SortSettings.DefaultFormat = ssAutomatic
            VAlignment = vtaCenter
            Version = '8.4.2.2'
            WordWrap = False
            ColWidths = (
              40
              120
              150
              300
              0
              0
              0)
            object asgSMS: TAdvStringGrid
              Left = -3
              Top = 186
              Width = 642
              Height = 207
              Cursor = crDefault
              Align = alCustom
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              ColCount = 24
              Ctl3D = False
              DefaultColWidth = 30
              DefaultRowHeight = 30
              DrawingStyle = gdsClassic
              FixedColor = 528832347
              RowCount = 50
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
              ParentCtl3D = False
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 4
              Visible = False
              OnKeyDown = asgSMSKeyDown
              OnKeyPress = asgSMSKeyPress
              OnKeyUp = asgSMSKeyUp
              GridFixedLineColor = clMedGray
              HoverRowCells = [hcNormal, hcSelected]
              OnGetAlignment = asgSMSGetAlignment
              OnCanEditCell = asgSMSCanEditCell
              OnGetEditorType = asgSMSGetEditorType
              ActiveCellFont.Charset = DEFAULT_CHARSET
              ActiveCellFont.Color = clWindowText
              ActiveCellFont.Height = -11
              ActiveCellFont.Name = 'Tahoma'
              ActiveCellFont.Style = [fsBold]
              Bands.Active = True
              Bands.PrimaryColor = clWhite
              Bands.SecondaryColor = 16316664
              BorderColor = clSilver
              ColumnSize.StretchColumn = 4
              ControlLook.FixedGradientFrom = 15395562
              ControlLook.FixedGradientTo = 15395562
              ControlLook.FixedGradientHoverFrom = clGray
              ControlLook.FixedGradientHoverTo = clWhite
              ControlLook.FixedGradientDownFrom = clGray
              ControlLook.FixedGradientDownTo = clSilver
              ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownHeader.Font.Color = clWindowText
              ControlLook.DropDownHeader.Font.Height = -11
              ControlLook.DropDownHeader.Font.Name = 'Tahoma'
              ControlLook.DropDownHeader.Font.Style = []
              ControlLook.DropDownHeader.Visible = True
              ControlLook.DropDownHeader.Buttons = <>
              ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
              ControlLook.DropDownFooter.Font.Color = clWindowText
              ControlLook.DropDownFooter.Font.Height = -11
              ControlLook.DropDownFooter.Font.Name = 'Tahoma'
              ControlLook.DropDownFooter.Font.Style = []
              ControlLook.DropDownFooter.Visible = True
              ControlLook.DropDownFooter.Buttons = <>
              EnhTextSize = True
              Filter = <>
              FilterDropDown.Font.Charset = DEFAULT_CHARSET
              FilterDropDown.Font.Color = clWindowText
              FilterDropDown.Font.Height = -11
              FilterDropDown.Font.Name = 'Tahoma'
              FilterDropDown.Font.Style = []
              FilterDropDown.TextChecked = 'Checked'
              FilterDropDown.TextUnChecked = 'Unchecked'
              FilterDropDownClear = '(All)'
              FilterEdit.TypeNames.Strings = (
                'Starts with'
                'Ends with'
                'Contains'
                'Not contains'
                'Equal'
                'Not equal'
                'Larger than'
                'Smaller than'
                'Clear')
              FixedColWidth = 40
              FixedRowHeight = 30
              FixedFont.Charset = DEFAULT_CHARSET
              FixedFont.Color = clBlack
              FixedFont.Height = -12
              FixedFont.Name = #45208#45588#44256#46357
              FixedFont.Style = [fsBold]
              Flat = True
              FloatFormat = '%.2f'
              HideFocusRect = True
              HoverButtons.Buttons = <>
              HoverButtons.Position = hbLeftFromColumnLeft
              HTMLSettings.ImageFolder = 'images'
              HTMLSettings.ImageBaseName = 'img'
              MouseActions.AutoSizeColOnDblClick = False
              PrintSettings.DateFormat = 'dd/mm/yyyy'
              PrintSettings.Font.Charset = DEFAULT_CHARSET
              PrintSettings.Font.Color = clWindowText
              PrintSettings.Font.Height = -11
              PrintSettings.Font.Name = 'Tahoma'
              PrintSettings.Font.Style = []
              PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
              PrintSettings.FixedFont.Color = clWindowText
              PrintSettings.FixedFont.Height = -11
              PrintSettings.FixedFont.Name = 'Tahoma'
              PrintSettings.FixedFont.Style = []
              PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
              PrintSettings.HeaderFont.Color = clWindowText
              PrintSettings.HeaderFont.Height = -11
              PrintSettings.HeaderFont.Name = 'Tahoma'
              PrintSettings.HeaderFont.Style = []
              PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
              PrintSettings.FooterFont.Color = clWindowText
              PrintSettings.FooterFont.Height = -11
              PrintSettings.FooterFont.Name = 'Tahoma'
              PrintSettings.FooterFont.Style = []
              PrintSettings.PageNumSep = '/'
              SearchFooter.FindNextCaption = 'Find &next'
              SearchFooter.FindPrevCaption = 'Find &previous'
              SearchFooter.Font.Charset = DEFAULT_CHARSET
              SearchFooter.Font.Color = clWindowText
              SearchFooter.Font.Height = -11
              SearchFooter.Font.Name = 'Tahoma'
              SearchFooter.Font.Style = []
              SearchFooter.HighLightCaption = 'Highlight'
              SearchFooter.HintClose = 'Close'
              SearchFooter.HintFindNext = 'Find next occurrence'
              SearchFooter.HintFindPrev = 'Find previous occurrence'
              SearchFooter.HintHighlight = 'Highlight occurrences'
              SearchFooter.MatchCaseCaption = 'Match case'
              SearchFooter.ResultFormat = '(%d of %d)'
              SelectionColor = 16704470
              ShowDesignHelper = False
              ShowFocusedSelectionColor = False
              SortSettings.DefaultFormat = ssAutomatic
              VAlignment = vtaCenter
              Version = '8.4.2.2'
              WordWrap = False
              ColWidths = (
                40
                65
                85
                40
                40
                40
                180
                40
                90
                70
                65
                40
                60
                50
                50
                85
                100
                10
                10
                10
                10
                30
                30
                30)
              RowHeights = (
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30
                30)
            end
          end
        end
        object scbWrite: TScrollBox
          Left = 0
          Top = 420
          Width = 868
          Height = 215
          Align = alBottom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          ParentColor = False
          TabOrder = 1
          object pnlWriteL: TPanel
            Left = 0
            Top = 0
            Width = 267
            Height = 215
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object pnlADDFARE: TPanel
              Left = 0
              Top = 0
              Width = 267
              Height = 102
              Align = alTop
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 0
              object Label13: TLabel
                Left = 36
                Top = 9
                Width = 116
                Height = 15
                Caption = '* '#52628#44032#50868#51076' '#51077#47141' '#54637#47785
                Font.Charset = ANSI_CHARSET
                Font.Color = 230
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label14: TLabel
                Left = 32
                Top = 38
                Width = 72
                Height = 15
                Alignment = taRightJustify
                Caption = #52628#44032#50868#51076#49324#50976
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Label15: TLabel
                Left = 8
                Top = 62
                Width = 96
                Height = 15
                Alignment = taRightJustify
                Caption = #52628#44032#44208#51228#50696#51221#50868#51076
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Shape14: TShape
                Left = 0
                Top = 0
                Width = 267
                Height = 1
                Align = alTop
                Brush.Color = 15592941
                Pen.Color = clMedGray
                ExplicitLeft = 1
                ExplicitWidth = 161
              end
              object Shape18: TShape
                Left = 266
                Top = 1
                Width = 1
                Height = 100
                Align = alRight
                Brush.Color = 15592941
                Pen.Color = clMedGray
                ExplicitLeft = 8
                ExplicitHeight = 160
              end
              object Shape20: TShape
                Left = 0
                Top = 101
                Width = 267
                Height = 1
                Align = alBottom
                Brush.Color = 15592941
                Pen.Color = clMedGray
                ExplicitTop = 8
              end
              object edtADDAmount: TEdit
                Left = 110
                Top = 60
                Width = 120
                Height = 22
                HelpType = htKeyword
                HelpKeyword = '#{'#52628#44032#44208#51228#50696#51221#50868#51076'}'
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                Color = clWhite
                Ctl3D = True
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 2
                OnEnter = EdtKeyEnterCustom
                OnExit = EdtKeyExitCustom
              end
              object chkADDReason2: TCheckBox
                Left = 179
                Top = 37
                Width = 73
                Height = 17
                HelpType = htKeyword
                HelpKeyword = '#{'#52628#44032#50868#51076#49324#50976'}'
                Caption = #50629#44536#47112#51060#46300
                Color = clLime
                Enabled = False
                ParentColor = False
                TabOrder = 1
              end
              object chkADDReason1: TCheckBox
                Left = 116
                Top = 37
                Width = 60
                Height = 17
                HelpType = htKeyword
                HelpKeyword = '#{'#52628#44032#50868#51076#49324#50976'}'
                Caption = #47352#52264#51648
                Color = clWhite
                Enabled = False
                ParentColor = False
                TabOrder = 0
              end
            end
            object pnlCCLSHIP: TPanel
              Left = 0
              Top = 102
              Width = 267
              Height = 113
              Align = alClient
              BevelOuter = bvNone
              Color = clWhite
              ParentBackground = False
              TabOrder = 1
              object Label10: TLabel
                Left = 36
                Top = 9
                Width = 116
                Height = 15
                Caption = '* '#44208#54637#50504#45236' '#51077#47141' '#54637#47785
                Font.Charset = ANSI_CHARSET
                Font.Color = 230
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label11: TLabel
                Left = 56
                Top = 38
                Width = 48
                Height = 15
                Alignment = taRightJustify
                Caption = #44208#54637#49324#50976
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = []
                ParentFont = False
              end
              object Shape19: TShape
                Left = 266
                Top = 0
                Width = 1
                Height = 112
                Align = alRight
                Brush.Color = 15592941
                Pen.Color = clMedGray
                ExplicitLeft = 8
                ExplicitTop = 1
                ExplicitHeight = 164
              end
              object Shape15: TShape
                Left = 0
                Top = 112
                Width = 267
                Height = 1
                Align = alBottom
                Brush.Color = 15592941
                Pen.Color = clMedGray
                ExplicitLeft = 1
                ExplicitTop = 0
                ExplicitWidth = 165
              end
              object edtCCLReason: TEdit
                Left = 116
                Top = 35
                Width = 120
                Height = 22
                HelpType = htKeyword
                HelpKeyword = '#{'#44208#54637#49324#50976'}'
                AutoSize = False
                BevelKind = bkFlat
                BorderStyle = bsNone
                CharCase = ecUpperCase
                Color = clWhite
                Ctl3D = True
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = #45208#45588#44256#46357
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnEnter = EdtKeyEnterCustom
                OnExit = EdtKeyExitCustom
              end
            end
          end
          object pnlCHGTIME: TPanel
            Left = 267
            Top = 0
            Width = 601
            Height = 215
            Align = alClient
            BevelOuter = bvNone
            Color = clWhite
            ParentBackground = False
            TabOrder = 1
            object Shape21: TShape
              Left = 0
              Top = 0
              Width = 601
              Height = 1
              Align = alTop
              Brush.Color = 15592941
              Pen.Color = clMedGray
              ExplicitTop = 8
              ExplicitWidth = 264
            end
            object Shape23: TShape
              Left = 0
              Top = 214
              Width = 601
              Height = 1
              Align = alBottom
              Brush.Color = 15592941
              Pen.Color = clMedGray
              ExplicitTop = 8
              ExplicitWidth = 264
            end
            object Label9: TLabel
              Left = 20
              Top = 9
              Width = 168
              Height = 15
              Caption = '* '#49688#49549#49884#44036' '#48320#44221' '#50504#45236' '#51077#47141#54637#47785
              Font.Charset = ANSI_CHARSET
              Font.Color = 230
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 21
              Top = 38
              Width = 72
              Height = 15
              Alignment = taRightJustify
              Caption = #49884#44036#48320#44221#49324#50976
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 21
              Top = 62
              Width = 72
              Height = 15
              Alignment = taRightJustify
              Caption = #49688#49549#47560#44048#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 45
              Top = 86
              Width = 48
              Height = 15
              Alignment = taRightJustify
              Caption = #51077#54637#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label16: TLabel
              Left = 9
              Top = 110
              Width = 84
              Height = 15
              Alignment = taRightJustify
              Caption = #49849#49440#44428#49688#49549#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label17: TLabel
              Left = 9
              Top = 134
              Width = 84
              Height = 15
              Alignment = taRightJustify
              Caption = #49688#54616#47932#49688#49549#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label18: TLabel
              Left = 21
              Top = 158
              Width = 72
              Height = 15
              Alignment = taRightJustify
              Caption = #49849#49440#49688#49549#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 45
              Top = 182
              Width = 48
              Height = 15
              Alignment = taRightJustify
              Caption = #52636#54637#49884#44036
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 228
              Top = 38
              Width = 159
              Height = 15
              Caption = '('#47196' '#51064#54620' / '#47484' '#50948#54616#50668' '#46321' '#51077#47141')'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentFont = False
            end
            object edtCHGReason: TEdit
              Left = 105
              Top = 35
              Width = 120
              Height = 22
              HelpType = htKeyword
              HelpKeyword = '#{'#49688#49549#49884#44036#48320#44221#49324#50976'}'
              AutoSize = False
              BevelKind = bkFlat
              BorderStyle = bsNone
              CharCase = ecUpperCase
              Color = clWhite
              Ctl3D = True
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = #45208#45588#44256#46357
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGBoardProcLastTime: TMaskEdit
              Left = 105
              Top = 59
              Width = 45
              Height = 21
              HelpType = htKeyword
              HelpKeyword = '#{'#48320#44221#49688#49549#47560#44048#49884#44036'}'
              Color = clWhite
              Enabled = False
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 1
              Text = '00:00'
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGEntryTime: TMaskEdit
              Left = 105
              Top = 83
              Width = 45
              Height = 21
              HelpType = htKeyword
              HelpKeyword = '#{'#48320#44221#51077#54637#49884#44036'}'
              Enabled = False
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '00:00'
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGDeptTime: TMaskEdit
              Left = 105
              Top = 179
              Width = 45
              Height = 21
              HelpType = htKeyword
              HelpKeyword = '#{'#48320#44221#52636#54637#49884#44036'}'
              Enabled = False
              EditMask = '!90:00;1;_'
              MaxLength = 5
              TabOrder = 6
              Text = '00:00'
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGTketProcTime: TMaskEdit
              Left = 105
              Top = 107
              Width = 85
              Height = 21
              HelpKeyword = '#{'#48320#44221#49849#49440#44428#49688#49549#49884#44036'}'
              Enabled = False
              EditMask = '!90:00 ~ !90:00;1;_'
              MaxLength = 13
              TabOrder = 3
              Text = '  :   ~   :  '
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGBaggProcTime: TMaskEdit
              Left = 105
              Top = 131
              Width = 85
              Height = 21
              HelpType = htKeyword
              HelpKeyword = '#{'#48320#44221#49688#54616#47932#49688#49549#49884#44036'}'
              Enabled = False
              EditMask = '!90:00 ~ !90:00;1;_'
              MaxLength = 13
              TabOrder = 4
              Text = '  :   ~   :  '
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
            object mdtCHGBoardProcTime: TMaskEdit
              Left = 105
              Top = 155
              Width = 85
              Height = 21
              HelpType = htKeyword
              HelpKeyword = '#{'#48320#44221#49849#49440#49688#49549#49884#44036'}'
              Enabled = False
              EditMask = '!90:00 ~ !90:00;1;_'
              MaxLength = 13
              TabOrder = 5
              Text = '  :   ~   :  '
              OnEnter = EdtKeyEnterCustom
              OnExit = EdtKeyExitCustom
            end
          end
        end
      end
    end
  end
  object P_HEAD: TPanel
    Left = 0
    Top = 0
    Width = 1666
    Height = 73
    Align = alTop
    Color = 8663331
    ParentBackground = False
    TabOrder = 5
    object Label5: TLabel
      Left = 1316
      Top = 41
      Width = 80
      Height = 15
      Alignment = taRightJustify
      Caption = 'TEST '#49688#49888#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 1340
      Top = 15
      Width = 56
      Height = 15
      Alignment = taRightJustify
      Caption = 'TEST '#51060#47492
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 271
      Top = 5
      Width = 240
      Height = 75
      Caption = 
        '<<SMS '#48320#54872' '#49324#50857#48169#48277'>>'#13#10'1. '#50864#52769' '#51204#54868#48264#54840' '#51077#47141' '#54980' '#45824#49345#52628#44032#48260#53948' '#53364#47533#13#10'2. '#53596#54540#47551#49440#53469#50640' '#46972#46356#50724#48260#53948' '#53364#47533#13#10 +
        '3. '#53596#54540#47551' '#44536#47532#46300' '#53364#47533' '#13#10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label21: TLabel
      Left = 529
      Top = 29
      Width = 48
      Height = 15
      Caption = #51204#54868#48264#54840
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = []
      ParentFont = False
    end
    object edtTESTNUMB: TEdit
      Left = 1402
      Top = 38
      Width = 120
      Height = 22
      HelpType = htKeyword
      HelpKeyword = '#{'#52628#44032#44208#51228#50696#51221#50868#51076'}'
      AutoSize = False
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnEnter = EdtKeyEnterCustom
      OnExit = EdtKeyExitCustom
    end
    object Panel21: TPanel
      Left = 1056
      Top = 8
      Width = 217
      Height = 53
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object rdbTESTON: TRadioButton
        Left = 8
        Top = 18
        Width = 73
        Height = 17
        Caption = 'TEST ON'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rdbTESTOFF: TRadioButton
        Left = 103
        Top = 18
        Width = 89
        Height = 17
        Caption = 'TEST OFF'
        TabOrder = 1
      end
    end
    object edtTESTNAME: TEdit
      Left = 1402
      Top = 11
      Width = 120
      Height = 22
      HelpType = htKeyword
      HelpKeyword = '#{'#52628#44032#44208#51228#50696#51221#50868#51076'}'
      AutoSize = False
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = #54861#44600#46041
      OnEnter = EdtKeyEnterCustom
      OnExit = EdtKeyExitCustom
    end
    object Panel22: TPanel
      Left = 16
      Top = 16
      Width = 91
      Height = 28
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object Shape25: TShape
        Left = 0
        Top = 0
        Width = 91
        Height = 28
        Align = alClient
        Brush.Color = 4863277
        Pen.Color = 7362381
        Shape = stRoundRect
        ExplicitLeft = 7
        ExplicitTop = 4
        ExplicitWidth = 75
        ExplicitHeight = 22
      end
      object SpeedButton1: TSpeedButton
        AlignWithMargins = True
        Left = 1
        Top = 0
        Width = 89
        Height = 28
        Cursor = crHandPoint
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 0
        Align = alClient
        Caption = #51312#54924
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #45208#45588#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 0
        ExplicitTop = -1
      end
    end
    object Panel24: TPanel
      Left = 1607
      Top = 1
      Width = 58
      Height = 71
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
      object SB_CLOSE: TSpeedButton
        Left = 6
        Top = 1
        Width = 42
        Height = 66
        Cursor = crHandPoint
        Caption = '&E'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8663331
        Font.Height = -1
        Font.Name = #45208#45588#48148#47480#44256#46357
        Font.Style = []
        Glyph.Data = {
          56370000424D5637000000000000360000002800000060000000310000000100
          18000000000020370000120B0000120B00000000000000000000843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123C8ADAA97595184312384312384312384312384312384
          3123843123A87973B89490843123843123843123843123843123843123843123
          843123A87973B894908431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123925147883A2D
          8431238431238431238431238431238431238431238B42378F4A3F8431238431
          238431238431238431238431238431238431238B42378F4A3F84312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123FFFFFFA8797384312384312384312384312384312384
          3123843123C8ADAAE5D9D7843123843123843123843123843123843123843123
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431238431239F6B638B4237
          843123843123843123843123843123843123843123925147995F568431238431
          23843123843123843123843123843123843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123FFFFFFA87973843123B8949084312384312384312384
          3123843123C8ADAAE5D9D78431238D473CA87973843123843123843123843123
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431238431239F6B638B4237
          8431238F4A3F843123843123843123843123843123925147995F568431238636
          288B4237843123843123843123843123843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123B89490E5D9D7E5D9D7E5D9
          D7E5D9D7C8ADAAB08782FFFFFFA879739F6A63F9F6F6EBE3E29F6A6384312384
          3123843123C8ADAAE5D9D7843123C0A19DFFFFFFD6C3C18D473C843123843123
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238F4A3F995F56995F56995F56995F569251478D463B9F6B638B4237
          893E329D68609A6259893E32843123843123843123925147995F56843123904D
          439F6B6395584F863628843123843123843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAEBE3E2A87973C0A1
          9DC8ADAACFB8B6CFB8B6FFFFFFA879738431238D473CDECECCF9F6F69F6A6384
          3123843123C8ADAAE5D9D7843123843123A87973F9F6F6EBE3E2843123843123
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431239251479A62598B4237904D4392514794554B94554B9F6B638B4237
          843123863628975B529D6860893E32843123843123925147995F568431238431
          238B42379D68609A6259843123843123843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAE5D9D78431238431
          23843123843123843123FFFFFFA879738431238431238D473CEBE3E2EBE3E284
          3123843123C8ADAAEBE3E2A879739759518431239F6A63F9F6F6CFB8B6843123
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123925147995F568431238431238431238431238431239F6B638B4237
          8431238431238636289A62599A62598431238431239251479A62598B4237883A
          2D843123893E329D686094554B843123843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAE5D9D78431238431
          23843123843123843123FFFFFFFFFFFFFFFFFF843123843123975951F9F6F6B8
          9490843123C8ADAAF9F6F6E5D9D7B89490843123843123B89490FFFFFF975951
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123925147995F568431238431238431238431238431239F6B639F6B63
          9F6B63843123843123883A2D9D68608F4A3F8431239251479D6860995F568F4A
          3F8431238431238F4A3F9F6B63883A2D843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAE5D9D78431238431
          23843123843123843123FFFFFFA87973843123843123843123843123CFB8B6EB
          E3E2843123C8ADAAE5D9D7843123843123843123843123843123F2EDECC0A19D
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123925147995F568431238431238431238431238431239F6B638B4237
          84312384312384312384312394554B9A6259843123925147995F568431238431
          238431238431238431239C655D904D43843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAE5D9D78431238431
          23843123843123843123FFFFFFA87973843123A87973A87973A87973C0A19DFF
          FFFF843123C8ADAAE5D9D78431238D473CA87973A87973A87973DECECCE5D9D7
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123925147995F568431238431238431238431238431239F6B638B4237
          8431238B42378B42378B4237904D439F6B63843123925147995F568431238636
          288B42378B42378B4237975B52995F56843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123C8ADAAE5D9D78431238431
          23843123843123843123FFFFFFA87973843123E5D9D7E5D9D7E5D9D7E5D9D7E5
          D9D7975951C8ADAAE5D9D78431239F6A63E5D9D7E5D9D7E5D9D7E5D9D7CFB8B6
          843123C8ADAAE5D9D78431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123925147995F568431238431238431238431238431239F6B638B4237
          843123995F56995F56995F56995F56995F56883A2D925147995F56843123893E
          32995F56995F56995F56995F5694554B843123925147995F5684312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123E5D9D79F6A6384312384312384312384312384312384
          3123843123B89490CFB8B6843123843123843123843123843123843123843123
          843123B89490CFB8B68431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123995F56893E32
          8431238431238431238431238431238431238431238F4A3F94554B8431238431
          238431238431238431238431238431238431238F4A3F94554B84312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431238431238431238431238431238432248B392B9240329845389B493C9D
          4A3D9D4A3D9B493C9845389240328B392B853224843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431237F2F227B2D20782C1F752B1E742A1E742A1E752B1E782C1F7B2D207F2F
          2284312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123863325913E319B493C9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9B493C913E31863325843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431238431238331237C2D20
          752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E752B1E7C2D2083312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431238431238D3A2C9B493C9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9B493C8D3A2C843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431237E2F21752B1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E752B1E7E2F2184312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431239340339D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E934033
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431237B2D20742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E7B2D2084312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          239543359D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9543358431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123792C20742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E792C2084312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431239340
          339D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9340338431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431237B2D20742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E7B2D2084312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238D3A2C9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E8D3A2C8431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431237F2F21742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E7E2F2184312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238633259B493C9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EAE6A5FC4
          938BCB9F98C3928AAC665B9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9B493C8633258431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123833123752B1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E7B352A85443A88483E8543397A3428742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E752B1E83312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123843123913E319D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EB17065E9D7D4FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFE6D1CEAE6B609D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E913E318431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431237C2D20742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E7D372C955C549F6B639F6B639F6B639F6B639F6B63945A517C35
          2A742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E7C2D2084312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238532249B493C9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EBE8880FDFBFBFFFFFFFFFFFFFF
          FFFFFDFCFCFFFFFFFFFFFFFFFFFFFCF9F9BA80779D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9B493C8532248431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E8340369E6A629F6B639F6B639F6B639E6A629F6B639F6B639F6B639E69
          61813D32742A1E742A1E742A1E742A1E742A1E742A1E742A1E752B1E84312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238B392B9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EB06E64FCF9F9FFFFFFF9F4F3C89992A5
          5A4E9D4B3EA75D52CA9E97FAF7F6FFFFFFFAF5F4AC675C9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E8C392B8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431237F2F22742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          7C372C9E69619F6B639C675F87463C782F24742A1E78312588483E9D68609F6B
          639D675F7B3429742A1E742A1E742A1E742A1E742A1E742A1E742A1E7F2F2184
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239240329D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EE9D6D3FFFFFFF8F3F2AD685D9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3EB06E64FBF7F7FFFFFFE3CBC79D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9240338431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431237B2D20742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          955C539F6B639C675E7B3429742A1E742A1E742A1E742A1E742A1E7C372C9D68
          609F6B6393584F742A1E742A1E742A1E742A1E742A1E742A1E742A1E7B2D2084
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239745389D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3EAC675CFFFFFFFFFFFFC3928A9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3EC99C95FFFFFFFFFEFEA75D529D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9745388431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123782C1F742A1E742A1E742A1E742A1E742A1E742A1E742A1E7B3429
          9F6B639F6B63854339742A1E742A1E742A1E742A1E742A1E742A1E742A1E8747
          3D9F6B639F6B63783125742A1E742A1E742A1E742A1E742A1E742A1E782C1F84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239B493C9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3EC6978FFFFFFFFBF7F7A050439D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3EA4584CFDFCFCFFFFFFC08B839D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9B493C8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E86453B
          9F6B639D6860752C20742A1E742A1E742A1E742A1E742A1E742A1E742A1E772F
          239E6A629F6B63834137742A1E742A1E742A1E742A1E742A1E742A1E752B1E84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239C4A3D9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3ED1AAA4FFFFFFEDDDDB9D4B3E9D4B3E9D4B3E9D
          4B3EA65C509D4B3E9D4B3E9D4B3E9D4B3EF3E9E8FFFFFFCA9E979D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9C4A3D8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E8B4C43
          9F6B63975F56742A1E742A1E742A1E742A1E783024742A1E742A1E742A1E742A
          1E9A635B9F6B6388483E742A1E742A1E742A1E742A1E742A1E742A1E742A1E84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239C4A3D9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3ED0A8A2FFFFFFEFE2E09D4B3E9D4B3E9D4B3ECD
          A39DFFFFFFC798909D4B3E9D4B3E9D4B3EF7EFEEFFFFFFCA9E979D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9C4A3D8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E8A4C42
          9F6B63986158742A1E742A1E742A1E894A409F6B6386463B742A1E742A1E742A
          1E9B655D9F6B6388483E742A1E742A1E742A1E742A1E742A1E742A1E742A1E84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239B493C9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3EC28E86FFFFFFFEFDFDA55A4E9D4B3E9D4B3EE2
          CAC6FFFFFFDCBFBB9D4B3E9D4B3EAA6257FFFFFFFFFFFFBC837B9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9B493C8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E844238
          9F6B639E6A62782F24742A1E742A1E92584F9F6B6390544B742A1E742A1E7A32
          279F6B639F6B63813E34742A1E742A1E742A1E742A1E742A1E742A1E752B1E84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239745389D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3EA4584CFDFBFAFFFFFFD4AFA99D4B3E9D4B3EE2
          CAC6FFFFFFDCBFBB9D4B3E9D4B3EDABBB6FFFFFFFCF9F8A255499D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9745388431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123782C1F742A1E742A1E742A1E742A1E742A1E742A1E742A1E772F23
          9E69619F6B638C4E44742A1E742A1E92584F9F6B6390544B742A1E742A1E8F53
          499F6B639D6961762E22742A1E742A1E742A1E742A1E742A1E742A1E782C1F84
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431239240329D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3ED8B7B2FFFFFFFEFDFDC28E869D4B3EE2
          CAC6FFFFFFDCBFBB9D4B3EC79991FFFEFEFFFFFFD2ACA69D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E9240338431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431237B2D20742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          8E51479F6B639E6A62844238742A1E92584F9F6B6390544B742A1E87463C9F6B
          639F6B638B4D43742A1E742A1E742A1E742A1E742A1E742A1E742A1E7B2D2084
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238B392B9D4B3E9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EA4574BF4EBEAFFFFFFFEFDFDA4574BE2
          CAC6FFFFFFDCBFBBA96055FFFEFEFFFFFFF0E4E2A152469D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9D4B3E8B392B8431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431237F2F22742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          772E239A645B9F6B639E6A62772E2392584F9F6B6390544B7932269F6B639F6B
          63996159762D21742A1E742A1E742A1E742A1E742A1E742A1E742A1E7F2F2284
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238532249B493C9D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EAB655AEEE0DEE8D5D29E4D40E2
          CAC6FFFFFFDCBFBBA05144ECDCDAEBDBD8A960559D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E9B493C8532248431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E7A3328986057955C53752B1F92584F9F6B6390544B752C20975F56965E
          55793226742A1E742A1E742A1E742A1E742A1E742A1E742A1E752B1E84312384
          3123843123843123843123843123843123843123843123843123843123843123
          843123843123843123843123843123843123843123843123913E319D4B3E9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EE2
          CAC6FFFFFFDCBFBB9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9D4B3E913E318431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431237C2D20742A1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E92584F9F6B6390544B742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E7C2D2084312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238633259B493C9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EDA
          BBB6FFFFFFD4B0AA9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E9B493C8633258431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123833123752B1E742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E8F52499F6B638C4E45742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E752B1E83312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238D3A2C9D4B
          3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3EA4
          584CC28F87A254489D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9D4B3E8D3A2C8431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431237F2F21742A1E742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E772F23844338762D22742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E7F2F2184312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431239240
          339D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9D4B3E9340338431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431237B2D20742A1E742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E742A1E7B2D2084312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          239543359D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E
          9543358431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123792C20742A1E742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E742A1E792C2084312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431239340339D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E934033
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431237B2D20742A1E742A1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E742A1E742A1E7B2D2084312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431238431238D3A2C9B493C9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9B493C8D3A2C843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431237E2F21752B1E742A1E
          742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E742A1E742A1E752B1E7E2F2184312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          23843123843123843123863325913E319B493C9D4B3E9D4B3E9D4B3E9D4B3E9D
          4B3E9D4B3E9D4B3E9D4B3E9D4B3E9D4B3E9B493C913E31863325843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          31238431238431238431238431238431238431238431238431238331237C2D20
          752B1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A1E742A
          1E752B1E7C2D2083312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          238431238431238431238431238431238432248B392B9240329745389B493C9C
          4A3D9C4A3D9B493C9745389240328B392B843224843123843123843123843123
          8431238431238431238431238431238431238431238431238431238431238431
          2384312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123843123843123
          8431237F2F227B2D20782C1F752B1E742A1E742A1E752B1E782C1F7B2D207F2F
          2284312384312384312384312384312384312384312384312384312384312384
          3123843123843123843123843123843123843123843123843123}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = SB_CLOSEClick
      end
    end
    object addNumber: TEdit
      Left = 586
      Top = 25
      Width = 120
      Height = 22
      AutoSize = False
      BevelKind = bkFlat
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clWhite
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #45208#45588#44256#46357
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object Panel25: TPanel
      Left = 713
      Top = 22
      Width = 91
      Height = 28
      BevelOuter = bvNone
      TabOrder = 6
      object Shape26: TShape
        Left = 0
        Top = 0
        Width = 91
        Height = 28
        Align = alClient
        Brush.Color = 4863277
        Pen.Color = 7362381
        Shape = stRoundRect
        ExplicitLeft = 7
        ExplicitTop = 4
        ExplicitWidth = 75
        ExplicitHeight = 22
      end
      object SpeedButton2: TSpeedButton
        AlignWithMargins = True
        Left = 1
        Top = 0
        Width = 89
        Height = 28
        Cursor = crHandPoint
        Margins.Left = 1
        Margins.Top = 0
        Margins.Right = 1
        Margins.Bottom = 0
        Align = alClient
        Caption = #45824#49345' '#52628#44032
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #45208#45588#44256#46357
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = spbRELOADLISTClick
        ExplicitLeft = -1
        ExplicitTop = 6
      end
    end
  end
  object MemoEditLink1: TMemoEditLink
    Tag = 0
    AutoPopupWidth = True
    EditStyle = esPopup
    PopupWidth = 100
    PopupHeight = 300
    WantKeyLeftRight = False
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = True
    Color = clNone
    Scrollbars = ssVertical
    MaxLength = 0
    SelectAll = False
    TabIsExit = True
    WantTabs = False
    WantReturns = False
    Left = 381
    Top = 149
  end
  object MemoEditLink2: TMemoEditLink
    Tag = 0
    AutoPopupWidth = True
    EditStyle = esPopup
    PopupWidth = 100
    PopupHeight = 300
    WantKeyLeftRight = False
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = True
    Color = clNone
    Scrollbars = ssVertical
    MaxLength = 0
    SelectAll = False
    TabIsExit = True
    WantTabs = False
    WantReturns = False
    Left = 381
    Top = 205
  end
  object Query1: TFDQuery
    Connection = MainDM.MainDB
    Left = 120
    Top = 11
  end
  object Query2: TFDQuery
    Connection = MainDM.MainDB
    Left = 168
    Top = 11
  end
end
