@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

Title 一键更换DNS

:caozuo
Color 0A

::网络适配器名字
set name=以太网

echo.
echo ═══════════════════════════════════════
echo 【更换DNS】：
echo    1.国内114DNS
echo    2.国外谷歌DNS
echo    3.国外cloudflare
echo    9.结束脚本
echo.
set /p n=输入要换DNS编号（默认1）:
if "%n%"==""  call :1
if "%n%"=="1" call :1
if "%n%"=="2" call :2
if "%n%"=="3" call :3
if "%n%"=="9" exit
REM if /i "%n%"=="n" exit
if not "%n%"=="1" if not "%n%"=="2" if not "%n%"=="3" if not "%n%"=="n" if not "%n%"=="9" (
	cls
	color 0C
	echo.
	echo 输入错误，请重新输入！
	pause
	cls&goto :caozuo
)

:exit
::不关闭窗口
pause
::退出
goto :eof

:1
::114 DNS
set dns_first=114.114.114.114

set dns_second=114.114.115.115

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo 更改114DNS成功！

ipconfig /flushdns

goto :caozuo 



:2
::谷歌 DNS
set dns_first=8.8.8.8

set dns_second=8.8.4.4

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo 更改谷歌DNS成功！

ipconfig /flushdns

goto :caozuo 



:3
::cloudflare DNS
set dns_first=1.1.1.1

set dns_second=1.0.0.1

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo 更改cloudflareDNS成功！

ipconfig /flushdns

goto :caozuo 

::网关
::set mask=255.255.255.0

::电信 DNS
::set dns_first=61.134.1.4
::set dns_second=218.30.19.40

::腾讯 DNS
::set dns_first=119.29.29.29
::set dns_second=182.254.116.116

::阿里 DNS
::set dns_first=223.5.5.5
::set dns_second=223.6.6.6

::百度 DNS
::set dns_first=180.76.76.76
::set dns_second=180.76.76.76

 