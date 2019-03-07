(******************************************************************************
**  项目名称:    EEPROM                                                      **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EEPROM_form.pas                                             **
**  建立日期:    2006-04-26                                                  **
**  单元简介:    用於产生EEPROM的协议内容填充                                **
**  更新历史:                                                                **
******************************************************************************)
unit EEPROM_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EDSport_Protocol, hmWinPos, hmStrTools;

type
  TfrmEEPROM = class(TForm)
    GroupBox1: TGroupBox;
    opnAddr1: TRadioButton;
    opnAddr2: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ra2: TCheckBox;
    ra1: TCheckBox;
    ra0: TCheckBox;
    wa2: TCheckBox;
    wa1: TCheckBox;
    wa0: TCheckBox;
    grpRead: TGroupBox;
    btnOK: TButton;
    btnCancel: TButton;
    grpWrite: TGroupBox;
    Label6: TLabel;
    edtReadFirstAddress: TEdit;
    Label7: TLabel;
    edtReadCount: TEdit;
    Label8: TLabel;
    edtWriteFirstAddress: TEdit;
    Label9: TLabel;
    edtWriteData: TEdit;
    HMWinPos1: THMWinPos;
  private
    FMode: Integer;
    procedure SetMode(const Value: Integer);
    { Private declarations }
  public
    procedure PressBuffer(Protocol: PProtocol);
    property Mode: Integer read FMode write SetMode;
  end;

var
  frmEEPROM: TfrmEEPROM;

implementation

uses EDSport_Memory;

{$R *.dfm}

{ TfrmEEPROM }

procedure TfrmEEPROM.PressBuffer(Protocol: PProtocol);
var
  s: string;
  Buffer: Pchar;
  Buf2: PByte;
  Count: Integer;
begin
    //if Length(edtWriteData.Text>=6) then
  AllocateProtocolMemory(Protocol, gpInputData, 6);

  Buffer := Protocol^.InputData;
  Buf2 := PByte(Buffer);
  if opnAddr1.Checked then
    Buf2^ := 1 //Memory Address Type
  else
    Buf2^ := 2;
  Count := 1;

  Inc(Buf2);
  Inc(Count);
  Buf2^ := 0; //Chip Address
  if ra0.Checked then Buf2^ := Buf2^ + 2;
  if ra1.Checked then Buf2^ := Buf2^ + 4;
  if ra2.Checked then Buf2^ := Buf2^ + 8;

  if grpRead.Enabled then
    s := edtReadFirstAddress.Text; //Memory Address
  if grpWrite.Enabled then
    s := edtWriteFirstAddress.Text; //Memory Address

  Inc(Buf2); // Low Byte of Word
  Inc(Count);
  if Length(s) >= 6 then
    Buf2^ := HexToByte(Copy(s, 5, 2))
  else if Length(s) >= 4 then
    Buf2^ := HexToByte(Copy(s, 3, 2))
  else
    Buf2^ := 0;

  Inc(Buf2); //High Byte of Word
  Inc(Count);
  if Length(s) >= 6 then
    Buf2^ := HexToByte(Copy(s, 3, 2))
  else
    Buf2^ := 0;

  if grpRead.Enabled then
    s := edtReadCount.Text; //Read Count
  if grpWrite.Enabled then
    s := edtWriteData.Text;

  Inc(Buf2); // Low Byte of Word / or Single Byte of Data
  Inc(Count);
  if Length(s) >= 6 then
    Buf2^ := HexToByte(Copy(s, 5, 2))
  else if Length(s) >= 4 then
    Buf2^ := HexToByte(Copy(s, 3, 2))
  else
    Buf2^ := 0;

  if grpRead.Enabled then
  begin
    Inc(Buf2); // High Byte of Word
    Inc(Count);
    if Length(s) >= 6 then
      Buf2^ := HexToByte(Copy(s, 3, 2))
    else
      Buf2^ := 0;
  end;

  if grpWrite.Enabled and (Length(s) >= 6) then
  begin
    Inc(Buf2); // High Byte of Word
    Inc(Count);
    Buf2^ := HexToByte(Copy(s, 3, 2))
  end;
  if Count < 6 then Protocol^.InputCount := Count;
end;

procedure TfrmEEPROM.SetMode(const Value: Integer);
begin
  FMode := Value;
  if FMode = 2 then
  begin
    grpRead.Enabled := False;
    edtReadFirstAddress.Enabled := False;
    edtReadCount.Enabled := False;
  end
  else
  begin
    grpWrite.Enabled := False;
    edtWriteFirstAddress.Enabled := False;
    edtWriteData.Enabled := False;
  end;

end;

end.

