unit BASE_PAS_NONEU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, AdvObj, StrUtils,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, AdvGrid, Vcl.Menus, Generics.Collections,
  Vcl.Imaging.pngimage, RxCurrEdit;

type
  TEditType = (etBaseCode, etCommonCode, etDate);

  TEditTypeBind = record
    case edtType : TEditType of
      etBaseCode, etCommonCode :
                       (edtCodeName:TEdit;
                        codeType: String[20];);
      etDate: (calImg:TImage;);
  end;

type
  TBASE_PAS_NONEF = class(TForm)
    P_HEAD: TPanel;
    Image1: TImage;
    fmTITLE: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    EdtKey: TEdit;
    ScrollBox1: TScrollBox;
    Query1: TFDQuery;
    Query2: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SB_CLOSEClick(Sender: TObject);
    procedure EdtKeyEnter(Sender: TObject);
    procedure EdtKeyExit(Sender: TObject);
    procedure EdtKeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure EdtKeyChange(Sender: TObject);

    procedure asgCanSort(Sender: TObject; ACol: Integer; var DoSort: Boolean);
    procedure asgMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure asgClickSort(Sender: TObject; ACol: Integer);
    procedure asgGetFormat(Sender: TObject; ACol: Integer; var AStyle: TSortStyle; var aPrefix, aSuffix: string);
    procedure asgRawCompare(Sender: TObject; ACol, Row1, Row2: Integer; var Res: Integer);
    //
    { 그리드 사이징 관련.. ( 숨김필드 0 처리) }
    procedure asgRColumnSize(Sender: TObject; ACol: Integer; var Allow: Boolean);
    procedure asgRColumnSizing(Sender: TObject; ACol, ColumnSize: Integer);
    procedure asgRUpdateColumnSize(Sender: TObject; ACol: Integer; var AWidth: Integer);
    procedure asgREndColumnSize(Sender: TObject; ACol: Integer);
    //{ mouse wheel 1칸 이동 }
    procedure asgRMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure asgRMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);

    procedure EdtKeyKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

    { 에디트박스 타입 }
    editTypeDict :TDictionary<TEdit, TEditTypeBind>;
    FGridSortList : TList<TAdvStringGrid>;
    procedure SBMouseEnterHover(Sender: TObject);
    procedure SBMouseLeaveHover(Sender: TObject);
  public
    { Public declarations }

    { 그리드 정렬 리스트 }
    SortJigwiDict:TDictionary<String, String>;
    SortDeptDict :TDictionary<String, String>;

    { 그리드 사이징 관련 변수}
    OldColumnSize : integer;

    procedure SetTEditBaseCode(Code, CodeName:TEdit; const CodeType:String);
    procedure SetTEditCommCode(Code, CodeName:TEdit; const CodeType:String);
    procedure SetTEditDate(Code :TEdit; calImg:TImage);
    procedure SetGridSortSetting(grid:TAdvStringGrid);
    procedure CommonEventBinding;
  end;

var
  BASE_PAS_NONEF: TBASE_PAS_NONEF;

implementation

uses  MAINU, MainDMU;

{$R *.dfm}

procedure TBASE_PAS_NONEF.SetTEditBaseCode(Code, CodeName: TEdit;
  const CodeType: String);
var
  editTypeBind:TEditTypeBind;
begin
  editTypeBind.edtType := etBaseCode;
  editTypeBind.edtCodeName := CodeName;
  editTypeBind.codeType := CodeType;
  editTypeDict.TryAdd(code, editTypeBind);
end;

procedure TBASE_PAS_NONEF.SetTEditCommCode(Code, CodeName: TEdit;
  const CodeType: String);
var
  editTypeBind:TEditTypeBind;
begin
  editTypeBind.edtType := etCommonCode;
  editTypeBind.edtCodeName := CodeName;
  editTypeBind.codeType := CodeType;
  editTypeDict.TryAdd(code, editTypeBind);
end;

procedure TBASE_PAS_NONEF.SetTEditDate(Code: TEdit; calImg: TImage);
var
  editTypeBind:TEditTypeBind;
begin
  editTypeBind.edtType := etDate;
  editTypeBind.calImg := calImg;
  editTypeDict.TryAdd(code, editTypeBind);
end;

procedure TBASE_PAS_NONEF.SetGridSortSetting(grid: TAdvStringGrid);
var
  editTypeBind:TEditTypeBind;
begin
  FGridSortList.Add(grid);
  grid.SortSettings.IndexShow := True;
  grid.SortSettings.Show := True;
  grid.SortSettings.BlankPos := TSortBlankPosition.blLast;
  grid.SortSettings.Row := grid.FixedRows - 1;
end;

procedure TBASE_PAS_NONEF.asgCanSort(Sender: TObject; ACol: Integer;
  var DoSort: Boolean);
