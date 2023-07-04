unit DMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TDm = class(TDataModule)
    FDConnection1: TFDConnection;
    stInsereUsuario: TFDStoredProc;
    qryLogin: TFDQuery;
    qryLoginID_Usuario: TFDAutoIncField;
    qryLoginNM_Usuario: TStringField;
    qryLoginSE_Usuario: TStringField;
    dsLogin: TDataSource;
    stAtualizaUsu: TFDStoredProc;
    stExcluiUsu: TFDStoredProc;
    qryUsuario: TFDQuery;
    qryUsuarioID_Usuario: TFDAutoIncField;
    qryUsuarioNM_Usuario: TStringField;
    qryUsuarioSE_Usuario: TStringField;
    dsUsuario: TDataSource;
    stexcluiProduto: TFDStoredProc;
    stAtualizaProduto: TFDStoredProc;
    stInsereProduto: TFDStoredProc;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    qryProdutoID_Produto: TFDAutoIncField;
    qryProdutoNM_Produto: TStringField;
    qryProdutoVL_Produto: TCurrencyField;
    qryProdutoQTD_Produto: TIntegerField;
    stInsereCliente: TFDStoredProc;
    stAtualizaCliente: TFDStoredProc;
    stExcluiCliente: TFDStoredProc;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryClienteID_Cliente: TFDAutoIncField;
    qryClienteNM_Cliente: TStringField;
    qryClienteEM_Cliente: TStringField;
    qryCodVenda: TFDQuery;
    dsCodVenda: TDataSource;
    qryCodVendaUnnamed1: TIntegerField;
    stInsereVenda: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
