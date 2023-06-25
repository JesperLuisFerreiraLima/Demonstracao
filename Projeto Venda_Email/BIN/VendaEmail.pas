unit VendaEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Produtos2: TMenuItem;
    Cliente1: TMenuItem;
    Venda1: TMenuItem;
    btnCliente: TImage;
    btnVenda: TImage;
    btnProduto: TImage;
    btnUsuario: TImage;
    Usurio1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