var
  grid:TAdvStringGrid;
  colName:String;
  sortRow:Byte;
begin

end;

procedure TBASE_PAS_NONEF.asgClickSort(Sender: TObject; ACol: Integer);
const seq1 = '순번';
const seq2 = 'seq';
var
  grid:TAdvStringGrid;
  sortRow:Byte;
begin
  grid := TAdvStringGrid(Sender);
  if FGridSortList.Contains(grid) then
  begin
    sortRow := grid.SortSettings.Row;
    { 순번컬럼 초기화 }
    if grid.Rows[sortRow].IndexOf(seq1) <> -1 then
      grid.AutoNumberCol(grid.Rows[sortRow].IndexOf(seq1));

    if grid.Rows[sortRow].IndexOf(seq2) <> -1 then
       grid.AutoNumberCol(grid.Rows[sortRow].IndexOf(seq2));
  end;
end;

procedure TBASE_PAS_NONEF.asgGetFormat(Sender: TObject; ACol: Integer;
  var AStyle: TSortStyle; var aPrefix, aSuffix: string);
var
  grid:TAdvStringGrid;
begin
  grid := TAdvStringGrid(Sender);
  if FGridSortList.Contains(grid) then
  begin
    if ACol in [grid.Rows[grid.SortSettings.Row].IndexOf('직위'),
                grid.Rows[grid.SortSettings.Row].IndexOf('부서')] then
      AStyle := ssRaw;
  end;
end;

procedure TBASE_PAS_NONEF.asgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  grid:TAdvStringGrid;
begin
  grid := TAdvStringGrid(Sender);
  if FGridSortList.Contains(grid) then
  begin

    if Button = TMouseButton.mbRight then
    begin
      if (grid.Cells[0, grid.FixedRows] <> EmptyStr) and
         (grid.RowCount > grid.FixedRows + 1) then
      begin
      end;
    end;
  end;
end;

procedure TBASE_PAS_NONEF.asgRawCompare(Sender: TObject; ACol, Row1, Row2: Integer;
  var Res: Integer);
var
  grid:TAdvStringGrid;
  sortRow : Byte;
  s1, s2 : String;
begin
  grid := TAdvStringGrid(Sender);
  sortRow := grid.SortSettings.Row;

  if      ACol = grid.Rows[sortRow].IndexOf('직위') then
  begin
    s1 := SortJigwiDict.Items[grid.Cells[acol,Row1]];
    s2 := SortJigwiDict.Items[grid.Cells[acol,Row2]];
  end
  else if ACol = grid.Rows[sortRow].IndexOf('부서') then
  begin
    s1 := SortDeptDict.Items[grid.Cells[acol,Row1]];
    s2 := SortDeptDict.Items[grid.Cells[acol,Row2]];
  end;

  if s1 = s2 then
    Res := 0
  else
  begin
    if s1 > s2 then
      Res := 1
    else
      Res := -1;
  end;
end;


procedure TBASE_PAS_NONEF.asgRColumnSize(Sender: TObject; ACol: Integer; var Allow: Boolean);
var grid:TAdvStringGrid;
begin
  grid := TAdvStringGrid(Sender);
  OldColumnSize := grid.ColWidths[ACol];
end;

procedure TBASE_PAS_NONEF.asgRColumnSizing(Sender: TObject; ACol, ColumnSize: Integer);
begin
  OldColumnSize := ColumnSize;
end;

procedure TBASE_PAS_NONEF.asgRUpdateColumnSize(Sender: TObject; ACol: Integer;
  var AWidth: Integer);
begin
  if OldColumnSize <> 0 then
     OldColumnSize := AWidth;
end;

procedure TBASE_PAS_NONEF.asgREndColumnSize(Sender: TObject; ACol: Integer);
var grid:TAdvStringGrid;
    iCol, iFirstZeroColPos : integer;
begin
  grid := TAdvStringGrid(Sender);

  For iCol := 0 To grid.ColCount - 1 Do Begin
      If grid.ColWidths[iCol] = 0 Then Begin
         iFirstZeroColPos := iCol;
         Break;
      End;
  End;

  If ACol >= iFirstZeroColPos Then
     grid.ColWidths[ACol] := OldColumnSize;
end;

procedure TBASE_PAS_NONEF.asgRMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var grid: TAdvStringGrid;
begin
  grid := TAdvStringGrid(Sender);
  Handled := True;
  if  grid.Row < grid.RowCount - 1 then
      grid.Row := grid.Row + 1
  else
      Exit;
end;

procedure TBASE_PAS_NONEF.asgRMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var grid: TAdvStringGrid;
begin
  grid := TAdvStringGrid(Sender);
  Handled := True;
  if  grid.Row > 1 then
      grid.Row := grid.Row - 1
  else
      Exit;
end;

