(******************************************************************************
 **  项目名称:    EDSport                                                     **
 **  建立作者:    吴创明(Aleyn.wu)                                            **
 **  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
 **  -----------------------------------------------------------------------  **
 **  单元名称:    EDSport_form.pas                                            **
 **  建立日期:    2006-04-12                                                  **
 **  建立日期:    2017-06-28                                                  **
 **  单元简介:    串口调试工具主界面                                          **
 **  版    本:    v2.2                                                        **
 **  更新历史:                                                                **
 ******************************************************************************)
unit EDSport_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, MPHexEditor, MPHexEditorEx, CPort, StdCtrls,
  CPortCtl, ActnList, Menus, hmStrTools, hmIniTools, ExtCtrls, HMWinPos, hmDateTools,
  WinSpool, GAProtocol, EDSport_Protocol, WdmDeviceApi;

type
  TfrmEDSport = class(TForm)
    pgcView: TPageControl;
    tabNormalView: TTabSheet;
    tabProtocolView: TTabSheet;
    pgcPanel: TPageControl;
    tabCOMsetting: TTabSheet;
    pgcInput: TPageControl;
    tabNormalInput: TTabSheet;
    tabProtocolInput: TTabSheet;
    tabCustomInput: TTabSheet;
    mpeNormal: TMPHexEditorEx;
    ComPort1: TComPort;
    OpenDialog1: TOpenDialog;
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
    opnInputasCharAuto: TRadioButton;
    mpeNormalInput: TMPHexEditorEx;
    tabStringInput: TTabSheet;
    tabOption: TTabSheet;
    ActionList1: TActionList;
    actOpenCom: TAction;
    actUpdateCom: TAction;
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
    TabSheet1: TTabSheet;
    Image1: TImage;
    lblVersion: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    edtProtocolView: TMemo;
    edtDetail: TEdit;
    Label16: TLabel;
    edtProtocolRS: TEdit;
    Label26: TLabel;
    Label5: TLabel;
    edtAddress: TEdit;
    Label27: TLabel;
    edtCount: TEdit;
    Label31: TLabel;
    edtCategory: TEdit;
    Label2: TLabel;
    edtPort: TEdit;
    TabSheet2: TTabSheet;
    cmbUSB: TComboBox;
    Label32: TLabel;
    btnOpenUSB: TButton;
    btnUpdateUSB: TButton;
    actOpenUSB: TAction;
    actUpdateUSB: TAction;
    actUsbReadGap: TAction;
    btnUsbCheckIn: TButton;
    TabSheet3: TTabSheet;
    edtLog: TMemo;
    actReadStatus: TAction;
    actReadLog: TAction;
    btnReadStatus: TButton;
    btnReadLog: TButton;
    Timer2: TTimer;
    Label33: TLabel;
    opnNothing: TRadioButton;
    opnOnceAfterSend: TRadioButton;
    opnAutoCheckIn: TRadioButton;
    Button1: TButton;
    actClearDeviceLog: TAction;
    TabSheet4: TTabSheet;
    edtEvent: TMemo;
    btnClearEvent: TButton;
    actClearEvent: TAction;
    chkReadLog: TCheckBox;
    chkAutoCheckPnp: TCheckBox;
    chkCheckLog: TButton;
    actCheckLog: TAction;
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
    procedure actOpenComExecute(Sender: TObject);
    procedure actUpdateComExecute(Sender: TObject);
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
    procedure actSendProtocolExecute(Sender: TObject);
    procedure actClearProtocolInputExecute(Sender: TObject);
    procedure actClearProtocolViewExecute(Sender: TObject);
    procedure opnOpenDTRClick(Sender: TObject);
    procedure opnOpenDTRKeyPress(Sender: TObject; var Key: Char);
    procedure opnOpenRTSClick(Sender: TObject);
    procedure opnOpenRTSKeyPress(Sender: TObject; var Key: Char);
    procedure ComPort1BeforeClose(Sender: TObject);
    procedure actTimeInputExecute(Sender: TObject);
    procedure chkEnabledTimeClick(Sender: TObject);
    procedure edtTimeKeyPress(Sender: TObject; var Key: Char);
    procedure chkEnabledTimeKeyPress(Sender: TObject; var Key: Char);
    procedure actOpenUSBExecute(Sender: TObject);
    procedure actUsbReadGapExecute(Sender: TObject);
    procedure actReadStatusExecute(Sender: TObject);
    procedure actReadLogExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure actUpdateUSBExecute(Sender: TObject);
    procedure actClearDeviceLogExecute(Sender: TObject);
    procedure actClearEventExecute(Sender: TObject);
    procedure chkAutoCheckPnpClick(Sender: TObject);
    procedure actCheckLogExecute(Sender: TObject);
    procedure ComPort1RxBuf(Sender: TObject; const Buffer; Count: Integer);
  private
    LastKey: Char;
    FRXCount: Integer;
    FTXCount: Integer;
    FRXPackage: Integer;
    FTXPackage: Integer;
    strBuffer: string;
    FilenameList: TStringList;
    SBuffer: PChar;
    RBuffer: PChar;
    Gaps: TGapProtocol;
    GapType:Integer;
    ComGap: TGapCom;
    UsbDrv:TUsbDevice;
    UsbGap: TGapUsb;
    CheckInMode:Integer;
    CheckInFlag:boolean;

    UsbStatus:TUSB_GAP_Status;
    UsbCmd:TUSB_GAP_CMD;

    UsbBusy:Boolean;
    function GetRXCount: Integer;
    function GetTXCount: Integer;
    procedure SetRXCount(const Value: Integer);
    procedure SetTXCount(const Value: Integer);
    function GetRXPackage: Integer;
    function GetTXPackage: Integer;
    procedure SetRXPackage(const Value: Integer);
    procedure SetTXPackage(const Value: Integer);

    procedure UsbDrvAfterOpen(Sender: TObject);
    procedure UsbDrvAfterClose(Sender: TObject);
    procedure UsbError(Sender:TObject; ErrorCode:Integer);

    procedure TimerCmd(Active:Boolean);

  public
    function Connected:Boolean;
    procedure SendChar(Buffer: Char);
    procedure SendBuffer(Buffer: Pointer; Count: Integer);
    procedure ReceiveBuffer(Count: Integer);
    procedure PressBufferToString(Buffer: PChar; Count: Integer);
    procedure PressBufferToProtocol(Buffer: PChar; Count: Integer);

    procedure Log(Msg:string);
    procedure DeviceLog(const Msg:string);

    property RXCount: Integer read GetRXCount write SetRXCount;
    property TXCount: Integer read GetTXCount write SetTXCount;
    property RXPackage: Integer read GetRXPackage write SetRXPackage;
    property TXPackage: Integer read GetTXPackage write SetTXPackage;
  end;

var
  frmEDSport: TfrmEDSport;

implementation

{$R *.dfm}


(*******************************************************************************
* Function    : OnProtocolError
* Caption     : .
*  @Param     : 1.Code - 
*  @Param     : 2.Msg - 
*  @Param     : 3.Count - 
* Description : .
*******************************************************************************)
procedure OnProtocolError(Code: Integer; Msg: PChar; Count: Integer); stdcall;
var
  s: string;
begin
  if (Count <= 0) then exit;

  SetLength(s, Count);
  CopyMemory(@s[1], Msg, Count);
  ShowMessage('ERROR(' + Inttostr(Code) + '):' + s);
end;

(*******************************************************************************
* Function    : HexToBuffer
* Caption     : .
*  @Param     : 1.Hex - 
*  @Param In  : 2.Buffer - 
*  @Param Out : 3.Count - 
* Description : .
*******************************************************************************)
procedure HexToBuffer(Hex: string; const Buffer: Pointer; var Count: Integer);
var
  B: Byte;
  H: string;
  i, j: Integer;
  pB: PByte;
