unit DETAIL01U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDETAIL01 = class(TForm)
    QuickRep1: TQuickRep;
    Query1: TFDQuery;
    QRBand4: TQRBand;
    QRShape1: TQRShape;
    qrlblSELECTNO: TQRLabel;
    qrlblVIZTNUM1: TQRLabel;
    qrlblVIZTUSNM: TQRLabel;
    QRShape5: TQRShape;
    qrsSELECTNO_UNDERLINE: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    iDetailNum : Integer;
    iDetailCount : Integer;
  public
    { Public declarations }
  end;

var
  DETAIL01: TDETAIL01;

implementation

{$R *.dfm}

procedure TDETAIL01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  With Query1 Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT TO_DATE(VIZTNUM1, ''YYYY-MM-DD'') VIZTNUM1, VIZTUSNM, VIZTNATL        ');
    SQL.Add('   FROM PSSTTMMB                                                              ');
    SQL.Add('  WHERE BOOKDATE = ''20200106''                                               ');
    SQL.Add('    AND BOOKSEQ3 = ''5''                                                      ');
    Open;

    if Query1.isEmpty then Exit;

    iDetailCount := Query1.RecordCount;

    iDetailNum := 1;
  End;
end;

procedure TDETAIL01.QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
begin
  if iDetailNum <= iDetailCount then
  begin
    qrlblSELECTNO.Caption := IntToStr(iDetailNum);
    qrlblVIZTNUM1.Caption := Query1.FieldByName('VIZTNUM1').AsString;
    qrlblVIZTUSNM.Caption := Query1.FieldByName('VIZTUSNM').AsString;

//    if iDetailNum MOD 2 = 1 then
//       qrsSELECTNO_UNDERLINE.Enabled := True
//    else
//       qrsS8ELECTNO_UNDERLINE.Enabled := False;

    Query1.Next;
    MoreData := True;
    Inc(iDetailNum);
  end
  else
    MoreData := False;
end;

end.
