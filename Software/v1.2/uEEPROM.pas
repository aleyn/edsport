(******************************************************************************
**  项目名称:    EEPROM                                                      **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    uEEPROM.pas                                                 **
**  建立日期:    2006-04-26                                                  **
**  单元简介:    EEPROM协议读写，协议方式自定义                              **
**  更新历史:                                                                **
******************************************************************************)
unit uEEPROM;

interface
uses
  Classes, SysUtils, Controls, Windows, Forms, hmStrTools, hmIniTools, EDSport_Protocol;

function GetLibraryInfo(const Buffer: pChar): Integer; stdcall;
function GetCommandList(const Buffer: pChar): Integer; stdcall;
function GetCommandIndex(const ListIndex: Integer): Integer; stdcall;

function ProtocolEncode(const Protocol: pProtocol): Integer; stdcall;
function ProtocolDecode(const Protocol: pProtocol): Integer; stdcall;

function GetWizareInput(WinHandle: THandle; const Protocol: pProtocol): Integer; stdcall;
function ConfigLibrary: Integer; stdcall;
procedure ClearDecodeBuffer; stdcall;

implementation

uses
  Dialogs, EEPROM_form, hmUniKey, EDSport_Memory;

const
  CMDBEGIN = #27;
  CMDEND = #28;
  CMDHELP = 'H';
  CMDREAD = 'R';
  CMDWRITE = 'W';
  CMDTEST = 'T';

var
  BufferMemory: TMemoryStream;

function GetLibraryInfo(const Buffer: pChar): Integer; stdcall;
const
  Info =
    'EEPROM Protocol v1.0'#13 +
    ' CMD_BEGIN 0x1B'#13 +
    ' CMD_END   0x1C';
begin
  if Buffer = nil then
    Result := Length(Info)
  else
    try
      CopyMemory(Buffer, @Info[1], Length(Info));
      Result := PROTOCOL_RESULT_OK;
    except
      Result := PROTOCOL_ERROR;
    end;
end;

function GetCommandList(const Buffer: pChar): Integer; stdcall;
const
  CmdList =
    'Help'#13 +
    'Read EEPROM'#13 +
    'Write EEPROM'#13 +
    'Test Code';
begin
  if Buffer = nil then
    Result := Length(CmdList)
  else
    try
      CopyMemory(Buffer, @CmdList[1], Length(CmdList));
      Result := PROTOCOL_RESULT_OK;
    except
      Result := PROTOCOL_ERROR;
    end;
end;

function GetCommandIndex(const ListIndex: Integer): Integer; stdcall;
begin
  Result := ListIndex;
end;

function ProtocolEncode(const Protocol: pProtocol): Integer; stdcall;
var
  ErrorMsg: string;
  WordFlag: Integer;
  TestCode: Byte;
  Encode: Byte;
  i: integer;
  Key: string;