procedure TBASE_PAS_NONEF.CommonEventBinding;
var
  i:Integer;
  cEdit:TEdit;
  cCdit:TCurrencyEdit;
  cSpdBtn:TSpeedButton;
  cAsg:TAdvStringGrid;
begin
  For i := 0 to ComponentCount - 1 do
  begin
    { 스피드 버튼 HOVER 이벤트 바인딩 }

    if  Components[i] is TSpeedButton then
        begin
          cSpdBtn := Components[i] as TSpeedButton;
          { base form button 제외 }
          //if cSpdBtn.Parent <> P_HEAD_BUTTON then
          //   begin
              {
               if not Assigned(cSpdBtn.OnMouseEnter) then
                 cSpdBtn.OnMouseEnter := SBMouseEnterHover;

               if not Assigned(cSpdBtn.OnMouseLeave) then
                 cSpdBtn.OnMouseLeave := SBMouseLeaveHover;
               }
          //   end;
        end;

    { TEdit 이벤트 바인딩 }
    if  (Components[i] is TEdit) then
        begin
          cEdit := TEdit(Components[i]);
          if not Assigned(cEdit.OnChange) then
            cEdit.OnChange := EdtKeyChange;

          if not Assigned(cEdit.OnEnter) then
            cEdit.OnEnter := EdtKeyEnter;

            if not Assigned(cEdit.OnExit) then
            cEdit.OnExit := EdtKeyExit;

          if not Assigned(cEdit.OnKeyDown) then
            cEdit.OnKeyDown := EdtKeyKeyDown;

          if not Assigned(cEdit.OnKeyPress) then
            cEdit.OnKeyPress := EdtKeyKeyPress;

        end;

    { TCurrencyEdit 이벤트 바인딩 }
    if  (Components[i] is TCurrencyEdit) then
        begin
          cCdit := TCurrencyEdit(Components[i]);
          if not Assigned(cCdit.OnChange) then
            cCdit.OnChange := EdtKeyChange;

          if not Assigned(cCdit.OnEnter) then
            cCdit.OnEnter := EdtKeyEnter;

            if not Assigned(cCdit.OnExit) then
            cCdit.OnExit := EdtKeyExit;

          if not Assigned(cCdit.OnKeyDown) then
            cCdit.OnKeyDown := EdtKeyKeyDown;

          if not Assigned(cCdit.OnKeyPress) then
            cCdit.OnKeyPress := EdtKeyKeyPress;

          if not Assigned(cCdit.OnKeyUp) then
            cCdit.OnKeyUp := EdtKeyKeyUp;
        end;

    { 그리드 이벤트 바인딩 }
    if  Components[i] is TAdvStringGrid then
        begin
        cAsg := TAdvStringGrid(Components[i]);
        cAsg.SelectionColor := clYellow;
        cAsg.FixedFont.Size := 10;
        cAsg.Font.Size      := 10;
          if FGridSortList.Contains(cAsg) then
          begin
            if not Assigned(cAsg.OnCanSort) then
               cAsg.OnCanSort := asgCanSort;

            if not Assigned(cAsg.OnClickSort) then
               cAsg.OnClickSort := asgClickSort;

            if not Assigned(cAsg.OnGetFormat) then
               cAsg.OnGetFormat := asgGetFormat;

            if not Assigned(cAsg.OnMouseDown) then
               cAsg.OnMouseDown := asgMouseDown;

            if not Assigned(cAsg.OnRawCompare) then
               cAsg.OnRawCompare := asgRawCompare;
          end;

          { 그리드 사이징 관련.. }
          if not Assigned(cAsg.OnColumnSize) then
             cAsg.OnColumnSize := asgRColumnSize;
          if not Assigned(cAsg.OnColumnSizing) then
             cAsg.OnColumnSizing := asgRColumnSizing;
          if not Assigned(cAsg.OnUpdateColumnSize) then
             cAsg.OnUpdateColumnSize := asgRUpdateColumnSize;
          if not Assigned(cAsg.OnEndColumnSize) then
             cAsg.OnEndColumnSize := asgREndColumnSize;

        end;
  end;
end;

procedure TBASE_PAS_NONEF.EdtKeyChange(Sender: TObject);
var
  editBindRec:TEditTypeBind;
  edit:TEdit;
begin
end;

procedure TBASE_PAS_NONEF.EdtKeyEnter(Sender: TObject);
begin
  // 다중항차 표기시, Color/Font Color 변경하므로 Color Change이벤트 X
  if (TEdit(Sender).Name = 'edtDEPTHCHA') or
     (TEdit(Sender).Name = 'edtRETNHCHA') then
     Exit;

  ENTER_CORLOR(Sender);
end;

procedure TBASE_PAS_NONEF.EdtKeyExit(Sender: TObject);
var
  editBindRec:TEditTypeBind;
