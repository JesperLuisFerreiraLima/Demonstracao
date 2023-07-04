unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvXPCore, JvXPButtons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TfrmCliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    edtEmail: TEdit;
    btnInserir: TJvXPButton;
    btnAtualizar: TJvXPButton;
    btnExluir: TJvXPButton;
    dbCliente: TDBGrid;
    Image1: TImage;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

{$R *.dfm}

uses DMDados;

procedure TfrmCliente.btnAtualizarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja atualizar?', 'Aten��o',
    mb_yesno + mb_iconquestion) = id_yes then
  begin
    with DMDados.Dm.stAtualizaCliente do
    begin
      close;
      ParamByName('@id').Value := dbCliente.Fields[0].Value;
      ParamByName('@nome').Value := dbCliente.Fields[1].Value;
      ParamByName('@email').Value := dbCliente.Fields[2].Value;
      ExecProc;
      Application.MessageBox('Cliente Atualizado!', 'Sucesso',
        MB_ICONEXCLAMATION);

    end;
  end
  else
    Application.MessageBox('Cliente n�o Atualizado', 'Aten��o',
      MB_ICONEXCLAMATION);

  with Dm.qryCliente do
  begin
    close;
    Open();
  end;

end;

procedure TfrmCliente.btnExluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja apagar?', 'Aten��o',
    mb_yesno + mb_iconquestion) = id_yes then
  begin
    with DMDados.Dm.stExcluiCliente do
    begin
      close;
      ParamByName('@id').Value := dbCliente.Fields[0].Value;
      ParamByName('@nome').Value := dbCliente.Fields[1].Value;
      ParamByName('@email').Value := dbCliente.Fields[2].Value;
      ExecProc;
      Application.MessageBox('Cliente apagado!', 'Sucesso', MB_ICONEXCLAMATION);

    end;
  end
  else
    Application.MessageBox('Cliente n�o apagado', 'Aten��o',
      MB_ICONEXCLAMATION);

  with Dm.qryCliente do
  begin
    close;
    Open();
  end;
end;

procedure TfrmCliente.btnInserirClick(Sender: TObject);
begin
  if edtNome.Text = '' then
  begin
    Application.MessageBox('Campo Nome Vazio!', 'Aten��o', MB_OK);
    edtNome.SetFocus;
  end
  else if edtEmail.Text = '' then
  begin
    Application.MessageBox('Campo email Vazio!', 'Aten��o', MB_OK);
    edtEmail.SetFocus;
  end
  else
  begin
    with DMDados.Dm.stInsereCliente do
    begin
      close;
      ParamByName('@nome').Value := edtNome.Text;
      ParamByName('@email').Value := edtEmail.Text;
      ExecProc;

      Application.MessageBox('Cliente Inserido com sucesso!', 'Sucesso',
        MB_ICONEXCLAMATION)
    end;
  end;

  with Dm.qryCliente do
  begin
    close;
    Open();
  end;
end;

procedure TfrmCliente.FormActivate(Sender: TObject);
begin
  with Dm.qryCliente do
  begin
    close;
    Open();
  end;
end;

end.
