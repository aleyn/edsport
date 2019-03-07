object frmEEPROM: TfrmEEPROM
  Left = 352
  Top = 391
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'EEPROM Wizare'
  ClientHeight = 197
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 173
    Height = 81
    Caption = 'Address Type'
    TabOrder = 0
    object opnAddr1: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = '8 bit address'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object opnAddr2: TRadioButton
      Left = 16
      Top = 48
      Width = 113
      Height = 17
      Caption = '16 bit address'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 92
    Width = 173
    Height = 97
    Caption = 'Chip Address'
    TabOrder = 1
    object Label1: TLabel
      Left = 64
      Top = 24
      Width = 13
      Height = 13
      Caption = 'A2'
    end
    object Label2: TLabel
      Left = 84
      Top = 24
      Width = 13
      Height = 13
      Caption = 'A1'
    end
    object Label3: TLabel
      Left = 104
      Top = 24
      Width = 13
      Height = 13
      Caption = 'A0'
    end
    object Label4: TLabel
      Left = 12
      Top = 40
      Width = 35
      Height = 13
      Caption = 'Reader'
    end
    object Label5: TLabel
      Left = 12
      Top = 60
      Width = 28
      Height = 13
      Caption = 'Writer'
    end
    object ra2: TCheckBox
      Left = 64
      Top = 40
      Width = 17
      Height = 17
      TabOrder = 0
    end
    object ra1: TCheckBox
      Left = 84
      Top = 40
      Width = 17
      Height = 17
      TabOrder = 1
    end
    object ra0: TCheckBox
      Left = 104
      Top = 40
      Width = 17
      Height = 17
      TabOrder = 2
    end
    object wa2: TCheckBox
      Left = 64
      Top = 60
      Width = 17
      Height = 17
      TabOrder = 3
    end
    object wa1: TCheckBox
      Left = 84
      Top = 60
      Width = 17
      Height = 17
      TabOrder = 4
    end
    object wa0: TCheckBox
      Left = 104
      Top = 60
      Width = 17
      Height = 17
      TabOrder = 5
    end
  end
  object grpRead: TGroupBox
    Left = 196
    Top = 4
    Width = 185
    Height = 81
    Caption = 'Read'
    TabOrder = 2
    object Label6: TLabel
      Left = 12
      Top = 24
      Width = 60
      Height = 13
      Caption = 'First Address'
    end
    object Label7: TLabel
      Left = 12
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Count'
    end
    object edtReadFirstAddress: TEdit
      Left = 80
      Top = 20
      Width = 69
      Height = 21
      TabOrder = 0
      Text = '0x00'
    end
    object edtReadCount: TEdit
      Left = 80
      Top = 52
      Width = 69
      Height = 21
      TabOrder = 1
      Text = '0x01'
    end
  end
  object btnOK: TButton
    Left = 412
    Top = 12
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 412
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object grpWrite: TGroupBox
    Left = 196
    Top = 96
    Width = 185
    Height = 93
    Caption = 'Write'
    TabOrder = 5
    object Label8: TLabel
      Left = 12
      Top = 24
      Width = 60
      Height = 13
      Caption = 'First Address'
    end
    object Label9: TLabel
      Left = 12
      Top = 56
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object edtWriteFirstAddress: TEdit
      Left = 80
      Top = 20
      Width = 69
      Height = 21
      TabOrder = 0
      Text = '0x00'
    end
    object edtWriteData: TEdit
      Left = 80
      Top = 52
      Width = 69
      Height = 21
      TabOrder = 1
      Text = '0xFF'
    end
  end
  object HMWinPos1: THMWinPos
    DesignPreView = pvNone
    Left = 412
    Top = 84
  end
end