begin
  if not CheckMemoryManage then
  begin
    ErrorMsg := 'MemoryManage Error';
    Protocol^.OnProtocolError(PROTOCOL_ERROR, @ErrorMsg[1], Length(ErrorMsg));
    Result := PROTOCOL_ERROR;
    exit;
  end;
  case Protocol^.CmdIndex of
    1: //Get Hardware Help
      try
        AllocateProtocolMemory(Protocol, gpEncodeData, 3);
        Protocol^.EncodeData[0] := CMDBEGIN; //命令开始符
        Protocol^.EncodeData[1] := CMDHELP; //标志这条命令是要求AVR发送HELP给PC
        Protocol^.EncodeData[2] := CMDEND; //命令结束符
        Result := PROTOCOL_RESULT_OK;
      except
        Result := PROTOCOL_ERROR;
      end;
    2: //Read EEPROM Protocol
      begin
        if Protocol^.InputCount < 6 then
        begin
          ErrorMsg := 'Input data count less then 6';
          Protocol^.OnProtocolError(PROTOCOL_INPUTCOUNT_ERROR, @ErrorMsg[1], Length(ErrorMsg));
          Result := PROTOCOL_INPUTCOUNT_ERROR;
          exit;
        end
        else
          try
            AllocateProtocolMemory(Protocol, gpEncodeData, 15);
            Protocol^.EncodeData[0] := CMDBEGIN; //命令开始符
            Protocol^.EncodeData[1] := CMDREAD;
            BinToHex(Protocol^.InputData, @(Protocol^.EncodeData[2]), 6);
            Protocol^.EncodeData[14] := CMDEND; //命令结束符
            Result := PROTOCOL_RESULT_OK;
          except
            Result := PROTOCOL_ERROR;
          end;
      end;
    3: //Write EEPROM Protocol
      begin
        if Protocol^.InputCount < 5 then
        begin
          ErrorMsg := 'Input data count less then 5';
          Protocol^.OnProtocolError(PROTOCOL_INPUTCOUNT_ERROR, @ErrorMsg[1], Length(ErrorMsg));
          Result := PROTOCOL_INPUTCOUNT_ERROR;
          exit;
        end
        else
          try
            if Protocol^.InputCount > 5 then
              WordFlag := 1
            else
              WordFlag := 0;
            AllocateProtocolMemory(Protocol, gpEncodeData, 13 + WordFlag * 2);
            Protocol^.EncodeData[0] := CMDBEGIN; //命令开始符
            Protocol^.EncodeData[1] := CMDWRITE;
            BinToHex(Protocol^.InputData, @(Protocol^.EncodeData[2]), 5 + WordFlag);
            Protocol^.EncodeData[12 + WordFlag * 2] := CMDEND; //命令结束符
            Result := PROTOCOL_RESULT_OK;
          except
            Result := PROTOCOL_ERROR;
          end;
      end;

    4: //Test Byte Encode
      begin
        if Protocol^.InputCount < 1 then
        begin
          ErrorMsg := 'Input data count less then 1';
          Protocol^.OnProtocolError(PROTOCOL_INPUTCOUNT_ERROR, @ErrorMsg[1], Length(ErrorMsg));
          Result := PROTOCOL_INPUTCOUNT_ERROR;
          exit;
        end
        else
          try
            TestCode := Byte(Protocol^.InputData[0]);
            Key := UniKey;
            AllocateProtocolMemory(Protocol, gpEncodeData, 8 * 2 + 3);
            Protocol^.EncodeData[0] := CMDBEGIN;
            Protocol^.EncodeData[1] := CMDTEST;
            Protocol^.EncodeData[Protocol^.EncodeCount - 1] := CMDEND;
            for i := 0 to 7 do
            begin
              Encode := ({Byte(Key[i + 1])}$FF and not ($01 shl i)) or (Testcode and ($01 shl i));
              Key[i + 1] := Char(Encode);
              //Inc(Encode);
            end;
            BinToHex(@Key[1], @(Protocol^.EncodeData[2]), 8);
            Result := PROTOCOL_RESULT_OK;
          except
            Result := PROTOCOL_ERROR;
          end;

      end;

    else
      Result := PROTOCOL_ERROR;
  end;
end;

function PressBuffer(const Protocol: pProtocol): Integer;
var
  FBuffer: PChar;
  Buf2: pchar;
  i: integer;
  pos, Count: integer;
  s: string;
  Size: integer;
  ErrorMsg: string;
