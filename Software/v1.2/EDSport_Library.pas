(******************************************************************************
**  项目名称:    EDSport                                                     **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EDSport_Library.pas                                         **
**  建立日期:    2006-04-12                                                  **
**  单元简介:    载入和管理插件                                              **
**  更新历史:                                                                **
******************************************************************************)
unit EDSport_Library;

interface
uses
  Classes, SysUtils, Windows, hmStrTools, hmIniTools, EDSport_Protocol, Dialogs;

type

  TSetMemoryManage = function(
    const InitMemory: TInitProtocolMemory;
    const AllocMemory: TAllocateProtocolMemory;
    const FreeMemory: TFreeProtocolMemory): Integer; stdcall;

  TGetLibraryInfo = function(const Buffer: PChar): Integer; stdcall;
  TGetCommandList = function(const Buffer: PChar): Integer; stdcall;
  TGetCommandIndex = function(const ListIndex: Integer): Integer; stdcall;

  TProtocolEncode = function(const Protocol: pProtocol): Integer; stdcall;
  TProtocolDecode = function(const Protocol: pProtocol): Integer; stdcall;

  TGetWizareInput = function(WinHandle: THandle; const Protocol: pProtocol): Integer; stdcall;
  TConfigLibrary = function(): Integer; stdcall;
  TClearDecodeBuffer = procedure(); stdcall;

  {$IFDEF EDSport}
var
  GetLibraryInfo: TGetLibraryInfo;
  GetCommandList: TGetCommandList;
  GetCommandIndex: TGetCommandIndex;
  ProtocolEncode: TProtocolEncode;
  ProtocolDecode: TProtocolDecode;
  GetWizareInput: TGetWizareInput;
  ConfigLibrary: TConfigLibrary;
  ClearDecodeBuffer: TClearDecodeBuffer;
  LibraryHandle: THandle;
  {$ENDIF}

  {$IFDEF EDSport}
function LoadProtocolLibrary(Filename: string): Boolean;
function FreeProtocolLibrary: Boolean;
function ProtocolLibraryLoaded: Boolean;
{$ENDIF}

procedure InitProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType = gpAll); stdcall;
procedure AllocateProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType; Count: integer); stdcall;
procedure FreeProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType = gpAll); stdcall;
procedure DefaultProtocolError(Code: Integer; Msg: PChar; Count: Integer); stdcall;

implementation

{$IFDEF EDSport}

function ProtocolLibraryLoaded: Boolean;
begin
  Result := LibraryHandle <> 0;
end;

function LoadProtocolLibrary(Filename: string): Boolean;
var
  SetMemoryManage: TSetMemoryManage;
begin
  if not FileExists(filename) then
  begin
    Result := False;
    exit;
  end;
  LibraryHandle := LoadLibrary(PChar(filename));
  try
    if LibraryHandle <> 0 then
    begin
      SetMemoryManage := GetProcAddress(LibraryHandle, 'SetMemoryManage');
      if @SetMemoryManage <> nil then
        SetMemoryManage(@InitProtocolMemory, @AllocateProtocolMemory, @FreeProtocolMemory)
      else
        raise Exception.Create('SetMemoryManage not Found');

      GetLibraryInfo := GetProcAddress(LibraryHandle, 'GetLibraryInfo');
      if @GetLibraryInfo = nil then raise Exception.Create('GetLibraryInfo not Found');

      GetCommandList := GetProcAddress(LibraryHandle, 'GetCommandList');
      if @GetCommandList = nil then raise Exception.Create('GetCommandList not Found');

      GetCommandIndex := GetProcAddress(LibraryHandle, 'GetCommandIndex');
      if @GetCommandIndex = nil then raise Exception.Create('GetCommandIndex not Found');

      ProtocolEncode := GetProcAddress(LibraryHandle, 'ProtocolEncode');
      if @ProtocolEncode = nil then raise Exception.Create('ProtocolEncode not Found');

      ProtocolDecode := GetProcAddress(LibraryHandle, 'ProtocolDecode');
      if @ProtocolDecode = nil then raise Exception.Create('ProtocolDecode not Found');

      GetWizareInput := GetProcAddress(LibraryHandle, 'GetWizareInput');
      if @GetWizareInput = nil then raise Exception.Create('GetWizareInput not Found');

      ConfigLibrary := GetProcAddress(LibraryHandle, 'ConfigLibrary');
      if @ConfigLibrary = nil then raise Exception.Create('ConfigLibrary not Found');

      ClearDecodeBuffer := GetProcAddress(LibraryHandle, 'ClearDecodeBuffer');
      if @ClearDecodeBuffer = nil then raise Exception.Create('ClearDecodeBuffer not Found');
    end;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      if LibraryHandle <> 0 then
        FreeLibrary(LibraryHandle);
      LibraryHandle := 0;
    end;
  end;
  Result := LibraryHandle <> 0;
