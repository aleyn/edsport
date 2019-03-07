(******************************************************************************
**  项目名称:    EDSport                                                     **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EDSport_form.pas                                            **
**  建立日期:    2006-04-12                                                  **
**  单元简介:    主界面                                                      **
**  更新历史:                                                                **
******************************************************************************)
unit EDSport_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, MPHexEditor, MPHexEditorEx, CPort, StdCtrls,
  CPortCtl, ActnList, Menus, hmStrTools, hmIniTools, ExtCtrls, HMWinPos,
  WinSpool;

type
  TfrmEDSport = class(TForm)
    pgcView: TPageControl;
    tabNormalView: TTabSheet;
    tabProtocolView: TTabSheet;
    PageControl2: TPageControl;
    tabCOMsetting: TTabSheet;
    pgcInput: TPageControl;
    tabNormalInput: TTabSheet;
    tabProtocolInput: TTabSheet;
    tabCustomInput: TTabSheet;
    mpeNormal: TMPHexEditorEx;
    ComPort1: TComPort;
    OpenDialog1: TOpenDialog;
    tabProtocolSetting: TTabSheet;
    Label10: TLabel;
    cmbPort: TComComboBox;
    Label11: TLabel;
    cmbRate: TComComboBox;
    Label12: TLabel;
    cmbData: TComComboBox;
    Label13: TLabel;
    cmbFlow: TComComboBox;
    Label14: TLabel;
    cmbParity: TComComboBox;
    Label15: TLabel;
    cmbStop: TComComboBox;
    btnUpdate: TButton;
    btnActive: TButton;
    mpeProtocol: TMPHexEditorEx;
    opnInputasCharAuto: TRadioButton;
    mpeNormalInput: TMPHexEditorEx;
    tabStringInput: TTabSheet;
    tabOption: TTabSheet;
    Label5: TLabel;
    cmbProtocolLibrary: TComboBox;
    btnStartProtocol: TButton;
    btnStopProtocol: TButton;
    btnConfigProtocol: TButton;
    edtProtocolInfo: TMemo;
    Label16: TLabel;
    ActionList1: TActionList;
    actActive: TAction;
    actUpdate: TAction;
    actStartProtocol: TAction;
    actStopProtocol: TAction;
    actConfigProtocol: TAction;
    actHexInput: TAction;
    actCharInput: TAction;
    actTest: TAction;
    ppmChangeInput: TPopupMenu;
    HexInput1: TMenuItem;
    CharInput1: TMenuItem;
    actLoadConfig: TAction;
    actSaveConfig: TAction;
    Label17: TLabel;
    ComLed4: TComLed;
    Label18: TLabel;
    ComLed5: TComLed;
    Label19: TLabel;
    ComLed6: TComLed;
    Label20: TLabel;
    ComLed7: TComLed;
    Label21: TLabel;
    ComLed8: TComLed;
    Label22: TLabel;
    ComLed9: TComLed;
    Label23: TLabel;
    ComLed10: TComLed;
    edtTX: TEdit;
    edtRX: TEdit;
    Button2: TButton;
    actClearNormalView: TAction;
    actSaveAsFile: TAction;
    SaveDialog1: TSaveDialog;
    opnInputasCharManual: TRadioButton;
    opnInputAsHex: TRadioButton;
    chkClearAfterSend: TCheckBox;
    btnSend: TButton;
    actSendNormal: TAction;
    chkSendWhenEnterKey: TCheckBox;
    btnClear: TButton;
    actClearNormalInput: TAction;
    tabStringView: TTabSheet;
    edtStringView: TMemo;
    chkSyncStringView: TCheckBox;
    actClearStringView: TAction;
    btnClearStringView: TButton;
    chkClearAfterSend2: TCheckBox;
    chkSendWhenEnterKey2: TCheckBox;
    btnSendString: TButton;
    btnClearString: TButton;
    edtEndOfString: TEdit;
    Label1: TLabel;
    actSendString: TAction;
    Panel1: TPanel;
    edtStringInputList: TMemo;
    edtStringInput: TEdit;
    Input: TLabel;
    actClearStringInput: TAction;
    chkPrefixChar: TCheckBox;
    edtPrefixChar: TEdit;
    chkSuffixChar: TCheckBox;
    edtSuffixChar: TEdit;
    Label2: TLabel;
    chkSyncProtocolView: TCheckBox;
    btnClearProtocolView: TButton;
    actClearProtocolView: TAction;
    Label3: TLabel;
    edtTXLine: TEdit;
    Label6: TLabel;
    edtRXLine: TEdit;
    Panel2: TPanel;
    mpeProtocolInput: TMPHexEditorEx;
    chkClearAfterSend3: TCheckBox;
    chkSendWhenEnterKey3: TCheckBox;
    btnSendProtocol: TButton;
    btnClearProtocol: TButton;
    actSendProtocol: TAction;
    actClearProtocolInput: TAction;
    cmbCommand: TComboBox;
    Label4: TLabel;
    Label7: TLabel;
    edtTXPack: TEdit;
    Label8: TLabel;
    edtRXPack: TEdit;
    Button1: TButton;
    actWizageDialog: TAction;
    chkAutoClearOldProtocolView: TCheckBox;
    HMWinPos1: THMWinPos;
    Bevel1: TBevel;
    opnAsChar: TRadioButton;
    opnAsHex: TRadioButton;
    btnSaveAsFile: TButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Panel3: TPanel;
    Label9: TLabel;
    opnOpenDTR: TRadioButton;
    opnCloseDTR: TRadioButton;
    Panel4: TPanel;
    opnOpenRTS: TRadioButton;
    Label24: TLabel;
    opnCloseRTS: TRadioButton;
    Timer1: TTimer;
    actTimeInput: TAction;
    chkEnabledTime: TCheckBox;
    edtTime: TEdit;
    Label25: TLabel;
    Panel5: TPanel;
    opnNormalInput: TRadioButton;
    opnStringInput: TRadioButton;
    opnProtocolInput: TRadioButton;
    chkAutoStartProtocol: TCheckBox;
    btn1: TButton;
    btn2: TButton;
    TabSheet1: TTabSheet;
    Image1: TImage;
    lblVersion: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure mpeNormalInputChange(Sender: TObject);
    procedure mpeNormalInputKeyPress(Sender: TObject; var Key: Char);
    procedure mpeProtocolInputKeyPress(Sender: TObject; var Key: Char);
    procedure opnInputasCharAutoClick(Sender: TObject);
    procedure opnInputAsHexKeyPress(Sender: TObject; var Key: Char);
    procedure edtStringInputKeyPress(Sender: TObject; var Key: Char);
    procedure edtStringViewChange(Sender: TObject);
    procedure edtStringInputListChange(Sender: TObject);
    procedure actHexInputExecute(Sender: TObject);
    procedure actCharInputExecute(Sender: TObject);
    procedure actActiveExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actTestExecute(Sender: TObject);
    procedure actLoadConfigExecute(Sender: TObject);
    procedure actSaveConfigExecute(Sender: TObject);
    procedure actClearNormalViewExecute(Sender: TObject);
    procedure actSaveAsFileExecute(Sender: TObject);
    procedure actClearNormalInputExecute(Sender: TObject);
    procedure actSendNormalExecute(Sender: TObject);
    procedure actClearStringViewExecute(Sender: TObject);
    procedure actSendStringExecute(Sender: TObject);
    procedure actClearStringInputExecute(Sender: TObject);
    procedure actStartProtocolExecute(Sender: TObject);
    procedure actSendProtocolExecute(Sender: TObject);
    procedure actClearProtocolInputExecute(Sender: TObject);
    procedure actClearProtocolViewExecute(Sender: TObject);
    procedure actWizageDialogExecute(Sender: TObject);
    procedure actStopProtocolExecute(Sender: TObject);
    procedure actConfigProtocolExecute(Sender: TObject);
    procedure opnOpenDTRClick(Sender: TObject);
    procedure opnOpenDTRKeyPress(Sender: TObject; var Key: Char);
    procedure opnOpenRTSClick(Sender: TObject);
    procedure opnOpenRTSKeyPress(Sender: TObject; var Key: Char);
    procedure ComPort1BeforeClose(Sender: TObject);
    procedure actTimeInputExecute(Sender: TObject);
    procedure chkEnabledTimeClick(Sender: TObject);
    procedure edtTimeKeyPress(Sender: TObject; var Key: Char);
    procedure chkEnabledTimeKeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    LastKey: Char;
    FRXCount: integer;
    FTXCount: integer;
    FRXPackage: Integer;
    FTXPackage: Integer;
    strBuffer: string;
    FilenameList: TStringList;
    SBuffer:PChar;
    RBuffer:PChar;
    function GetRXCount: integer;
    function GetTXCount: integer;
    procedure SetRXCount(const Value: integer);
    procedure SetTXCount(const Value: integer);
    function GetRXPackage: Integer;
    function GetTXPackage: Integer;
    procedure SetRXPackage(const Value: Integer);
    procedure SetTXPackage(const Value: Integer);
  public
    procedure SendChar(Buffer: Char);
    procedure SendBuffer(Buffer: Pointer; Count: integer);
    procedure ReceiveBuffer(Count: Integer);
    procedure PressBufferToString(Buffer: PChar; Count: Integer);
    procedure PressBufferToProtocol(Buffer: PChar; Count: Integer);
    property RXCount: integer read GetRXCount write SetRXCount;
    property TXCount: integer read GetTXCount write SetTXCount;
    property RXPackage: Integer read GetRXPackage write SetRXPackage;
    property TXPackage: Integer read GetTXPackage write SetTXPackage;
  end;

