unit Basic01U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TBASIC01 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRBand4: TQRBand;
    QRBand6: TQRBand;
    QRLabel6: TQRLabel;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlblSELECTNO: TQRLabel;
    qrlblVIZTNUM1: TQRLabel;
    qrlblVIZTUSNM: TQRLabel;
    Query1: TFDQuery;
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
  BASIC01: TBASIC01;

implementation

{$R *.dfm}

procedure TBASIC01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  With Query1 Do
  Begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT TO_DATE(VIZTNUM1, ''YYYY-MM-DD'') VIZTNUM1, VIZTUSNM, VIZTNATL       ');
    SQL.Add('   FROM PSSTTMMB                                                    ');
    SQL.Add('  WHERE BOOKDATE = ''20200106''                                     ');
    SQL.Add('    AND BOOKSEQ3 = ''5''                                            ');
    Open;

    if Query1.isEmpty then Exit;

    iDetailCount := Query1.RecordCount;        // 12


    iDetailNum := 1; // 1
  End;
end;

procedure TBASIC01.QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
begin
  if iDetailNum <= iDetailCount then
  begin
    qrlblSELECTNO.Caption := IntToStr(iDetailNum);
    qrlblVIZTNUM1.Caption := Query1.FieldByName('VIZTNUM1').AsString;
    qrlblVIZTUSNM.Caption := Query1.FieldByName('VIZTUSNM').AsString;

    Query1.Next;
    MoreData := True;
    Inc(iDetailNum);
  end
  else
    MoreData := False;
end;

end.
