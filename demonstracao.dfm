object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 501
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 282
    Width = 148
    Height = 23
    Caption = 'Resultado Final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnImportar: TButton
    Left = 624
    Top = 164
    Width = 105
    Height = 33
    Caption = 'Importar'
    TabOrder = 0
    OnClick = btnImportarClick
  end
  object btnExportar: TButton
    Left = 624
    Top = 203
    Width = 105
    Height = 33
    Caption = 'Exportar'
    TabOrder = 1
  end
  object Inserir: TButton
    Left = 624
    Top = 242
    Width = 105
    Height = 33
    Caption = 'Inserir'
    TabOrder = 2
  end
  object btnAlterar: TButton
    Left = 624
    Top = 281
    Width = 105
    Height = 33
    Caption = 'Alterar'
    TabOrder = 3
  end
  object btn_excluir: TButton
    Left = 624
    Top = 320
    Width = 105
    Height = 33
    Caption = 'Excluir'
    TabOrder = 4
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 320
    Width = 577
    Height = 157
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 49
    Caption = 'Sistema demonstra'#231#227'o de habilidades t'#233'cnicas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object dbimporta: TStringGrid
    Left = 8
    Top = 128
    Width = 577
    Height = 137
    TabOrder = 7
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Demonstracao'
      'User_Name=sa'
      'Password=845347'
      'Server=JESPER\SQLEXPRESS'
      'DriverID=MSSQL')
    Left = 40
    Top = 54
  end
  object ImPExcel: TImportExcel
    Left = 168
    Top = 56
  end
  object opImporta: TOpenDialog
    Left = 112
    Top = 52
  end
end
