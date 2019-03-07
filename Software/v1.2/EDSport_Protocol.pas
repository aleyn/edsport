(******************************************************************************
**  项目名称:    EDSport                                                     **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EDSport_Protocol.pas                                        **
**  建立日期:    2006-04-12                                                  **
**  单元简介:    应用协议定义，编码，解码                                    **
**  更新历史:                                                                **
******************************************************************************)
unit EDSport_Protocol;

interface
uses
  Classes, Windows;

type
  TProtocolError = procedure(Code: Integer; Msg: PChar; Count: Integer); stdcall;

type
  TGetProtocolMemoryType = (gpAll, gpInputData, gpEncodeData, gpReceiveData, gpDecodeData);

  PProtocol = ^TProtocol;

  TInitProtocolMemory = procedure(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType = gpAll); stdcall;
  TAllocateProtocolMemory = procedure(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType; Count: integer); stdcall;
  TFreeProtocolMemory = procedure(Protocol: PProtocol; MemoryType: TGetProtocolMemoryType = gpAll); stdcall;

  TProtocol = record
    CmdIndex: integer;
    InputData: PChar;
    InputCount: Integer;
    EncodeData: PChar;
    EncodeCount: Integer;
    ReceiveData: PChar;
    ReceiveCount: Integer;
    DecodeData: PChar;
    DecodeCount: Integer;
    OnProtocolError: TProtocolError;
    //AllocateMemory: TAllocateProtocolMemory;
  end;

const
  PROTOCOL_RESULT_OK = 0;
  PROTOCOL_ERROR = -1;
  PROTOCOL_NOTHING = -2;
  PROTOCOL_NO_WIZARE = -3;
  PROTOCOL_NO_DIALOG = -4;
  PROTOCOL_BUFFER_NOT_ENOUGH = -5;
  PROTOCOL_INPUTDATA_ERROR = -6;
  PROTOCOL_INPUTCOUNT_ERROR = -7;
  PROTOCOL_ENCODEDATA_ERROR = -8;
  PROTOCOL_ENCODECOUNT_ERROR = -9;
  PROTOCOL_RECEIVEDATA_ERROR = -10;
  PROTOCOL_RECEIVECOUNT_ERROR = -11;
  PROTOCOL_DECODEDATA_ERROR = -12;
  PROTOCOL_DECODECOUNT_ERROR = -13;

  PROTOCOL_BEGIN = #$01; //帧开始符
  PROTOCOL_END = #$04; //帧结束符
  PROTOCOL_STX = #$02; //帧的第一个包
  PROTOCOL_ETX = #$03; //帧的最后一个包
  PROTOCOL_RS = #$1E; //帧的继续包
  PROTOCOL_TEXT = #$1A; // 纯文本包

  PROTOCOL_ESC = #$1B; //帧的转义定义
  PROTOCOL_ESC_BEGIN = #$11; //把0x01 转为 0x11
  PROTOCOL_ESC_END = #$14; //把0x04 转为 0x14
  PROTOCOL_ESC_DOL = #$0B; //把0x1B 转为 0x0B

function EncodeInvaildData(const Sour: PChar; const Dest: PChar; Count: Integer): integer;
function DecodeInvaildData(const Sour: PChar; const Dest: PChar; Count: Integer): integer;

function Crc16(Buffer: PChar; Length: Integer): Word;

function EncodeProtocolFrame(const Data: PChar; const Protocol: PChar; Count: Integer): integer;

implementation

const
  crc_ta: array[0..15] of Word = (
    $0000, $1021, $2042, $3063, $4084, $50A5, $60C6, $70E7,
    $8108, $9129, $A14A, $B16B, $C18C, $D1AD, $E1CE, $F1EF
    );

function Crc16(Buffer: PChar; Length: Integer): Word;
var
  crc: Word;
  da: Byte;
  len: Integer;
  ptr: PByte;
begin
  Len := Length;
  crc := 0;
  //  da := 0;
  ptr := PByte(Buffer);
  while (Len > 0) do
  begin
    da := crc shr 12;
    crc := crc shl 4;
    crc := crc xor crc_ta[da xor (ptr^ div 16)];
    da := crc shr 12;
    crc := crc shl 4;
    crc := crc xor crc_ta[da xor (ptr^ and $0F)];
    Inc(Ptr);
    Dec(len);
  end;
  Result := crc;
end;

function EncodeInvaildData(const Sour: PChar; const Dest: PChar; Count: Integer): integer;
var
  i: integer;
  S2: PChar;
  D2: PChar;
  cnt: integer;
begin
  S2 := Sour;
  D2 := Dest;
  cnt := 0;
  for i := 1 to Count do
  begin
    if not (S2^ in [PROTOCOL_BEGIN, PROTOCOL_END, PROTOCOL_ESC]) then
      D2^ := S2^
    else if S2^ = PROTOCOL_BEGIN then
    begin
      D2^ := PROTOCOL_ESC;
      Inc(D2);
      Inc(cnt);
      D2^ := PROTOCOL_ESC_BEGIN;
    end
    else if S2^ = PROTOCOL_END then
    begin
      D2^ := PROTOCOL_ESC;
      Inc(D2);
      Inc(cnt);
      D2^ := PROTOCOL_ESC_END;
    end
    else if S2^ = PROTOCOL_ESC then
    begin
      D2^ := PROTOCOL_ESC;
      Inc(D2);
      Inc(cnt);
      D2^ := PROTOCOL_ESC_DOL;
    end;
    Inc(S2);
    Inc(D2);
    Inc(cnt);
  end;
  Result := cnt;
end;

function DecodeInvaildData(const Sour: PChar; const Dest: PChar; Count: Integer): integer;
var
  i: integer;
  S2: PChar;
  D2: PChar;
  cnt: integer;
begin
  S2 := Sour;
  D2 := Dest;
  cnt := 0;
  i := 0;
  while (i < Count) do
  begin
    if not (S2^ in [PROTOCOL_BEGIN, PROTOCOL_END, PROTOCOL_ESC]) then
      D2^ := S2^
    else if S2^ = PROTOCOL_ESC then
    begin
      if (i < Count - 1) then
      begin
        Inc(S2);
        Inc(i);
        if S2^ = PROTOCOL_ESC_BEGIN then
          D2^ := PROTOCOL_BEGIN
        else if S2^ = PROTOCOL_ESC_END then
          D2^ := PROTOCOL_END
        else if S2^ = PROTOCOL_ESC_DOL then
          D2^ := PROTOCOL_ESC
        else
        begin
          Result := PROTOCOL_ERROR;
          exit;
        end;
      end;
    end
    else if S2^ in [PROTOCOL_BEGIN, PROTOCOL_END] then
    begin
      Result := -1;
      exit;
    end;
    Inc(S2);
    Inc(D2);
    Inc(cnt);
    Inc(i);
  end;
  Result := cnt;
end;

function EncodeProtocolFrame(const Data: PChar; const Protocol: PChar; Count: Integer): integer;
var
  Key: string[2];
  CRC: Word;
begin
  try
    Protocol[0] := PROTOCOL_BEGIN;
    if (Count > 0) then
      Result := EncodeInvaildData(Data, @Protocol[1], Count) + 1
    else
      Result := 1;
    CRC := Crc16(Data, Count);
    Key[1] := Char(CRC and $00FF);
    Key[2] := Char(CRC shr 8);
    Result := Result + EncodeInvaildData(@Key[1], @Protocol[Result], 2);
    Protocol[Result] := PROTOCOL_END;
    Inc(Result);
  except
    Result := 0;
  end;
end;

end.

