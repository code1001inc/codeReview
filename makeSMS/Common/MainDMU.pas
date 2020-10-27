unit MainDMU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.Oracle,
  FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Moni.Base, FireDAC.Moni.RemoteClient;

type
  TMainDM = class(TDataModule)
    MainDB: TFDConnection;
    QMASTER: TFDQuery;
    QLOG: TFDQuery;
    QCOMMON: TFDQuery;
    QBILL: TFDQuery;
    QALRIM: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainDM: TMainDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TMainDM.DataModuleCreate(Sender: TObject);
begin
  MainDB.Params.Database := '211.221.3.61:1521/pkinc';

  if NOT MainDB.Connected Then MainDB.Connected := True;
end;

end.