begin
  if editTypeDict.TryGetValue(TEdit(Sender), editBindRec) then
  begin
    if editBindRec.edtType = etDate then
      TEdit(Sender).Text := CHECK_DATE_RETURN(TEdit(Sender).Text);
  end;
  // 다중항차 표기시, Color/Font Color 변경하므로 Color Change이벤트 X
  if (TEdit(Sender).Name = 'edtDEPTHCHA') or
     (TEdit(Sender).Name = 'edtRETNHCHA') then
     Exit;
  EXIT_CORLOR(Sender);
end;

procedure TBASE_PAS_NONEF.EdtKeyKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  editBindRec:TEditTypeBind;
  comCodeParamRec:TComCodeParameter;
  edit:TEdit;
begin
  edit := TEdit(Sender);
  if editTypeDict.TryGetValue(edit, editBindRec) then
  begin
    if editBindRec.edtType = etDate then
    begin
      if (key in [VK_RETURN, VK_DOWN, VK_UP]) then
        edit.Text := CHECK_DATE_RETURN(edit.Text);

      if (Key = VK_RETURN) and (edit.Text <> '') then
        SelectNext(TWinControl(Sender), True, True);
    end
    else
    if editBindRec.edtType in [etBaseCode, etCommonCode] then
    begin
      if  (Key = VK_F4) and
          (PAS_CommonCodeDict.ContainsKey(editBindRec.codeType)) then
          begin
            comCodeParamRec := PAS_CommonCodeDict.Items[editBindRec.codeType];
            if  CALL_POPUP_PAS(comCodeParamRec.param1, comCodeParamRec.param2, '') <> '' then  // edit.Text
                begin
                  edit.Text := GS_CODE;
                  SelectNext(TWinControl(Sender), True, True);
                end;
          end;
    end;
  end
  else
  begin
    if  Key = vk_Return then
        SelectNext(TWinControl(Sender), True, True);
  end;

  case Key of
    VK_UP   : SelectNext(TWinControl(Sender), False, True);
    VK_DOWN : SelectNext(TWinControl(Sender), True,  True);
  end;
end;

procedure TBASE_PAS_NONEF.EdtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = #13  then
      begin
        key := #0;
        SelectNext(TWinControl(Sender), True, True);
      end;
end;

procedure TBASE_PAS_NONEF.EdtKeyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_UP                       then SelectNext(TWinControl(Sender), False, True)  else
  if  (Key = VK_DOWN)                   then SelectNext(TWinControl(Sender), True,  True);
end;

procedure TBASE_PAS_NONEF.FormActivate(Sender: TObject);
begin
  if  Assigned(MAINF.ActiveMDIChild) then
      PROGRAM_CHECK(MAINF.ActiveMDIChild.Name, 1);
end;

procedure TBASE_PAS_NONEF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PROGRAM_FORM_CLOSE(Self.Name);

  Action := CaFree;
end;

procedure TBASE_PAS_NONEF.FormCreate(Sender: TObject);
begin
  Self.Caption := self.Name + ' : ' + fmTITLE.Caption;

  {권한설정관리}
  AUTHOR_DISPLAY(Self);

 { 정렬관련 Dictionary }
  SortJigwiDict := TDictionary<String, String>.Create;
  SortDeptDict  := TDictionary<String, String>.Create;

  { 에디트박스 Dict }
  editTypeDict  := TDictionary<TEdit, TEditTypeBind>.Create;
  FGridSortList := TList<TAdvStringGrid>.Create;

  ScrollBox1.HorzScrollBar.Visible := True;
  ScrollBox1.VertScrollBar.Visible := True;
  ScrollBox1.HorzScrollBar.Range := Self.Width-40;
  ScrollBox1.VertScrollBar.Range := Self.Height-120;
end;

procedure TBASE_PAS_NONEF.FormDestroy(Sender: TObject);
begin
  Query1.Close;  Query1.Free;
  Query2.Close;  Query2.Free;

  SortJigwiDict.Free;
  SortDeptDict.Free;
  editTypeDict.Free;
  FGridSortList.Free;
end;

procedure TBASE_PAS_NONEF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TBASE_PAS_NONEF.SB_CLOSEClick(Sender: TObject);
begin
  PROGRAM_FORM_CLOSE(Self.Name);
  Close;
end;

procedure TBASE_PAS_NONEF.SBMouseEnterHover(Sender: TObject);
begin
  if  (Sender as TSpeedButton).Font.Color <> clYellow then
      begin
        OLD_SB_FONT_COLOR := (Sender as TSpeedButton).Font.Color;
        (Sender as TSpeedButton).Font.Color := clYellow;
      end;
end;

procedure TBASE_PAS_NONEF.SBMouseLeaveHover(Sender: TObject);
begin
  (Sender as TSpeedButton).Font.Color := OLD_SB_FONT_COLOR;
end;

end.
