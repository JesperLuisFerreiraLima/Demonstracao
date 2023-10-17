unit Conversor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.NetEncoding;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    imaCarrega: TImage;
    dlgImporta: TOpenDialog;
    btnImporta: TSpeedButton;
    Panel2: TPanel;
    imaBase64: TImage;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    procedure btnImportaClick(Sender: TObject);
    function base64: String;
    procedure converteImage(base64: String);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.base64: String;
var
  entrada, saida: TStringStream;
begin

  entrada := TStringStream.Create;
  saida := TStringStream.Create;

  try

    if dlgImporta.Execute then
    begin
      imaCarrega.Picture.LoadFromFile(dlgImporta.FileName);
    end;

    imaCarrega.Picture.SaveToStream(entrada);
    entrada.Position := 0;
    saida.Position := 0;
    TNetEncoding.base64.Encode(entrada, saida);
    result := saida.DataString;
    Memo1.Lines.Text := result;

  finally
    entrada.Free;
    saida.Free;

  end;
end;

procedure TForm1.btnImportaClick(Sender: TObject);
begin
  base64;
end;

procedure TForm1.converteImage(base64: String);
var
  entrada, saida: TStringStream;
begin

  entrada := TStringStream.Create(base64);
  saida := TStringStream.Create;

  try
    entrada.Position := 0;
    TNetEncoding.base64.Decode(entrada, saida);
    saida.Position := 0;
    imaBase64.Picture.LoadFromStream(saida);
  finally
    entrada.Free;
    saida.Free;
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  converteImage(Memo1.Text);
end;

end.
