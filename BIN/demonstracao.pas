unit demonstracao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  uImportExcel, Vcl.ComCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, JvExControls, JvXPCore, JvXPButtons;

type
  TForm1 = class(TForm)
    dbresultado: TDBGrid;
    Label1: TLabel;
    Panel1: TPanel;
    FDConnection1: TFDConnection;
    ImPExcel: TImportExcel;
    opImporta: TOpenDialog;
    dbimporta: TStringGrid;
    st_inseriDados: TFDStoredProc;
    qrySalvar: TFDQuery;
    dsSalvar: TDataSource;
    qrySalvarNm_Pessoa: TStringField;
    qrySalvarIda_Pessoa: TIntegerField;
    qrySalvarSX_Pessoa: TStringField;
    qrySalvarNm_Cargo: TStringField;
    qrySalvarSl_cargo: TCurrencyField;
    qrySalvarID_Pessoa_1: TIntegerField;
    st_atualiza: TFDStoredProc;
    st_exclui: TFDStoredProc;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    btn_alterar: TJvXPButton;
    btn_exclui: TJvXPButton;
    btn_exportar: TJvXPButton;
    btn_mostrar: TJvXPButton;
    btn_Importar: TJvXPButton;
    btn_salvar: TJvXPButton;
    btn_Sair: TJvXPButton;
    procedure btnImportarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure btn_ImportarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluiClick(Sender: TObject);
    procedure btn_exportarClick(Sender: TObject);
    procedure btn_mostrarClick(Sender: TObject);
    procedure btn_SairClick(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAlterarClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja Atualizar ?', 'Atenção',
    4 + MB_ICONEXCLAMATION) = IDYES then
  Begin
    with st_atualiza do
    begin
      close;
      ParamByName('@nome').Value := dbresultado.Fields[1].Value;
      ParamByName('@idade').Value := dbresultado.Fields[2].Value;
      ParamByName('@sexo').Value := dbresultado.Fields[3].Value;
      ParamByName('@cargo').Value := dbresultado.Fields[4].Value;
      ParamByName('@sal').Value := dbresultado.Fields[5].Value;
      ParamByName('@pessoa').Value := dbresultado.Fields[0].Value;
      ExecProc;
    end;
  end
  else
    Abort;
end;

procedure TForm1.btnExportarClick(Sender: TObject);
begin
  ImPExcel.ExportarParaExcel(qrySalvar,
    'Demonstração foi feita com Exito!', []);
end;

procedure TForm1.btnImportarClick(Sender: TObject);
begin
  if opImporta.execute then
  begin
    ImPExcel.ExcelFile := opImporta.FileName;
    ImPExcel.ExcelParaStringGrid(dbimporta, nil);
  end;

  dbimporta.ColWidths[0] := 240; // nome
  dbimporta.ColWidths[1] := 50; // idade
  dbimporta.ColWidths[2] := 50; // sexo
  dbimporta.ColWidths[3] := 120; // cargo
  dbimporta.ColWidths[4] := 85; // salário

end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin

  // verifica se o query está vazio ou não
  with qrySalvar do
  begin
    close;
    Open();

    if (qrySalvar.IsEmpty) then
    begin
      MessageDlg('Nenhum documento importado!', mtInformation, [mbOk], 0, mbOk);
    end

  end;

end;

procedure TForm1.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
var
  i: Integer;
begin
  // Executando a proc para inserir os valores importados
  for i := 1 to dbimporta.RowCount - 1 do
  begin
    with st_inseriDados do
    begin
      close;
      ParamByName('@nome').Value := dbimporta.Cells[0, i];
      ParamByName('@idade').Value := strtoint(dbimporta.Cells[1, i]);
      ParamByName('@sexo').Value := dbimporta.Cells[2, i];
      ParamByName('@cargo').Value := dbimporta.Cells[3, i];
      ParamByName('@sal').Value := dbimporta.Cells[4, i];
      ExecProc;
    end;
  end;

  with qrySalvar do
  begin
    close;
    Open();
  end;

  { // Carregando ClientDataSet para fazer exportação
    with qrySalvar do
    begin
    close;
    Open;
    cliDsExporta.Open;
    qrySalvar.First;

    while not qrySalvar.Eof do
    begin
    cliDsExporta.Append;
    cliDsExportaID_Pessoa := qrySalvarID_Pessoa_1;
    cliDsExportaNM_Pessoa := qrySalvarNm_Pessoa;
    cliDsExportaIda_Pessoa := qrySalvarIda_Pessoa;
    cliDsExportaSX_Pessoa := qrySalvarSX_Pessoa;
    cliDsExportaNM_Cargo := qrySalvarNm_Cargo;
    cliDsExportaSL_Cargo := qrySalvarSl_cargo;
    qrySalvar.Next
    end;
    end; }

