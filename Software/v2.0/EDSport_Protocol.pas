(******************************************************************************
 **  项目名称:    EDSport                                                     **
 **  建立作者:    吴创明(Aleyn.wu)                                            **
 **  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
 **  -----------------------------------------------------------------------  **
 **  单元名称:    EDSport_Protocol.pas                                        **
 **  建立日期:    2006-04-12                                                  **
 **  更新日期:    2016-04-21                                                  **
 **  单元简介:    应用协议定义，编码，解码                                    **
 **  更新历史:                                                                **
 ******************************************************************************)
unit EDSport_Protocol;

interface

uses
  Classes, Windows, CPort, GAProtocol, hmStrTools, SysUtils, WdmDeviceApi;

const
  USBGAP_GUID: TGUID = (D1: $E59B3705; D2: $D3D0; D3: $4B8A; D4: ($8C, $BB, $31, $F1, $4A, $21, $61, $9A));

type
  PUSB_GAP_Status = ^TUSB_GAP_Status;

  TUSB_GAP_Status = packed record
    Query: Cardinal; // 主机查询
    Response: Cardinal; // 设备回复
  end;

type
  TGapCom = class(TGapProtocol)
  private
    Comport: TComport;
  protected
    function InnerTransmitBuffer(const Data: GapBuffer; Count: Integer): Boolean; override;
    function InnerReceiveBuffer(const Data: GapBuffer; var Count: Integer): Boolean; override;
  public
    constructor Create(Comport: TComport);
  end;

  TGapUsb = class(TGapProtocol)
  private
    FUsbDrv: TWDMDevice;
  protected
    function InnerTransmitBuffer(const Data: GapBuffer; Count: Integer): Boolean; override;
    function InnerReceiveBuffer(const Data: GapBuffer; var Count: Integer): Boolean; override;
  public
    constructor Create(UsbDrv: TWDMDevice);
    property UsbDrv: TWDMDevice read FUsbDrv write FUsbDrv;
  end;

  TOnUsbError = procedure(Sender: TObject; ErrorCode: Integer) of object;
  TOnUsbReadBuffer = procedure(Sender: TObject; OperatStatus: Boolean; NumberOfBytes: Integer) of object;
  TOnUsbWriteBuffer = procedure(Sender: TObject; OperatStatus: Boolean; NumberOfBytes: Integer) of object;

  TUsbDevice = class(TWDMDevice)
  private
    FOnReadBuffer: TOnUsbReadBuffer;
    FOnWriteBuffer: TOnUsbWriteBuffer;
    FOnAfterOpen: TNotifyEvent;
    FOnAfterClose: TNotifyEvent;
    FOnError: TOnUsbError;
    Ioctl_Read: TWDMIoControl;
    Ioctl_Write: TWDMIoControl;
    FEffectControlSize: Cardinal;
  protected
    procedure Init; override;
    procedure DoAfterOpen; override;
    procedure DoAfterClose; override;
    procedure DoAfterExecuteIoctl(Sender: TWDMIoControl); override;
    procedure DoError; override;
    procedure DoAfterReadBuffer(OperatStatus: Boolean; NumberOfBytes: Integer); override;
    procedure DoAfterWriteBuffer(OperatStatus: Boolean; NumberOfBytes: Integer); override;
  public
    function WriteControl(const Buffer: PChar; nNumberOfBytesToWrite: DWORD): Boolean;
    function ReadControl(const Buffer: PChar; nNumberOfBytesToRead: DWORD): Boolean;

    property OnAfterOpen: TNotifyEvent read FOnAfterOpen write FOnAfterOpen;
    property OnAfterClose: TNotifyEvent read FOnAfterClose write FOnAfterClose;
    property OnError: TOnUsbError read FOnError write FOnError;
    property OnReadBuffer: TOnUsbReadBuffer read FOnReadBuffer write FOnReadBuffer;
    property OnWriteBuffer: TOnUsbWriteBuffer read FOnWriteBuffer write FOnWriteBuffer;
    property EffectControlSize: Cardinal read FEffectControlSize write FEffectControlSize;
  end;

function CategoryIsCommand(Category: Byte): Boolean;
function CategoryIsRespond(Category: Byte): Boolean;

