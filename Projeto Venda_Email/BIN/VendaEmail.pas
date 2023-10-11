unit VendaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Produtos2: TMenuItem;
    Cliente1: TMenuItem;
    Venda1: TMenuItem;
    btnCliente: TImage;
    btnVenda: TImage;
    btnProduto: TImage;
    btnUsuario: TImage;
    Usurio1: TMenuItem;
    Image1: TImage;
    btnRelat: TImage;
    Relatrio1: TMenuItem;
    Image2: TImage;
    procedure Usurio1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnRelatClick(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses DMDados, ConfiguracaoUsuario, Produtos, Cliente, Venda, Usuario, Relatorio,
  RelatorioVenda;

procedure TfrmMain.btnClienteClick(Sender: TObject);
begin
  frmCliente.showmodal;
end;

procedure TfrmMain.btnProdutoClick(Sender: TObject);
begin
  frmProduto.showmodal;
end;

procedure TfrmMain.btnRelatClick(Sender: TObject);
begin
  frmRelat.relVendas.Preview();
end;

procedure TfrmMain.btnUsuarioClick(Sender: TObject);
begin
  frmConfUsuario.showmodal;
end;

procedure TfrmMain.btnVendaClick(Sender: TObject);
begin
  frmVenda.showmodal;
end;

procedure TfrmMain.Cliente1Click(Sender: TObject);
begin
  frmCliente.showmodal;
end;

procedure TfrmMain.Image2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.Produtos2Click(Sender: TObject);
begin
  frmProduto.showmodal;
end;

procedure TfrmMain.Relatrio1Click(Sender: TObject);
begin
  frmRelVendas.relVendas.Preview();
end;

procedure TfrmMain.Usurio1Click(Sender: TObject);
begin
  frmConfUsuario.showmodal;
end;

procedure TfrmMain.Venda1Click(Sender: TObject);
begin
  frmVenda.showmodal;
end;

end.
