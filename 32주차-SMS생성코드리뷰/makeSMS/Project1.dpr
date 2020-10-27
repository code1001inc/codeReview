program Project1;

uses
  Vcl.Forms,
  Linkhub in 'Linkhub\Linkhub.pas',
  Popbill in 'Popbill\Popbill.pas',
  PopbillKakao in 'PopbillKakao\PopbillKakao.pas',
  MainDMU in 'Common\MainDMU.pas' {MainDM: TDataModule},
  PopbillFax in 'PopbillFax\PopbillFax.pas',
  SMS_PASU in 'SMS_PASU.pas' {SMS_PAS};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainDM, MainDM);
  Application.CreateForm(TSMS_PAS, SMS_PAS);
  Application.Run;
end.