function GetCategoryStr(Category: Byte): string;
function GetStatusStr(Respond: Byte): string;
function GetCategoryStrByIndex(Category: Byte): string; overload;
function GetCategoryByIndex(Category: Byte): Byte; overload;
function NumberToUint(Number: string): Cardinal;

implementation

function CategoryIsCommand(Category: Byte): Boolean;
begin
  Result := Category in [GAP_CMD_DETECT, GAP_CMD_SETUP, GAP_CMD_READ, GAP_CMD_WRITE, GAP_CMD_CONTROL, GAP_CMD_ECHO];
end;

function CategoryIsRespond(Category: Byte): Boolean;
begin
  Result := Category in [GAP_RPD_DETECT, GAP_RPD_SETUP, GAP_RPD_READ, GAP_RPD_WRITE, GAP_RPD_CONTROL, GAP_RPD_ECHO];
end;

function GetCategoryStr(Category: Byte): string;
begin
  // 主类别
  case Category of
    GAP_CMD_DETECT: Result := 'CMD_DETECT';
    GAP_CMD_SETUP: Result := 'CMD_SETUP';
    GAP_CMD_READ: Result := 'CMD_READ';
    GAP_CMD_WRITE: Result := 'CMD_WRITE';
    GAP_CMD_CONTROL: Result := 'CMD_CONTROL';
    GAP_CMD_ECHO: Result := 'CMD_ECHO';

    GAP_RPD_DETECT: Result := 'RPD_DETECT';
    GAP_RPD_SETUP: Result := 'RPD_SETUP';
    GAP_RPD_READ: Result := 'RPD_READ';
    GAP_RPD_WRITE: Result := 'RPD_WRITE';
    GAP_RPD_CONTROL: Result := 'RPD_CONTROL';
    GAP_RPD_ECHO: Result := 'RPD_ECHO';
  else
    Result := 'CMD_UNKNOW';
  end;
end;

function GetCategoryStrByIndex(Category: Byte): string;
begin
  // 主类别
  case Category of
    0: Result := 'CMD_DETECT';
    1: Result := 'CMD_SETUP';
    2: Result := 'CMD_READ';
    3: Result := 'CMD_WRITE';
    4: Result := 'CMD_CONTROL';
    5: Result := 'CMD_ECHO';

    6: Result := 'RPD_DETECT';
    7: Result := 'RPD_SETUP';
    8: Result := 'RPD_READ';
    9: Result := 'RPD_WRITE';
    10: Result := 'RPD_CONTROL';
    11: Result := 'RPD_ECHO';
  else
    Result := 'CMD_UNKNOW';
  end;
end;

function GetCategoryByIndex(Category: Byte): Byte;
begin
  // 主类别
  case Category of
    0: Result := GAP_CMD_DETECT;
    1: Result := GAP_CMD_SETUP;
    2: Result := GAP_CMD_READ;
    3: Result := GAP_CMD_WRITE;
    4: Result := GAP_CMD_CONTROL;
    5: Result := GAP_CMD_ECHO;

    6: Result := GAP_RPD_DETECT;
    7: Result := GAP_RPD_SETUP;
    8: Result := GAP_RPD_READ;
    9: Result := GAP_RPD_WRITE;
    10: Result := GAP_RPD_CONTROL;
    11: Result := GAP_RPD_ECHO;
  else
    Result := 0;
  end;
end;

function GetStatusStr(Respond: Byte): string;
begin
  case Respond of
    GAP_STS_SUCCESS: Result := 'STS_SUCCESS';
    GAP_STS_FAILED: Result := 'STS_FAILED';
    GAP_STS_NOT_READY: Result := 'STS_NOT_READY';
    GAP_STS_INVALID_CMD: Result := 'STS_INVALID_CMD';
  else
    Result := 'STS_UNKNOW';
  end;
end;

function NumberToUint(Number: string): Cardinal;
var
  HexMode: Boolean;
  I, J: Integer;
  Cnt: Integer;
begin
  HexMode := False;
  Result := 0;
  I := 1;
  Cnt := 0;

  if Number = '' then Exit;

  if Number[1] = '$' then
  begin
    HexMode := True;
    I := 2;
  end;

  if (Length(Number) > 2) and (Number[1] = '0') and (Number[2] in ['x', 'X']) then
  begin
    HexMode := True;
    I := 3;
  end;

  for J := I to Length(Number) do
  begin
    if Number[J] in ['0' .. '9'] then
    begin
    end
    else if Number[J] in ['a' .. 'f', 'A' .. 'F'] then
    begin
      HexMode := True;
    end
    else
    begin
      Exit;
    end;
    Inc(Cnt);
  end;

  if HexMode then
      Result := HexsToInt(Copy(Number, I, Cnt))
  else
      Result := StrToInt(Copy(Number, I, Cnt));

