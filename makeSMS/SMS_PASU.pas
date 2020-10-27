unit SMS_PASU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  AdvUtil, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.WinXPanels, Vcl.Buttons,
  Vcl.Imaging.jpeg, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Imaging.pngimage, Generics.Collections,
  Vcl.ComCtrls, AsgMemo, StrUtils, AdvDateTimePicker, Vcl.Mask, AdvEdit, EditBtn, HTMLbtns, RxToolEdit, RxCurrEdit, AdvCombo,
  Popbill, PopbillFax, PopbillKakao;

  type
  TSmsTag = class
    TAGCOD : String; // �±��ڵ� - #{���������� �����۸�ũ}
    TAGTYP : String; // �±�Ÿ�� - 1:��������(�����۸�ũ ��) 2:���������̰�(�������,�ݾ� ��) 3:����INPUT��  4:PSSMSFMB(�ٵ�)�� ����� �ʵ尪
    TAGGBN : String; // �±ױ��� - PS/SP(�׷�), S/H(���ڸ�) ��..
    TAGVAL : String; // �±װ�   - https://~~~
  end;

  TSMS_PAS = class(TForm)
    pnlHISTORY: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    asgHIS: TAdvStringGrid;
    pnlHisTopArea: TPanel;
    pnlSearch: TPanel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    pnlTopTitle: TPanel;
    Image3: TImage;
    Label2: TLabel;
    Panel6: TPanel;
    Panel13: TPanel;
    Panel20: TPanel;
    Shape16: TShape;
    spbSELHISTORY: TSpeedButton;
    pnlPREVIEW: TPanel;
    Shape3: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Panel14: TPanel;
    memTMPMSG: TMemo;
    Panel15: TPanel;
    Label7: TLabel;
    Image2: TImage;
    Panel16: TPanel;
    Panel7: TPanel;
    Panel10: TPanel;
    Shape17: TShape;
    spbSENDSMS: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Label3: TLabel;
    Label1: TLabel;
    edtVIZTUSNM: TEdit;
    edtTELENUMB: TEdit;
    pnlTEMPLATE: TPanel;
    Shape7: TShape;
    Shape9: TShape;
    Panel9: TPanel;
    Panel8: TPanel;
    stpFMH: TStackPanel;
    rdbDC01: TRadioButton;
    Panel12: TPanel;
    Panel5: TPanel;
    Label4: TLabel;
    Image5: TImage;
    Panel19: TPanel;
    Label29: TLabel;
    Label23: TLabel;
    lblSMSTOTAL: TLabel;
    Shape24: TShape;
    Panel23: TPanel;
    Shape8: TShape;
    spbRELOADLIST: TSpeedButton;
    Panel18: TPanel;
    Panel11: TPanel;
    asgFMB: TAdvStringGrid;
    scbWrite: TScrollBox;
    pnlWriteL: TPanel;
    pnlADDFARE: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape14: TShape;
    Shape18: TShape;
    Shape20: TShape;
    edtADDAmount: TEdit;
    pnlCCLSHIP: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Shape19: TShape;
    Shape15: TShape;
    edtCCLReason: TEdit;
    pnlCHGTIME: TPanel;
    Shape21: TShape;
    Shape23: TShape;
    Label9: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    edtCHGReason: TEdit;
    asgSMS: TAdvStringGrid;
    mdtCHGBoardProcLastTime: TMaskEdit;
    mdtCHGEntryTime: TMaskEdit;
    mdtCHGDeptTime: TMaskEdit;
    mdtCHGTketProcTime: TMaskEdit;
    mdtCHGBaggProcTime: TMaskEdit;
    mdtCHGBoardProcTime: TMaskEdit;
    MemoEditLink1: TMemoEditLink;
    chkADDReason2: TCheckBox;
    pnlCVRTFAIL: TPanel;
    Shape22: TShape;
    MemoEditLink2: TMemoEditLink;
    chkADDReason1: TCheckBox;
    Panel17: TPanel;
    Shape13: TShape;
    spbSELSMS: TSpeedButton;
    Label20: TLabel;
    Memo1: TMemo;
    Query1: TFDQuery;
    Query2: TFDQuery;
    P_HEAD: TPanel;
    Label5: TLabel;
    Label19: TLabel;
    edtTESTNUMB: TEdit;
    Panel21: TPanel;
    rdbTESTON: TRadioButton;
    rdbTESTOFF: TRadioButton;
    edtTESTNAME: TEdit;
    Panel22: TPanel;
    Shape25: TShape;
    SpeedButton1: TSpeedButton;
    Panel24: TPanel;
    SB_CLOSE: TSpeedButton;
    Label24: TLabel;
    addNumber: TEdit;
    Panel25: TPanel;
    Shape26: TShape;
    SpeedButton2: TSpeedButton;
    Label21: TLabel;
    procedure FormShow(Sender: TObject);
    procedure spbRELOADLISTClick(Sender: TObject);
    procedure asgFMBCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgFMBEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure asgFMBGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgFMBGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgFMBGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure asgFMBKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure asgFMBKeyPress(Sender: TObject; var Key: Char);
    procedure asgFMBClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure asgFMBSelectionChanged(Sender: TObject; ALeft, ATop, ARight,
      ABottom: Integer);
    procedure EdtKeyEnterCustom(Sender: TObject);
    procedure EdtKeyExitCustom(Sender: TObject);
    procedure spbSELSMSClick(Sender: TObject);
    procedure asgSMSGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgSMSCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgSMSGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgSMSKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure asgSMSKeyPress(Sender: TObject; var Key: Char);
    procedure asgSMSKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure spbSENDSMSClick(Sender: TObject);
    procedure spbSELHISTORYClick(Sender: TObject);
    procedure asgHISGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgHISDblClick(Sender: TObject);
    procedure SB_CLOSEClick(Sender: TObject);
    procedure fmTITLEDblClick(Sender: TObject);
  private
    { Private declarations }
    usMemoEditText : String; // �׸��� ���ø� ����(�����Ұ� ó���� ����)
    procedure rdbDCClick(Sender: TObject);
    procedure up_INIT_PNL_HISTORY;
    procedure up_INIT_PNL_TEMPLATE;
    procedure up_INIT_PNL_PREVIEW;
    procedure up_INIT_WRITE_AREA;
    procedure up_INIT_WRITE_EDIT;
    procedure up_INIT_GRID_HIS; //�̷±׸��� �ʱ�ȭ
    procedure up_INIT_GRID_FMB; //���ø��׸��� �ʱ�ȭ
    procedure up_INIT_GRID_SMS; //SMS���۱׸��� �ʱ�ȭ
    procedure up_SEL_HISTORY;  //SMS �̷���ȸ
    procedure up_SET_FMH_LIST; //���ø�(HEAD) - PSSMSFMH - ����Ʈ ����
    procedure up_SEL_FMB_LIST(pFOMGBN : String); //���ø�(BODY) - PSSMSFMB
    procedure up_ENABLE_WRITE_AREA(pFOMGBN : String); //�Է¿��� Enable ����
    procedure up_ENABLE_WRITE_EDIT(pAVG: TAdvStringGrid; pRow: Integer; var dict: TDictionary<String, String> ); //�Է�EDIT Enable ����
    procedure up_GridToMemo(Sender: TObject; pRow, pCol, pCnt:Integer);

    {==============================================================================
     KAKAO �˸���(SMS) ����
     ------------------------------------------------------------------------------}
    // KAKAO SMS - ����(Dictionary) ����, ������ 1������( '#{...}' )
    procedure SET_SMSTAG;
    {==============================================================================
       �˺� : īī���˸���
              PAPPNAM : �˸��������� (��: ǰ�Ǽ�, ��������, ȸ�Ƿ� ��)
              PRPTNAM : �˸���������
              PSENDER : ������ ��
              PUSERID : ������ ID
              PAPPGBN : �������� (R.��û S.���ΰ�� A.��������)
              PAPPRLT : ���ڰ��� ����/�ݷ����� �� S.���ΰ�� �̿� ����ó��
              PRLTRMK : ���ڰ��� ����/�ݷ����� �� ���û��� �� S.���ΰ�� �̿� ����ó��
     ------------------------------------------------------------------------------}
    function  POPBILL_KAKAO_SEND_PAS(PRCVNUM, PRCVNAM, PTEMPCD, PMSGTXT, PREPTXT, PREPTYP, PTABKEY, PTABGBN, PUSERID : String; PBOKSEQ,PCOMSEQ,PSMSSEQ:Integer): Boolean;
    function  ExtractInt(Astring:String):String;
    function  IF_RETURN_PAS(Expression: Boolean; ValueTrue, ValueFalse: Variant): Variant;
    procedure CLEAR_BOX_PAS(PMPBOX : TObject);
    procedure ASG_CLEAR(var PGRID : TAdvStringGrid; PSC, PSR, PEC, PER : Integer);
    function  STF(TS: String):Double;
    function  STi(TS: String):Integer;

  public
    { Public declarations }
    gs_CALLFORM : String;
    gsDEPTLINE : String;
    gstlSMS_DATA : TStringList;
    POPBILL_ERRMSG : String;
    giRow : Integer;
    procedure gp_INIT_HEAD;
  end;

type TFieldH = (
                fhSELSEQ,
                fhRLTNAM,
                fhPOPDAT,
                fhSTSNAM,
                fhTABNAM,
                fhMSGDAT,
                fhRECDAT,
                fhTEMPCD,
                //
                fhMSGCOD,
                fhMSGTXT,
                fhRCVNAM,
                fhRCVNUM
               );

type TFieldB = (
                fbSELSEQ,
                fbFOMNAM,
                fbDETNAM,
                fbTMPMSG,
                //
                fbFOMGBN,
                fbDETGBN,
                fbTMPCOD,
                fbFIXLIN // PS, SP

               );

type TFieldS = (
                fsSELSEQ,
                fsVIZTNM,
                fsBKSTAT,
                fsDTLINE,
                fsDTDATE,
                fsDTSHIP,
                fsTELNUM,
                fsSNDMSG,
                fsBKNUMB,
                //
                fsTMPCOD,
                fsTABGBN,
                fsBOKDAT,
                fsBOKSEQ,
                fsCOMSEQ
               );

var
  SMS_PAS: TSMS_PAS;
  {SMS TAG ���� ���� --------------------------------------------------------------}
  PAS_SmsTagDict:TDictionary<String, TSmsTag>;

const
  // ��ũ���̵�.
  LinkID = 'PUKWAN';
  // ��Ʈ�� ��ſ� ���Ű. ���� ����.
  SecretKey = 'cf3Zzvj8tdpy1gsIlIhfJAap7jgT2m7Vx+vGZjo/3jU=';

implementation

uses  MainDMU;

{$R *.dfm}

procedure TSMS_PAS.asgFMBCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if ACol in [Ord(fbTMPMSG)] then //Ord(frCHECKBOX)
     CanEdit := True
  else
     CanEdit := False;
end;

procedure TSMS_PAS.asgFMBEditCellDone(Sender: TObject; ACol, ARow: Integer);
begin
  // ������ ����..
  asgFMB.Cells[ACol, ARow] := usMemoEditText;
end;

procedure TSMS_PAS.asgFMBGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ARow > 0) and (ACol in [Ord(fbFOMNAM), Ord(fbDETNAM), Ord(fbTMPMSG)]) then
     HAlign := taLeftJustify
  //else
  //if (ARow > 0) and (ACol in [Ord(frGROUP_ID), Ord(frGROUP_NO)]) then
     //HAlign := taRightJustify
  else
     HAlign := taCenter;
end;

procedure TSMS_PAS.asgFMBGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  AEditor := edCustom;

  if ARow <= 0 then Exit;

  if ACol = Ord(fbTMPMSG) then
     asgFMB.EditLink := MemoEditLink1;
end;

procedure TSMS_PAS.asgFMBGetEditText(Sender: TObject; ACol, ARow: Integer;
  var Value: string);
begin
  usMemoEditText := Value;
end;

procedure TSMS_PAS.asgFMBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  key := 0;
end;

procedure TSMS_PAS.asgFMBKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TSMS_PAS.asgFMBSelectionChanged(Sender: TObject; ALeft, ATop, ARight,
  ABottom: Integer);
begin
  if asgFMB.Row = 0 then Exit;

  if ((Sender as TAdvStringGrid).Cells[Ord(fbTMPMSG), asgFMB.Row ] <> '') then
     asgFMBClickCell(Sender, asgFMB.Row, asgFMB.Col);
end;

