@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

Title һ������DNS

:caozuo
Color 0A

::��������������
set name=��̫��

echo.
echo �T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo ������DNS����
echo    1.����114DNS
echo    2.����ȸ�DNS
echo    3.����cloudflare
echo    9.�����ű�
echo.
set /p n=����Ҫ��DNS��ţ�Ĭ��1��:
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
	echo ����������������룡
	pause
	cls&goto :caozuo
)

:exit
::���رմ���
pause
::�˳�
goto :eof

:1
::114 DNS
set dns_first=114.114.114.114

set dns_second=114.114.115.115

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo ����114DNS�ɹ���

ipconfig /flushdns

goto :caozuo 



:2
::�ȸ� DNS
set dns_first=8.8.8.8

set dns_second=8.8.4.4

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo ���Ĺȸ�DNS�ɹ���

ipconfig /flushdns

goto :caozuo 



:3
::cloudflare DNS
set dns_first=1.1.1.1

set dns_second=1.0.0.1

netsh interface ipv4 set dns name=%name% source=static addr=%dns_first% register=PRIMARY

netsh interface ipv4 add dns name=%name% addr=%dns_second% index=2

echo ����cloudflareDNS�ɹ���

ipconfig /flushdns

goto :caozuo 

::����
::set mask=255.255.255.0

::���� DNS
::set dns_first=61.134.1.4
::set dns_second=218.30.19.40

::��Ѷ DNS
::set dns_first=119.29.29.29
::set dns_second=182.254.116.116

::���� DNS
::set dns_first=223.5.5.5
::set dns_second=223.6.6.6

::�ٶ� DNS
::set dns_first=180.76.76.76
::set dns_second=180.76.76.76

 