end;

{TGapCom}

constructor TGapCom.Create(Comport: TComport);
begin
  Inherited Create;
  Self.Comport := Comport;
end;

function TGapCom.InnerTransmitBuffer(const Data: GapBuffer; Count: Integer): Boolean;
begin
  Comport.Write(Data^, Count);
end;

function TGapCom.InnerReceiveBuffer(const Data: GapBuffer; var Count: Integer): Boolean;
begin
  Count := Comport.InputCount;
  Comport.Read(Data^, Count);
end;

{TGapUsb}

constructor TGapUsb.Create(UsbDrv: TWDMDevice);
begin
  Inherited Create;
  FUsbDrv := UsbDrv;
end;

function TGapUsb.InnerReceiveBuffer(const Data: GapBuffer; var Count: Integer): Boolean;
begin
  if (FUsbDrv <> nil) then
  begin
    Result := FUsbDrv.ReadBuffer(PChar(Data), Count);
    Count := FUsbDrv.EffectBufferSize;
  end
  else
  begin
    Count := 0;
    Result := False;
  end;
end;

function TGapUsb.InnerTransmitBuffer(const Data: GapBuffer; Count: Integer): Boolean;
begin
  if (FUsbDrv <> nil) then
      Result := FUsbDrv.WriteBuffer(PChar(Data), Count)
  else
      Result := False;
end;

{TUsbDevice}

procedure TUsbDevice.Init;
begin
  inherited;

  Ioctl_Read := nil;
  Ioctl_Write := nil;

  FOnReadBuffer := nil;
  FOnWriteBuffer := nil;
  FOnAfterOpen := nil;
  FOnAfterClose := nil;
  FOnError := nil;
  FEffectControlSize := 0;
end;

function TUsbDevice.ReadControl(const Buffer: PChar; nNumberOfBytesToRead: DWORD): Boolean;
begin
  if Ioctl_Read = nil then
      Ioctl_Read := CreateIoControl(FILE_DEVICE_USB_SCAN, $801, METHOD_BUFFERED, FILE_ANY_ACCESS);

  Result := Ioctl_Read.Execute(Buffer, nNumberOfBytesToRead, Buffer, nNumberOfBytesToRead);
  FEffectControlSize := Ioctl_Read.EffectBufferSize;
end;

function TUsbDevice.WriteControl(const Buffer: PChar; nNumberOfBytesToWrite: DWORD): Boolean;
begin
  if Ioctl_Write = nil then
      Ioctl_Write := CreateIoControl(FILE_DEVICE_USB_SCAN, $802, METHOD_BUFFERED, FILE_ANY_ACCESS);

  Result := Ioctl_Write.Execute(Buffer, nNumberOfBytesToWrite, Buffer, nNumberOfBytesToWrite);
  FEffectControlSize := Ioctl_Write.EffectBufferSize;
end;

procedure TUsbDevice.DoAfterOpen;
begin
  if Assigned(FOnAfterOpen) then FOnAfterOpen(Self);
end;

procedure TUsbDevice.DoAfterClose;
begin
  if Assigned(FOnAfterClose) then FOnAfterClose(Self);
end;

procedure TUsbDevice.DoAfterExecuteIoctl(Sender: TWDMIoControl);
begin
  // if Assigned(FOnAfterClose) then FOnAfterClose(Self);
end;

procedure TUsbDevice.DoAfterReadBuffer(OperatStatus: Boolean; NumberOfBytes: Integer);
begin
  if Assigned(FOnReadBuffer) then FOnReadBuffer(Self, OperatStatus, NumberOfBytes);
end;

procedure TUsbDevice.DoAfterWriteBuffer(OperatStatus: Boolean; NumberOfBytes: Integer);
begin
  if Assigned(FOnWriteBuffer) then FOnWriteBuffer(Self, OperatStatus, NumberOfBytes);
end;

procedure TUsbDevice.DoError;
begin
  if Assigned(FOnError) then FOnError(Self, LastError);
end;

end.
