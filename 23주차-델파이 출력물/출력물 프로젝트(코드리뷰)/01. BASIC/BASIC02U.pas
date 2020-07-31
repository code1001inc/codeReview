unit BASIC02U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QRCtrls, QuickRpt, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TBASIC02 = class(TForm)
    QuickRep1: TQuickRep;
    Query1: TFDQuery;
    QRLoopBand1: TQRLoopBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrlblSELECTNO: TQRLabel;
    qrlblVIZTNUM1: TQRLabel;
    qrlblVIZTUSNM: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iDetailNum : Integer;
    iDetailCount : Integer;
  public
    { Public declarations }
  end;

var
  BASIC02: TBASIC02;

implementation

{$R *.dfm}

procedure TBASIC02.FormCreate(Sender: TObject);
begin
  QuickRep1.Page.Columns := 3;  // Page 나누기..
  QRLoopBand1.PrintCount := 30; // Loop 돌릴 횟수
end;

procedure TBASIC02.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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
    SQL.Add('    AND LISTSEQ3 = ''1''                                                      ');
    Open;

    if Query1.isEmpty then Exit;

    qrlblSELECTNO.Caption := IntToStr(iDetailNum);
    qrlblVIZTNUM1.Caption := Query1.FieldByName('VIZTNUM1').AsString;
    qrlblVIZTUSNM.Caption := Query1.FieldByName('VIZTUSNM').AsString;
  End;
end;

end.
