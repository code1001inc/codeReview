unit ETC01U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls;

type
  TETC01 = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRBand1: TQRBand;
    QRBand4: TQRBand;
    QRBand6: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand5: TQRBand;
    QRLabel7: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand6AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand5AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    iDetailNum : Integer;
    iDetailCount : Integer;
  public
    { Public declarations }
  end;

var
  ETC01: TETC01;

implementation

{$R *.dfm}

procedure TETC01.QRBand1AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Page Header After Print');
end;

procedure TETC01.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Page Header Before Print');
end;

procedure TETC01.QRBand2AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Title After Print');
end;

procedure TETC01.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Title Before Print');
end;

procedure TETC01.QRBand3AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Column Header After Print');
end;

procedure TETC01.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Column Header Before Print');
end;

procedure TETC01.QRBand4AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Detail After Print');
end;

procedure TETC01.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Detail Before Print');
end;

procedure TETC01.QRBand5AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Summary After Print')
end;

procedure TETC01.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Summary Before Print');
end;

procedure TETC01.QRBand6AfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ShowMessage('Page Footer After Print');
end;

procedure TETC01.QRBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  ShowMessage('Page Footer Before Print');
end;

procedure TETC01.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  iDetailNum := 1;
  iDetailCount := 5;  // Detial °¹¼ö
end;

procedure TETC01.QuickRep1NeedData(Sender: TObject; var MoreData: Boolean);
begin
  if iDetailNum <= iDetailCount then
  begin
    MoreData := True;
    Inc(iDetailNum);
  end
  else
    MoreData := False;
end;

end.