begin
  if not CheckMemoryManage then
  begin
    ErrorMsg := 'MemoryManage Error';
    Protocol^.OnProtocolError(PROTOCOL_ERROR, @ErrorMsg[1], Length(ErrorMsg));
    Result := PROTOCOL_ERROR;
    exit;
  end;

  FBuffer := BufferMemory.Memory;
  Size := BufferMemory.Size;
  Result := PROTOCOL_ERROR;
  if (Size <= 1) then exit;
  if (FBuffer[0] = CMDHELP) then
  begin
    AllocateProtocolMemory(Protocol, gpDecodeData, Size - 1);
    CopyMemory(Protocol^.DecodeData, @FBuffer[1], Size - 1);
    for i := 1 to Size - 1 do
      if (Protocol^.DecodeData[i - 1] < #32) and not (Protocol^.DecodeData[i - 1] in [#10, #13]) then
        Protocol^.DecodeData[i - 1] := #$7F;
    Result := PROTOCOL_RESULT_OK;
  end
  else if (FBuffer[0] in [CMDREAD, CMDWRITE]) then
  begin
    GetMem(Buf2, Size - 1);
    SetLength(s, 2);
    try
      //Buf2[Size - 1] := #0;
      pos := 1;
      Count := 0;
      for i := 2 to Size do
      begin
        if (FBuffer[i - 1] <> #32) then
        begin
          if (pos <= 2) then s[Pos] := FBuffer[i - 1];
          Inc(Pos);
        end
        else
        begin
          Buf2[Count] := Char(HextoByte(s));
          Inc(Count);
          if (Count > Size - 1) then Count := Size - 1;
          Pos := 1;
        end;
      end;
      if (Count > 0) then
      begin
        AllocateProtocolMemory(Protocol, gpDecodeData, Count);
        CopyMemory(Protocol^.DecodeData, Buf2, Count);
      end;
      Result := PROTOCOL_RESULT_OK;
    finally
      FreeMem(Buf2);
    end;
  end
  else if (FBuffer[0] = CMDTEST) then
  begin
    try
      AllocateProtocolMemory(Protocol, gpDecodeData, 1);
      CopyMemory(Protocol^.DecodeData, @FBuffer[1], 1);
      Result := PROTOCOL_RESULT_OK;
    except
      Result := PROTOCOL_ERROR;
    end;
  end;
end;

function ProtocolDecode(const Protocol: pProtocol): Integer; stdcall;
var
  i: integer;
  ErrorMsg: string;
begin
  if not CheckMemoryManage then
  begin
    ErrorMsg := 'MemoryManage Error';
    Protocol^.OnProtocolError(PROTOCOL_ERROR, @ErrorMsg[1], Length(ErrorMsg));
    Result := PROTOCOL_ERROR;
    exit;
  end;

  if (BufferMemory = nil) and not Assigned(BufferMemory) then
    BufferMemory := TMemoryStream.Create;
  try
    Result := PROTOCOL_ERROR;
    for i := 1 to Protocol^.ReceiveCount do
    begin
      if (Protocol^.ReceiveData[i - 1] = CMDBEGIN) then
      begin
        BufferMemory.Position := 0;
        BufferMemory.Clear;
      end
      else if (Protocol^.ReceiveData[i - 1] = CMDEND) then
      begin
        Result := PressBuffer(Protocol);
        BufferMemory.Position := 0;
        BufferMemory.Clear;
      end
      else
      begin
        BufferMemory.Seek(0, soFromEnd);
        BufferMemory.WriteBuffer(Protocol^.ReceiveData[i - 1], 1);
      end;
    end;
  except
    Result := PROTOCOL_ERROR;
  end;
end;

function GetWizareInput(WinHandle: THandle; const Protocol: pProtocol): Integer; stdcall;
var
  ErrorMsg: string;
  OldHandle: THandle;
begin
  if not CheckMemoryManage then
  begin
    ErrorMsg := 'MemoryManage Error';
    Protocol^.OnProtocolError(PROTOCOL_ERROR, @ErrorMsg[1], Length(ErrorMsg));
    Result := PROTOCOL_ERROR;
    exit;
  end;

  OldHandle := Application.Handle;
  Application.Handle := WinHandle;
  try
    case Protocol^.CmdIndex of
      1: //Get Hardware Help
        begin
          Application.MessageBox('No Wizage Dialog', PChar(Application.Title), MB_OK + MB_ICONINFORMATION);
          Result := PROTOCOL_RESULT_OK;
        end;
      2: //Read EEPROM Protocol
        begin
          with TfrmEEPROM.Create(Application) do
            try
              Mode := 1;
              if ShowModal = mrOK then
              begin
                PressBuffer(Protocol);
              end;
            finally
              Free;
              Result := PROTOCOL_RESULT_OK;
            end;
        end;
      3: //Write EEPROM Protocol
        begin
          with TfrmEEPROM.Create(Application) do
            try
              Mode := 2;
              if ShowModal = mrOK then
              begin
                PressBuffer(Protocol);
              end;
            finally
              Free;
              Result := PROTOCOL_RESULT_OK;
            end;
        end;
      else
        Result := PROTOCOL_ERROR;
    end;
  finally
    Application.Handle := OldHandle;
  end;
end;

function ConfigLibrary: Integer; stdcall;
begin
  Result := PROTOCOL_NOTHING;
end;

procedure ClearDecodeBuffer; stdcall;
begin
end;

exports
  GetLibraryInfo,
  GetCommandList,
  GetCommandIndex,
  ProtocolEncode,
  ProtocolDecode,
  GetWizareInput,
  ConfigLibrary,
  ClearDecodeBuffer;

initialization
  BufferMemory := nil;

finalization
  if (BufferMemory <> nil) and Assigned(BufferMemory) then BufferMemory.Free;

end.

