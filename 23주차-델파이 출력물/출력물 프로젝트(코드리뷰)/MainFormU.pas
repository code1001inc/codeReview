unit MainFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.Menus;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    BASICMENU: TMenuItem;
    BASICSUB01: TMenuItem;
    BASICSUB02: TMenuItem;
    DETAILMENU: TMenuItem;
    DETAILSUB01: TMenuItem;
    DETAILSUB02: TMenuItem;
    MainDB: TFDConnection;
    ETCMENU: TMenuItem;
    ETCSUB01: TMenuItem;
    procedure BASICSUB01Click(Sender: TObject);
    procedure BASICSUB02Click(Sender: TObject);
    procedure DETAILSUB01Click(Sender: TObject);
    procedure DETAILSUB02Click(Sender: TObject);
    procedure ETCSUB01Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses DETAIL01U, BASIC01U, BASIC02U, ETC01U, DETAIL02U;

procedure TMainForm.DETAILSUB01Click(Sender: TObject);
begin
//
  Screen.Cursor := crHourGlass;
  Try
    DETAIL01 := TDETAIL01.Create(Application);

    DETAIL01.QuickRep1.PreviewInitialState := wsMaximized;
    DETAIL01.QuickRep1.Preview;
  Finally
    DETAIL01.Close;
    DETAIL01.Release;
    Screen.Cursor := crDefault;
  End;
end;

procedure TMainForm.BASICSUB01Click(Sender: TObject);
begin
//
  Screen.Cursor := crHourGlass;
  Try
    BASIC01 := TBASIC01.Create(Application);

    BASIC01.QuickRep1.PreviewInitialState := wsMaximized;
    BASIC01.QuickRep1.Preview;
  Finally
    BASIC01.Close;
    BASIC01.Release;
    Screen.Cursor := crDefault;
  End;
end;

procedure TMainForm.BASICSUB02Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Try
    BASIC02 := TBASIC02.Create(Application);

    BASIC02.QuickRep1.PreviewInitialState := wsMaximized;
    BASIC02.QuickRep1.Preview;
  Finally
    BASIC02.Close;
    BASIC02.Release;
    Screen.Cursor := crDefault;
  End;
end;

procedure TMainForm.DETAILSUB02Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Try
    DETAIL02 := TDETAIL02.Create(Application);

    DETAIL02.QuickRep1.PreviewInitialState := wsMaximized;
    DETAIL02.QuickRep1.Preview;
  Finally
    DETAIL02.Close;
    DETAIL02.Release;
    Screen.Cursor := crDefault;
  End;
end;

procedure TMainForm.ETCSUB01Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Try
    ETC01 := TETC01.Create(Application);

    ETC01.QuickRep1.PreviewInitialState := wsMaximized;
    ETC01.QuickRep1.Preview;
  Finally
    ETC01.Close;
    ETC01.Release;
    Screen.Cursor := crDefault;
  End;
end;

end.
