unit ConfiguracaoUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvExControls, JvXPCore,
  JvXPButtons, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmConfUsuario = class(TForm)
    dbUsuario: TDBGrid;
    btnAtualizar: TJvXPButton;
    btnExcluir: TJvXPButton;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfUsuario: TfrmConfUsuario;

implementation

{$R *.dfm}

uses DMDados;

procedure TfrmConfUsuario.btnAtualizarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Atualizar?', 'Aten��o',
    mb_yesno + mb_iconquestion) = id_yes then
  begin
    with DMDados.Dm.stAtualizaUsu do
    begin
      close;
      ParamByName('@id').Value := dbUsuario.Fields[0].Value;
      ParamByName('@nome').Value := dbUsuario.Fields[1].Value;
      ParamByName('@senha').Value := dbUsuario.Fields[2].Value;
      ExecProc;

      Application.MessageBox('Atualizado com Sucesso?', 'Aten��o',
        mb_iconquestion)
    end;
  end
  else
    Application.MessageBox('N�o atualizado?', 'Aten��o', mb_iconquestion);

  with DMDados.Dm.qryUsuario do
  begin
    close;
    Open();
  end;

end;

procedure TfrmConfUsuario.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir?', 'Aten��o',
    mb_yesno + mb_iconquestion) = id_yes then
  begin
    with DMDados.Dm.stExcluiUsu do
    begin
      close;
      ParamByName('@id').Value := dbUsuario.Fields[0].Value;
      ExecProc;

      Application.MessageBox('Excluido com Sucesso?', 'Aten��o',
        mb_iconquestion)
    end;
  end
  else
    Application.MessageBox('N�o Excluido?', 'Aten��o', mb_iconquestion);

  with DMDados.Dm.qryUsuario do
  begin
    close;
    Open();
  end;

end;

procedure TfrmConfUsuario.FormActivate(Sender: TObject);
begin

  with DMDados.Dm.qryUsuario do
  begin
    close;
    Open();
  end;
end;

end.
