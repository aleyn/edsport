(******************************************************************************
**  项目名称:    EEPROM                                                      **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EDSport_Memory.pas                                          **
**  建立日期:    2006-04-26                                                  **
**  单元简介:    用於EDSport的插件载入之内存管理                             **
**  更新历史:                                                                **
******************************************************************************)
unit EDSport_Memory;

interface
uses
  Classes, Windows,  EDSport_Protocol;


function SetMemoryManage(
  const InitMemory: TInitProtocolMemory;
  const AllocMemory: TAllocateProtocolMemory;
  const FreeMemory: TFreeProtocolMemory): Integer; stdcall;

function CheckMemoryManage: Boolean;

var
  InitProtocolMemory: TInitProtocolMemory;
  AllocateProtocolMemory: TAllocateProtocolMemory;
  FreeProtocolMemory: TFreeProtocolMemory;


implementation

function SetMemoryManage(
  const InitMemory: TInitProtocolMemory;
  const AllocMemory: TAllocateProtocolMemory;
  const FreeMemory: TFreeProtocolMemory): integer; stdcall;
begin
  @InitProtocolMemory := @InitMemory;
  @AllocateProtocolMemory := @AllocMemory;
  @FreeProtocolMemory := @FreeMemory;
  Result := 0;
end;

function CheckMemoryManage: Boolean;
begin
  Result := (@InitProtocolMemory <> nil)
    and (@AllocateProtocolMemory <> nil)
    and (@FreeProtocolMemory <> nil);
end;

exports
  SetMemoryManage;

initialization
  InitProtocolMemory := nil;
  AllocateProtocolMemory := nil;
  FreeProtocolMemory := nil;

finalization
  //if (BufferMemory <> nil) and Assigned(BufferMemory) then BufferMemory.Free;

end.