end;

procedure TForm1.btn_alterarClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja Atualizar ?', 'Atenção',
    4 + MB_ICONEXCLAMATION) = IDYES then
  Begin
    with st_atualiza do
    begin
      close;
      ParamByName('@nome').Value := dbresultado.Fields[1].Value;
      ParamByName('@idade').Value := dbresultado.Fields[2].Value;
      ParamByName('@sexo').Value := dbresultado.Fields[3].Value;
      ParamByName('@cargo').Value := dbresultado.Fields[4].Value;
      ParamByName('@sal').Value := dbresultado.Fields[5].Value;
      ParamByName('@pessoa').Value := dbresultado.Fields[0].Value;
      ExecProc;
    end;
  end
  else
    Abort;
end;

procedure TForm1.btn_excluiClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja Apagar ?', 'Atenção',
    4 + MB_ICONEXCLAMATION) = IDYES then
  Begin
    with st_exclui do
    begin
      close;
      ParamByName('@pessoa').Value := dbresultado.Fields[0].Value;
      ExecProc;
    end;
  end
  else
    Abort;
  with qrySalvar do
  begin
    close;
    Open();
  end;
end;

procedure TForm1.btn_excluirClick(Sender: TObject);
begin
  If Application.MessageBox('Deseja Apagar ?', 'Atenção',
    4 + MB_ICONEXCLAMATION) = IDYES then
  Begin
    with st_exclui do
    begin
      close;
      ParamByName('@pessoa').Value := dbresultado.Fields[0].Value;
      ExecProc;
    end;
  end
  else
    Abort;
  with qrySalvar do
  begin
    close;
    Open();
  end;
end;

procedure TForm1.btn_exportarClick(Sender: TObject);
begin
  ImPExcel.ExportarParaExcel(qrySalvar,
    'Demonstração foi feita com Exito!', []);
end;

procedure TForm1.btn_ImportarClick(Sender: TObject);
begin
  if opImporta.execute then
  begin
    ImPExcel.ExcelFile := opImporta.FileName;
    ImPExcel.ExcelParaStringGrid(dbimporta, nil);
  end;

  dbimporta.ColWidths[0] := 240; // nome
  dbimporta.ColWidths[1] := 50; // idade
  dbimporta.ColWidths[2] := 50; // sexo
  dbimporta.ColWidths[3] := 120; // cargo
  dbimporta.ColWidths[4] := 85; // salário

end;

procedure TForm1.btn_mostrarClick(Sender: TObject);
begin
  // verifica se o query está vazio ou não
  with qrySalvar do
  begin
    close;
    Open();

    if (qrySalvar.IsEmpty) then
    begin
      MessageDlg('Nenhum documento importado!', mtInformation, [mbOk], 0, mbOk);
    end
  end;
end;

procedure TForm1.btn_SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.btn_salvarClick(Sender: TObject);
var
  i: Integer;
begin
  // Executando a proc para inserir os valores importados
  for i := 1 to dbimporta.RowCount - 1 do
  begin
    with st_inseriDados do
    begin
      close;
      ParamByName('@nome').Value := dbimporta.Cells[0, i];
      ParamByName('@idade').Value := strtoint(dbimporta.Cells[1, i]);
      ParamByName('@sexo').Value := dbimporta.Cells[2, i];
      ParamByName('@cargo').Value := dbimporta.Cells[3, i];
      ParamByName('@sal').Value := dbimporta.Cells[4, i];
      ExecProc;
    end;
  end;

  with qrySalvar do
  begin
    close;
    Open();
  end;
end;

end.