var
  frmEDSport: TfrmEDSport;

implementation

uses EDSport_Protocol, EDSport_Library, setupapi;

{$R *.dfm}

procedure OnProtocolError(Code: Integer; Msg: PChar; Count: Integer); stdcall;
var
  s: string;
begin
  if (Count <= 0) then exit;

  SetLength(s, Count);
  CopyMemory(@s[1], Msg, Count);
  ShowMessage('ERROR(' + Inttostr(Code) + '):' + s);
end;

procedure HexToBuffer(Hex: string; const Buffer: Pointer; var Count: integer);
var
  B: Byte;
  H: string;
  i, j: integer;
  pB: PByte;
begin
  if Length(Hex) = 0 then exit;
  SetLength(H, Length(Hex));
  j := 0;
  for i := 1 to Length(Hex) do
  begin
    if Hex[i] in ['0'..'9', 'A'..'F', 'a'..'f'] then
    begin
      Inc(j);
      H[j] := Hex[i];
    end;
  end;
  if j = 0 then exit;
  if j < Length(H) then SetLength(H, j);
  if j mod 2 > 0 then H := H + '0';
  j := 0;
  pB := Buffer;
  Count := 0;
  while j < Length(H) do
  begin
    Inc(j);
    B := Byte(H[j]) - 48;
    if B > 9 then dec(B, 7);
    Inc(j);
    pB^ := Byte(H[J]) - 48;
    if pB^ > 9 then dec(pB^, 7);
    pB^ := (B shl 4) or (pB^ and $0F);
    Inc(Integer(pB));
    Inc(Count);
  end;
end;

procedure TfrmEDSport.FormCreate(Sender: TObject);
var
  i: integer;
begin
  FRXCount := 0;
  FTXCount := 0;
  FRXPackage := 0;
  FTXPackage := 0;
  strBuffer := '';
  Application.Title := Caption;

  GetMem(SBuffer, 4096);
  GetMem(RBuffer,4096);

  FilenameList := TStringList.Create;

  actLoadConfig.Execute;
  actUpdate.Execute;

  MPHCustomCharConv := MPH_CCONV_VIEW;

  for i := 1 to Self.ComponentCount do
    if Self.Components[i - 1] is TMPHexEditorEx then
      with Self.Components[i - 1] as TMPHexEditorEx do
      begin
        Font.Charset := DEFAULT_CHARSET;
        Font.Name := 'Fixedsys';
        //OffsetFormat:='-!10:0x00|';
        OffsetFormat := '8!10:|:';
        GutterWidth := 80;
        Translation := tkCustom;
        Repaint;
      end;
  mpeNormalInput.AdjustCursorPos;

  pgcView.ActivePageIndex:=0;