procedure TSMS_PAS.asgHISDblClick(Sender: TObject);
begin
  //
  pnlCVRTFAIL.Visible := True;
  pnlCVRTFAIL.Caption := '���ۺҰ�';

  memTMPMSG.Lines.Text := asgHIS.Cells[Ord(fhMSGTXT), asgHIS.Row];
end;

procedure TSMS_PAS.asgHISGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ARow > 0) and (ACol in [Ord(fhRCVNAM), Ord(fhTABNAM)]) then
     HAlign := taLeftJustify
  //else
  //if (ARow > 0) and (ACol in [Ord(frGROUP_ID), Ord(frGROUP_NO)]) then
     //HAlign := taRightJustify
  else
     HAlign := taCenter;
end;

procedure TSMS_PAS.asgSMSCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if ACol in [Ord(fsSNDMSG)] then //Ord(frCHECKBOX)
     CanEdit := True
  else
     CanEdit := False;
end;

procedure TSMS_PAS.asgSMSGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ARow > 0) and (ACol in [Ord(fsVIZTNM), Ord(fsTELNUM), Ord(fsSNDMSG)]) then
     HAlign := taLeftJustify
  //else
  //if (ARow > 0) and (ACol in [Ord(frGROUP_ID), Ord(frGROUP_NO)]) then
     //HAlign := taRightJustify
  else
     HAlign := taCenter;
end;

procedure TSMS_PAS.asgSMSGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  AEditor := edCustom;

  if ARow <= 0 then Exit;

  if ACol = Ord(fsSNDMSG) then
     asgSMS.EditLink := MemoEditLink2;
end;

procedure TSMS_PAS.asgSMSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  key := 0;
end;

procedure TSMS_PAS.asgSMSKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;

procedure TSMS_PAS.asgSMSKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  key := 0;
end;

procedure TSMS_PAS.EdtKeyEnterCustom(Sender: TObject);
begin
  //
end;

procedure TSMS_PAS.EdtKeyExitCustom(Sender: TObject);
begin
  //
end;

procedure TSMS_PAS.fmTITLEDblClick(Sender: TObject);
begin
  if memo1.Visible = True then
     MEMO1.Visible := False
  else
     MEMO1.Visible := True;
end;

procedure TSMS_PAS.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(gstlSMS_DATA) then
     FreeAndNil(gstlSMS_DATA);
end;

procedure TSMS_PAS.FormShow(Sender: TObject);
begin
  inherited;

  gp_INIT_HEAD;

  giRow := 0;
  gsDEPTLINE := 'PS';

  gstlSMS_DATA := TStringList.Create;
  gstlSMS_DATA.Duplicates := dupIgnore;
  gstlSMS_DATA.Sorted := True;
  gstlSMS_DATA.NameValueSeparator := '=';
end;

procedure TSMS_PAS.spbSENDSMSClick(Sender: TObject);
var bSEND_RESULT : Boolean;
    iEndCnt, iRow : Integer;
    sBKNUMB, sERRMSG : String;
begin
  ShowMessage('�׽�Ʈ ������Ʈ�̹Ƿ� ������ �Ұ����մϴ�.');
  Exit;

  if pnlCVRTFAIL.Visible = True then
  begin
    SHOWMESSAGE('���� �Ұ����� �����Դϴ�.');
    Exit;
  end;

  // �޽��� ��ü ��ȯ
  if gs_CALLFORM = 'PB30020' then // �Ϲݿ�������� ���߼����ϹǷ�..
     iEndCnt := gstlSMS_DATA.Count - 1
  else //�׿� ���࿹��, �߱� ��..
     iEndCnt := 0;
  up_GridToMemo(asgFMB, asgFMB.Row, asgFMB.Col, iEndCnt);

  if asgSMS.RowCount - 1 <> STi(lblSMSTOTAL.Caption) then
  begin
    ShowMessage('���۴����� ��ȯ���� ��ġ���� �ʽ��ϴ�.');
    Exit;
  end;

  if  Not MainDM.MainDB.InTransaction then
      MainDM.MainDB.StartTransaction;

  if memTMPMSG.Lines.Text = '' then Exit;

  // relook Testmode

  If rdbTESTON.Checked Then
  if (edtTESTNUMB.Text) = '' then
  begin
    ShowMessage('TEST���Դϴ�. TEST���Ź�ȣ�� �˸��峻���� Ȯ���Ͻ� ��ȣ�� ��Ȯ�ϰ� �Է��Ͽ� �ּ���.');
    edtTESTNUMB.SetFocus;
    Exit;
  end;

  If rdbTESTON.Checked Then


  MessageDlg('TEST�ܰ�' + #13#10 +
                            '1. �̸����� ���� 1�Ǹ� ����' + #13#10 +
                            '2. ���Ź�ȣ�� ��� "TEST��ȣ"�� �Էµ� ��ȣ�� �������ϴ�.' + #13#10 +
                            '�˸����� �����Ͻðڽ��ϱ�?', mtInformation,[mbOk], 0)
  Else
  MessageDlg('�˸����� �����Ͻðڽ��ϱ�?', mtInformation,[mbOk], 0);

  Try
    With asgSMS Do
    Begin
      If rdbTESTON.Checked Then Begin
      For iRow := 1 to 1 Do //asgSMS.RowCount - 1
      Begin
        sBKNUMB := Cells[Ord(fsBKNUMB), iRow];
        if (Cells[Ord(fsTELNUM), iRow] = '') then
        begin
          sERRMSG := '������ ��ȣ�� �����ϴ�.(' + sBKNUMB + ')';
          ShowMessage(sERRMSG);
          Exit;
        end;
        if (Cells[Ord(fsSNDMSG), iRow] = '') then
        begin
          sERRMSG := '���� �޽����� �����ϴ�.(' + sBKNUMB + ')';
          ShowMessage(sERRMSG);
          Exit;
        end;
        {
        bSEND_RESULT := POPBILL_KAKAO_SEND_PAS(ExtractInt(edtTESTNUMB.Text),  //Cells[Ord(fsTELNUM), iRow] // relook �Ϸ�� ��ȣ ����
                                               edtTESTNAME.Text,//Cells[Ord(fsVIZTNM), iRow],
                                               Cells[Ord(fsTMPCOD), iRow],
                                               Cells[Ord(fsSNDMSG), iRow],
                                               '',
                                               'C',
                                               Cells[Ord(fsBKNUMB), iRow],
                                               Cells[Ord(fsTABGBN), iRow],
                                               '',
                                               STi(Cells[Ord(fsBOKSEQ), iRow]),
                                               STi(Cells[Ord(fsCOMSEQ), iRow]),
                                               0
                                               );
         }
      End;
      End
      Else Begin
      For iRow := 1 to asgSMS.RowCount - 1 Do
      Begin
        sBKNUMB := Cells[Ord(fsBKNUMB), iRow];
        if (Cells[Ord(fsTELNUM), iRow] = '') then
        begin
          sERRMSG := '������ ��ȣ�� �����ϴ�.(' + sBKNUMB + ')';
          ShowMEssage(sERRMSG);
          Exit;
        end;
        if (Cells[Ord(fsSNDMSG), iRow] = '') then
        begin
          sERRMSG := '���� �޽����� �����ϴ�.(' + sBKNUMB + ')';
          ShowMEssage(sERRMSG);
          Exit;
        end;

        {
        bSEND_RESULT := POPBILL_KAKAO_SEND_PAS(Cells[Ord(fsTELNUM), iRow],
                                               Cells[Ord(fsVIZTNM), iRow],
                                               Cells[Ord(fsTMPCOD), iRow],
                                               Cells[Ord(fsSNDMSG), iRow],
                                               '',
                                               'C',
                                               Cells[Ord(fsBKNUMB), iRow],
                                               Cells[Ord(fsTABGBN), iRow],
                                               '',
                                               STi(Cells[Ord(fsBOKSEQ), iRow]),
                                               STi(Cells[Ord(fsCOMSEQ), iRow]),
                                               0
                                               );
        }
      End;
      End;
    End;
  Except
    On E:Exception Do
    Begin
      if  MainDM.MainDB.InTransaction then
          MainDM.MainDB.Rollback;

      ShowMEssage(E.Message);
      Exit;
    End;
  End;
  if  MainDM.MainDB.InTransaction then
      MainDM.MainDB.Commit;

  if bSEND_RESULT = True then
  begin
    //�ʱ�ȭ
    up_INIT_PNL_TEMPLATE;
    up_INIT_PNL_PREVIEW;

    up_SEL_HISTORY;
    ShowMEssage('�˸��� ���� �Ϸ�');
  end;
end;

procedure TSMS_PAS.spbSELHISTORYClick(Sender: TObject);
begin
  up_SEL_HISTORY;
end;

procedure TSMS_PAS.spbRELOADLISTClick(Sender: TObject);
begin
  if Trim(addNumber.Text) = '' then
     begin
       ShowMessage('���� ��ȭ��ȣĭ�� �ʼ��Դϴ�.');
       Exit;
     end;

  Inc(giRow);
  gstlSMS_DATA.Add('20201231-001-' + FormatFloat('00#', giRow) + '=' + ExtractInt(addNumber.Text));

  lblSMSTOTAL.Caption := IntToStr(gstlSMS_DATA.Count);
end;

procedure TSMS_PAS.spbSELSMSClick(Sender: TObject);
begin
  if asgSMS.Visible = False then
  begin
    asgSMS.Align   := alClient;
    asgSMS.Visible := True;
  end
  else
  begin
    asgSMS.Align   := alCustom;
    asgSMS.Visible := False;
  end;
end;

