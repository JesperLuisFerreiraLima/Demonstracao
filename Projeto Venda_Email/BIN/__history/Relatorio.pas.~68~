unit Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage;

type
  TfrmRelat = class(TForm)
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
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLBand5: TRLBand;
    RLDraw3: TRLDraw;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBResult1: TRLDBResult;
    procedure RLDBText4AfterPrint(Sender: TObject);
    procedure RLDBResult1BeforePrint(Sender: TObject; var AText: string;
      var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelat: TfrmRelat;

implementation

{$R *.dfm}

uses DMDados;

procedure TfrmRelat.RLDBResult1BeforePrint(Sender: TObject; var AText: string;
  var PrintIt: Boolean);
begin
  DMDados.dm.qryTotVenda.Next;
end;

procedure TfrmRelat.RLDBText4AfterPrint(Sender: TObject);
var
  valorunit: real;
  qtd: Integer;
begin
  valorunit := StrToFloat(StringReplace(copy(RLDBText4.Caption, 4), '.',
    ',', []));

  qtd := StrToInt(RLDBText5.Caption);

  RLDBText6.Caption := FormatCurr('R$ ##,##0.00', valorunit * qtd);

end;

end.