end;

procedure TfrmEDSport.FormDestroy(Sender: TObject);
begin
  try
    if ComPort1.Connected then Comport1.Close;
    actSaveConfig.Execute;
  finally
    FilenameList.Free;
    FreeMem(SBuffer);
    FreeMem(RBuffer);
  end;
end;

procedure TfrmEDSport.ComPort1AfterOpen(Sender: TObject);
begin
  actActive.Caption := 'Close';
  opnOpenDTR.Enabled := ComPort1.Connected;
  opnCloseDTR.Enabled := ComPort1.Connected;
  opnOpenRTS.Enabled := ComPort1.Connected;
  opnCloseRTS.Enabled := ComPort1.Connected;
end;

procedure TfrmEDSport.ComPort1AfterClose(Sender: TObject);
begin
  actActive.Caption := 'Open';
  opnOpenDTR.Enabled := ComPort1.Connected;
  opnCloseDTR.Enabled := ComPort1.Connected;
  opnOpenRTS.Enabled := ComPort1.Connected;
  opnCloseRTS.Enabled := ComPort1.Connected;
end;

procedure TfrmEDSport.actHexInputExecute(Sender: TObject);
begin
  mpeNormalInput.LockCursorAtField := lcHexField;
  mpeNormalInput.InCharField := False;
end;

procedure TfrmEDSport.actCharInputExecute(Sender: TObject);
begin
  mpeNormalInput.LockCursorAtField := lcCharField;
  mpeNormalInput.InCharField := True;
end;

procedure TfrmEDSport.actActiveExecute(Sender: TObject);
begin
  if Comport1.Connected then
    ComPort1.Close
  else
  begin
    actUpdate.Execute;
    ComPort1.Open;
  end;
end;

procedure TfrmEDSport.actUpdateExecute(Sender: TObject);
begin
  try
    comport1.BeginUpdate;
    cmbPort.ApplySettings;
    cmbPort.UpdateSettings;
    cmbRate.ApplySettings;
    cmbData.ApplySettings;
    cmbFlow.ApplySettings;
    cmbParity.ApplySettings;
    cmbStop.ApplySettings;
    ComPort1.EndUpdate;
  except
    ShowMessage('Setting Port Error');
  end;
end;

procedure TfrmEDSport.actTestExecute(Sender: TObject);
var
  s: string;
begin
  //  if OpenDialog1.Execute then
  //    begin
  //      mpeNormal.LoadFromFile(OpenDialog1.FileName);
  //    end;
  //s := Edit1.Text;
  //mpeNormal.SetDataSizeFillByte:=10;
  //mpeNormal.WriteBuffer(s,1,1);
//  s:='1234ABCD';
  //mpeNormal.InsertBuffer(PChar(s),Length(s),0);
  mpeNormal.AppendBuffer(PChar(s), Length(s));
  //mpeNormal.SelEnd:=mpeNormal.SelStart;
  //mpeNormal.po
  //mpeNormal.NewSelection(mpeNormal.SelEnd+1,mpeNormal.SelEnd+1);
  //mpeNormal.HideSelection:=true;
  //mpeNormal.InCharField := True;

end;