procedure TSMS_PAS.up_SEL_HISTORY; //SMS �̷���ȸ
var iRow : Integer;
begin
  up_INIT_GRID_HIS;

  if edtVIZTUSNM.Text = '' then Exit;
  if edtTELENUMB.Text = '' then Exit;

  With asgHIS, Query1 Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('  SELECT A.MSGCOD, A.MSGTXT, A.TABKEY, A.RCVNUM                                                                 ');
    SQL.Add('       , A.RCVNAM, A.TEMPCD, A.MSGTXT                                                                           ');
    SQL.Add('       , A.POPSTS, Z1.KORNAM STSNAM                                                                             ');
    SQL.Add('       , A.POPRLT, Z2.KORNAM RLTNAM                                                                             ');
    SQL.Add('       , A.MSGDAT, A.RECDAT, A.POPDAT                                                                           ');
    SQL.Add('       , B.FOMNAM||''-''||C.DETNAM TABNAM                                                                       ');
    SQL.Add('    FROM PKMSGMST A                                                                                             ');
    SQL.Add('    LEFT OUTER JOIN PKCODMST Z1 ON A.POPSTS = Z1.TETCOD                                                         ');
    SQL.Add('                               AND Z1.DAECOD = ''POPSTS''                                                       ');
    SQL.Add('    LEFT OUTER JOIN PKCODMST Z2 ON A.POPRLT = Z2.TETCOD                                                         ');
    SQL.Add('                               AND Z2.DAECOD = ''POPRLT''                                                       ');
    SQL.Add('    LEFT OUTER JOIN PSSMSFMH B ON SUBSTR(A.TABGBN, 0, INSTR(A.TABGBN, ''/'', 1, 1)-1) = B.FOMGBN                ');
    SQL.Add('    LEFT OUTER JOIN PSSMSFMB C ON SUBSTR(A.TABGBN, 0, INSTR(A.TABGBN, ''/'', 1, 1)-1) = C.FOMGBN                ');
    SQL.Add('                              AND SUBSTR(A.TABGBN, INSTR(A.TABGBN, ''/'', 1, 1)+1, LENGTH(A.TABGBN)) = C.DETGBN ');
    SQL.Add('   WHERE A.RCVNAM = ''' + edtVIZTUSNM.Text + '''                                                                ');
    SQL.Add('     AND REGEXP_REPLACE(A.RCVNUM,''[^0-9]'') = ''' + ExtractInt(edtTELENUMB.Text) + '''                         '); // or �������� ��ȭ��ȣ �˻�.
    SQL.Add('   ORDER BY A.RECDAT                                                                                            ');
    Open;

    if Query1.IsEmpty then Exit;

    iRow := 0;
    While Not Query1.Eof Do
    Begin
      Inc(iRow);
      Cells[Ord(fhSELSEQ), iRow] := IntToStr(iRow);
      Cells[Ord(fhRLTNAM), iRow] := FieldByName('RLTNAM').AsString;
      Cells[Ord(fhPOPDAT), iRow] := FieldByName('POPDAT').AsString;
      Cells[Ord(fhSTSNAM), iRow] := FieldByName('STSNAM').AsString;
      Cells[Ord(fhTABNAM), iRow] := FieldByName('TABNAM').AsString;
      Cells[Ord(fhMSGDAT), iRow] := FieldByName('MSGDAT').AsString;
      Cells[Ord(fhRECDAT), iRow] := FieldByName('RECDAT').AsString;
      Cells[Ord(fhTEMPCD), iRow] := FieldByName('TEMPCD').AsString;
      //
      Cells[Ord(fhMSGCOD), iRow] := FieldByName('MSGCOD').AsString;
      Cells[Ord(fhMSGTXT), iRow] := FieldByName('MSGTXT').AsString;
      Cells[Ord(fhRCVNAM), iRow] := FieldByName('RCVNAM').AsString;
      Cells[Ord(fhRCVNUM), iRow] := FieldByName('RCVNUM').AsString;
      Next;
    End;

    RowCount := iRow + 1;
  End;

end;

procedure TSMS_PAS.up_SET_FMH_LIST; //���ø�(HEAD) - PSSMSFMH - ����Ʈ ����
var i : Integer;
    rdbComp : TRadioButton;
    sCompComm, sCompName : String;
begin
  sCompComm := 'rdbDC'; // RadioButton ���� Name

  // 1. ���� List(RadioButton) ����
  i := stpFMH.ControlCollection.Count;
  While i > 0 Do
  Begin
    //stpFMH.ControlCollection.Delete(i-1);

    sCompName := sCompComm + FormatFloat('00', i);
    rdbComp := TRadioButton(Self.FindComponent(sCompName));

    if Assigned(rdbComp) then
       FreeAndNil(rdbComp);

    Dec(i);
  End;

  With Query1 Do
  Begin
    // 2. List(RadioButton) ����
    Close;
    SQL.Clear;
    SQL.Add('  SELECT *                    ');
    SQL.Add('    FROM PSSMSFMH             ');
    SQL.Add('   WHERE USEFLG = ''Y''       ');
    SQL.Add('   ORDER BY ORDSEQ, FOMGBN    ');
    Open;

    if Query1.IsEmpty then
    begin
      ShowMEssage('�ҷ��� ���ø� List�� �����ϴ�.');
      Exit;
    end;

    i := 0;
    While Not Eof Do
    Begin
      sCompName := sCompComm + FormatFloat('00', i+1);
      rdbComp := TRadioButton(Self.FindComponent(sCompName));

      if Not Assigned(rdbComp) then
         rdbComp := TRadioButton.Create(Self);

      rdbComp.Name := sCompName;
      rdbComp.Parent := stpFMH;
      rdbComp.Caption     := FormatFloat('00', i+1) + '. ' + FieldByName('FOMNAM').AsString;
      rdbComp.HelpKeyword := FieldByName('FOMGBN').AsString;
      rdbComp.Align := alTop;
      rdbComp.Height := 27;

      //�̺�Ʈ ����
      rdbComp.OnClick := rdbDCClick;

      Inc(i);
      Next;
    End;
  End;
end;

procedure TSMS_PAS.rdbDCClick(Sender: TObject);
begin
  //�ʱ�ȭ
  up_INIT_GRID_FMB;
  up_INIT_GRID_SMS;
  up_INIT_PNL_PREVIEW;

  //�׸��� ��ȸ
  up_SEL_FMB_LIST((Sender as TRadioButton).HelpKeyword);
  //�Է¿��� Enable ����
  up_ENABLE_WRITE_AREA((Sender as TRadioButton).HelpKeyword);
end;

procedure TSMS_PAS.SB_CLOSEClick(Sender: TObject);
begin
  Close;
end;

procedure TSMS_PAS.up_SEL_FMB_LIST(pFOMGBN : String); //���ø�(BODY) - PSSMSFMB
var iRow : Integer;
begin
  if pFOMGBN = '' then Exit;

  With Query1, asgFMB Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('  SELECT A.FOMGBN, B.FOMNAM, A.DETGBN, A.DETNAM                 ');
    SQL.Add('       , A.TMPCOD, T.TMPMSG, A.TAGCD1, A.TAGVA1                 ');
    SQL.Add('       , A.REFCD1, A.REFCD2                                     ');
    SQL.Add('    FROM PSSMSFMB A                                             ');
    SQL.Add('    LEFT OUTER JOIN PSSMSFMH B ON A.FOMGBN = B.FOMGBN           ');
    SQL.Add('                              AND NVL(B.USEFLG,''N'') = ''Y''   ');
    SQL.Add('    LEFT OUTER JOIN PSSMSTMP T ON A.TMPCOD = T.TMPCOD           ');
    SQL.Add('                              AND NVL(T.USEFLG,''N'') = ''Y''   ');
    SQL.Add('   WHERE A.FOMGBN = :pFOMGBN                                    ');
    SQL.Add('     AND NVL(A.USEFLG,''N'') = ''Y''                            ');
    SQL.Add('   ORDER BY A.ORDSEQ, A.TMPCOD                                  ');
    ParamByName('pFOMGBN').AsString := pFOMGBN;
    Open;

    if Query1.IsEmpty then Exit;

    iRow := 0;
    While Not Eof Do
    Begin
      if FieldByName('REFCD2').AsString = 'DEPTLINE' then
      begin
        Inc(iRow);
        Cells[Ord(fbSELSEQ), iRow] := IntToStr(iRow);
        Cells[Ord(fbFOMNAM), iRow] := FieldByName('FOMNAM').AsString;
        Cells[Ord(fbDETNAM), iRow] := 'PS ' + FieldByName('DETNAM').AsString;
        Cells[Ord(fbTMPMSG), iRow] := FieldByName('TMPMSG').AsString;

        Cells[Ord(fbFOMGBN), iRow] := FieldByName('FOMGBN').AsString;
        Cells[Ord(fbDETGBN), iRow] := FieldByName('DETGBN').AsString;
        Cells[Ord(fbTMPCOD), iRow] := FieldByName('TMPCOD').AsString;
        Cells[Ord(fbFIXLIN), iRow] := 'PS';

        Inc(iRow);
        Cells[Ord(fbSELSEQ), iRow] := IntToStr(iRow);
        Cells[Ord(fbFOMNAM), iRow] := FieldByName('FOMNAM').AsString;
        Cells[Ord(fbDETNAM), iRow] := 'SP ' + FieldByName('DETNAM').AsString;
        Cells[Ord(fbTMPMSG), iRow] := FieldByName('TMPMSG').AsString;

        Cells[Ord(fbFOMGBN), iRow] := FieldByName('FOMGBN').AsString;
        Cells[Ord(fbDETGBN), iRow] := FieldByName('DETGBN').AsString;
        Cells[Ord(fbTMPCOD), iRow] := FieldByName('TMPCOD').AsString;
        Cells[Ord(fbFIXLIN), iRow] := 'SP';
      end
      else
      begin
        Inc(iRow);
        Cells[Ord(fbSELSEQ), iRow] := IntToStr(iRow);
        Cells[Ord(fbFOMNAM), iRow] := FieldByName('FOMNAM').AsString;
        Cells[Ord(fbDETNAM), iRow] := FieldByName('DETNAM').AsString;
        Cells[Ord(fbTMPMSG), iRow] := FieldByName('TMPMSG').AsString;

        Cells[Ord(fbFOMGBN), iRow] := FieldByName('FOMGBN').AsString;
        Cells[Ord(fbDETGBN), iRow] := FieldByName('DETGBN').AsString;
        Cells[Ord(fbTMPCOD), iRow] := FieldByName('TMPCOD').AsString;
        Cells[Ord(fbFIXLIN), iRow] := '';
      end;

      Next;
    End;

    RowCount := iRow + 1;
  End;
end;

//�Է¿��� Enable ����
procedure TSMS_PAS.up_ENABLE_WRITE_AREA(pFOMGBN : String);
var pnlComp : TPanel;
    sCompComm, sCompName : String;
begin
  if pFOMGBN = '' then Exit;

  //�ʱ�ȭ
  up_INIT_WRITE_AREA;

  //�ش� PNL �� �����ϸ� Enable True
  sCompComm := 'pnl';
  sCompName := sCompComm + pFOMGBN;
  pnlComp := TPanel(Self.FindComponent(sCompName));
  if Assigned(pnlComp) then
  begin
    pnlComp.Enabled := True;
    pnlComp.Color := clYellow;
  end;
end;

//�Է�EDIT Enable ����
procedure TSMS_PAS.up_ENABLE_WRITE_EDIT(pAVG: TAdvStringGrid; pRow: Integer; var dict : TDictionary<String, String> ); //�Է�EDIT Enable ����
var pnlComp : TPanel;
    sFOMGBN, sTMPMSG, sCompComm, sCompName, sKey : String;
    iCCnt : Integer;
begin
  //�Է�edit �ʱ�ȭ
  up_INIT_WRITE_EDIT;

  sFOMGBN := pAVG.Cells[Ord(fbFOMGBN), pRow];
  sTMPMSG := pAVG.Cells[Ord(fbTMPMSG), pRow];

  //�ش� PNL �� �����ϸ� Enable True
  sCompComm := 'pnl';
  sCompName := sCompComm + sFOMGBN;
  pnlComp := TPanel(Self.FindComponent(sCompName));

  if Assigned(pnlComp) then
  begin
    Try
      SET_SMSTAG;

      For sKey in PAS_SmsTagDict.Keys Do
      Begin
        if (PAS_SmsTagDict.Items[sKey].TAGTYP = '3') then
        begin
          if ContainsText(sTMPMSG, PAS_SmsTagDict.Items[sKey].TAGCOD ) then
          begin
            With pnlComp as TPanel Do
            Begin
              For iCCnt := 0 to ControlCount - 1 Do
              Begin
                if (Controls[iCCnt] is TCheckBox) and
                   ((Controls[iCCnt] as TCheckBox).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                begin
                  (Controls[iCCnt] as TCheckBox).Enabled := True;
                  //(Controls[iCCnt] as TCheckBox).Color := clLime;
                  dict.Add(IntToStr(iCCnt), (Controls[iCCnt] as TCheckBox).Name);
                end;

                if (Controls[iCCnt] is TEdit) and
                   ((Controls[iCCnt] as TEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                begin
                  (Controls[iCCnt] as TEdit).Enabled := True;
                  (Controls[iCCnt] as TEdit).Color := clLime;
                  dict.Add(IntToStr(iCCnt), (Controls[iCCnt] as TEdit).Name);
                end;

                if (Controls[iCCnt] is TMaskEdit) and
                   ((Controls[iCCnt] as TMaskEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                begin
                  (Controls[iCCnt] as TMaskEdit).Enabled := True;
                  (Controls[iCCnt] as TMaskEdit).Color := clLime;
                  dict.Add(IntToStr(iCCnt), (Controls[iCCnt] as TMaskEdit).Name);
                end;
              End;
            End;
          end;
        end;
      End;
    Finally
      FreeAndNil(PAS_SmsTagDict);
    End;
  end;
end;

procedure TSMS_PAS.asgFMBClickCell(Sender: TObject; ARow, ACol: Integer);
var pDict : TDictionary<String, String>;
    sKey : String;
    iCheckCnt, iEdtTabOrder, iMdtTabOrder : Integer;
    bCompFocus : Boolean;
    chkComp : TCheckBox;
    edtComp, edtFocusComp : TEdit;
    mdtComp, mdtFocusComp : TMaskEdit;
begin
  if ARow = 0 then Exit;

  bCompFocus := False;
  iCheckCnt    := 1000; // üũ�ڽ� ���� �� ( �⺻�� 1000 )
  iEdtTabOrder := 1000;
  iMdtTabOrder := 1000;

  if (ACol <> Ord(fbTMPMSG)) and
     ((Sender as TAdvStringGrid).Cells[Ord(fbTMPMSG), ARow ] <> '') then
  begin
    up_INIT_PNL_PREVIEW;

    if (gs_CALLFORM = 'PB30020') and
       ((Sender as TAdvStringGrid).Cells[Ord(fbFIXLIN), ARow] <> '') and
       ((Sender as TAdvStringGrid).Cells[Ord(fbFIXLIN), ARow] <> gsDEPTLINE) then
    begin
      ShowMessage('��������� �׷ο� ��ġ���� �ʽ��ϴ�.');
      pnlCVRTFAIL.Visible := True;
      pnlCVRTFAIL.Caption := '�׷ι���ġ';
      Exit;
    end;

    Try                  //Key, Component Name
      pDict := TDictionary<String, String>.Create;

      // �׸��� Click�� Input Field ���ο� ���� Enable True, BackgroundColor clLime ó��
      up_ENABLE_WRITE_EDIT((Sender as TAdvStringGrid), ARow, pDict);

      if Assigned(pDict) then
      begin
        For sKey in pDict.Keys Do
        Begin
          // [ Focus ������Ʈ ã�� - CheckBox�� Focus X ]
          if (Self.FindComponent(pDict.Items[sKey]) is TCheckBox) then
          begin
             chkComp := (Self.FindComponent(pDict.Items[sKey]) as TCheckBox);

             if iCheckCnt = 1000 then
                iCheckCnt := 0;
             if chkComp.Checked then
                Inc(iCheckCnt);
          end
          else
          if (Self.FindComponent(pDict.Items[sKey]) is TEdit) then
          begin
             edtComp := (Self.FindComponent(pDict.Items[sKey]) as TEdit);

             if Trim(edtComp.Text) = '' then
             begin
               bCompFocus := True;
               if edtComp.TabOrder <= iEdtTabOrder then
               begin
                 edtFocusComp := edtComp;
                 iEdtTabOrder := edtComp.TabOrder;
               end;
             end;
          end
          else
          if (Self.FindComponent(pDict.Items[sKey]) is TMaskEdit) then
          begin
             mdtComp := (Self.FindComponent(pDict.Items[sKey]) as TMaskEdit);

             if (ExtractInt(mdtComp.Text) = '') then
             begin
               bCompFocus := True;
               if mdtComp.TabOrder <= iMdtTabOrder then
               begin
                 mdtFocusComp := mdtComp;
                 iMdtTabOrder := mdtComp.TabOrder;
               end;
             end;
          end;
        End;
      end;
    Finally
      FreeAndNil(pDict);
    End;

    if bCompFocus = True then
    begin
      memTMPMSG.Lines.Text := '�ϴܿ� ǥ�õ� �׸��� �Է� �� �ٽ� Ŭ���ϼ���.';

      if iEdtTabOrder <= iMdtTabOrder then
         edtFocusComp.SetFocus
      else
         mdtFocusComp.SetFocus;

      pnlCVRTFAIL.Visible := True;
      pnlCVRTFAIL.Caption := '�̺�ȯ';
    end
    else
    if iCheckCnt = 0 then
    begin
      memTMPMSG.Lines.Text := '�ϴܿ� ǥ�õ� üũ�ڽ��� 1���̻� ������ �ʼ������Դϴ�.';
      pnlCVRTFAIL.Visible := True;
      pnlCVRTFAIL.Caption := '�̺�ȯ';
    end
    else
    begin
      up_GridToMemo(Sender, ARow, ACol, 0);  // 1�� ��ȯ
      pnlCVRTFAIL.Visible := False;
      pnlCVRTFAIL.Caption := '';
    end;
  end;
end;

procedure TSMS_PAS.up_GridToMemo(Sender: TObject; pRow, pCol, pCnt:Integer);
var sORGMSG, sCVTMSG, sFOMGBN, sDETGBN, sTMPCOD, sFIXLIN, sREFCD1,
    sTAGCD1, sTAGVA1, sTAGCD2, sTAGVA2 : String;
    sKey : String;
    sSMS_DATA, sBOOKDATE, sBOOKSEQ3, sCOMMSEQ3, sTELENUMB, sDEPTLINE : String;
    iCCnt, iStrCnt : Integer;
begin
  //���� �׸��� �ʱ�ȭ
  up_INIT_GRID_SMS;

  if gstlSMS_DATA.Count = 0 then
  begin
    ShowMEssage('������ ����� �������� �ʽ��ϴ�.');
    Exit;
  end;

  //  [ 0. ���ø� �޽���, ���ø��ڵ� ]
  sORGMSG := (Sender as TAdvStringGrid).Cells[Ord(fbTMPMSG), pRow];
  sTMPCOD := (Sender as TAdvStringGrid).Cells[Ord(fbTMPCOD), pRow];
  sFIXLIN := (Sender as TAdvStringGrid).Cells[Ord(fbFIXLIN), pRow];

  if sORGMSG = '' then
  begin
    ShowMEssage('��ȯ�� �޽����� �������� �ʽ��ϴ�.');
    pnlCVRTFAIL.Visible := True;
    pnlCVRTFAIL.Caption := '�޽��� ����';
    Exit;
  end;

  Try
    // [ 1. ����(Dictionary) ���� ��
    //      ���� ���� - �⺻��        ]
    SET_SMSTAG;
    // 1-1. ���� �߰����� 1 - ���ø� ������(TAGTYP : 4)
    With Query1 Do
    Begin
      sFOMGBN := (Sender as TAdvStringGrid).Cells[Ord(fbFOMGBN), pRow];
      sDETGBN := (Sender as TAdvStringGrid).Cells[Ord(fbDETGBN), pRow];
      Close;
      SQL.Clear;
      SQL.Add('  SELECT *                              ');
      SQL.Add('    FROM PSSMSFMB                       ');
      SQL.Add('   WHERE FOMGBN = ''' + sFOMGBN + '''   ');
      SQL.Add('     AND DETGBN = ''' + sDETGBN + '''   ');
      Open;

      if Not Query1.IsEmpty then
      begin
        First;

        if FieldByName('REFCD1').AsString = 'YMTK' then
           sREFCD1 := 'YM''' + ',' + '''TK'
        else
           sREFCD1 := FieldByName('REFCD1').AsString;

        sTAGCD1 := FieldByName('TAGCD1').AsString;
        sTAGVA1 := FieldByName('TAGVA1').AsString;
        sTAGCD2 := FieldByName('TAGCD2').AsString;
        sTAGVA2 := FieldByName('TAGVA2').AsString;

        For sKey in PAS_SmsTagDict.Keys Do
        Begin
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '4') then
          begin
            if PAS_SmsTagDict.Items[sKey].TAGCOD = sTAGCD1 then
               PAS_SmsTagDict.Items[sKey].TAGVAL := sTAGVA1
            else
            if PAS_SmsTagDict.Items[sKey].TAGCOD = sTAGCD2 then
               PAS_SmsTagDict.Items[sKey].TAGVAL := sTAGVA2;
          end;
        End;
      end;
    End;
    // 1-2. ���� �߰����� 2 - ���� INPUT(�Է�)��(TAGTYP : 3)
    For sKey in PAS_SmsTagDict.Keys Do
    Begin
      if (PAS_SmsTagDict.Items[sKey].TAGTYP = '3') then
      begin
        if pnlADDFARE.Enabled = True then
           With pnlADDFARE as TPanel Do
                For iCCnt := 0 to ControlCount - 1 Do
                Begin
                  if (Controls[iCCnt] is TCheckBox) and
                     ((Controls[iCCnt] as TCheckBox).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD) and
                     ((Controls[iCCnt] as TCheckBox).Checked) then
                     if PAS_SmsTagDict.Items[sKey].TAGVAL = '' then
                        PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TCheckBox).Caption
                     else
                        PAS_SmsTagDict.Items[sKey].TAGVAL := PAS_SmsTagDict.Items[sKey].TAGVAL + '�� ' + (Controls[iCCnt] as TCheckBox).Caption;

                  if (Controls[iCCnt] is TEdit) and
                     ((Controls[iCCnt] as TEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TEdit).Text;

                  if (Controls[iCCnt] is TMaskEdit) and
                     ((Controls[iCCnt] as TMaskEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TMaskEdit).Text;
                End;

        if pnlCCLSHIP.Enabled = True then
           With pnlCCLSHIP as TPanel Do
                For iCCnt := 0 to ControlCount - 1 Do
                Begin
                  if (Controls[iCCnt] is TEdit) and
                     ((Controls[iCCnt] as TEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TEdit).Text;

                  if (Controls[iCCnt] is TMaskEdit) and
                     ((Controls[iCCnt] as TMaskEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TMaskEdit).Text;
                End;

        if pnlCHGTIME.Enabled = True then
           With pnlCHGTIME as TPanel Do
                For iCCnt := 0 to ControlCount - 1 Do
                Begin
                  if (Controls[iCCnt] is TEdit) and
                     ((Controls[iCCnt] as TEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TEdit).Text;

                  if (Controls[iCCnt] is TMaskEdit) and
                     ((Controls[iCCnt] as TMaskEdit).HelpKeyword = PAS_SmsTagDict.Items[sKey].TAGCOD)  then
                     PAS_SmsTagDict.Items[sKey].TAGVAL := (Controls[iCCnt] as TMaskEdit).Text;
                End;
      end;
    End;

    For iStrCnt := 0 to pCnt Do
    Begin
      sCVTMSG := sORGMSG;

      sSMS_DATA := gstlSMS_DATA[iStrCnt];
      sBOOKDATE := Copy(sSMS_DATA, 1,8);
      sBOOKSEQ3 := IntToStr(STi(Copy(sSMS_DATA,10,3)));
      sCOMMSEQ3 := IntToStr(STi(Copy(sSMS_DATA,14,3)));
      sTELENUMB := Copy(sSMS_DATA, 18, Length(gstlSMS_DATA[iStrCnt])-17);

      { [�׷�����] relook
        �⺻������ �θ������� �ҷ��� ���� �����׷η� ��´�.
            ���� 1 - '�߰����Ӿȳ�', '���׾ȳ�'�� �ִ� Ư���׸���� �׷κ��� �ٽ� ����
            ���� 2 - '�߱����'�� 'SP' �����̹Ƿ� SP�� ���� ���� (�����ȣ�� �����ϸ� �Ǳ⶧���� ���ٸ� ��ȿ�� �˻� �ʿ���� }

      if sFIXLIN <> '' then       // ���� 1 - Ư���׸���� �׷� �ٽ� ����
         sDEPTLINE := sFIXLIN
      else
      if (sFOMGBN = 'CC') and
         (sDETGBN = 'TK_CC') then // ����2 - �߱������ ��쿡�� �������ڷ� ����
         sDEPTLINE := 'SP'
      else
         sDEPTLINE := gsDEPTLINE; // �⺻

      if (gs_CALLFORM = 'PB30020') and
         (sDEPTLINE <> gsDEPTLINE) then
      begin
        ShowMEssage('��������� �׷ο� ��ġ���� �ʽ��ϴ�.');
        pnlCVRTFAIL.Visible := True;
        pnlCVRTFAIL.Caption := '�׷ι���ġ';
        Exit;
      end;

      if (sBOOKDATE = '') or
         (sBOOKSEQ3 = '') or
         (sCOMMSEQ3 = '') or
         (sDEPTLINE = '') then
      begin
        memTMPMSG.Lines.Text := '���������� �ùٸ��� ���� �ڷᰡ �ֽ��ϴ�.' + #13#10 +
                                '[�����ȣ=��ȭ��ȣ]' + #13#10 +
                                sSMS_DATA;
        pnlCVRTFAIL.Visible := True;
        pnlCVRTFAIL.Caption := '������������';
        Exit;
      end;

      // [ 2. SMS TAG ���� ���� �� ��ȯ ]
      With Query1 Do
      Begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT ''ȫ�浿''           VIZTUSNM          ');
        SQL.Add('      , ''2''                MANCOUNT          ');
        SQL.Add('      , ''1''                CARCOUNT          ');
        SQL.Add('      , ''20201231-001-001'' BOOKNUMB          ');
        SQL.Add('      , ''2020-12-01''       PSTRDATE          ');
        SQL.Add('      , ''2020-12-05''       SSTRDATE          ');
        SQL.Add('      , ''2020-12-01''       DEPTDATE          ');
        SQL.Add('      , ''30000''            SUMAMOUNT         ');
        SQL.Add('      , ''50000''            CARAMOUNT         ');
        SQL.Add('      , ''1''                CCLCOUNT          ');
        SQL.Add('      , ''�����''           CCLUSNMS          ');
        //
        SQL.Add('      , ''YY''               BOOKSTAT          ');
        SQL.Add('      , ''20201231''         BOOKDATE          ');
        SQL.Add('      , ''1''                BOOKSEQ3          ');
        SQL.Add('      , ''1''                COMMSEQ3          ');
        SQL.Add('      , ''S''                DEPTSHIP          ');
        SQL.Add('      , ''PS''               DEPTLINE          ');
        SQL.Add('   FROM DUAL                                   ');
        {
        SQL.Add(' WITH CANCDATA AS                                                                                                                                                       ');
        SQL.Add(' (                                                                                                                                                                      ');
        SQL.Add('          SELECT BOOKDATE, BOOKSEQ3                                                                                                                                     ');
        SQL.Add('               , SUBSTR(XMLAGG(XMLELEMENT(A, CHR(13)||CHR(10)||CASE WHEN ROWNUM = 1 THEN ''''                                                                           ');
        SQL.Add('                                                                                    ELSE ''                    '' END||VIZTUSNM)                                        ');
        SQL.Add('                                          ORDER BY COMMSEQ3, LENGTH(VIZTUSNM)).EXTRACT(''//text()''), 2) AS CCLUSNMS                                                    ');
        SQL.Add('               , SUM(VIZT_CNT)||''��''   CCLCOUNT                                                                                                                       ');
        SQL.Add('            FROM PSSTBKDT                                                                                                                                               ');
        SQL.Add('           WHERE BOOKDATE = :pBOOKDATE                                                                                                                                  ');
        SQL.Add('             AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                  ');
        SQL.Add('             AND DEPTLINE = :pDEPTLINE                                                                                                                                  ');
        SQL.Add('             AND NVL(CANCAPCD, 0) = 1                                                                                                                                   ');
        SQL.Add('           GROUP BY BOOKDATE, BOOKSEQ3                                                                                                                                  ');
        SQL.Add(' )                                                                                                                                                                      ');
        SQL.Add(' SELECT A.BOOKDATE, A.BOOKSEQ3, A.COMMSEQ3                                                                                                                              ');
        SQL.Add('      , :pDEPTLINE DEPTLINE                                                                                                                                             ');
        SQL.Add('      , TO_CHAR(SUBSTR(A.BOOKDATE,1,4))||''-''||TO_CHAR(SUBSTR(A.BOOKDATE,5,4))||''-''||LPAD(A.BOOKSEQ3, 3, ''0'') BOOKNUMB                                             ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' THEN P.BOOKSTAT                                                                                                                   ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' THEN S.BOOKSTAT                                                                                                                   ');
        SQL.Add('                                      ELSE '''' END BOOKSTAT                                                                                                            ');
//        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' THEN TO_CHAR(TO_DATE(P.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'')                                                                                                                   ');
//        SQL.Add('             WHEN :pDEPTLINE = ''SP'' THEN TO_CHAR(TO_DATE(S.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'')                                                                                                               ');
//        SQL.Add('                                      ELSE '''' END DEPTDATE                                                                                                            ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' AND NVL(P.DEPTDATE, '' '') <> '' '' THEN TO_CHAR(TO_DATE(P.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'')                  ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' AND NVL(S.DEPTDATE, '' '') <> '' '' THEN TO_CHAR(TO_DATE(S.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'')                  ');
        SQL.Add('             WHEN :pDEPTLINE = ''PS'' AND NVL(P.BOOKDATE, '' '')  = '' '' THEN ''-''                                                                                    ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' AND NVL(S.BOOKDATE, '' '')  = '' '' THEN ''-''                                                                                    ');
        SQL.Add('             WHEN :pDEPTLINE = ''PS'' AND NVL(P.BOOKDATE, '' '') <> '' '' THEN ''OPEN''                                                                                 ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' AND NVL(S.BOOKDATE, '' '') <> '' '' THEN ''OPEN''                                                                                 ');
        SQL.Add('                                                                          ELSE '''' END DEPTDATE                                                                        ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' THEN P.DEPTSHIP                                                                                                                   ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' THEN S.DEPTSHIP                                                                                                                   ');
        SQL.Add('                                      ELSE '''' END DEPTSHIP                                                                                                            ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' THEN P.VIZTUSNM                                                                                                                   ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' THEN S.VIZTUSNM                                                                                                                   ');
        SQL.Add('                                      ELSE '''' END VIZTUSNM                                                                                                            ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''PS'' THEN CASE WHEN NVL(P.DEPTDATE, '' '')='' '' THEN ''OPEN''                                                                         ');
        SQL.Add('                                                                                  ELSE TO_CHAR(TO_DATE(P.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'') END      ');
        SQL.Add('             WHEN :pDEPTLINE = ''SP'' THEN CASE WHEN NVL(P.BOOKDATE, '' '')='' '' THEN ''-''                                                                            ');
        SQL.Add('                                                WHEN NVL(P.DEPTDATE, '' '')='' '' THEN ''OPEN''                                                                         ');
        SQL.Add('                                                                                  ELSE TO_CHAR(TO_DATE(P.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'') END      ');
        SQL.Add('                                      ELSE '''' END PSTRDATE                                                                                                            ');
        SQL.Add('                                                                                                                                                                        ');
        SQL.Add('      , CASE WHEN :pDEPTLINE = ''SP'' THEN CASE WHEN NVL(S.DEPTDATE, '' '')='' '' THEN ''OPEN''                                                                         ');
        SQL.Add('                                                                                  ELSE TO_CHAR(TO_DATE(S.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'') END      ');
        SQL.Add('             WHEN :pDEPTLINE = ''PS'' THEN CASE WHEN NVL(S.BOOKDATE, '' '')='' '' THEN ''-''                                                                            ');
        SQL.Add('                                                WHEN NVL(S.DEPTDATE, '' '')='' '' THEN ''OPEN''                                                                         ');
        SQL.Add('                                                                                  ELSE TO_CHAR(TO_DATE(S.DEPTDATE,''YYYY-MM-DD''), ''YYYY"��" MM"��" DD"��"'') END      ');
        SQL.Add('                                      ELSE '''' END SSTRDATE                                                                                                            ');
        SQL.Add('      , V.MANCOUNT-1 MANCOUNT                                                                                                                                           ');
        SQL.Add('      , V.CARCOUNT CARCOUNT                                                                                                                                             ');
        SQL.Add('      , TRIM(TO_CHAR(W.SUMAMOUNT , ''999,999,999''))||''��'' SUMAMOUNT                                                                                                  ');
        SQL.Add('      , CASE WHEN W.CARAMOUNT = 0 THEN ''����''                                                                                                                         ');
        SQL.Add('             ELSE TRIM(TO_CHAR(W.CARAMOUNT , ''999,999,999''))||''��'' END CARAMOUNT                                                                                    ');
        SQL.Add('      , X.CCLUSNMS                                                                                                                                                      ');
        SQL.Add('      , X.CCLCOUNT                                                                                                                                                      ');
        SQL.Add('   FROM (                                                                                                                                                               ');
        SQL.Add('         SELECT BOOKDATE, BOOKSEQ3, COMMSEQ3                                                                                                                            ');
        SQL.Add('              , MAX(CASE WHEN SORRGBUN = ''S'' THEN NVL(DEPTDATE, ''00000000'') ELSE ''00000000'' END) PSSTRDAT                                                         ');
        SQL.Add('              , MAX(CASE WHEN SORRGBUN = ''R'' THEN NVL(DEPTDATE, ''00000000'') ELSE ''00000000'' END) SPSTRDAT                                                         ');
        SQL.Add('            FROM PSSTBKDT                                                                                                                                               ');
        SQL.Add('           WHERE BOOKDATE = :pBOOKDATE                                                                                                                                  ');
        SQL.Add('             AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                  ');
        SQL.Add('             AND COMMSEQ3 = :pCOMMSEQ3                                                                                                                                  ');
        SQL.Add('           GROUP BY BOOKDATE, BOOKSEQ3, COMMSEQ3                                                                                                                        ');
        SQL.Add('        ) A                                                                                                                                                             ');
        SQL.Add('   LEFT OUTER JOIN                                                                                                                                                      ');
        SQL.Add('        ( SELECT *                                                                                                                                                      ');
        SQL.Add('            FROM PSSTBKDT                                                                                                                                               ');
        SQL.Add('           WHERE BOOKDATE = :pBOOKDATE                                                                                                                                  ');
        SQL.Add('             AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                  ');
        SQL.Add('             AND COMMSEQ3 = :pCOMMSEQ3                                                                                                                                  ');
        SQL.Add('             AND DEPTLINE = ''PS''                                                                                                                                      ');
        SQL.Add('        ) P ON A.BOOKDATE = P.BOOKDATE                                                                                                                                  ');
        SQL.Add('           AND A.BOOKSEQ3 = P.BOOKSEQ3                                                                                                                                  ');
        SQL.Add('           AND A.COMMSEQ3 = P.COMMSEQ3                                                                                                                                  ');
        SQL.Add('           AND P.DEPTLINE = ''PS''                                                                                                                                      ');
        SQL.Add('   LEFT OUTER JOIN                                                                                                                                                      ');
        SQL.Add('        ( SELECT *                                                                                                                                                      ');
        SQL.Add('            FROM PSSTBKDT                                                                                                                                               ');
        SQL.Add('           WHERE BOOKDATE = :pBOOKDATE                                                                                                                                  ');
        SQL.Add('             AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                  ');
        SQL.Add('             AND COMMSEQ3 = :pCOMMSEQ3                                                                                                                                  ');
        SQL.Add('             AND DEPTLINE = ''SP''                                                                                                                                      ');
        SQL.Add('        ) S ON A.BOOKDATE = S.BOOKDATE                                                                                                                                  ');
        SQL.Add('           AND A.BOOKSEQ3 = S.BOOKSEQ3                                                                                                                                  ');
        SQL.Add('           AND A.COMMSEQ3 = S.COMMSEQ3                                                                                                                                  ');
        SQL.Add('           AND S.DEPTLINE = ''SP''                                                                                                                                      ');
        SQL.Add('   LEFT OUTER JOIN                                                                                                                                                      ');
        SQL.Add('       ( SELECT BOOKDATE, BOOKSEQ3, BOOKSTAT                                                                                                                            ');
        SQL.Add('              , CASE WHEN DEPTLINE = ''PS'' THEN NVL(DEPTDATE, ''00000000'')                                                                                            ');
        SQL.Add('                     WHEN DEPTLINE = ''SP'' THEN NVL(RETNDATE, ''00000000'') END DEPTDATE                                                                               ');
        SQL.Add('              , CASE WHEN DEPTLINE = ''PS'' THEN NVL(RETNDATE, ''00000000'')                                                                                            ');
        SQL.Add('                     WHEN DEPTLINE = ''SP'' THEN NVL(DEPTDATE, ''00000000'') END RETNDATE                                                                               ');
        SQL.Add('              , SUM(NVL(TKETAMTW,0)+NVL(FAREDANW,0)+NVL(AUTOAMTW,0)) SUMAMOUNT                                                                                          ');
        SQL.Add('              , SUM(NVL(VIZT_CNT,0)) MANCOUNT                                                                                                                                  ');
        SQL.Add('              , SUM(CASE WHEN AUTOGBUN IN (''C'', ''B'') THEN 1                                                                                                         ');
        SQL.Add('                                                         ELSE 0 END) CARCOUNT                                                                                           ');
        SQL.Add('           FROM PSSTBKDT                                                                                                                                                ');
        SQL.Add('          WHERE BOOKDATE = :pBOOKDATE                                                                                                                                   ');
        SQL.Add('            AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                   ');
        SQL.Add('            AND DEPTLINE = :pDEPTLINE                                                                                                                                   ');
        SQL.Add('            AND CANCGBUN = ''N''                                                                                                                                        ');
        SQL.Add('            AND TEAMGBUN = ''N''                                                                                                                                        ');
        SQL.Add('            AND NVL(CANCAPCD, 0) = 0                                                                                                                                    ');
        SQL.Add('          GROUP BY BOOKDATE, BOOKSEQ3, BOOKSTAT                                                                                                                         ');
        SQL.Add('                 , CASE WHEN DEPTLINE = ''PS'' THEN NVL(DEPTDATE, ''00000000'')                                                                                         ');
        SQL.Add('                        WHEN DEPTLINE = ''SP'' THEN NVL(RETNDATE, ''00000000'') END                                                                                     ');
        SQL.Add('                 , CASE WHEN DEPTLINE = ''PS'' THEN NVL(RETNDATE, ''00000000'')                                                                                         ');
        SQL.Add('                        WHEN DEPTLINE = ''SP'' THEN NVL(DEPTDATE, ''00000000'') END                                                                                     ');
        SQL.Add('       ) V ON A.BOOKDATE = V.BOOKDATE                                                                                                                                   ');
        SQL.Add('          AND A.BOOKSEQ3 = V.BOOKSEQ3                                                                                                                                   ');
        SQL.Add('          AND V.BOOKSTAT = CASE WHEN :pDEPTLINE = ''PS'' THEN P.BOOKSTAT                                                                                                ');
        SQL.Add('                                WHEN :pDEPTLINE = ''SP'' THEN S.BOOKSTAT                                                                                                ');
        SQL.Add('                                                          END                                                                                                           ');
        SQL.Add('          AND A.PSSTRDAT = V.DEPTDATE                                                                                                                                   ');
        SQL.Add('          AND A.SPSTRDAT = V.RETNDATE                                                                                                                                   ');
        SQL.Add('   LEFT OUTER JOIN                                                                                                                                                      ');
        SQL.Add('       ( SELECT BOOKDATE, BOOKSEQ3, BOOKSTAT                                                                                                                            ');
        SQL.Add('              , CASE WHEN DEPTLINE = ''PS'' THEN NVL(DEPTDATE, ''00000000'')                                                                                            ');
        SQL.Add('                     WHEN DEPTLINE = ''SP'' THEN NVL(RETNDATE, ''00000000'') END DEPTDATE                                                                               ');
        SQL.Add('              , CASE WHEN DEPTLINE = ''PS'' THEN NVL(RETNDATE, ''00000000'')                                                                                            ');
        SQL.Add('                     WHEN DEPTLINE = ''SP'' THEN NVL(DEPTDATE, ''00000000'') END RETNDATE                                                                               ');
        SQL.Add('              , SUM(NVL(TKETAMTW,0)+NVL(FAREDANW,0)) SUMAMOUNT                                                                                                          ');
        SQL.Add('              , SUM(NVL(AUTOAMTW,0)) CARAMOUNT                                                                                                                          ');
        SQL.Add('           FROM PSSTBKDT                                                                                                                                                ');
        SQL.Add('          WHERE BOOKDATE = :pBOOKDATE                                                                                                                                   ');
        SQL.Add('            AND BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                   ');
        SQL.Add('            AND CANCGBUN = ''N''                                                                                                                                        ');
        SQL.Add('            AND TEAMGBUN = ''N''                                                                                                                                        ');
        SQL.Add('            AND NVL(CANCAPCD, 0) = 0                                                                                                                                    ');
        SQL.Add('          GROUP BY BOOKDATE, BOOKSEQ3, BOOKSTAT                                                                                                                         ');
        SQL.Add('                 , CASE WHEN DEPTLINE = ''PS'' THEN NVL(DEPTDATE, ''00000000'')                                                                                         ');
        SQL.Add('                        WHEN DEPTLINE = ''SP'' THEN NVL(RETNDATE, ''00000000'') END                                                                                     ');
        SQL.Add('                 , CASE WHEN DEPTLINE = ''PS'' THEN NVL(RETNDATE, ''00000000'')                                                                                         ');
        SQL.Add('                        WHEN DEPTLINE = ''SP'' THEN NVL(DEPTDATE, ''00000000'') END                                                                                     ');
        SQL.Add('       ) W ON A.BOOKDATE = W.BOOKDATE                                                                                                                                   ');
        SQL.Add('          AND A.BOOKSEQ3 = W.BOOKSEQ3                                                                                                                                   ');
        SQL.Add('          AND W.BOOKSTAT = CASE WHEN :pDEPTLINE = ''PS'' THEN P.BOOKSTAT                                                                                                ');
        SQL.Add('                                WHEN :pDEPTLINE = ''SP'' THEN S.BOOKSTAT                                                                                                ');
        SQL.Add('                                                          END                                                                                                           ');
        SQL.Add('          AND A.PSSTRDAT = W.DEPTDATE                                                                                                                                   ');
        SQL.Add('          AND A.SPSTRDAT = W.RETNDATE                                                                                                                                   ');
        SQL.Add('   LEFT OUTER JOIN CANCDATA X ON A.BOOKDATE = X.BOOKDATE                                                                                                                ');
        SQL.Add('                             AND A.BOOKSEQ3 = X.BOOKSEQ3                                                                                                                ');
        SQL.Add('  WHERE A.BOOKDATE = :pBOOKDATE                                                                                                                                         ');
        SQL.Add('    AND A.BOOKSEQ3 = :pBOOKSEQ3                                                                                                                                         ');
        SQL.Add('    AND A.COMMSEQ3 = :pCOMMSEQ3                                                                                                                                         ');
        SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN P.CANCGBUN                                                                                                                     ');
        SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN S.CANCGBUN                                                                                                                     ');
        SQL.Add('                                    ELSE '''' END = ''N''                                                                                                               ');
        SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN P.TEAMGBUN                                                                                                                     ');
        SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN S.TEAMGBUN                                                                                                                     ');
        SQL.Add('                                    ELSE '''' END = ''N''                                                                                                               ');
        // �������
        if (sREFCD1 <> '') then
        begin
           SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN REPLACE(P.BOOKSTAT,''IM'',''YM'')                                                                                           ');
           SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN REPLACE(S.BOOKSTAT,''IM'',''YM'')                                                                                           ');
           SQL.Add('                                    ELSE '''' END IN (''' + sREFCD1 + ''')                                                                                           '); // IM �� YM ��ȯ
        end;
//        if (Copy(sFOMGBN,1,2) = 'YY') or
//           (Copy(sFOMGBN,1,2) = 'YM') or
//           (Copy(sFOMGBN,1,2) = 'TK') then
//        begin
//           SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN REPLACE(P.BOOKSTAT,''IM'',''YM'')                                                                                           ');
//           SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN REPLACE(S.BOOKSTAT,''IM'',''YM'')                                                                                           ');
//           SQL.Add('                                    ELSE '''' END = ''' + Copy(sFOMGBN,1,2) + '''                                                                                    '); // IM �� YM ��ȯ
//        end;
        if ContainsText(sFOMGBN, 'CAR') then
        begin
           SQL.Add('  AND NVL(V.CARCOUNT, 0) > 0                                                                                                                                         ');
           SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN P.AUTOGBUN                                                                                                                  ');
           SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN S.AUTOGBUN                                                                                                                  ');
           SQL.Add('                                    ELSE '''' END IN (''C'', ''B'')                                                                                                  ');
        end;
//        if sDETGBN = 'CONF_RB' then // ����Ȯ�� - ����
//        begin
//           SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN P.BOOKSTAT                                                                                                                  ');
//           SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN S.BOOKSTAT                                                                                                                  ');
//           SQL.Add('                                    ELSE '''' END = ''YY''                                                                                                           ');
//        end
//        else
//        if sDETGBN = 'CONF_PC' then // ����Ȯ�� - Ƽ�ϱ����� (����, �߱�)
//        begin
//           SQL.Add('  AND CASE WHEN :pDEPTLINE = ''PS'' THEN P.BOOKSTAT                                                                                                                  ');
//           SQL.Add('           WHEN :pDEPTLINE = ''SP'' THEN S.BOOKSTAT                                                                                                                  ');
//           SQL.Add('                                    ELSE '''' END IN (''IM'', ''YM'', ''TK'')                                                                                        ');
//        end;
        ParamByName('pBOOKDATE').AsString := sBOOKDATE;
        ParamByName('pBOOKSEQ3').AsString := sBOOKSEQ3;
        ParamByName('pCOMMSEQ3').AsString := sCOMMSEQ3;
        ParamByName('pDEPTLINE').AsString := sDEPTLINE;
        }
        Open;
        MEMO1.Lines.Text := Query1.TEXT;

        if Query1.IsEmpty then
        begin
          memTMPMSG.Lines.Text := '�����Ͻ� ���¿� �ش��ϴ� ���������� �������� �ʽ��ϴ�.' + #13#10 +
                                  '[�����ȣ=��ȭ��ȣ]' + #13#10 +
                                  sSMS_DATA;
          pnlCVRTFAIL.Visible := True;
          pnlCVRTFAIL.Caption := '������������';
          Exit;
        end;

        First;
        //  2-1. ���� �߰����� 2 - �������̰�(DB) (TAGTYP : 2)
        For sKey in PAS_SmsTagDict.Keys Do
        Begin
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '2') then
          begin
            if FieldByName(PAS_SmsTagDict.Items[sKey].TAGGBN).AsString <> '' then
            begin
              // ���ź���, �������������� ��� ���Ӻκ��� - ó��
              if (sFOMGBN = 'YMUP') or
                 (sFOMGBN = 'YMUP_CAR') then
              begin
                if (PAS_SmsTagDict.Items[sKey].TAGGBN = 'SUMAMOUNT') or
                   (PAS_SmsTagDict.Items[sKey].TAGGBN = 'CARAMOUNT') then
                   begin
                     PAS_SmsTagDict.Items[sKey].TAGVAL := '-';
                     Continue;
                   end;
              end;

              PAS_SmsTagDict.Items[sKey].TAGVAL := FieldByName(PAS_SmsTagDict.Items[sKey].TAGGBN).AsString;
            end;
          end;
        End;

        // [ 3.�޽��� ��ȯ ]
        For sKey in PAS_SmsTagDict.Keys Do
        Begin
          // 3-1. ������,���� X (TAGTYP : 1, TABGBN : Null)
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '1') and
             (PAS_SmsTagDict.Items[sKey].TAGGBN = '') then
          begin
            sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD,
                                              PAS_SmsTagDict.Items[sKey].TAGVAL,
                                              [rfReplaceAll, rfIgnoreCase]);
          end
          // 3-2. ������,���� O (TAGTYP : 1, TABGBN : Not Null)
          else
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '1') and
             (PAS_SmsTagDict.Items[sKey].TAGGBN <> '') then
          begin
            if (PAS_SmsTagDict.Items[sKey].TAGGBN = FieldByName('DEPTSHIP').AsString) or
               (PAS_SmsTagDict.Items[sKey].TAGGBN = FieldByName('DEPTLINE').AsString) or
               (PAS_SmsTagDict.Items[sKey].TAGGBN = '210') then // �����ڴ� �λ�μ��� ġȯ
               sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD,
                                                 PAS_SmsTagDict.Items[sKey].TAGVAL,
                                                 [rfReplaceAll, rfIgnoreCase]);
          end
          //  2-3 ��������(DB) (2-1���� ����) (TAGTYP : 2)
          else
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '2') then
          begin
            sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD,
                                              PAS_SmsTagDict.Items[sKey].TAGVAL,
                                              [rfReplaceAll, rfIgnoreCase]);
          end
          //  2-4 INPUT�� (1-2���� ����) (TAGTYP : 3)
          else                                                              if (PAS_SmsTagDict.Items[sKey].TAGTYP = '3') then
          begin