begin
  if Length(Hex) = 0 then exit;
  SetLength(H, Length(Hex));
  j := 0;
  for i := 1 to Length(Hex) do
  begin
    if Hex[i] in ['0' .. '9', 'A' .. 'F', 'a' .. 'f'] then
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
    pB^ := Byte(H[j]) - 48;
    if pB^ > 9 then dec(pB^, 7);
    pB^ := (B shl 4) or (pB^ and $0F);
    Inc(Integer(pB));
    Inc(Count);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.FormCreate
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FRXCount := 0;
  FTXCount := 0;
  FRXPackage := 0;
  FTXPackage := 0;
  strBuffer := '';
  Application.Title := Caption;

  GetMem(SBuffer, 4096);
  GetMem(RBuffer, 4096);

  FillMemory(@UsbStatus, sizeof(UsbStatus), 0);
  FillMemory(@UsbCmd, sizeof(UsbCmd), 0);

  FilenameList := TStringList.Create;
  Gaps:= nil;
  ComGap := TGapCom.Create(ComPort1);

  UsbDrv := TUsbDevice.Create;
  UsbGap := TGapUsb.Create(UsbDrv);
  GapType := 0;
  UsbBusy:=False;

  UsbDrv.OnAfterOpen := UsbDrvAfterOpen;
  UsbDrv.OnAfterClose:=UsbDrvAfterClose;
  CheckInFlag := false;
  CheckInMode := 0;

  actLoadConfig.Execute;
  //actUpdateCom.Execute;

  MPHCustomCharConv := MPH_CCONV_VIEW;

  for i := 1 to Self.ComponentCount do
    if Self.Components[i - 1] is TMPHexEditorEx then
      with Self.Components[i - 1] as TMPHexEditorEx do
      begin
        Font.Charset := DEFAULT_CHARSET;
        Font.Name := 'Fixedsys';
        // OffsetFormat:='-!10:0x00|';
        OffsetFormat := '8!10:|:';
        GutterWidth := 80;
        Translation := tkCustom;
        Repaint;
      end;
      
  mpeNormalInput.AdjustCursorPos;


  if Left > (Screen.Width - 20) then Left:=Screen.Width - 80;

  pgcView.ActivePageIndex := 0;
  pgcInput.ActivePageIndex :=0;
  pgcPanel.ActivePageIndex:=0;
end;

