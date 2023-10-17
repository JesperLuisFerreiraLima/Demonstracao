object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 432
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnImporta: TSpeedButton
    Left = 256
    Top = 72
    Width = 137
    Height = 33
    Caption = 'Importar Imagem'
    OnClick = btnImportaClick
  end
  object SpeedButton1: TSpeedButton
    Left = 256
    Top = 120
    Width = 137
    Height = 33
    Caption = 'Carregar Imagem'
    OnClick = SpeedButton1Click
  end
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 209
    Height = 193
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 0
    object imaCarrega: TImage
      Left = 3
      Top = 2
      Width = 198
      Height = 182
      Stretch = True
    end
  end
  object Panel2: TPanel
    Left = 423
    Top = 8
    Width = 209
    Height = 193
    BevelInner = bvRaised
    BevelKind = bkFlat
    TabOrder = 1
    object imaBase64: TImage
      Left = 2
      Top = 2
      Width = 198
      Height = 182
      Stretch = True
    end
  end
  object Memo1: TMemo
    Left = 16
    Top = 216
    Width = 616
    Height = 193
    TabOrder = 2
  end
  object dlgImporta: TOpenDialog
    Left = 304
    Top = 16
  end
end