procedure TfrmEDSport.mpeNormalInputChange(Sender: TObject);
begin
  if opnInputasCharAuto.Checked then
    if (LastKey >= #$20) and (LastKey <= #$7F) then SendChar(LastKey);
end;

procedure TfrmEDSport.mpeNormalInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  //Memo1.Lines.Add(ByteToHex(Byte(Key))+', '+Key);
  if Key = #13 then
  begin
    if chkSendWhenEnterKey.Checked and actSendNormal.Enabled then actSendNormal.Execute;
  end
  else
    LastKey := Key;
  //mpeNormalInput.data
end;

procedure TfrmEDSport.ComPort1RxChar(Sender: TObject; Count: Integer);
begin
  while (Count>0) do
  begin
    if Count>4096 then
    begin
      ReceiveBuffer(4096);
      Count := Count - 4096;
    end
    else
    begin
      ReceiveBuffer(Count);
      break;
    end;
  end;
end;

procedure TfrmEDSport.actLoadConfigExecute(Sender: TObject);
var
  ini: THMIniFile;
begin
  if FileExists(ChangeFileExt(ParamStr(0), '.ini')) then
  begin
    ini := THMIniFile.Create;
    try
      ini.LoadFromFile(ChangeFileExt(ParamStr(0), '.ini'));
      Ini.RootKey := 'COMSetting';
      Ini.OpenFirstKey;
      if Ini.ItemKeyOpend then
      begin
        if ini.ValueExists('Port') then cmbPort.Text := ini.Value['Port'];
        if ini.ValueExists('Rate') then cmbRate.Text := ini.Value['Rate'];
        if ini.ValueExists('Data') then cmbData.Text := ini.Value['Data'];
        if ini.ValueExists('Flow') then cmbFlow.Text := ini.Value['Flow'];
        if ini.ValueExists('Parity') then cmbParity.Text := ini.Value['Parity'];
        if ini.ValueExists('Stop') then cmbStop.Text := ini.Value['Stop'];
      end;
      Ini.CloseKey;

      ini.RootKey := 'View';
      ini.OpenFirstKey;
      if Ini.ItemKeyOpend then
      begin
        if ini.ValueExists('SyncStringView') then
          chkSyncStringView.Checked := ini.BValue['SyncStringView'];
        if ini.ValueExists('SyncProtocolView') then
          chkSyncProtocolView.Checked := ini.BValue['SyncProtocolView'];
        if ini.ValueExists('AutoClearOldProtocolView') then
          chkAutoClearOldProtocolView.Checked := ini.BValue['AutoClearOldProtocolView'];
      end;
      Ini.CloseKey;

      ini.RootKey := 'Input';
      ini.OpenFirstKey;
      if Ini.ItemKeyOpend then
      begin
        if ini.ValueExists('InputAs') then
        begin
          if UpperCase(Ini.Value['InputAs']) = 'CHARAUTO' then
            opnInputasCharAuto.Checked := True;
          if UpperCase(Ini.Value['InputAs']) = 'CHARMANUAL' then
            opnInputasCharManual.Checked := True;
          if UpperCase(Ini.Value['InputAs']) = 'HEXMANUAL' then
            opnInputAsHex.Checked := True;

          opnInputasCharAutoClick(Self);
        end;

        if ini.ValueExists('ClearNormal') then
          chkClearAfterSend.Checked := Ini.BValue['ClearNormal'];
        if ini.ValueExists('NormalEnterKey') then
          chkSendWhenEnterKey.Checked := Ini.BValue['NormalEnterKey'];

        if ini.ValueExists('Prefix') then
          chkPrefixChar.Checked := ini.BValue['Prefix'];
        if ini.ValueExists('PrefixChar') then
          edtPrefixChar.Text := Ini.SValue['PrefixChar'];
        if ini.ValueExists('Suffix') then
          chkSuffixChar.Checked := Ini.BValue['Suffix'];
        if ini.ValueExists('SuffixChar') then
          edtSuffixChar.Text := Ini.SValue['SuffixChar'];
        if ini.ValueExists('ClearString') then
          chkClearAfterSend2.Checked := ini.BValue['ClearString'];
        if ini.ValueExists('StringlEnterKey') then
          chkSendWhenEnterKey2.Checked := ini.BValue['StringlEnterKey'];

      end;
      Ini.CloseKey;

      ini.RootKey := 'Protocol';
      ini.OpenFirstKey;
      FilenameList.Clear;
      cmbProtocolLibrary.Clear;
      while Ini.ItemKeyOpend do
      begin
        if ini.ValueExists('Caption') and ini.ValueExists('Library') and FileExists(ini.SValue['Library']) then
        begin
          cmbProtocolLibrary.Items.Add(ini.SValue['Caption']);
          FilenameList.Add(ini.SValue['Library']);
          if ini.ValueExists('Default') and ini.BValue['Default'] then
            cmbProtocolLibrary.ItemIndex := cmbProtocolLibrary.Items.Count - 1;
        end;
        ini.OpenNextKey;
      end;
      ini.CloseKey;
      if (cmbProtocolLibrary.ItemIndex < 0) and (cmbProtocolLibrary.Items.Count > 0) then
        cmbProtocolLibrary.ItemIndex := 0;

      ini.RootKey := 'Option';
      ini.OpenFirstKey;
      if Ini.ItemKeyOpend then
      begin
        if ini.ValueExists('AutoStartProtocol') then
          chkAutoStartProtocol.Checked := ini.BValue['AutoStartProtocol'];
      end;
      Ini.CloseKey;

      if chkAutoStartProtocol.Checked and (cmbProtocolLibrary.ItemIndex >= 0) then actStartProtocol.Execute;

    finally
      ini.Free;
    end;
  end;
end;

procedure TfrmEDSport.actSaveConfigExecute(Sender: TObject);
var
  ini: THMIniFile;
begin
  ini := THMIniFile.Create;
  try
    if FileExists(ChangeFileExt(ParamStr(0), '.ini')) then
      ini.LoadFromFile(ChangeFileExt(ParamStr(0), '.ini'));

    Ini.RootKey := 'COMSetting';
    Ini.OpenFirstKey;
    if not Ini.ItemKeyOpend then ini.AppendKey;
    if Ini.ItemKeyOpend then
    begin
      ini.Value['Port'] := cmbPort.Text;
      ini.Value['Rate'] := cmbRate.Text;
      ini.Value['Data'] := cmbData.Text;
      ini.Value['Flow'] := cmbFlow.Text;
      ini.Value['Parity'] := cmbParity.Text;
      ini.Value['Stop'] := cmbStop.Text;
    end;
    Ini.CloseKey;

    ini.RootKey := 'View';
    ini.OpenFirstKey;
    if not Ini.ItemKeyOpend then ini.AppendKey;
    if Ini.ItemKeyOpend then
    begin
      ini.BValue['SyncStringView'] := chkSyncStringView.Checked;
      ini.BValue['SyncProtocolView'] := chkSyncProtocolView.Checked;
      ini.BValue['AutoClearOldProtocolView'] := chkAutoClearOldProtocolView.Checked;
    end;
    Ini.CloseKey;

    ini.RootKey := 'Input';
    ini.OpenFirstKey;
    if not Ini.ItemKeyOpend then ini.AppendKey;
    if Ini.ItemKeyOpend then
    begin
      if opnInputasCharAuto.Checked then
        ini.Value['InputAs'] := 'CharAuto';
      if opnInputasCharManual.Checked then
        ini.Value['InputAs'] := 'CharManual';
      if opnInputAsHex.Checked then
        ini.Value['InputAs'] := 'HexManual';

      Ini.BValue['ClearNormal'] := chkClearAfterSend.Checked;
      Ini.BValue['NormalEnterKey'] := chkSendWhenEnterKey.Checked;

      ini.BValue['Prefix'] := chkPrefixChar.Checked;
      Ini.SValue['PrefixChar'] := edtPrefixChar.Text;
      Ini.BValue['Suffix'] := chkSuffixChar.Checked;
      Ini.SValue['SuffixChar'] := edtSuffixChar.Text;
      ini.BValue['ClearString'] := chkClearAfterSend2.Checked;
      ini.BValue['StringlEnterKey'] := chkSendWhenEnterKey2.Checked;

    end;
    Ini.CloseKey;

    ini.RootKey := 'View';
    ini.OpenFirstKey;
    if not Ini.ItemKeyOpend then ini.AppendKey;
    if Ini.ItemKeyOpend then
    begin
    end;
    Ini.CloseKey;

    ini.RootKey := 'Option';
    ini.OpenFirstKey;
    if not Ini.ItemKeyOpend then ini.AppendKey;
    if Ini.ItemKeyOpend then
    begin
      ini.BValue['AutoStartProtocol'] := chkAutoStartProtocol.Checked;
    end;
    Ini.CloseKey;

    Ini.SaveToFile(ChangeFileExt(ParamStr(0), '.ini'));
  finally
    ini.Free;
  end;
end;

procedure TfrmEDSport.actClearNormalViewExecute(Sender: TObject);
begin
  mpeNormal.ClearBuffer;
  RXCount := 0;
  TXCount := 0;
end;

procedure TfrmEDSport.actSaveAsFileExecute(Sender: TObject);
var
  sFile: TStringList;
begin
  if SaveDialog1.Execute then
  begin
    sFile := TStringList.Create;
    try
      if opnAsChar.Checked then
        case pgcView.ActivePageIndex of
          0: sFile.Text := mpeNormal.AsText;
          1: sFile.Text := edtStringView.Text;
          2: sFile.Text := mpeProtocol.AsText;
        end;
      if opnAsHex.Checked then
        case pgcView.ActivePageIndex of
          0: sFile.Text := mpeNormal.AsHex;
          1: sFile.Text := edtStringView.Text;
          2: sFile.Text := mpeProtocol.AsHex;
        end;
      sFile.SaveToFile(SaveDialog1.FileName);
    finally
      sFile.Free;
    end;
  end;
  //mpeNormal.get
end;

procedure TfrmEDSport.opnInputasCharAutoClick(Sender: TObject);
begin
  if opnInputasCharAuto.Checked then
  begin
    mpeNormalInput.LockCursorAtField := lcCharField;
    mpeNormalInput.InCharField := True;
    mpeNormalInput.LockCursorInAppendMode := True;
    actSendNormal.Enabled := False;
  end;
  if opnInputasCharManual.Checked then
  begin
    mpeNormalInput.LockCursorAtField := lcCharField;
    mpeNormalInput.LockCursorInAppendMode := False;
    mpeNormalInput.InCharField := True;
    actSendNormal.Enabled := True;
  end;
  if opnInputAsHex.Checked then
  begin
    mpeNormalInput.LockCursorAtField := lcHexField;
    mpeNormalInput.LockCursorInAppendMode := False;
    mpeNormalInput.InCharField := False;
    actSendNormal.Enabled := True;
  end;
end;

procedure TfrmEDSport.opnInputAsHexKeyPress(Sender: TObject;
  var Key: Char);
begin
  opnInputasCharAutoClick(Sender);
end;

procedure TfrmEDSport.SendBuffer(Buffer: Pointer; Count: integer);
begin
  if ComPort1.Connected then
  begin
    ComPort1.Write(Buffer^, Count);
    //mpeNormalInput.AppendBuffer(Buffer, Count);
    TXCount := TXCount + Count;
  end;
end;

procedure TfrmEDSport.SendChar(Buffer: Char);
begin
  if ComPort1.Connected then
  begin
    ComPort1.Write(Buffer, 1);
    //mpeNormalInput.AppendBuffer(@Buffer, 1);
    TXCount := TXCount + 1;
  end;
end;

function TfrmEDSport.GetRXCount: integer;
begin
  Result := FRXCount;
end;

function TfrmEDSport.GetTXCount: integer;
begin
  Result := FTXCount;
end;

procedure TfrmEDSport.SetRXCount(const Value: integer);
begin
  FRXCount := Value;
  if FRXCount = 0 then
    edtRX.Text := ''
  else
    edtRX.Text := IntToStr(FRXCount);
end;

procedure TfrmEDSport.SetTXCount(const Value: integer);
begin
  FTXCount := Value;
  if FTXCount = 0 then
    edtTX.Text := ''
  else
    edtTX.Text := IntToStr(FTXCount);
end;

procedure TfrmEDSport.actClearNormalInputExecute(Sender: TObject);
begin
  mpeNormalInput.ClearBuffer;
end;

procedure TfrmEDSport.actSendNormalExecute(Sender: TObject);
var
  Buffer: PChar;
  Count: Integer;
begin
  Count := mpeNormalInput.DataSize;
  if Count <= 0 then exit;
  GetMem(Buffer, Count);
  try
    mpeNormalInput.ReadBuffer(Buffer^, 0, Count);
    SendBuffer(Buffer, Count);
    if chkClearAfterSend.Checked then mpeNormalInput.ClearBuffer;
  finally
    FreeMem(Buffer);
  end;
end;

procedure TfrmEDSport.ReceiveBuffer(Count: Integer);
begin
  if Count <= 0 then exit;
  ComPort1.Read(RBuffer^, Count);
  mpeNormal.AppendBuffer(RBuffer, Count);
  if chkSyncStringView.Checked then PressBufferToString(RBuffer, Count);
  if chkSyncProtocolView.Checked then PressBufferToProtocol(RBuffer, Count);
  RXCount := RXCount + Count;
end;

function GetSerialPortsSys(const Items: TStrings): Boolean;
var
  pcReturned: DWORD;
  pcbNeeded: DWORD;
  outb: PChar;
  Ports: PPortInfo2;
  i: integer;
  PortName: string;
begin
  //function EnumPorts(pName: PChar; Level: DWORD; pPorts: Pointer; cbBuf: DWORD;
  //                  var pcbNeeded, pcReturned: DWORD): BOOL; stdcall;
  outb := nil;
  Result:=False;
  PortName := 'COM';
  EnumPorts(nil, 2, nil, 0, pcbNeeded, pcReturned);
  if (pcbNeeded <= 0) then
  begin
    Result := False;
    exit;
  end;

  GetMem(outb, pcbNeeded);

  try
    EnumPorts(nil, 2, outb, pcbNeeded, pcbNeeded, pcReturned);
    begin
      Ports := PPortInfo2(outb);

      for i := 0 to pcReturned - 1 do
      begin
        if Assigned(Ports) and (Ports.pPortName <> nil) then
        begin
          PortName := StrPas(Ports.pPortName);
          if (Pos('COM', PortName) = 1) and (Pos(':', PortName) > 1) then
          begin
            PortName := Copy(PortName, 1, Pos(':', PortName) - 1);
            Items.Add(PortName);
          end;
        end;
        Inc(Ports);
      end;
      Result:=True;
    end
  finally
    Freemem(outb);
  end;
end;

procedure TfrmEDSport.actClearStringViewExecute(Sender: TObject);
begin
  //GetSerialPortsSys(edtStringView.Lines);
  //exit;


  edtStringView.Clear;
  edtRXLine.Text := '';
  edtEndOfString.Text := '';
  //GetSerialPortsSys(edtStringView.Lines);
end;

procedure TfrmEDSport.PressBufferToString(Buffer: PChar; Count: Integer);
var
  i, j: integer;
  s: string;
begin
  if Count <= 0 then exit;
  SetLength(s, Count);
  FillMemory(@s[1], Count, 0);
  j := 0;
  i := 1;
  while (i <= Count) do
  begin
    if (Buffer[i - 1] >= #$20) and (Buffer[i - 1] <= #$7F) then
    begin
      Inc(j);
      s[j] := Buffer[i - 1];
    end
    else if Buffer[i - 1] in [#0, #13, #10] then
    begin
      SetLength(strBuffer, Length(strBuffer) + j);

      CopyMemory(@strBuffer[Length(strBuffer) - j + 1], @s[1], j);
      if chkSyncStringView.Checked then
        edtStringView.Lines.Add(strBuffer);
      strBuffer := '';
      j := 0;

      if  (Buffer[i - 1] = #13) then
      begin
        if (i < Count) and (Buffer[i] = #10) then
        begin
          edtEndOfString.Text := '0x0D0A';
          Inc(i);
        end
        else
          edtEndOfString.Text := '0x0D';
      end
      else
        edtEndOfString.Text := '0x' + ByteToHex(Byte(Buffer[i - 1]));

      //Continue;
    end
    else
    begin
      Inc(j);
      s[j] := #$7F;
    end;
    Inc(i);
  end;
  if j > 0 then
  begin
    SetLength(s, j);
    strBuffer := strBuffer + s;
  end;
end;

procedure TfrmEDSport.PressBufferToProtocol(Buffer: PChar; Count: Integer);
var
  Protocol: TProtocol;
begin
  if not ProtocolLibraryLoaded then exit;
  if not chkSyncProtocolView.Checked then exit;

  InitProtocolMemory(@Protocol);
  //Protocol.AllocateMemory := AllocateProtocolMemory;
  LastKey := #0; // Disable Normal Input auto send;
  AllocateProtocolMemory(@Protocol, gpReceiveData, Count);
  try
    Protocol.CmdIndex := 0;
    Protocol.OnProtocolError := OnProtocolError;
    CopyMemory(Protocol.ReceiveData, Buffer, Count);
    if ProtocolDecode(@Protocol) = PROTOCOL_RESULT_OK then
    begin
      if chkAutoClearOldProtocolView.Checked then mpeProtocol.ClearBuffer;
      mpeProtocol.AppendBuffer(Protocol.DecodeData, Protocol.DecodeCount);
      RXPackage := RXPackage + 1;
    end;
  finally
    FreeProtocolMemory(@Protocol);
  end;
end;

procedure TfrmEDSport.actSendStringExecute(Sender: TObject);
var
  Buffer: pChar;
  cnt: integer;
  s: string;
begin
  if edtStringInput.Text <> '' then
  begin
    LastKey := #0; // Disable Normal Input auto send;
    cnt := Length(edtStringInput.Text);
    s := edtStringInput.Text;
    if chkPrefixChar.Checked then
    begin
      cnt := cnt + Length(edtPrefixChar.Text) div 2;
      s := '[' + edtPrefixChar.Text + ']' + s;
    end;
    if chkSuffixChar.Checked then
    begin
      cnt := cnt + Length(edtSuffixChar.Text) div 2;
      s := s + '[' + edtSuffixChar.Text + ']';
    end;

    edtStringInputList.Lines.Add('->' + s);

    GetMem(Buffer, cnt);
    try

      if chkClearAfterSend.Checked then mpeNormalInput.ClearBuffer;

      if chkPrefixChar.Checked then
      begin
        HexToBuffer(edtPrefixChar.Text, Buffer, cnt);
        SendBuffer(Buffer, cnt);
        mpeNormalInput.AppendBuffer(Buffer, cnt);
      end;
      s := edtStringInput.Text;
      SendBuffer(@s[1], Length(s));
      mpeNormalInput.AppendBuffer(@s[1], Length(s));
      
      if chkSuffixChar.Checked then
      begin
        HexToBuffer(edtSuffixChar.Text, Buffer, cnt);
        SendBuffer(Buffer, cnt);
        mpeNormalInput.AppendBuffer(Buffer, cnt);
      end;
      if chkClearAfterSend2.Checked then edtStringInput.Clear;
    finally
      FreeMem(Buffer);
    end;
  end;
end;

procedure TfrmEDSport.actClearStringInputExecute(Sender: TObject);
begin
  edtStringInputList.Clear;
  edtStringInput.Clear;
  edtTXLine.Text := '';
end;

procedure TfrmEDSport.edtStringInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and chkSendWhenEnterKey2.Checked and actSendString.Enabled then actSendString.Execute;
end;

procedure TfrmEDSport.edtStringViewChange(Sender: TObject);
begin
  if edtStringView.Lines.Count = 0 then
    edtRXLine.Text := ''
  else
    edtRXLine.Text := IntToStr(edtStringView.Lines.Count);
end;

procedure TfrmEDSport.edtStringInputListChange(Sender: TObject);
begin
  if edtStringInputList.Lines.Count = 0 then
    edtTXLine.Text := ''
  else
    edtTXLine.Text := IntToStr(edtStringInputList.Lines.Count);
end;

procedure PressBufferToStringList(Buffer: PChar; List: TStrings; DeleteNullLine: Boolean);
var
  s, Sour: string;
  Pos1, Pos2: Integer;
begin
  Sour := StrPas(Buffer);
  Pos1 := SmartPos(#13, Sour);
  if Pos1 = 0 then
  begin
    List.Add(Sour);
    exit;
  end;
  Pos2 := 1;
  while (Pos1 > Pos2) do
  begin
    s := Copy(Sour, Pos2, Pos1 - Pos2);
    if not ((trim(s) = '') and DeleteNullLine) then
      List.Add(s);
    Pos2 := Pos1 + 1;
    Pos1 := SmartPos(#13, Sour, Pos2);
  end;
end;

procedure TfrmEDSport.actStartProtocolExecute(Sender: TObject);
var
  Buffer: PChar;
  Count: integer;
begin
  if (cmbProtocolLibrary.ItemIndex < 0) then
  begin
    if (cmbProtocolLibrary.Items.Count > 0) then
      cmbProtocolLibrary.ItemIndex := 0
    else
      exit;
  end;

  if not ProtocolLibraryLoaded then LoadProtocolLibrary(FilenameList[cmbProtocolLibrary.ItemIndex]);
  if not ProtocolLibraryLoaded then
  begin
    edtProtocolInfo.Text := 'Load ' + FilenameList[cmbProtocolLibrary.ItemIndex] + ' Error';
    exit;
  end;

  Buffer := nil;
  Count := GetLibraryInfo(Buffer);
  if Count = 0 then exit;
  GetMem(Buffer, Count + 1);
  try
    if GetLibraryInfo(Buffer) = PROTOCOL_RESULT_OK then
    begin
      Buffer[Count] := #0;
      PressBufferToStringList(Buffer, edtProtocolInfo.Lines, False);
    end;
  finally
    FreeMem(Buffer);
  end;

  Buffer := nil;
  Count := GetCommandList(Buffer);
  if Count <= 0 then exit;
  GetMem(Buffer, Count + 1);
  try
    if GetCommandList(Buffer) = PROTOCOL_RESULT_OK then
    begin
      Buffer[Count] := #0;
      PressBufferToStringList(Buffer, cmbCommand.Items, True);
      if cmbCommand.Items.Count > 0 then cmbCommand.ItemIndex := 0;
    end;
  finally
    FreeMem(Buffer);
  end;

end;

procedure TfrmEDSport.actStopProtocolExecute(Sender: TObject);
begin
  if ProtocolLibraryLoaded then FreeProtocolLibrary;
  if not ProtocolLibraryLoaded then
  begin
    edtProtocolInfo.Lines.Clear;
    cmbCommand.Items.Clear;
  end;
end;

procedure TfrmEDSport.actConfigProtocolExecute(Sender: TObject);
begin
  if not ProtocolLibraryLoaded then
  begin
    ShowMessage('Protocol Library not start');
    exit;
  end;

  if ProtocolLibraryLoaded then
  try
    case ConfigLibrary() of
      PROTOCOL_ERROR:
        ShowMessage('Config Protocol library error');
      PROTOCOL_NOTHING:
        ShowMessage('It is needless to config protocol');
    end;
  finally

  end;

end;

procedure TfrmEDSport.actSendProtocolExecute(Sender: TObject);
var
  Protocol: TProtocol;
  DataCount: Integer;
begin
  if not ProtocolLibraryLoaded then
  begin
    ShowMessage('Protocol Library not start');
    exit;
  end;
  if cmbCommand.ItemIndex < 0 then
  begin
    ShowMessage('Please choose command');
    exit;
  end;

  ClearDecodeBuffer();
  InitProtocolMemory(@Protocol);
  //Protocol.AllocateMemory := AllocateProtocolMemory;
  LastKey := #0; // Disable Normal Input auto send;
  DataCount := mpeProtocolInput.DataSize;
  AllocateProtocolMemory(@Protocol, gpInputData, DataCount + 1);
  try
    Protocol.CmdIndex := GetCommandIndex(cmbCommand.ItemIndex + 1);
    Protocol.OnProtocolError := OnProtocolError;
    Protocol.InputCount := DataCount;
    mpeProtocolInput.ReadBuffer(Protocol.InputData^, 0, DataCount);
    if ProtocolEncode(@Protocol) = PROTOCOL_RESULT_OK then
    begin
      SendBuffer(Protocol.EncodeData, Protocol.EncodeCount);
      if chkClearAfterSend.Checked then mpeNormalInput.ClearBuffer;
      mpeNormalInput.AppendBuffer(Protocol.EncodeData, Protocol.EncodeCount);
      TXPackage := TXPackage + 1;
    end;
  finally
    FreeProtocolMemory(@Protocol);
  end;
end;

procedure TfrmEDSport.actClearProtocolInputExecute(Sender: TObject);
begin
  mpeProtocolInput.ClearBuffer;
  TXPackage := 0;
end;

procedure TfrmEDSport.actClearProtocolViewExecute(Sender: TObject);
begin
  mpeProtocol.ClearBuffer;
  RXPackage := 0;
end;

procedure TfrmEDSport.actWizageDialogExecute(Sender: TObject);
var
  Protocol: TProtocol;
  ResultCode: Integer;
begin
  if not ProtocolLibraryLoaded then
  begin
    ShowMessage('Protocol Library not start');
    exit;
  end;
  if cmbCommand.ItemIndex < 0 then
  begin
    ShowMessage('Please choose command');
    exit;
  end;

  InitProtocolMemory(@Protocol);
  //Protocol.AllocateMemory := AllocateProtocolMemory;
  Protocol.CmdIndex := GetCommandIndex(cmbCommand.ItemIndex + 1);
  Protocol.OnProtocolError := OnProtocolError;

  try
    ResultCode := GetWizareInput(Application.Handle, @Protocol);
    if ResultCode = 0 then
    begin
      //if chkClearAfterSend3.Checked then
      actClearProtocolInput.Execute;
      mpeProtocolInput.AppendBuffer(Protocol.InputData, Protocol.InputCount);
    end;
  finally
    FreeProtocolMemory(@Protocol);
  end;
end;

procedure TfrmEDSport.mpeProtocolInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if chkSendWhenEnterKey3.Checked and actSendProtocol.Enabled then actSendProtocol.Execute;
  end;
end;

function TfrmEDSport.GetRXPackage: Integer;
begin
  Result := FRXPackage;
end;

function TfrmEDSport.GetTXPackage: Integer;
begin
  Result := FTXPackage;
end;

procedure TfrmEDSport.SetRXPackage(const Value: Integer);
begin
  FRXPackage := Value;
  if FRXPackage = 0 then
    edtRXPack.Text := ''
  else
    edtRXPack.Text := IntToStr(FRXPackage);
end;

procedure TfrmEDSport.SetTXPackage(const Value: Integer);
begin
  FTXPackage := Value;
  if FTXPackage = 0 then
    edtTXPack.Text := ''
  else
    edtTXPack.Text := IntToStr(FTXPackage);
end;

procedure TfrmEDSport.opnOpenDTRClick(Sender: TObject);
begin
  if opnOpenDTR.Checked then ComPort1.SetDTR(True);
  if opnCloseDTR.Checked then ComPort1.SetDTR(False);
  //Windows.dt
end;

procedure TfrmEDSport.opnOpenDTRKeyPress(Sender: TObject; var Key: Char);
begin
  opnOpenDTRClick(Sender);
end;

procedure TfrmEDSport.opnOpenRTSClick(Sender: TObject);
begin
  if opnOpenRTS.Checked then ComPort1.SetRTS(True);
  if opnCloseRTS.Checked then ComPort1.SetRTS(False);
end;

procedure TfrmEDSport.opnOpenRTSKeyPress(Sender: TObject; var Key: Char);
begin
  opnOpenRTSClick(Sender);
end;

procedure TfrmEDSport.ComPort1BeforeClose(Sender: TObject);
begin
  if not opnCloseDTR.Checked then opnCloseDTR.Checked := True;
  if not opnCloseRTS.Checked then opnCloseRTS.Checked := True;
end;

procedure TfrmEDSport.actTimeInputExecute(Sender: TObject);
begin
  if opnNormalInput.Checked then actSendNormal.Execute;
  if opnStringInput.Checked then actSendString.Execute;
  if opnProtocolInput.Checked and ProtocolLibraryLoaded then actSendProtocol.Execute;
end;

procedure TfrmEDSport.chkEnabledTimeClick(Sender: TObject);
begin
  try
    if (StrToInt(edtTime.Text) <= 0) then edtTime.Text := '1';
    Timer1.Interval := StrToInt(edtTime.Text);
    Timer1.Enabled := chkEnabledTime.Checked;
    mpeNormalInput.Enabled := not chkEnabledTime.Checked;
    edtStringInput.Enabled := not chkEnabledTime.Checked;
    mpeProtocolInput.Enabled := not chkEnabledTime.Checked;
    edtTime.Enabled := not chkEnabledTime.Checked;
    opnNormalInput.Enabled := not chkEnabledTime.Checked;
    opnProtocolInput.Enabled := not chkEnabledTime.Checked; ;
    opnStringInput.Enabled := not chkEnabledTime.Checked; ;
  except
    Timer1.Enabled := False;
    chkEnabledTime.Checked := False;
    mpeNormalInput.Enabled := not chkEnabledTime.Checked;
    edtStringInput.Enabled := not chkEnabledTime.Checked;
    mpeProtocolInput.Enabled := not chkEnabledTime.Checked;
    edtTime.Enabled := not chkEnabledTime.Checked;
    opnNormalInput.Enabled := not chkEnabledTime.Checked;
    opnProtocolInput.Enabled := not chkEnabledTime.Checked; ;
    opnStringInput.Enabled := not chkEnabledTime.Checked; ;
  end;
end;

procedure TfrmEDSport.edtTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TfrmEDSport.chkEnabledTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  chkEnabledTimeClick(Sender);
end;

procedure TfrmEDSport.btn1Click(Sender: TObject);
var
  Sour, Dest: PChar;
  //Count: integer;
  Crc: Word;
begin
  if mpeNormalInput.DataSize <= 0 then exit;
  GetMem(Sour, mpeNormalInput.DataSize);
  //Dest := nil;
  try
    mpeNormalInput.ReadBuffer(Sour^, 0, mpeNormalInput.DataSize);
    Crc := Crc16(Sour, mpeNormalInput.DataSize);
    mpeProtocolInput.ClearBuffer;
    Dest := @Crc;
    //if Count > 0 then
    mpeProtocolInput.AppendBuffer(Sour, mpeNormalInput.DataSize);
    mpeProtocolInput.AppendBuffer(Dest, SizeOf(Crc));
  finally
    FreeMem(Sour);
    //if Dest <> nil then FreeMem(Dest);
  end;
end;

procedure TfrmEDSport.btn2Click(Sender: TObject);
var
  Sour, Dest: PChar;
  Count: integer;
  Count2: integer;
  Crc: Word;
  Buf: Byte;
  i, j: integer;
begin
  Count := mpeNormalInput.DataSize;
  if Count <= 0 then exit;
  GetMem(Sour, Count);
  GetMem(Dest, Count);
  try
    mpeNormalInput.ReadBuffer(Sour^, 0, Count);
    Count := DecodeInvaildData(Sour, Dest, Count);
    CopyMemory(Sour, Dest, Count);
    Crc := Crc16(Sour, Count);
    mpeProtocolInput.ClearBuffer;
    j := 1;
    Count2 := 0;
    while (j < Count) and (Dest <> nil) do
    begin
      Buf := 0;
      for i := 0 to 7 do
        Buf := Buf or (Byte(Sour[j + i]) and ($01 shl i));
      Dest[Count2] := Char(Buf);
      Inc(Count2);
      Inc(j, 8);
    end;

    mpeProtocolInput.AppendBuffer(Dest, Count2);
    mpeProtocolInput.AppendBuffer(@Crc, SizeOf(Crc));
  finally
    FreeMem(Sour);
    if Dest <> nil then FreeMem(Dest);
  end;
end;

end.