//            if ContainsText(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD ) then
//            begin
              sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD,
                                                PAS_SmsTagDict.Items[sKey].TAGVAL,
                                                [rfReplaceAll, rfIgnoreCase]);
//            end;
          end
          //  2-5 �������� �� ��ȯ - ���ø� ������ (1-1���� ����) (TAGTYP : 3)
          else
          if (PAS_SmsTagDict.Items[sKey].TAGTYP = '4') then
          begin
//            if ContainsText(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD ) then
//            begin
              sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGCOD,
                                                PAS_SmsTagDict.Items[sKey].TAGVAL,
                                                [rfReplaceAll, rfIgnoreCase]);
//            end;
          end;


          // 2-6 �ݾ׺κ��� 3�ڸ� , ó��
          if //(PAS_SmsTagDict.Items[sKey].TAGCOD = '#{������������}') or -- �ش�κ��� �������� ���
             (PAS_SmsTagDict.Items[sKey].TAGCOD = '#{�߰�������������}') then
              sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGVAL,
                                                FormatFloat('#,###', STf(ExtractInt(PAS_SmsTagDict.Items[sKey].TAGVAL))),
                                                [rfReplaceAll, rfIgnoreCase]);

//          if (PAS_SmsTagDict.Items[sKey].TAGCOD = '#{�����}') then
//             sCVTMSG := StringReplace(sCVTMSG, PAS_SmsTagDict.Items[sKey].TAGVAL,
//                                               CHG_DATE_DASH_ADD(PAS_SmsTagDict.Items[sKey].TAGVAL),
//                                               [rfReplaceAll, rfIgnoreCase]);

        End;

        // ���鰪 ���� ..
        While ContainsText(sCVTMSG, #$D#$A#$D#$A#$D#$A) Do
        Begin
          sCVTMSG := StringReplace(sCVTMSG, #$D#$A#$D#$A#$D#$A , #$D#$A#$D#$A, [rfReplaceAll, rfIgnoreCase]);
        End;

        // ���鰪 ���� ..
        While ContainsText(sCVTMSG, #$A#$A#$A) Do
        Begin
          sCVTMSG := StringReplace(sCVTMSG, #$A#$A#$A , #$A#$A, [rfReplaceAll, rfIgnoreCase]);
        End;

        asgSMS.Cells[Ord(fsSELSEQ), iStrCnt+1] := IntToStr(iStrCnt+1);
        asgSMS.Cells[Ord(fsVIZTNM), iStrCnt+1] := FieldByName('VIZTUSNM').AsString;
        asgSMS.Cells[Ord(fsBKSTAT), iStrCnt+1] := FieldByName('BOOKSTAT').AsString;
        asgSMS.Cells[Ord(fsDTLINE), iStrCnt+1] := FieldByName('DEPTLINE').AsString;
        asgSMS.Cells[Ord(fsDTDATE), iStrCnt+1] := FieldByName('DEPTDATE').AsString;
        asgSMS.Cells[Ord(fsDTSHIP), iStrCnt+1] := FieldByName('DEPTSHIP').AsString;
        asgSMS.Cells[Ord(fsTELNUM), iStrCnt+1] := sTELENUMB;
        asgSMS.Cells[Ord(fsSNDMSG), iStrCnt+1] := sCVTMSG;
        asgSMS.Cells[Ord(fsBKNUMB), iStrCnt+1] := FieldByName('BOOKDATE').AsString + '-' +
                                                  FormatFloat('00#', FieldByName('BOOKSEQ3').AsFloat) + '-' +
                                                  FormatFloat('00#', FieldByName('COMMSEQ3').AsFloat);
        asgSMS.Cells[Ord(fsTMPCOD), iStrCnt+1] := sTMPCOD;
        asgSMS.Cells[Ord(fsTABGBN), iStrCnt+1] := sFOMGBN+'/'+sDETGBN;
        asgSMS.Cells[Ord(fsBOKDAT), iStrCnt+1] := FieldByName('BOOKDATE').AsString;
        asgSMS.Cells[Ord(fsBOKSEQ), iStrCnt+1] := FieldByName('BOOKSEQ3').AsString;
        asgSMS.Cells[Ord(fsCOMSEQ), iStrCnt+1] := FieldByName('COMMSEQ3').AsString;
      End;

      asgSMS.RowCount := iStrCnt + 2;

      //[ 3. �̺�ȯ �ڷ� �ȳ� ]
      if ContainsText(sCVTMSG, '#{') then
         begin
           ShowMessage('��ȯ�� ���� ���� ������ �����մϴ�.' + #13#10 + '�̸����� �޸� ����');
           memTMPMSG.Lines.Text := sCVTMSG;
           pnlCVRTFAIL.Visible := True;
           pnlCVRTFAIL.Caption := '�̺�ȯ�ڷ�';
           Exit;
         end
      else
      //[ 4. ����޽��� ��� (���� �ο��� ��ȯ) ]
      if iStrCnt = 0 then
         memTMPMSG.Lines.Text := sCVTMSG;
    End;
  Finally
    FreeAndNil(PAS_SmsTagDict);
  End;
end;

procedure TSMS_PAS.gp_INIT_HEAD;
begin
  up_INIT_PNL_HISTORY;
  up_INIT_PNL_TEMPLATE;
  up_INIT_PNL_PREVIEW;
  up_INIT_WRITE_AREA;
end;

procedure TSMS_PAS.up_INIT_PNL_HISTORY;
begin
  CLEAR_BOX_PAS(pnlHISTORY);

  up_INIT_GRID_HIS;
end;

procedure TSMS_PAS.up_INIT_PNL_TEMPLATE;
begin
  CLEAR_BOX_PAS(pnlTEMPLATE);

  up_INIT_GRID_FMB;
  up_INIT_GRID_SMS;

  //���ø�(HEAD) - PSSMSFMH - ����Ʈ ����
  up_SET_FMH_LIST;
end;

procedure TSMS_PAS.up_INIT_PNL_PREVIEW;
begin
  CLEAR_BOX_PAS(pnlPREVIEW);
  pnlCVRTFAIL.Visible := False;
  pnlCVRTFAIL.Caption := '';
end;

procedure TSMS_PAS.up_INIT_WRITE_AREA;
begin
  CLEAR_BOX_PAS(pnlADDFARE);
  CLEAR_BOX_PAS(pnlCCLSHIP);
  CLEAR_BOX_PAS(pnlCHGTIME);

  pnlADDFARE.Enabled := False;
  pnlCCLSHIP.Enabled := False;
  pnlCHGTIME.Enabled := False;

  pnlADDFARE.Color := clWhite;
  pnlCCLSHIP.Color := clWhite;
  pnlCHGTIME.Color := clWhite;

  up_INIT_WRITE_EDIT;
end;

procedure TSMS_PAS.up_INIT_WRITE_EDIT;
begin
  chkADDReason1.Enabled            := False;
  chkADDReason2.Enabled            := False;
  edtADDAmount.Enabled             := False;
  edtCCLReason.Enabled             := False;
  edtCHGReason.Enabled             := False;
  mdtCHGBoardProcLastTime.Enabled  := False;
  mdtCHGEntryTime.Enabled          := False;
  mdtCHGDeptTime.Enabled           := False;
  mdtCHGTketProcTime.Enabled       := False;
  mdtCHGBaggProcTime.Enabled       := False;
  mdtCHGBoardProcTime.Enabled      := False;

  //chkADDReason1.Color            := clWhite; //�׸�������
  //chkADDReason2.Color            := clWhite; //�׸�������
  edtADDAmount.Color             := clWhite;
  edtCCLReason.Color             := clWhite;
  edtCHGReason.Color             := clWhite;
  mdtCHGBoardProcLastTime.Color  := clWhite;
  mdtCHGEntryTime.Color          := clWhite;
  mdtCHGDeptTime.Color           := clWhite;
  mdtCHGTketProcTime.Color       := clWhite;
  mdtCHGBaggProcTime.Color       := clWhite;
  mdtCHGBoardProcTime.Color      := clWhite;
end;

procedure TSMS_PAS.up_INIT_GRID_HIS; //�̷±׸��� �ʱ�ȭ
begin
  With asgHIS Do
  Begin
    ASG_CLEAR(asgHIS, 0, 1, 0, 0);
    RowCount :=  2;
    ColCount := 12;

    Cells[Ord(fhSELSEQ), 0] := '����';
    Cells[Ord(fhRLTNAM), 0] := '���۰��';
    Cells[Ord(fhPOPDAT), 0] := '�����Ͻ�(�˺�)';
    Cells[Ord(fhSTSNAM), 0] := '���ۻ���';
    Cells[Ord(fhTABNAM), 0] := '���۱���';
    Cells[Ord(fhMSGDAT), 0] := '�����Ͻ�(ERP)';
    Cells[Ord(fhRECDAT), 0] := '�����Ͻ�(�˺�)';
    Cells[Ord(fhTEMPCD), 0] := '���ø��ڵ�';
    //
    Cells[Ord(fhMSGCOD), 0] := '����KEY';
    Cells[Ord(fhMSGTXT), 0] := '���۳���';
    Cells[Ord(fhRCVNAM), 0] := '����';
    Cells[Ord(fhRCVNUM), 0] := '��ȣ';

    ColWidths[Ord(fhSELSEQ)] := 40;
    ColWidths[Ord(fhRLTNAM)] := 100;
    ColWidths[Ord(fhPOPDAT)] := 140;
    ColWidths[Ord(fhSTSNAM)] := 100;
    ColWidths[Ord(fhTABNAM)] := 140;
    ColWidths[Ord(fhMSGDAT)] := 145;
    ColWidths[Ord(fhRECDAT)] := 145;
    ColWidths[Ord(fhTEMPCD)] := 110;
    //
    ColWidths[Ord(fhMSGCOD)] := 0;
    ColWidths[Ord(fhMSGTXT)] := 0;
    ColWidths[Ord(fhRCVNAM)] := 0;
    ColWidths[Ord(fhRCVNUM)] := 0;
  End;
end;

procedure TSMS_PAS.up_INIT_GRID_FMB; //���ø��׸��� �ʱ�ȭ
begin
  With asgFMB Do
  Begin
    ASG_CLEAR(asgFMB, 0, 1, 0, 0);
    RowCount := 2;
    ColCount := 8;

    Cells[Ord(fbSELSEQ), 0] := '����';
    Cells[Ord(fbFOMNAM), 0] := '����';
    Cells[Ord(fbDETNAM), 0] := '�󼼱���';
    Cells[Ord(fbTMPMSG), 0] := '���ø�';
    //
    Cells[Ord(fbFOMGBN), 0] := '������';
    Cells[Ord(fbDETGBN), 0] := '�󼼱���';
    Cells[Ord(fbTMPCOD), 0] := '���ø��ڵ�';
    Cells[Ord(fbFIXLIN), 0] := '�����׷�';

    ColWidths[Ord(fbSELSEQ)] := 40;
    ColWidths[Ord(fbFOMNAM)] := 120;
    ColWidths[Ord(fbDETNAM)] := 200;
    ColWidths[Ord(fbTMPMSG)] := 250;
    //
    ColWidths[Ord(fbFOMGBN)] := 0;
    ColWidths[Ord(fbDETGBN)] := 0;
    ColWidths[Ord(fbTMPCOD)] := 0;
    ColWidths[Ord(fbFIXLIN)] := 0;
  End;
end;

procedure TSMS_PAS.up_INIT_GRID_SMS; //SMS���۱׸��� �ʱ�ȭ
begin
  asgSMS.Align := alCustom;
  asgSMS.Visible := False;

  With asgSMS Do
  Begin
    ASG_CLEAR(asgSMS, 0, 1, 0, 0);
    RowCount := 2;
    ColCount :=14;

    Cells[Ord(fsSELSEQ), 0] := '����';
    Cells[Ord(fsVIZTNM), 0] := '����';
    Cells[Ord(fsBKSTAT), 0] := '����';
    Cells[Ord(fsDTLINE), 0] := '�׷�';
    Cells[Ord(fsDTDATE), 0] := '�����';
    Cells[Ord(fsDTSHIP), 0] := '����';
    Cells[Ord(fsTELNUM), 0] := '��ȭ��ȣ';
    Cells[Ord(fsSNDMSG), 0] := '���۸޽���';
    Cells[Ord(fsBKNUMB), 0] := '�����ȣ';
    //
    Cells[Ord(fsTMPCOD), 0] := '���ø��ڵ�';
    Cells[Ord(fsTABGBN), 0] := '�Ǳ�����';
    Cells[Ord(fsBOKDAT), 0] := '��������';
    Cells[Ord(fsBOKSEQ), 0] := '�����ȣ';
    Cells[Ord(fsCOMSEQ), 0] := '����';

    ColWidths[Ord(fsSELSEQ)] := 40;
    ColWidths[Ord(fsVIZTNM)] := 100;
    ColWidths[Ord(fsBKSTAT)] := 40;
    ColWidths[Ord(fsDTLINE)] := 40;
    ColWidths[Ord(fsDTDATE)] := 80;
    ColWidths[Ord(fsDTSHIP)] := 40;
    ColWidths[Ord(fsTELNUM)] := 100;
    ColWidths[Ord(fsSNDMSG)] := 250;
    ColWidths[Ord(fsBKNUMB)] := 140;
    //
    ColWidths[Ord(fsTMPCOD)] := 0;
    ColWidths[Ord(fsTABGBN)] := 0;
    ColWidths[Ord(fsBOKDAT)] := 0;
    ColWidths[Ord(fsBOKSEQ)] := 0;
    ColWidths[Ord(fsCOMSEQ)] := 0;
  End;
end;

// KAKAO SMS - ����(Dictionary) ����, ������ 1������( '#{...}' )
procedure TSMS_PAS.SET_SMSTAG;
var pSmsTag : TSmsTag;
begin
  With MainDM.QMASTER Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add('  SELECT *                            ');
    SQL.Add('    FROM PSSMSTAG                     ');
    SQL.Add('   WHERE NVL(USEFLG, ''N'') = ''Y''   ');
    SQL.Add('   ORDER BY TAGSEQ                    ');
    Open;

    if not Assigned(PAS_SmsTagDict) then
       PAS_SmsTagDict := TDictionary<String, TSmsTag>.Create
    else
    begin
      FreeAndNil(PAS_SmsTagDict);
      PAS_SmsTagDict := TDictionary<String, TSmsTag>.Create;
    end;

    While Not Eof Do
    Begin
      pSmsTag := TSmsTag.Create;
      pSmsTag.TAGCOD := FieldByName('TAGCOD').AsString;
      pSmsTag.TAGTYP := FieldByName('TAGTYP').AsString;
      pSmsTag.TAGGBN := FieldByName('TAGGBN').AsString;
      pSmsTag.TAGVAL := FieldByName('TAGVAL').AsString;

      PAS_SmsTagDict.TryAdd(pSmsTag.TAGCOD+pSmsTag.TAGGBN, pSmsTag);

      Next;
    End;
  End;
end;

{==============================================================================
   �˺� : īī���˸���
          PAPPNAM : �˸��������� (��: ǰ�Ǽ�, ��������, ȸ�Ƿ� ��)
          PRPTNAM : �˸���������
          PSENDER : ������ ��
          PUSERID : ������ ID
          PAPPGBN : �������� (R.��û S.���ΰ�� A.��������)
          PAPPRLT : ���ڰ��� ����/�ݷ����� �� S.���ΰ�� �̿� ����ó��
          PRLTRMK : ���ڰ��� ����/�ݷ����� �� ���û��� �� S.���ΰ�� �̿� ����ó��
 ------------------------------------------------------------------------------}
function  TSMS_PAS.POPBILL_KAKAO_SEND_PAS(PRCVNUM, PRCVNAM, PTEMPCD, PMSGTXT, PREPTXT, PREPTYP, PTABKEY, PTABGBN, PUSERID : String; PBOKSEQ,PCOMSEQ,PSMSSEQ:Integer): Boolean;
var LS_MSGCOD, LS_SNDDAT : String;
begin
{
  Result := False;
  POPBILL_ERRMSG := '';

  LS_SNDDAT := TimeToStr(Now);
  Try
    With  MainDM.QMASTER  do
    begin
      LS_MSGCOD := 'PUKWAN' + Copy(LS_SNDDAT, 1, 4) + Copy(LS_SNDDAT, 6, 2) + Copy(LS_SNDDAT, 9, 2) + '-' + FormatFloat('0000000000', CALL_NUMBER('POPBILL', '', Copy(LS_SNDDAT, 1, 10)));

      Close;
      SQL.Clear;
      SQL.ADD(' INSERT INTO PKMSGMST                                         ');
      SQL.ADD('      ( MSGCOD,  MSGTYP,  RCVNUM,  RCVNAM,  TEMPCD,  MSGTXT,  ');
      SQL.ADD('        REPTXT,  REPTYP,  MSGUSR,  MSGDAT,  RECNUM,  RECDAT,  ');
      SQL.ADD('        POPSTS,  POPRLT,  POPDAT,  TABKEY,  TABGBN,  RCVUSR,  ');
      SQL.ADD('        KEYNO1,  KEYNO2,  KEYNO3   )                          ');
      SQL.ADD(' VALUES                                                       ');
      SQL.ADD('      (:MSGCOD, :MSGTYP, :RCVNUM, :RCVNAM, :TEMPCD, :MSGTXT,  ');
      SQL.ADD('       :REPTXT, :REPTYP, :MSGUSR, :MSGDAT, :RECNUM, :RECDAT,  ');
      SQL.ADD('       :POPSTS, :POPRLT, :POPDAT, :TABKEY, :TABGBN, :RCVUSR,  ');
      SQL.ADD('       :KEYNO1, :KEYNO2, :KEYNO3   )                          ');
      ParamByName('MSGCOD').AsString := LS_MSGCOD;
      ParamByName('MSGTYP').AsString := 'K';
      ParamByName('RCVNUM').AsString := PRCVNUM;
      ParamByName('RCVNAM').AsString := PRCVNAM;
      ParamByName('TEMPCD').AsString := PTEMPCD;
      ParamByName('MSGTXT').AsWideMemo := PMSGTXT;
      ParamByName('REPTXT').AsWideMemo := PREPTXT;
      ParamByName('REPTYP').AsString := PREPTYP;         //��ü��������-����:������ , C:�˸���(MSGTXT) A:��ü����(REPTXT)
      ParamByName('MSGUSR').AsString := 'ADMIN'; //MASTER_USERID;
      ParamByName('MSGDAT').AsString := LS_SNDDAT;
      ParamByName('RECNUM').AsString := '';
      ParamByName('RECDAT').AsString := '';
      ParamByName('POPSTS').AsString := '9';
      ParamByName('POPRLT').AsString := '';
      ParamByName('POPDAT').AsString := '';
      ParamByName('TABKEY').AsString := PTABKEY;
      ParamByName('TABGBN').AsString := PTABGBN;
      ParamByName('RCVUSR').AsString := PUSERID;
      ParamByName('KEYNO1').AsInteger := PBOKSEQ;
      ParamByName('KEYNO2').AsInteger := PCOMSEQ;
      ParamByName('KEYNO3').AsInteger := PSMSSEQ;

      ExecSQL;
    end;
  Except
    On E:Exception Do
    Begin
      POPBILL_ERRMSG := '�˸������ۿ���: ' + E.Message;
      Exit;
    End;
  end;

  Result := True;
}
end;

// ���ڸ� ����
function TSMS_PAS.ExtractInt(Astring:String):String;
var
  i : integer;
  TempString:String;
begin
  TempString := '';
  Astring := Trim(Astring);

  if Astring <> '' then
    for i := 1 to Length(Astring) do
      if (Astring[I] in ['0'..'9']) then
        TempString := TempString+Astring[I];
  Result := Trim(TempString);
end;

// IF ���� ���� ǥ��
function TSMS_PAS.IF_RETURN_PAS(Expression: Boolean; ValueTrue, ValueFalse: Variant): Variant;
begin
  if Expression then
    Result := ValueTrue
  else
    Result := ValueFalse;
end;

// ������ Panel�� ��� Edit ���� Clear
procedure TSMS_PAS.CLEAR_BOX_PAS(PMPBOX: TObject);
var iRow : Integer;
begin
  if PMPBOX is TPanel then begin
    with PMPBOX as TPanel do begin
      for iRow := 0 to ControlCount - 1 do begin
        if Controls[iRow] is TEdit then //�⺻ ������Ʈ
          TEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Text := ''
        else if Controls[iRow] is TStaticText then
          TStaticText(Controls[iRow]).Caption := ''
        else if Controls[iRow] is TCheckBox then
          TCheckBox(Controls[iRow]).Checked := False
        else if Controls[iRow] is THTMLCheckBox then
          THTMLCheckBox(Controls[iRow]).Checked := False
        else if Controls[iRow] is TRadioButton then
          TRadioButton(Controls[iRow]).Checked := False
        else if Controls[iRow] is TComBobox then
          //TCombobox(Controls[iRow]).Text := ''
          TCombobox(Controls[iRow]).ItemIndex := -1
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).text := ''
        else if Controls[iRow] is TMemo then
          TMemo(Controls[iRow]).Clear
        else if Controls[iRow] is TDateEdit then
          TDateEdit(Controls[iRow]).Date := Now
        else if Controls[iRow] is TCurrencyEdit then
          TCurrencyEdit(Controls[iRow]).Value := 0
        else if Controls[iRow] is TAdvComboBox then
          TAdvComboBox(Controls[iRow]).ItemIndex := -1
        else if Controls[iRow] is TPanel then //�����г��� �⺻ ������Ʈ �ǳ� !!
          CLEAR_BOX_PAS(Controls[iRow]);

        if Controls[iRow] is TEdit then //�⺻ ������Ʈ
          TEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Hint := '';
      end;
    end;
  end;
  if PMPBOX is TGroupBox then begin
    with PMPBOX as TGroupBox do begin
      for iRow := 0 to ControlCount - 1 do begin
        if Controls[iRow] is TEdit then //�⺻ ������Ʈ
          TEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Text := ''
        else if Controls[iRow] is TStaticText then
          TStaticText(Controls[iRow]).Caption := ''
        else if Controls[iRow] is TCheckBox then
          TCheckBox(Controls[iRow]).Checked := False
        else if Controls[iRow] is TComBobox then
          //TCombobox(Controls[iRow]).Text := ''
          TCombobox(Controls[iRow]).ItemIndex := -1
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).text := ''
        else if Controls[iRow] is TMemo then
          TMemo(Controls[iRow]).Clear
        else if Controls[iRow] is TDateEdit then
          TDateEdit(Controls[iRow]).Date := Now
        else if Controls[iRow] is TCurrencyEdit then
          TCurrencyEdit(Controls[iRow]).Value := 0
        else if Controls[iRow] is TAdvComboBox then
          TAdvComboBox(Controls[iRow]).ItemIndex := -1;

        if Controls[iRow] is TEdit then //�⺻ ������Ʈ
          TEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Hint := '';

      end;
    end;
  end;

 if PMPBOX is TStackPanel then begin
    with PMPBOX as TStackPanel do begin
      for iRow := 0 to ControlCount - 1 do begin
        if Controls[iRow] is TPanel then //�����г��� �⺻ ������Ʈ �ǳ� !!
           CLEAR_BOX_PAS(Controls[iRow])
        else
        if Controls[iRow] is TEdit then
          TEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Text := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Text := ''
        else if Controls[iRow] is TStaticText then
          TStaticText(Controls[iRow]).Caption := ''
        else if Controls[iRow] is TCheckBox then
          TCheckBox(Controls[iRow]).Checked := False
        else if Controls[iRow] is THTMLCheckBox then
          THTMLCheckBox(Controls[iRow]).Checked := False
        else if Controls[iRow] is TRadioButton then
          TRadioButton(Controls[iRow]).Checked := False
        else if Controls[iRow] is TComBobox then
          //TCombobox(Controls[iRow]).Text := ''
          TCombobox(Controls[iRow]).ItemIndex := -1
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).text := ''
        else if Controls[iRow] is TMemo then
          TMemo(Controls[iRow]).Clear
        else if Controls[iRow] is TDateEdit then
          TDateEdit(Controls[iRow]).Date := Now
        else if Controls[iRow] is TCurrencyEdit then
          TCurrencyEdit(Controls[iRow]).Value := 0
        else if Controls[iRow] is TAdvComboBox then
          TAdvComboBox(Controls[iRow]).ItemIndex := -1;

        if Controls[iRow] is TEdit then //�⺻ ������Ʈ
          TEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TMaskEdit then
          TMaskEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TAdvEdit then
          TAdvEdit(Controls[iRow]).Hint := ''
        else if Controls[iRow] is TEditBtn then
          TEditBtn(Controls[iRow]).Hint := '';
      end;
    end;
  end;
end;

{------------------------------------------------------------------------------
  �׸��� �ʱ�ȭ
 ------------------------------------------------------------------------------}
procedure TSMS_PAS.ASG_CLEAR(var PGRID : TAdvStringGrid; PSC, PSR, PEC, PER : Integer);
var  CC, RR : Integer;
begin
  if  PEC = 0 then
      PEC := PGRID.ColCount - 1;
  if  PER = 0 then
      PER := PGRID.RowCount - 1;
  With  PGRID do
  begin
    ClearRect(PSC, PSR, PEC, PER);
    RowCount := PSR + 1;
    Row := PSR;
    Col := PSC;
  end;
end;

{------------------------------------------------------------------------------
   ���� -> ����(Double) ��ȯ
 ------------------------------------------------------------------------------}
function  TSMS_PAS.STF(TS: String):Double;
var  i, LI_POINT : Integer;
     STRING_NUMBER : String;
begin
  if  Length(TS) = 0 then
      begin
        Result := 0;
        Exit;
      end;

  LI_POINT := 0;     //�Ҽ����� ó�� �Ҽ����� ������ ������ �������� ����

  STRING_NUMBER := '';

  For  i := 1 to  Length(TS)  do
  begin
    if  TS[i] in ['0'..'9'] then
        STRING_NUMBER := STRING_NUMBER + TS[i]
    else
    if  TS[i] = '-' then
        begin
          if  i = 1 then
              STRING_NUMBER := STRING_NUMBER + TS[i];
        end
    else
    if  TS[i] = '.' then
        begin
          LI_POINT := LI_POINT + 1;
          if  LI_POINT = 1 then
              STRING_NUMBER := STRING_NUMBER + TS[i];
        end;
  end;
  if  STRING_NUMBER = '-' then
      Result := -0
  else
  if  Length(STRING_NUMBER) = 0 then
      Result := 0
  else
      Result := StrToFloat(STRING_NUMBER);
end;

{------------------------------------------------------------------------------
   ���� -> ����(Integer) ��ȯ
 ------------------------------------------------------------------------------}
function  TSMS_PAS.STi(TS: String):Integer;
var  i,l,j,k : Integer;
     String_number : String;
begin
  L := Length(TS);
  if  L = 0 then
      begin
        Result := 0;
        Exit;
      end;

  String_number := ''; j := 0; k := 0;
  For  i := 1 to  l  do
       begin
         if TS[i] in ['-','0'..'9'] then
             begin
               if  (TS[i] = '-') and (i > 1) and (Length(String_number) > 0) then
                   j := 9;
               if  (j <= 1) then
                   String_number := String_number + TS[i];
             end;
       end;
  if  String_number = '-' then
      Result := -0
  else
  if  Length(String_number) = 0 then
      Result := 0
  else
      Result := StrToInt(String_number);
end;

end.

