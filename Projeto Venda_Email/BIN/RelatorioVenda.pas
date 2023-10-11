unit RelatorioVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage;

type
  TfrmRelVendas = class(TForm)
    relVendas: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLImage1: TRLImage;
    RLSystemInfo1: TRLSystemInfo;
    RLDraw1: TRLDraw;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLBand5: TRLBand;
    RLLabel9: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLDraw2: TRLDraw;
    procedure RLDBResult1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);
    procedure RLDBText5AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVendas: TfrmRelVendas;

implementation

{$R *.dfm}

uses DMDados;

procedure TfrmRelVendas.RLDBResult1BeforePrint(Sender: TObject;
  var AText: string; var PrintIt: Boolean);
begin
  DMDados.dm.qryTotVenda.Next;
end;

procedure TfrmRelVendas.RLDBText5AfterPrint(Sender: TObject);
var
  valorunit: real;
  qtd: Integer;
begin
  valorunit := StrToFloat(StringReplace(copy(RLDBText5.Caption, 4), '.',
    ',', []));

  qtd := StrToInt(RLDBText6.Caption);

  RLDBText7.Caption := FormatCurr('R$ ##,##0.00', valorunit * qtd);

end;

end.
