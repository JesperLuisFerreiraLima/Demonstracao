unit Usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvXPCore, JvXPButtons,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmUsuario = class(TForm)
    edtNome: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblcadastro: TLabel;
    JvXPButton1: TJvXPButton;
    Image1: TImage;
    procedure lblcadastroMouseEnter(Sender: TObject);
    procedure lblcadastroMouseLeave(Sender: TObject);
    procedure JvXPButton1Click(Sender: TObject);
    procedure lblcadastroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses VendaEmail, DMDados;

procedure TfrmUsuario.JvXPButton1Click(Sender: TObject);
begin
  with DMDados.DM.qryLogin do
  begin
    close;
    ParamByName('nome').AsString := edtNome.Text;
    Open();
  end;

  if edtNome.Text = '' then
  begin
    Application.MessageBox('Campo Nome Vazio!', 'Aten��o', MB_OK);
    edtNome.SetFocus;
  end
  else if edtSenha.Text = '' then
  begin
    Application.MessageBox('Campo Senha Vazio!', 'Aten��o', MB_OK);
    edtSenha.SetFocus;
  end
  else if DM.qryLoginSENHA_USU.Value <> edtSenha.Text then
  begin
    Application.MessageBox('Campo Senha Incorreto!', 'Aten��o', MB_OK);
    edtSenha.SetFocus;
  end

  else
    frmMain.showmodal;
end;

procedure TfrmUsuario.lblcadastroClick(Sender: TObject);
begin

  with DMDados.DM.qryLogin do
  begin
    close;
    ParamByName('nome').AsString := edtNome.Text;
    Open();
  end;

  if edtNome.Text = '' then
  begin
    Application.MessageBox('Campo Nome Vazio!', 'Aten��o', MB_OK);
    edtNome.SetFocus;
  end
  else if edtSenha.Text = '' then
  begin
    Application.MessageBox('Campo Senha Vazio!', 'Aten��o', MB_OK);
    edtSenha.SetFocus;
  end
  else if (DM.qryLoginNOME_USU.Value = edtNome.Text) Then
  begin
    Application.MessageBox('Usu�rio j� existe!', 'Aten��o', MB_OK);
    edtSenha.SetFocus;
  end
  else
  begin
    with DMDados.DM.stInsereUsuario do
    begin
      close;
      ParamByName('@usu').Value := edtNome.Text;
      ParamByName('@sen').Value := edtSenha.Text;
      ExecProc;
      Application.MessageBox('Usu�rio Cadastrado com sucesso', 'Sucesso', MB_OK)
    end;
  end;
end;

procedure TfrmUsuario.lblcadastroMouseEnter(Sender: TObject);
begin
  lblcadastro.Font.Color := clBlue;
end;

procedure TfrmUsuario.lblcadastroMouseLeave(Sender: TObject);
begin
  lblcadastro.Font.Color := clBlack;
end;

end.
