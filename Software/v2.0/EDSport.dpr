(******************************************************************************
**  项目名称:    EDSport                                                     **
**  建立作者:    吴创明(Aleyn.wu)                                            **
**  博客邮箱:    http://blog.e-midas.cn , aleyn@e-midas.cn                   **
**  -----------------------------------------------------------------------  **
**  项目地址:    E:\HunMing\EDSport\                                         **
**  单元名称:    EDSport.dpr                                                 **
**  建立日期:    2006-04-12                                                  **
**  单元简介:    串口监视主程序，支持Hex方式，字符串方式，自定义插件协议     **
**  更新历史:                                                                **
******************************************************************************)
program EDSport;
//  SetupApi in '..\..\..\WiseLeg\Delphi\SetupAPI\SetupApi.pas';

uses
  Forms,
  CrcUtil in '..\..\..\#Library#\CRC\ForDelphi\CrcUtil.pas',
  GAProtocol in '..\..\..\#Library#\GAP\ForDelphi\v1.0\GAProtocol.pas',
  EDSport_Protocol in 'EDSport_Protocol.pas',
  EDSport_form in 'EDSport_form.pas' {frmEDSport},
  WdmDeviceApi in '..\..\..\#Library#\USB\ForDelphi\WdmDeviceApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEDSport, frmEDSport);
  Application.Run;
end.
