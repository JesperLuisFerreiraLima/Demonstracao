unit demonstracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  uImportExcel;

type
  TForm1 = class(TForm)
    btnImportar: TButton;
    btnExportar: TButton;
    Inserir: TButton;
    btnAlterar: TButton;
    btn_excluir: TButton;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    FDConnection1: TFDConnection;
    ImPExcel: TImportExcel;
    opImporta: TOpenDialog;
    dbimporta: TStringGrid;
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnImportarClick(Sender: TObject);
begin
 if opImporta.execute then
 begin
   ImPExcel.ExcelFile:= opImporta.FileName;
   ImPExcel.ExcelParaStringGrid(dbimporta, nil);
 end;

end;

end.