(*******************************************************************************
* Function    : TfrmEDSport.FormDestroy
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.FormDestroy(Sender: TObject);
begin
  try
    ComGap.Free;
    UsbGap.Free;
    if UsbDrv.Active then UsbDrv.Close;
    UsbDrv.Free;
    if ComPort1.Connected then ComPort1.Close;
    actSaveConfig.Execute;
  finally
    FilenameList.Free;
    FreeMem(SBuffer);
    FreeMem(RBuffer);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.ComPort1AfterOpen
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.ComPort1AfterOpen(Sender: TObject);
begin
  actOpenCom.Caption := 'Close';
  opnOpenDTR.Enabled := ComPort1.Connected;
  opnCloseDTR.Enabled := ComPort1.Connected;
  opnOpenRTS.Enabled := ComPort1.Connected;
  opnCloseRTS.Enabled := ComPort1.Connected;
  Gaps := ComGap;
  GapType := 1;
  actOpenUsb.Enabled:=False;
end;

(*******************************************************************************
* Function    : TfrmEDSport.ComPort1AfterClose
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.ComPort1AfterClose(Sender: TObject);
begin
  actOpenCom.Caption := 'Open';
  opnOpenDTR.Enabled := ComPort1.Connected;
  opnCloseDTR.Enabled := ComPort1.Connected;
  opnOpenRTS.Enabled := ComPort1.Connected;
  opnCloseRTS.Enabled := ComPort1.Connected;
  Gaps:= nil;
  GapType := 0;
  actOpenUsb.Enabled:=True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actHexInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actHexInputExecute(Sender: TObject);
begin
  mpeNormalInput.LockCursorAtField := lcHexField;
  mpeNormalInput.InCharField := False;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actCharInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actCharInputExecute(Sender: TObject);
begin
  mpeNormalInput.LockCursorAtField := lcCharField;
  mpeNormalInput.InCharField := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actActiveExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actOpenComExecute(Sender: TObject);
begin
  if UsbDrv.Active then
   begin
   Log('USBPort is Actived, Can not open Comport!');
   exit;
  end;

  actOpenCom.Enabled := False;

  try
    if ComPort1.Connected then
    begin
        Log('Closing Comport...');
        ComPort1.Close;
    end
    else
    begin
      Log('Opening Comport...');
      actUpdateCom.Execute;
      ComPort1.Open;
    end;
  finally
    actOpenCom.Enabled := True;

  end;

end;

(*******************************************************************************
* Function    : TfrmEDSport.actUpdateExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actUpdateComExecute(Sender: TObject);
begin
  try
    actUpdateCom.Enabled := False;
    //ComPort1.BeginUpdate;
    cmbPort.ApplySettings;
    //cmbPort.UpdateSettings;
    cmbRate.ApplySettings;
    //cmbRate.UpdateSettings;
    cmbData.ApplySettings;
    //cmbData.UpdateSettings;
    cmbFlow.ApplySettings;
    //cmbFlow.UpdateSettings;
    cmbParity.ApplySettings;
    //cmbParity.UpdateSettings;
    cmbStop.ApplySettings;
    //cmbStop.UpdateSettings;
    //ComPort1.EndUpdate;
    Comport1.Tag:=1; //DEBUG
    actUpdateCom.Enabled := True;
  except
    ShowMessage('Setting Port Error');
  end;
end;

procedure TfrmEDSport.actUpdateUSBExecute(Sender: TObject);
begin
  if opnNothing.Checked then
    CheckInMode := 0
  else if opnOnceAfterSend.Checked then
    CheckInMode :=1
  else if opnAutoCheckIn.Checked then
    CheckInMode :=2
  else
    CheckInMode :=0;

  TimerCmd(True);

end;

(*******************************************************************************
* Function    : TfrmEDSport.actUsbInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actUsbReadGapExecute(Sender: TObject);
var
  PnpStatus:Cardinal;
  LineCount:Integer;
begin
  TimerCmd(False);

  if (UsbStatus.ID > 0) then
  begin
    if (UsbStatus.GapLiveLen > 0 ) and (UsbStatus.GapLiveLen < GAP_ENCODE_SIZE) then
    begin
      if UsbDrv.ReadBuffer(RBuffer, UsbStatus.GapLiveLen) then
      begin
        if (UsbDrv.EffectBufferSize = UsbStatus.GapLiveLen) then
        begin
          ReceiveBuffer(UsbDrv.EffectBufferSize);
          UsbStatus.GapLiveLen := 0;
          Log(Format('Read Buffer Success, EffectBufferSize = %d;',[UsbDrv.EffectBufferSize]));
        end
        else
        begin
          Log(Format('Read Buffer Faild, EffectBufferSize = %d;',[UsbDrv.EffectBufferSize]));
        end;
      end
      else
      begin
        Log('Read Buffer Faild;');
        UsbDrv.Close;
      end;
    end
    else
    begin
      Log('Read Buffer Ignore, GapLiveLen = 0;');
    end;
  end;

  TimerCmd(True);
end;

(*******************************************************************************
* Function    : TfrmEDSport.actReadStatusExecute
* Caption     : .
*  @Param     : 1.Sender -
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actReadStatusExecute(Sender: TObject);
begin
  if not UsbDrv.Active then Exit;

  TimerCmd(False);

  FillMemory(@UsbStatus, sizeof(UsbStatus), 0);

  if UsbDrv.ReadStatus(@UsbStatus, sizeof(UsbStatus)) then
  begin
    if (UsbDrv.EffectControlSize = sizeof(UsbStatus)) then
    begin
      Log(Format('UsbStatus.ID = $%2.2x;',[UsbStatus.ID]));
      Log(Format('UsbStatus.Status = $%2.2x;',[UsbStatus.Status]));
      Log(Format('UsbStatus.GapLiveLen = %d.',[UsbStatus.GapLiveLen]));
      Log(Format('UsbStatus.LogLiveLen = %d.',[UsbStatus.LogLiveLen]));
      Log('Read Status Success.');
    end
    else
    begin
      Log(Format('Read Status EffectControlSize = %d', [UsbDrv.EffectControlSize]));
    end;
  end
  else
  begin
    Log('Read Status Faild.');
  end;

  TimerCmd(True);

end;

(*******************************************************************************
* Function    : TfrmEDSport.actReadLogExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actReadLogExecute(Sender: TObject);
var
  Buffer:string;
begin

  if not UsbDrv.Active then Exit;

  TimerCmd(False);

  if (UsbStatus.LogLiveLen > 0) and (UsbStatus.LogLiveLen < 256) then
  begin
    SetLength(Buffer, UsbStatus.LogLiveLen);

    if UsbDrv.ReadLog(@Buffer[1], UsbStatus.LogLiveLen) then
    begin
      if (UsbDrv.EffectControlSize = UsbStatus.LogLiveLen) then
      begin
        Log(Buffer);
        DeviceLog(Buffer);
      end
      else
      begin
        Log(Format('Read Log Faild, EffectControlSize = %d', [UsbDrv.EffectControlSize]));
      end;
    end
    else
    begin
      Log('Read Log Faild.');
      UsbDrv.Close;
    end;
  end
  else
  begin
    Log(Format('Invaild LogLiveLen:%d;',[UsbStatus.LogLiveLen]));
  end;

  TimerCmd(True);
end;



(*******************************************************************************
* Function    : TfrmEDSport.actTestExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actTestExecute(Sender: TObject);
var
  s: string;
begin
  // if OpenDialog1.Execute then
  // begin
  // mpeNormal.LoadFromFile(OpenDialog1.FileName);
  // end;
  // s := Edit1.Text;
  // mpeNormal.SetDataSizeFillByte:=10;
  // mpeNormal.WriteBuffer(s,1,1);
  // s:='1234ABCD';
  // mpeNormal.InsertBuffer(PChar(s),Length(s),0);
  mpeNormal.AppendBuffer(PChar(s), Length(s));
  // mpeNormal.SelEnd:=mpeNormal.SelStart;
  // mpeNormal.po
  // mpeNormal.NewSelection(mpeNormal.SelEnd+1,mpeNormal.SelEnd+1);
  // mpeNormal.HideSelection:=true;
  // mpeNormal.InCharField := True;

end;

(*******************************************************************************
* Function    : TfrmEDSport.mpeNormalInputChange
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.mpeNormalInputChange(Sender: TObject);
begin
  if opnInputasCharAuto.Checked then
    if (LastKey >= #$20) and (LastKey <= #$7F) then SendChar(LastKey);
end;

(*******************************************************************************
* Function    : TfrmEDSport.mpeNormalInputKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.mpeNormalInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Memo1.Lines.Add(ByteToHex(Byte(Key))+', '+Key);
  if Key = #13 then
  begin
    if chkSendWhenEnterKey.Checked and actSendNormal.Enabled then actSendNormal.Execute;
  end
  else
      LastKey := Key;
  // mpeNormalInput.data
end;

(*******************************************************************************
* Function    : TfrmEDSport.ComPort1RxChar
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param     : 2.Count - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.ComPort1RxBuf(Sender: TObject; const Buffer; Count: Integer);
begin
  (*while (Count > 0) do
  begin
    if Count > 1024 then
    begin
      ComPort1.Read(RBuffer^, 1024);
      ReceiveBuffer(1024);
      Count := Count - 1024;
    end
    else
    begin
      ComPort1.Read(RBuffer^, Count);
      ReceiveBuffer(Count);
      break;
    end;
  end;*)
end;

procedure TfrmEDSport.ComPort1RxChar(Sender: TObject; Count: Integer);
begin
  while (Count > 0) do
  begin
    if Count > 1024 then
    begin
      ComPort1.Read(RBuffer^, 1024);
      ReceiveBuffer(1024);
      Count := Count - 1024;
    end
    else
    begin
      ComPort1.Read(RBuffer^, Count);
      ReceiveBuffer(Count);
      break;
    end;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.Connected
* Caption     : .
* Return      : Boolean
* Description : .
*******************************************************************************)
function TfrmEDSport.Connected: Boolean;
begin
  if (Gaps = nil) then
      Result := False
  else if (GapType = 1) then
      Result := Comport1.Connected
  else if (GapType = 2) then
      Result := UsbDrv.Active
  else
    Result := False;

end;

procedure TfrmEDSport.DeviceLog(const Msg: string);
var
  I, Len:Integer;
  Start,Stop:Integer;
  LastIsReturn:Boolean;
  LineCount:Integer;
begin
  Len := Length(Msg);

  if Len = 0 then
  begin
    edtLog.Lines.Add('');
    exit;
  end;

  LastIsReturn := False;
  Start:=0;
  Stop:=0;

  for I := 1 to Len do
  begin
    if Msg[I] = #10 then
    begin
      if LastIsReturn then
      begin
        Stop  := I;
        LastIsReturn := False;
        Continue;
      end;
    end;

    if Msg[I] = #13 then
    begin
       LastIsReturn := True;
    end;

    if Msg[I] in [#10, #13] then
    begin
      
      if Start = 0 then
        edtLog.Lines.Add('')
      else
        edtLog.Lines.Add(Copy(Msg, Start, I - Start));

      Start := 0;
      Stop  := I;      
    end
    else
    begin
      if Start = 0 then Start := I;

      LastIsReturn := False;
    end;
  end;

  if Stop < Len then
  begin
    //LineCount:=SendMessage(edtLog.Handle, EM_GETLINECOUNT, 0, 0);
    //Start:= SendMessage(edtLog.Handle, EM_LINELENGTH, LineCount - 1, 0);

    //edtLog.CaretPos:=Point(Start-1 , LineCount-1);
    SendMessage(edtLog.Handle, EM_SETSEL, -1, -1);
    edtLog.SelLength:=0;

    if Stop = 0 then
      edtLog.SelText := Msg
    else
      edtLog.SelText := Copy(Msg, Stop + 1, Len - Stop);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actLoadConfigExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actLoadConfigExecute(Sender: TObject);
var
  ini: THMIniFile;
  i: Integer;

  procedure UpdateCombo(Combo:TComComboBox; Key:string);
  var
    Value:string;
    Index:Integer;
  begin
    if not ini.ValueExists(Key) then Exit;

    Value:= ini.Value[Key];

    Index:=Combo.Items.IndexOf(Value);

    if (Index >= 0) then
    begin
      Combo.Text := Value;
      //Combo.ItemIndex := Index;
      Combo.ApplySettings;
      Comport1.Tag :=0;
      //Combo.UpdateSettings;
    end;
  end;

begin
  cmbCommand.Items.BeginUpdate;
  cmbCommand.Items.Clear;

  for i := 0 to 11 do
  begin
    cmbCommand.Items.Add(GetCategoryStrByIndex(i));
  end;

  cmbCommand.Items.EndUpdate;
  cmbCommand.ItemIndex := 0;

  if FileExists(ChangeFileExt(ParamStr(0), '.ini')) then
  begin
    ini := THMIniFile.Create;
    try
      ini.LoadFromFile(ChangeFileExt(ParamStr(0), '.ini'));
      ini.RootKey := 'COMSetting';
      ini.OpenFirstKey;
      if ini.ItemKeyOpend then
      begin
        UpdateCombo(cmbPort,'Port');
        UpdateCombo(cmbRate,'Rate');
        UpdateCombo(cmbData,'Data');
        UpdateCombo(cmbFlow,'Flow');
        UpdateCombo(cmbParity,'Parity');
        UpdateCombo(cmbStop,'Stop');
      end;
      ini.CloseKey;

      ini.RootKey := 'USBSetting';
      ini.OpenFirstKey;
      if ini.ItemKeyOpend then
      begin
        if ini.ValueExists('CheckIn') then
        begin
          CheckInMode := ini.IValue['CheckIn'];
          if CheckInMode = 1 then
            opnOnceAfterSend.Checked :=True
          else if CheckInMode = 2 then
            opnAutoCheckIn.Checked:=True
          else
            opnNothing.Checked:=True;
        end;

        if Ini.ValueExists('ReadLog') then
          chkReadLog.Checked := Ini.BValue['ReadLog']
        else
          chkReadLog.Checked := False;

      end;
      ini.CloseKey;


      ini.RootKey := 'View';
      ini.OpenFirstKey;
      if ini.ItemKeyOpend then
      begin
        if ini.ValueExists('SyncStringView') then
            chkSyncStringView.Checked := ini.BValue['SyncStringView'];
        if ini.ValueExists('SyncProtocolView') then
            chkSyncProtocolView.Checked := ini.BValue['SyncProtocolView'];
        if ini.ValueExists('AutoClearOldProtocolView') then
            chkAutoClearOldProtocolView.Checked := ini.BValue['AutoClearOldProtocolView'];
      end;
      ini.CloseKey;

      ini.RootKey := 'Input';
      ini.OpenFirstKey;
      if ini.ItemKeyOpend then
      begin
        if ini.ValueExists('InputAs') then
        begin
          if UpperCase(ini.Value['InputAs']) = 'CHARAUTO' then
              opnInputasCharAuto.Checked := True;
          if UpperCase(ini.Value['InputAs']) = 'CHARMANUAL' then
              opnInputasCharManual.Checked := True;
          if UpperCase(ini.Value['InputAs']) = 'HEXMANUAL' then
              opnInputAsHex.Checked := True;

          opnInputasCharAutoClick(Self);
        end;

        if ini.ValueExists('ClearNormal') then
            chkClearAfterSend.Checked := ini.BValue['ClearNormal'];
        if ini.ValueExists('NormalEnterKey') then
            chkSendWhenEnterKey.Checked := ini.BValue['NormalEnterKey'];

        if ini.ValueExists('Prefix') then
            chkPrefixChar.Checked := ini.BValue['Prefix'];
        if ini.ValueExists('PrefixChar') then
            edtPrefixChar.Text := ini.SValue['PrefixChar'];
        if ini.ValueExists('Suffix') then
            chkSuffixChar.Checked := ini.BValue['Suffix'];
        if ini.ValueExists('SuffixChar') then
            edtSuffixChar.Text := ini.SValue['SuffixChar'];
        if ini.ValueExists('ClearString') then
            chkClearAfterSend2.Checked := ini.BValue['ClearString'];
        if ini.ValueExists('StringlEnterKey') then
            chkSendWhenEnterKey2.Checked := ini.BValue['StringlEnterKey'];

        if ini.ValueExists('Detail') then
            edtDetail.Text := ini.SValue['Detail'];

        if ini.ValueExists('Address') then
            edtAddress.Text := ini.SValue['Address'];

        if ini.ValueExists('Count') then
            edtCount.Text := ini.SValue['Count'];

        if ini.ValueExists('Category') then
            edtCategory.Text := ini.SValue['Category'];

        if ini.ValueExists('Port') then
            edtPort.Text := ini.SValue['Port'];

        //if ini.ValueExists('Value') then
        //    edtValue.Text := ini.SValue['Value'];

        if ini.ValueExists('Command') then
        begin
          i := ini.IValue['Command'];
          if (i >= 0) and (i < cmbCommand.Items.Count) then
              cmbCommand.ItemIndex := i;
        end;
      end;
      ini.CloseKey;

      ini.RootKey := 'Option';
      ini.OpenFirstKey;
      if ini.ItemKeyOpend then
      begin
         if ini.ValueExists('Time') then edtTime.Text:=IntToStr(ini.IValue['Time']);
         if ini.ValueExists('InputMode') then
         begin
           i:=Ini.IValue['InputMode'];
           case i of
           1: opnNormalInput.Checked:=True;
           2: opnStringInput.Checked:=True;
           3: opnProtocolInput.Checked:=True;
           else
           opnNormalInput.Checked:=True;
           end;
         end;
         if ini.ValueExists('ProtocolRS') then edtProtocolRS.Text:=IntToStr(ini.IValue['ProtocolRS']);
      end;
      ini.CloseKey;

    finally
      ini.Free;
    end;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actOpenUSBExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actOpenUSBExecute(Sender: TObject);
begin
  if Comport1.Connected then
  begin
   Log('Comport is Actived, Can not open USBPort!');
   exit;
  end;
  
  actOpenUsb.Enabled:=False;
  CheckInFlag := False;

  try
    if UsbDrv.Active then
    begin
      Log('Closing USBPort...');
      UsbDrv.Close;
    end
    else
    begin
      Log('Opening USBPort...');
      UsbDrv.Open(@USBGAP_GUID);

      if not UsbDrv.Active then
      begin
        Log('Open USBPort Faild:'+GUIDToString(USBGAP_GUID));
      end;
    end;
  finally
    actOpenUsb.Enabled:=True;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actSaveConfigExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actSaveConfigExecute(Sender: TObject);
var
  ini: THMIniFile;
  I:Integer;
begin
  ini := THMIniFile.Create;
  try
    if FileExists(ChangeFileExt(ParamStr(0), '.ini')) then
        ini.LoadFromFile(ChangeFileExt(ParamStr(0), '.ini'));

    ini.RootKey := 'COMSetting';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
      ini.Value['Port'] := cmbPort.Text;
      ini.Value['Rate'] := cmbRate.Text;
      ini.Value['Data'] := cmbData.Text;
      ini.Value['Flow'] := cmbFlow.Text;
      ini.Value['Parity'] := cmbParity.Text;
      ini.Value['Stop'] := cmbStop.Text;
    end;
    ini.CloseKey;

    ini.RootKey := 'USBSetting';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
      Ini.IValue['CheckIn'] := CheckInMode;
      Ini.BValue['ReadLog'] := chkReadLog.Checked;
    end;
    ini.CloseKey;

    ini.RootKey := 'View';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
      ini.BValue['SyncStringView'] := chkSyncStringView.Checked;
      ini.BValue['SyncProtocolView'] := chkSyncProtocolView.Checked;
      ini.BValue['AutoClearOldProtocolView'] := chkAutoClearOldProtocolView.Checked;
    end;
    ini.CloseKey;

    ini.RootKey := 'Input';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
      if opnInputasCharAuto.Checked then
          ini.Value['InputAs'] := 'CharAuto';
      if opnInputasCharManual.Checked then
          ini.Value['InputAs'] := 'CharManual';
      if opnInputAsHex.Checked then
          ini.Value['InputAs'] := 'HexManual';

      ini.BValue['ClearNormal'] := chkClearAfterSend.Checked;
      ini.BValue['NormalEnterKey'] := chkSendWhenEnterKey.Checked;

      ini.BValue['Prefix'] := chkPrefixChar.Checked;
      ini.SValue['PrefixChar'] := edtPrefixChar.Text;
      ini.BValue['Suffix'] := chkSuffixChar.Checked;
      ini.SValue['SuffixChar'] := edtSuffixChar.Text;
      ini.BValue['ClearString'] := chkClearAfterSend2.Checked;
      ini.BValue['StringlEnterKey'] := chkSendWhenEnterKey2.Checked;

      ini.SValue['Detail'] := edtDetail.Text;
      ini.SValue['Address'] := edtAddress.Text;
      ini.SValue['Count'] := edtCount.Text;
      ini.SValue['Category'] := edtCategory.Text;
      ini.SValue['Port'] := edtPort.Text;
      //ini.SValue['Value'] := edtValue.Text;

      ini.IValue['Command'] := cmbCommand.ItemIndex;

    end;
    ini.CloseKey;

    ini.RootKey := 'View';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
    end;
    ini.CloseKey;

    ini.RootKey := 'Option';
    ini.OpenFirstKey;
    if not ini.ItemKeyOpend then ini.AppendKey;
    if ini.ItemKeyOpend then
    begin
       I:=0;
       ini.IValue['Time']:= StrToInt(edtTime.Text);
       if opnNormalInput.Checked then I:=1;
       if opnStringInput.Checked then I:=2;
       if opnProtocolInput.Checked then I:=3;
       Ini.IValue['InputMode']:=I;
       ini.IValue['ProtocolRS']:=StrToInt( edtProtocolRS.Text);

    end;
    ini.CloseKey;

    ini.SaveToFile(ChangeFileExt(ParamStr(0), '.ini'));
  finally
    ini.Free;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearNormalViewExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearNormalViewExecute(Sender: TObject);
begin
  mpeNormal.ClearBuffer;
  RXCount := 0;
  TXCount := 0;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actSaveAsFileExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
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
          2: sFile.Text := edtProtocolView.Text;
        end;
      if opnAsHex.Checked then
        case pgcView.ActivePageIndex of
          0: sFile.Text := mpeNormal.AsHex;
          1: sFile.Text := edtStringView.Text;
          2: sFile.Text := edtProtocolView.Text;
        end;
      sFile.SaveToFile(SaveDialog1.FileName);
    finally
      sFile.Free;
    end;
  end;
  // mpeNormal.get
end;

(*******************************************************************************
* Function    : TfrmEDSport.opnInputasCharAutoClick
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
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

(*******************************************************************************
* Function    : TfrmEDSport.opnInputAsHexKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.opnInputAsHexKeyPress(Sender: TObject;
  var Key: Char);
begin
  opnInputasCharAutoClick(Sender);
end;

(*******************************************************************************
* Function    : TfrmEDSport.SendChar
* Caption     : .
*  @Param     : 1.Buffer -
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SendChar(Buffer: Char);
begin
  if Comport1.Connected then
  begin
    ComPort1.Write(Buffer, 1);
    TXCount := TXCount + 1;
  end
  else if UsbDrv.Active then
  begin
    UsbDrv.WriteBuffer(@Buffer, 1);
    TXCount := TXCount + 1;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.SendBuffer
* Caption     : .
*  @Param     : 1.Buffer - 
*  @Param     : 2.Count - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SendBuffer(Buffer: Pointer; Count: Integer);
begin
  if ComPort1.Connected then
  begin
    ComPort1.Write(Buffer^, Count);
    TXCount := TXCount + Count;
  end
  else if UsbDrv.Active then
  begin
    UsbDrv.WriteBuffer(@Buffer, Count);
    TXCount := TXCount + Count;
  end;  
end;



(*******************************************************************************
* Function    : TfrmEDSport.GetRXCount
* Caption     : .
* Return      : Integer
* Description : .
*******************************************************************************)
function TfrmEDSport.GetRXCount: Integer;
begin
  Result := FRXCount;
end;

(*******************************************************************************
* Function    : TfrmEDSport.GetTXCount
* Caption     : .
* Return      : Integer
* Description : .
*******************************************************************************)
function TfrmEDSport.GetTXCount: Integer;
begin
  Result := FTXCount;
end;

(*******************************************************************************
* Function    : TfrmEDSport.SetRXCount
* Caption     : .
*  @Param In  : 1.Value - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SetRXCount(const Value: Integer);
begin
  FRXCount := Value;
  if FRXCount = 0 then
      edtRX.Text := ''
  else
      edtRX.Text := Inttostr(FRXCount);
end;

(*******************************************************************************
* Function    : TfrmEDSport.SetTXCount
* Caption     : .
*  @Param In  : 1.Value - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SetTXCount(const Value: Integer);
begin
  FTXCount := Value;
  if FTXCount = 0 then
      edtTX.Text := ''
  else
      edtTX.Text := Inttostr(FTXCount);
end;


(*******************************************************************************
* Function    : TfrmEDSport.actCheckLogExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actCheckLogExecute(Sender: TObject);
var
  LogEnable:Byte;
begin
  if not UsbDrv.Active then Exit;

  TimerCmd(False);

  FillMemory(@UsbStatus, sizeof(UsbStatus), 0);

  if UsbDrv.ReadStatus(@UsbStatus, sizeof(UsbStatus)) then
  begin
    if (UsbDrv.EffectControlSize = sizeof(UsbStatus)) then
    begin
      if (UsbStatus.Status and USBGAP_LOG_ENABLE) = USBGAP_LOG_ENABLE then
      begin
        Log('Last Log Status is Enable;');
        LogEnable:=0;
      end
      else
      begin
        Log('Last Log Status is Disable;');
        LogEnable:=1;
      end;

       UsbCmd.Query := USBGAP_CMD_LOGENABLE;
       UsbCmd.Param1:= LogEnable;
       UsbCmd.Param2:=0;
       UsbCmd.Param3:=0;

       if (UsbDrv.WriteCmd(@UsbCmd, Sizeof(UsbCmd))) then
       begin
         if (LogEnable = 1) then
           Log('Now Log is Enabled;')
         else
           Log('Now Log is Disable;');

       end
       else
       begin
         Log('Write Command Faild.');
         UsbDrv.Close;
       end;
    end
    else
    begin
      Log(Format('Read Status EffectControlSize = %d', [UsbDrv.EffectControlSize]));
    end;
  end
  else
  begin
    Log('Read Status Faild.');
    UsbDrv.Close;
  end;

  TimerCmd(True);
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearDeviceLogExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearDeviceLogExecute(Sender: TObject);
begin
  edtLog.Clear;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearEventExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearEventExecute(Sender: TObject);
begin
  edtEvent.Clear;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearNormalInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)

procedure TfrmEDSport.actClearNormalInputExecute(Sender: TObject);
begin
  mpeNormalInput.ClearBuffer;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actSendNormalExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actSendNormalExecute(Sender: TObject);
var
  Buffer: PChar;
  Count: Integer;
begin
  actSendNormal.Enabled := False;
  TimerCmd(False);
  Count := mpeNormalInput.DataSize;
  if Count <= 0 then exit;
  GetMem(Buffer, Count);
  try
    mpeNormalInput.ReadBuffer(Buffer^, 0, Count);
    SendBuffer(Buffer, Count);
    CheckInFlag := True;
    if chkClearAfterSend.Checked then mpeNormalInput.ClearBuffer;
  finally
    FreeMem(Buffer);
  end;
  TimerCmd(True);
  actSendNormal.Enabled := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.ReceiveBuffer
* Caption     : .
*  @Param     : 1.Count - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.ReceiveBuffer(Count: Integer);
begin
  if Count <= 0 then exit;
  mpeNormal.AppendBuffer(RBuffer, Count);
  if chkSyncStringView.Checked then PressBufferToString(RBuffer, Count);
  if chkSyncProtocolView.Checked then PressBufferToProtocol(RBuffer, Count);
  RXCount := RXCount + Count;
end;

(*******************************************************************************
* Function    : GetSerialPortsSys
* Caption     : .
*  @Param In  : 1.Items - 
* Return      : Boolean
* Description : .
*******************************************************************************)
function GetSerialPortsSys(const Items: TStrings): Boolean;
var
  pcReturned: DWORD;
  pcbNeeded: DWORD;
  outb: PChar;
  Ports: PPortInfo2;
  i: Integer;
  PortName: string;
begin
  // function EnumPorts(pName: PChar; Level: DWORD; pPorts: Pointer; cbBuf: DWORD;
  // var pcbNeeded, pcReturned: DWORD): BOOL; stdcall;
  outb := nil;
  Result := False;
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
      Result := True;
    end
  finally
    FreeMem(outb);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearStringViewExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearStringViewExecute(Sender: TObject);
begin
  // GetSerialPortsSys(edtStringView.Lines);
  // exit;

  edtStringView.Clear;
  edtRXLine.Text := '';
  edtEndOfString.Text := '';
  // GetSerialPortsSys(edtStringView.Lines);
end;

(*******************************************************************************
* Function    : TfrmEDSport.PressBufferToString
* Caption     : .
*  @Param     : 1.Buffer - 
*  @Param     : 2.Count - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.PressBufferToString(Buffer: PChar; Count: Integer);
var
  i, j: Integer;
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
      begin
        edtStringView.Lines.Add(strBuffer);
        SendMessage(edtStringView.Handle, EM_SETSEL, -1, -1);
      end;
      strBuffer := '';
      j := 0;

      if (Buffer[i - 1] = #13) then
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

      // Continue;
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

(*******************************************************************************
* Function    : TfrmEDSport.PressBufferToProtocol
* Caption     : .
*  @Param     : 1.Buffer - 
*  @Param     : 2.Count - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.PressBufferToProtocol(Buffer: PChar; Count: Integer);
var
  Str: string;
  i: Byte;
  Data: PByte;
  Cnt:Integer;
begin
  if (Gaps = nil) then Exit;

  if Gaps.ReceiveBuffer(GapBuffer(Buffer), Count) > 0 then
  begin
    if chkAutoClearOldProtocolView.Checked then edtProtocolView.Clear;

    if edtProtocolView.Lines.Count>0 then edtProtocolView.Lines.Add('');

    RXPackage := FRXPackage + 1;

    edtProtocolView.Lines.Add('TimeStamp = '+ FormatDatetime(DF_FULL, Now()));
    edtProtocolView.Lines.Add(Format('Package = %d ', [FRXPackage]));
    if CategoryIsCommand(Gaps.RxData.Command) then
    begin
      edtProtocolView.Lines.Add(Format('Command = %s (0x%.2x)', [GetCategoryStr(Gaps.RxData.Command), Gaps.RxData.Command]));
      edtProtocolView.Lines.Add(Format('Detail = %d (0x%.2x)', [Gaps.RxData.Detail, Gaps.RxData.Detail]));
    end
    else
    begin
      edtProtocolView.Lines.Add(Format('Reply = %s (0x%.2x)', [GetCategoryStr(Gaps.RxData.Respond), Gaps.RxData.Respond]));
      edtProtocolView.Lines.Add(Format('Status = %s (0x%.2x)', [GetStatusStr(Gaps.RxData.Status), Gaps.RxData.Status]));
    end;

    edtProtocolView.Lines.Add(Format('Size = %d (0x%.4x)', [Gaps.RxData.Size, Gaps.RxData.Size]));

    case  Gaps.RxData.Command of
      GAP_CMD_DETECT, GAP_RPD_DETECT:
      begin
        edtProtocolView.Lines.Add(Format('DeviceID = %d (0x%.8x)', [Gaps.RxData.Detect.DeviceID, Gaps.RxData.Detect.DeviceID]));
        edtProtocolView.Lines.Add(Format('VenderID = %d (0x%.8x)', [Gaps.RxData.Detect.VenderID, Gaps.RxData.Detect.VenderID]));
        edtProtocolView.Lines.Add(Format('Hardware = %d.%d (Build %d) (0x%.8x)', [Gaps.RxData.Detect.Hardware.Major,
                                                                            Gaps.RxData.Detect.Hardware.Minor,
                                                                            Gaps.RxData.Detect.Hardware.Build,
                                                                            Gaps.RxData.Detect.Hardware.uVerInfo]));
        edtProtocolView.Lines.Add(Format('Firmware = %d.%d (Build %d) (0x%.8x)', [Gaps.RxData.Detect.Firmware.Major,
                                                                            Gaps.RxData.Detect.Firmware.Minor,
                                                                            Gaps.RxData.Detect.Firmware.Build,
                                                                            Gaps.RxData.Detect.Firmware.uVerInfo]));
        Cnt:= Gaps.RxData.Size - sizeof(TGapDetect);
        Data := @Gaps.RxData.Detect.Descript;
      end;
      GAP_CMD_SETUP, GAP_RPD_SETUP:
      begin
        Cnt:= Gaps.RxData.Size - 4;
        Data := @Gaps.RxData.Setup.bParam;
        edtProtocolView.Lines.Add(Format('Category = %d (0x%.8x)', [Gaps.RxData.Setup.Category, Gaps.RxData.Setup.Category]));
      end;
      GAP_CMD_READ,GAP_CMD_WRITE,GAP_RPD_READ,GAP_RPD_WRITE:
      begin
        Cnt := Gaps.RxData.Size - 8;
        Data := @Gaps.RxData.ReadWrite.bData;
        edtProtocolView.Lines.Add(Format('Address = %d (0x%.8x)', [Gaps.RxData.ReadWrite.Address, Gaps.RxData.ReadWrite.Address]));
        edtProtocolView.Lines.Add(Format('Count = %d (0x%.8x)', [Gaps.RxData.ReadWrite.Count, Gaps.RxData.ReadWrite.Count]));
      end;
      GAP_CMD_CONTROL,GAP_RPD_CONTROL:
      begin
        Cnt := Gaps.RxData.Size - 4;
        Data := @Gaps.RxData.Control.bValue;
        edtProtocolView.Lines.Add(Format('Port = %d (0x%.8x)', [Gaps.RxData.Control.Port, Gaps.RxData.Control.Port]));
      end;
      else //GAP_CMD_ECHO, GAP_RPD_ECHO:
      begin
        Cnt:= Gaps.RxData.Size;
        Data := @Gaps.RxData.Echo.bReply;
      end;
    end;

    Str := 'Data = ';
    if Cnt<0 then Cnt:=0;

    for i := 1 to Cnt do
    begin
      Str := Str + IntToHex(Data^, 2) + ' ';
      Inc(Data);
      if ((i mod 16) = 0) then
      begin
        edtProtocolView.Lines.Add(Str);
        Str := '       ';
      end;
    end;

    if ((Cnt mod 16) > 0) then
    begin
      edtProtocolView.Lines.Add(Str);
    end
    else if (Cnt = 0) then
    begin
      edtProtocolView.Lines.Add('Data = null');
    end;

    SendMessage(edtProtocolView.Handle, EM_SETSEL, -1, -1);
  end;

  //
end;

(*******************************************************************************
* Function    : TfrmEDSport.actSendStringExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actSendStringExecute(Sender: TObject);
var
  Buffer: PChar;
  cnt: Integer;
  s: string;
begin
  actSendString.Enabled := False;
  if edtStringInput.Text <> '' then
  begin
    TimerCmd(False);

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
      CheckInFlag := True;
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
      TimerCmd(True);
    end;
  end;

  actSendString.Enabled := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearStringInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearStringInputExecute(Sender: TObject);
begin
  edtStringInputList.Clear;
  edtStringInput.Clear;
  edtTXLine.Text := '';
end;

(*******************************************************************************
* Function    : TfrmEDSport.edtStringInputKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.edtStringInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and chkSendWhenEnterKey2.Checked and actSendString.Enabled then actSendString.Execute;
end;

(*******************************************************************************
* Function    : TfrmEDSport.edtStringViewChange
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.edtStringViewChange(Sender: TObject);
begin
  if edtStringView.Lines.Count = 0 then
      edtRXLine.Text := ''
  else
      edtRXLine.Text := Inttostr(edtStringView.Lines.Count);
end;

(*******************************************************************************
* Function    : TfrmEDSport.edtStringInputListChange
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.edtStringInputListChange(Sender: TObject);
begin
  if edtStringInputList.Lines.Count = 0 then
      edtTXLine.Text := ''
  else
      edtTXLine.Text := Inttostr(edtStringInputList.Lines.Count);
end;

(*******************************************************************************
* Function    : PressBufferToStringList
* Caption     : .
*  @Param     : 1.Buffer - 
*  @Param     : 2.List - 
*  @Param     : 3.DeleteNullLine - 
* Description : .
*******************************************************************************)
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
    if not((trim(s) = '') and DeleteNullLine) then
        List.Add(s);
    Pos2 := Pos1 + 1;
    Pos1 := SmartPos(#13, Sour, Pos2);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actSendProtocolExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actSendProtocolExecute(Sender: TObject);
var
  Cnt:Integer;
  Buf:string;
  Data:PByte;
begin
  actSendProtocol.Enabled := False;
  Cnt:=StrToInt(edtProtocolRS.Text);
  if Cnt>16 then Cnt:=16;

  if Connected then
  begin
    TimerCmd(False);

    Gaps.TransmitRS := Cnt;
    Gaps.TxData.Command := GetCategoryByIndex(cmbCommand.ItemIndex);
    Gaps.TxData.Detail := NumberToUint(edtDetail.Text);

    case  Gaps.TxData.Command of
      GAP_CMD_DETECT,  GAP_RPD_DETECT:
      begin
        Gaps.TxData.Size := mpeProtocolInput.DataSize;
        Data:=@Gaps.TxData.Detect.Descript;
      end;
      GAP_CMD_SETUP, GAP_RPD_SETUP:
      begin
        Gaps.TxData.Size := mpeProtocolInput.DataSize + 4;
        Gaps.TxData.Setup.Category:= NumberToUint(edtCategory.Text);
        Data:=@Gaps.TxData.Setup.bParam;
      end;
      GAP_CMD_READ,GAP_CMD_WRITE,GAP_RPD_READ,GAP_RPD_WRITE:
      begin
        Gaps.TxData.Size := mpeProtocolInput.DataSize + 8;
        Gaps.TxData.ReadWrite.Count:= NumberToUint(edtCount.Text);
        Gaps.TxData.ReadWrite.Address:= NumberToUint(edtAddress.Text);
        Data:=@Gaps.TxData.ReadWrite.bData;
      end;
      GAP_CMD_CONTROL,GAP_RPD_CONTROL:
      begin
        Gaps.TxData.Size := mpeProtocolInput.DataSize + 8;
        Gaps.TxData.Control.Port:= NumberToUint(edtPort.Text);
        //Gaps.TxData.Control.Value:= NumberToUint(edtValue.Text);
        Data:=@Gaps.TxData.Control.bValue;
      end;
      else
      begin
        Gaps.TxData.Size := mpeProtocolInput.DataSize;
        Data:=@Gaps.TxData.Echo.bReply;
      end;
    end;

    if mpeProtocolInput.DataSize > 0 then
        mpeProtocolInput.ReadBuffer(Data^, 0, mpeProtocolInput.DataSize);

    if Gaps.Transmit then
    begin
      TxPackage := FTxPackage + 1;
      CheckInFlag := True;

      if Cnt>0 then
      begin
        SetLength(Buf,Cnt);
        FillMemory(@Buf[1], Cnt, Ord(GAP_PTC_RS));
        mpeNormalInput.AppendBuffer(@Buf[1], Cnt);
      end;

      mpeNormalInput.AppendBuffer(PChar(Gaps.Buffer), Gaps.TransmitCount);
      if chkClearAfterSend3.Checked then mpeProtocolInput.ClearBuffer;
    end;
    
    TimerCmd(True);
  end;
  
  actSendProtocol.Enabled := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearProtocolInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearProtocolInputExecute(Sender: TObject);
begin
  mpeProtocolInput.ClearBuffer;
  TXPackage := 0;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actClearProtocolViewExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actClearProtocolViewExecute(Sender: TObject);
begin
  edtProtocolView.Clear;
  TXPackage := 0;
  RXPackage := 0;
end;

(*******************************************************************************
* Function    : TfrmEDSport.mpeProtocolInputKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.mpeProtocolInputKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if chkSendWhenEnterKey3.Checked and actSendProtocol.Enabled then actSendProtocol.Execute;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.GetRXPackage
* Caption     : .
* Return      : Integer
* Description : .
*******************************************************************************)
function TfrmEDSport.GetRXPackage: Integer;
begin
  Result := FRXPackage;
end;

(*******************************************************************************
* Function    : TfrmEDSport.GetTXPackage
* Caption     : .
* Return      : Integer
* Description : .
*******************************************************************************)
function TfrmEDSport.GetTXPackage: Integer;
begin
  Result := FTXPackage;
end;

(*******************************************************************************
* Function    : TfrmEDSport.Log
* Caption     : .
*  @Param     : 1.Msg - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.Log(Msg: string);
begin
  edtEvent.Lines.Add(FormatDateTime('hh:nn:ss.zzz -> ', now) + Msg);
  SendMessage(edtEvent.Handle, EM_SETSEL, -1, -1);
end;

(*******************************************************************************
* Function    : TfrmEDSport.SetRXPackage
* Caption     : .
*  @Param In  : 1.Value - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SetRXPackage(const Value: Integer);
begin
  FRXPackage := Value;
  if FRXPackage = 0 then
      edtRXPack.Text := ''
  else
      edtRXPack.Text := Inttostr(FRXPackage);
end;

(*******************************************************************************
* Function    : TfrmEDSport.SetTXPackage
* Caption     : .
*  @Param In  : 1.Value - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.SetTXPackage(const Value: Integer);
begin
  FTXPackage := Value;
  if FTXPackage = 0 then
      edtTXPack.Text := ''
  else
      edtTXPack.Text := Inttostr(FTXPackage);
end;


procedure TfrmEDSport.Timer2Timer(Sender: TObject);
var
  UsbStatus:TUSB_GAP_Status;
  LogStr:string;
  PnpFlag:Cardinal;
begin
  //exit;

  if not UsbDrv.Active then Exit;
  if UsbBusy then Exit;

  //Timer2.Enabled:=False;
  UsbBusy := True;

  //DEBUG
  //CheckInFlag := False;

  if UsbDrv.CheckPnp(@PnpFlag, sizeof(PnpFlag)) then
  begin

    if (chkReadLog.Checked) or ((CheckInMode > 0) and (CheckInFlag)) then
    begin
      FillMemory(@UsbStatus, sizeof(UsbStatus), 0);

      if UsbDrv.ReadStatus(@UsbStatus, sizeof(UsbStatus)) then
      begin
        if (UsbDrv.EffectControlSize = sizeof(UsbStatus)) then
        begin
          if (UsbStatus.ID > 0) then
          begin
            if (chkReadLog.Checked) and (UsbStatus.LogLiveLen >0) and (UsbStatus.LogLiveLen < 256) then
            begin
              SetLength(LogStr, UsbStatus.LogLiveLen);
              if UsbDrv.ReadLog(@LogStr[1], UsbStatus.LogLiveLen) then
              begin
                if (UsbDrv.EffectControlSize>0) then
                begin
                  DeviceLog(LogStr);
                end;
              end
              else
              begin
                Log('Read Log Faild;');
                UsbDrv.Close;
              end;
            end;

            if (CheckInFlag) and (UsbStatus.GapLiveLen >0 ) and (UsbStatus.GapLiveLen < GAP_ENCODE_SIZE) then
            begin
              if UsbDrv.ReadBuffer(RBuffer, UsbStatus.GapLiveLen) then
              begin
                if (UsbDrv.EffectBufferSize > 0) then
                begin
                  ReceiveBuffer(UsbDrv.EffectBufferSize);
                  if (CheckInMode = 1) then CheckInFlag := False;
                end;
              end
              else
              begin
                Log('Read Buffer Faild;');
                UsbDrv.Close;
              end;
            end;
          end;
        end;
      end
      else
      begin
        Log('Read Status Faild;');
        UsbDrv.Close;
      end;
    end;

    if (CheckInMode = 0) and (CheckInFlag) then
    begin
      CheckInFlag:=False;
    end;
  end
  else
  begin
    Log('Check USB PNP Faild;');
    UsbDrv.Close;
  end;

  UsbBusy := False;
  //Timer2.Enabled := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.TimerCmd
* Caption     : .
*  @Param     : 1.Active - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.TimerCmd(Active: Boolean);
var
  Count:Integer;
begin
  if not UsbDrv.Active then Exit;

  Timer2.Enabled := Active and chkAutoCheckPnp.Checked;

  if not Active then
  begin
    Count := 1000;
    while UsbBusy and (Count>0) do
    begin
      Sleep(1);
      Dec(Count);
    end;
  end;


  (*if CheckInMode >0 then
    Timer2.Enabled := Active
  else
    Timer2.Enabled := False;
  *)
end;

(*******************************************************************************
* Function    : TfrmEDSport.UsbDrvAfterOpen
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.UsbDrvAfterOpen(Sender: TObject);
var
  DeviceInfo: string;
begin
  Gaps:= UsbGap;
  GapType := 2;
  actOpenUsb.Caption:='Close';
  actOpenCom.Enabled:=False;
  if UsbDrv.Active then
  begin
    DeviceInfo := UsbDrv.DevicePath;
    Log('USB Status: Active');
    Log('Type: ' + GetArea(DeviceInfo, '?\', '#'));
    Log('Vid: ' + GetArea(DeviceInfo, '#vid_', '&'));
    Log('Pid: ' + GetArea(DeviceInfo, '&pid_', '#'));
    Log('Guid: ' + GetArea(DeviceInfo, '#{', '}'));

    TimerCmd(True);
    //Timer2.Enabled:=True;

  end
  else
  begin
    Log('USB Status: Error');
    Log(Format('Error: (%0x)', [UsbDrv.LastError]));
    //Timer2.Enabled:=False;
    TimerCmd(False);
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.UsbDrvAfterClose
* Caption     : .
*  @Param     : 1.Sender -
* Description : .
*******************************************************************************)
procedure TfrmEDSport.UsbDrvAfterClose(Sender: TObject);
begin
  Timer2.Enabled:=False;
  Gaps:=nil;
  GapType :=0;
  actOpenUsb.Caption:='Open';
  actOpenCom.Enabled:=True;
  Log('USB Status: Close');
end;

(*******************************************************************************
* Function    : TfrmEDSport.UsbError
* Caption     : .
*  @Param     : 1.Sender -
*  @Param     : 2.ErrorCode -
* Description : .
*******************************************************************************)
procedure TfrmEDSport.UsbError(Sender: TObject; ErrorCode: Integer);
begin
  Log(Format('USB ERROR: %d',[ErrorCode]));
end;

(*******************************************************************************
* Function    : TfrmEDSport.opnOpenDTRClick
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.opnOpenDTRClick(Sender: TObject);
begin
  if opnOpenDTR.Checked then ComPort1.SetDTR(True);
  if opnCloseDTR.Checked then ComPort1.SetDTR(False);
  // Windows.dt
end;

(*******************************************************************************
* Function    : TfrmEDSport.opnOpenDTRKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.opnOpenDTRKeyPress(Sender: TObject; var Key: Char);
begin
  opnOpenDTRClick(Sender);
end;

(*******************************************************************************
* Function    : TfrmEDSport.opnOpenRTSClick
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.opnOpenRTSClick(Sender: TObject);
begin
  if opnOpenRTS.Checked then ComPort1.SetRTS(True);
  if opnCloseRTS.Checked then ComPort1.SetRTS(False);
end;

(*******************************************************************************
* Function    : TfrmEDSport.opnOpenRTSKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.opnOpenRTSKeyPress(Sender: TObject; var Key: Char);
begin
  opnOpenRTSClick(Sender);
end;

(*******************************************************************************
* Function    : TfrmEDSport.ComPort1BeforeClose
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.ComPort1BeforeClose(Sender: TObject);
begin
  if not opnCloseDTR.Checked then opnCloseDTR.Checked := True;
  if not opnCloseRTS.Checked then opnCloseRTS.Checked := True;
end;

(*******************************************************************************
* Function    : TfrmEDSport.actTimeInputExecute
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.actTimeInputExecute(Sender: TObject);
begin
  if opnNormalInput.Checked then actSendNormal.Execute;
  if opnStringInput.Checked then actSendString.Execute;
  if opnProtocolInput.Checked then actSendProtocol.Execute;
end;

(*******************************************************************************
* Function    : TfrmEDSport.chkEnabledTimeClick
* Caption     : .
*  @Param     : 1.Sender - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.chkAutoCheckPnpClick(Sender: TObject);
begin
  TimerCmd(chkAutoCheckPnp.Checked);
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
    opnProtocolInput.Enabled := not chkEnabledTime.Checked;;
    opnStringInput.Enabled := not chkEnabledTime.Checked;;
  except
    Timer1.Enabled := False;
    chkEnabledTime.Checked := False;
    mpeNormalInput.Enabled := not chkEnabledTime.Checked;
    edtStringInput.Enabled := not chkEnabledTime.Checked;
    mpeProtocolInput.Enabled := not chkEnabledTime.Checked;
    edtTime.Enabled := not chkEnabledTime.Checked;
    opnNormalInput.Enabled := not chkEnabledTime.Checked;
    opnProtocolInput.Enabled := not chkEnabledTime.Checked;
    opnStringInput.Enabled := not chkEnabledTime.Checked;
  end;
end;

(*******************************************************************************
* Function    : TfrmEDSport.edtTimeKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.edtTimeKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #8]) then Key := #0;
end;

(*******************************************************************************
* Function    : TfrmEDSport.chkEnabledTimeKeyPress
* Caption     : .
*  @Param     : 1.Sender - 
*  @Param Out : 2.Key - 
* Description : .
*******************************************************************************)
procedure TfrmEDSport.chkEnabledTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  chkEnabledTimeClick(Sender);
end;

end.
