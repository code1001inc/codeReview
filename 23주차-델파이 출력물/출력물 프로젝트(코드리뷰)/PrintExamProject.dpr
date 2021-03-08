program PrintExamProject;

uses
  Vcl.Forms,
  MainFormU in 'MainFormU.pas' {MainForm},
  BASIC01U in '01. BASIC\BASIC01U.pas' {BASIC01},
  DETAIL02U in '02. DETAIL\DETAIL02U.pas' {DETAIL02},
  DETAIL01U in '02. DETAIL\DETAIL01U.pas' {DETAIL01},
  ETC01U in '03. ETC\ETC01U.pas' {ETC01},
  BASIC02U in '01. BASIC\BASIC02U.pas' {BASIC02};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TBASIC01, BASIC01);
  Application.CreateForm(TDETAIL02, DETAIL02);
  Application.CreateForm(TDETAIL01, DETAIL01);
  Application.CreateForm(TETC01, ETC01);
  Application.CreateForm(TBASIC02, BASIC02);
  Application.Run;
end.
