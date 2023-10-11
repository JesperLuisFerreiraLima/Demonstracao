unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    pnlMenu: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    btnMenu: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    pnlMenu2: TPanel;
    btnMenu2: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Panel2: TPanel;
    procedure btnMenuClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);

  private
    { Private declarations }

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.btnMenuClick(Sender: TObject);
begin

  if pnlMenu.Width = 160 then
    pnlMenu.Width := 40
  else
    pnlMenu.Width := 160;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pnlMenu.Width := 40;
  pnlMenu2.Width := 40;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
var
  i: integer;
begin
  if pnlMenu2.Width = 160 then
  begin
    for i := 160 downto 40 do
    begin
      pnlMenu2.Width := i
    end
  end
  else
  begin
    for i := 40 to 160 do
    begin
      pnlMenu2.Width := i;
    end;
  end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
