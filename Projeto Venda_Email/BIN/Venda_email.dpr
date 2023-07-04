program Venda_email;

uses
  Vcl.Forms,
  VendaEmail in 'VendaEmail.pas' {frmMain},
  Usuario in 'Usuario.pas' {frmUsuario},
  DMDados in 'DMDados.pas' {Dm: TDataModule},
  ConfiguracaoUsuario in 'ConfiguracaoUsuario.pas' {frmConfUsuario},
  Produtos in 'Produtos.pas' {frmProduto},
  Cliente in 'Cliente.pas' {frmCliente},
  Venda in 'Venda.pas' {frmVenda};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmConfUsuario, frmConfUsuario);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.Run;
end.