end;

function FreeProtocolLibrary: Boolean;
begin
  try
    if LibraryHandle <> 0 then FreeLibrary(LibraryHandle);
    LibraryHandle := 0;
    Result := True;
  except
    Result := False;
  end;
end;
{$ENDIF}

procedure DefaultProtocolError(Code: Integer; Msg: PChar; Count: Integer); stdcall;
//var
//  s: string;
begin
  //  if (Count <= 0) then exit;
  //
  //  SetLength(s, Count);
  //  CopyMemory(@s[1], Msg, Count);
  //  ShowMessage('ERROR(' + Inttostr(Code) + '):' + s);
end;

procedure InitProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType); stdcall;
begin
  if MemoryType in [gpInputData, gpAll] then
  begin
    Protocol^.InputData := nil;
    Protocol^.InputCount := 0;
  end;
  if MemoryType in [gpEncodeData, gpAll] then
  begin
    Protocol^.EncodeData := nil;
    Protocol^.EncodeCount := 0;
  end;
  if MemoryType in [gpReceiveData, gpAll] then
  begin
    Protocol^.ReceiveData := nil;
    Protocol^.ReceiveCount := 0;
  end;
  if MemoryType in [gpDecodeData, gpAll] then
  begin
    Protocol^.DecodeData := nil;
    Protocol^.DecodeCount := 0;
  end;
  Protocol^.OnProtocolError := DefaultProtocolError;
end;

procedure AllocateProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType; Count: integer); stdcall;
begin
  if Count <= 0 then exit;
  if MemoryType in [gpInputData, gpAll] then
  begin
    GetMem(Protocol^.InputData, Count);
    Protocol^.InputCount := Count;
  end;
  if MemoryType in [gpEncodeData, gpAll] then
  begin
    GetMem(Protocol^.EncodeData, Count);
    Protocol^.EncodeCount := Count;
  end;
  if MemoryType in [gpReceiveData, gpAll] then
  begin
    GetMem(Protocol^.ReceiveData, Count);
    Protocol^.ReceiveCount := Count;
  end;
  if MemoryType in [gpDecodeData, gpAll] then
  begin
    GetMem(Protocol^.DecodeData, Count);
    Protocol^.DecodeCount := Count;
  end;
end;

procedure FreeProtocolMemory(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType); stdcall;
begin
  if MemoryType in [gpInputData, gpAll] then
  begin
    if (Protocol^.InputData <> nil) and (Protocol^.InputCount > 0) then
      FreeMem(Protocol^.InputData);
    Protocol^.InputData := nil;
    Protocol^.InputCount := 0;
  end;
  if MemoryType in [gpEncodeData, gpAll] then
  begin
    if (Protocol^.EncodeData <> nil) and (Protocol^.EncodeCount > 0) then
      FreeMem(Protocol^.EncodeData);
    Protocol^.EncodeData := nil;
    Protocol^.EncodeCount := 0;
  end;
  if MemoryType in [gpReceiveData, gpAll] then
  begin
    if (Protocol^.ReceiveData <> nil) and (Protocol^.ReceiveCount > 0) then
      FreeMem(Protocol^.ReceiveData);
    Protocol^.ReceiveData := nil;
    Protocol^.ReceiveCount := 0;
  end;
  if MemoryType in [gpDecodeData, gpAll] then
  begin
    if (Protocol^.DecodeData <> nil) and (Protocol^.DecodeCount > 0) then
      FreeMem(Protocol^.DecodeData);
    Protocol^.DecodeData := nil;
    Protocol^.DecodeCount := 0;
  end;
end;

initialization
  {$IFDEF EDSport}
  LibraryHandle := 0;
  {$ENDIF}

finalization
  {$IFDEF EDSport}
  FreeProtocolLibrary;
  {$ENDIF}
end.

