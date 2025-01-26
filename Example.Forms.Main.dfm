object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 7
  Margins.Top = 7
  Margins.Right = 7
  Margins.Bottom = 7
  Caption = 'Form1'
  ClientHeight = 1001
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -27
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 216
  TextHeight = 37
  object cbStrings: TComboBox
    Left = 12
    Top = 72
    Width = 439
    Height = 45
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    ItemIndex = 0
    TabOrder = 0
    Text = 'VOLKSWAGEN'
    Items.Strings = (
      'VOLKSWAGEN'
      'GENERAL MOTORS'
      'FORD MOTORS'
      'RENAULT'
      'BAYERISCHE MOTOREN WERKE')
  end
  object memoOutput: TMemo
    Left = 12
    Top = 648
    Width = 439
    Height = 341
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    TabOrder = 1
  end
  object btnGetFromString: TButton
    Left = 12
    Top = 131
    Width = 439
    Height = 91
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Get Mapped Enumerated Value'
    TabOrder = 2
    OnClick = btnGetFromStringClick
  end
  object btnEnum0: TButton
    Left = 12
    Top = 276
    Width = 439
    Height = 56
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Option Index 0'
    TabOrder = 3
    OnClick = btnEnum0Click
  end
  object btnEnum1: TButton
    Left = 12
    Top = 346
    Width = 439
    Height = 56
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Option Index 1'
    TabOrder = 4
    OnClick = btnEnum1Click
  end
  object btnEnum2: TButton
    Left = 12
    Top = 416
    Width = 439
    Height = 56
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Option Index 2'
    TabOrder = 5
    OnClick = btnEnum2Click
  end
  object btnEnum3: TButton
    Left = 12
    Top = 486
    Width = 439
    Height = 56
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Option Index 3'
    TabOrder = 6
    OnClick = btnEnum3Click
  end
  object btnEnum4: TButton
    Left = 12
    Top = 556
    Width = 439
    Height = 56
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Option Index 4'
    TabOrder = 7
    OnClick = btnEnum4Click
  end
end
