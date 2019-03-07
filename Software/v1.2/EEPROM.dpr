(******************************************************************************
**  项目名称:    EEPROM                                                      **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EEPROM.dpr                                                  **
**  建立日期:    2006-04-26                                                  **
**  单元简介:    用於EDSport的插件，用於EEPROM读写，协议方式自定义           **
**  更新历史:                                                                **
******************************************************************************)
library EEPROM;
uses
  SysUtils,
  Classes,
  EDSport_Protocol in 'EDSport_Protocol.pas',
  EDSport_Memory in 'EDSport_Memory.pas',
  EEPROM_form in 'EEPROM_form.pas' {frmEEPROM},
  uEEPROM in 'uEEPROM.pas';

{$R *.res}

begin
end.
