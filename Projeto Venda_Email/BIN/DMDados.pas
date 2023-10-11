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
  Tdm = class(TDataModule)
    FDConnection1: TFDConnection;
    stInsereUsuario: TFDStoredProc;
    qryLogin: TFDQuery;
    dsLogin: TDataSource;
    stAtualizaUsu: TFDStoredProc;
    stExcluiUsu: TFDStoredProc;
    qryUsuario: TFDQuery;
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
    qryLoginID_USU: TFDAutoIncField;
    qryLoginNOME_USU: TStringField;
    qryLoginSENHA_USU: TStringField;
    qryUsuarioID_USU: TFDAutoIncField;
    qryUsuarioNOME_USU: TStringField;
    qryUsuarioSENHA_USU: TStringField;
    qryVenda: TFDQuery;
    dsVenda: TDataSource;
    qryVendaCod_Venda: TIntegerField;
    qryVendaID_Venda: TFDAutoIncField;
    qryVendaNM_Produto: TStringField;
    qryVendaNM_Cliente: TStringField;
    qryVendaQTD_Venda: TIntegerField;
    qryVendaVl_venda: TCurrencyField;
    qryVendaDT_Venda: TSQLTimeStampField;
    qryTotVenda: TFDQuery;
    dsTotVenda: TDataSource;
    qryTotVendatotal: TCurrencyField;
    qryTotVendaCod_Venda: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
