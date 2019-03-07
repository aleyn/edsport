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

uses
  Forms,
  EDSport_form in 'EDSport_form.pas' {frmEDSport},
  EDSport_Library in 'EDSport_Library.pas',
  EDSport_Protocol in 'EDSport_Protocol.pas',
  SetupApi in '..\..\..\WiseLeg\Delphi\SetupAPI\SetupApi.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmEDSport, frmEDSport);
  Application.Run;
end.
