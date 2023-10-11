program Venda_email;

uses
  Vcl.Forms,
  VendaEmail in 'VendaEmail.pas' {frmMain},
  Usuario in 'Usuario.pas' {frmUsuario},
  DMDados in 'DMDados.pas' {dm: TDataModule},
  ConfiguracaoUsuario in 'ConfiguracaoUsuario.pas' {frmConfUsuario},
  Produtos in 'Produtos.pas' {frmProduto},
  Cliente in 'Cliente.pas' {frmCliente},
  Venda in 'Venda.pas' {frmVenda},
  Relatorio in 'Relatorio.pas' {frmRelat},
  RelatorioVenda in 'RelatorioVenda.pas' {frmRelVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmConfUsuario, frmConfUsuario);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmCliente, frmCliente);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(TfrmRelat, frmRelat);
  Application.CreateForm(TfrmRelVendas, frmRelVendas);
  Application.Run;
end.
