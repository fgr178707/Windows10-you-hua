@ECHO off
TITLE Window  �Ż���������


set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
if exist %TempFile_Name% (
del %TempFile_Name% 1>nul 2>nul
GOTO Page 2
) else (
GOTO Page 2
)

:Page 2
CLS
COLOR 2f
MODE con: COLS=55 LINES=20
ECHO.
ECHO ===================================================#
ECHO                Windows  ����    
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO.
ECHO    # 01��ȥ����ݷ�ʽС��ͷ
ECHO    # 02��ȥ��UACС����
ECHO    # 03�������쳣�޸� 
ECHO    # 04����������
ECHO    # 05��ϵͳ����(�鿴)
ECHO    # 06��ϵͳ����(�鿴)
ECHO. 
ECHO    #-----------------------------------------------#
ECHO                                      ����2�����ҳ #
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO ====================================================

set /p cp=.            �����������Ų��س�������07����
if %cp%==01 goto lnk
if %cp%==02 goto uacico
if %cp%==03 goto Network
if %cp%==04 goto LJmenu
if %cp%==05 goto activation
if %cp%==06 goto configure
if %cp%==2 goto  application
if %cp%==exit exit
goto cho

:lnk
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO        ȥ����ݷ�ʽС��ͷ�ͺ�׺
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.�ָ�
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto lnk1
If ErrorLevel 2 If Not ErrorLevel 3 Goto lnk2

:lnk1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO ��������������˵�
pause>nul
GOTO Page 2

:lnk2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO ��������������˵�
pause>nul
GOTO Page 2

:uacico
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             ȥ��UACС����
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.�ָ�
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto uacico1
If ErrorLevel 2 If Not ErrorLevel 3 Goto uacico2

:uacico1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO ��������������˵�
pause>nul
GOTO Page 2

:uacico2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO ��������������˵�
pause>nul
GOTO Page 2

:LJmenu
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               ��������
ECHO.
ECHO                1.ִ��
ECHO.
ECHO                2.����
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto LJmenu1
If ErrorLevel 2 If Not ErrorLevel 3 Goto Page 2

:LJmenu1
CLS
MODE con: COLS=40 LINES=15
Color 2f
ECHO.
ECHO.
ECHO   ���������ļ����ٶ��ɵ����ļ���С������
ECHO   ��û������β��Ϣʱ������رձ�����
ECHO.
ECHO               1.ִ��
ECHO.
ECHO               2.����
Choice /C 12 /N /M ѡ��1��2����
If ErrorLevel 1 If Not ErrorLevel 2 Goto LJmenu3
If ErrorLevel 2 If Not ErrorLevel 3 Goto Page 2

:activation
CLS
MODE con: COLS=40 LINES=15
slmgr.vbs -xpr
GOTO Page 2

:configure
CLS
MODE con: COLS=40 LINES=15
Echo wscript.Echo MsgBox ("�����ĵȴ������ڿ���ϵͳ����", 36, "��ʾ")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 dxdiag  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
GOTO Page 2

:LJmenu3
Cls
MODE con: COLS=200 LINES=50
Color 2f
ECHO �������ϵͳ�����ļ������Ե�......
del /f /s /q  %systemdrive%\Windows\Temp\*.*
del /f /s /q  %systemdrive%\Windows\ServiceProfiles\NetworkService\AppData\Local\Temp\*.*
del /f /s /q  %systemdrive%\Windows\ServiceProfiles\LocalService\AppData\Local\Temp\*.*
del /f /s /q %systemdrive%\*.tmp
del /f /s /q  %systemdrive%\*._mp
del /f /s /q  %systemdrive%\*.log
del /f /s /q  %systemdrive%\*.gid
del /f /s /q  %systemdrive%\*.chk
del /f /s /q  %systemdrive%\*.old
del /f /s /q  %systemdrive%\recycled\*.*
del /f /s /q  %windir%\*.bak
del /f /s /q  %windir%\prefetch\*.*
rd /s /q %windir%\temp & md  %windir%\temp
del /f /q  %userprofile%\cookies\*.*
del /f /q  %userprofile%\recent\*.*
del /f /s /q  "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q  "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q  "%userprofile%\recent\*.*"
del /f /s /q  %windir%\system32\dllcache\*.*
echo ������������ڰ�װʱ���µĽ�ѹ�ļ������Ե�......
del /f /s /q  %SystemDrive%\AMD\*.*
del /f /s /q  %windir%\Intel\*.*
del /f /s /q  %windir%\NVIDIA\*.*
del /f /s /q  %windir%\Prog\*.*
ECHO.
ECHO.
ECHO ��������������˵�
pause>nul
GOTO Page 2



:Network
CLS
@echo ������������������...
REM ������������   
@taskkill  /f /t /im  IEXPLORE.exe >nul 2>nul
@netsh winsock reset all >nul 2>nul
@netsh int ipv4 reset all >nul 2>nul
@netsh int portproxy reset all >nul 2>nul
@netsh int tcp reset all >nul 2>nul
@netsh int teredo reset all >nul 2>nul
@echo ����IE���ô�����..   
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
rem ���ô���
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>nul
rem ɾ������IP��ַ
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>nul
rem �����Զ����ƽű�����ַҲ��ɾ����
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /f >nul 2>nul
@echo ����ie������..
rem ����ie����
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
@for /f "tokens=4*" %%a in ('netsh interface show interface ^| findstr "������"') do set "ConName=%%~a"
netsh interface ip set dns %ConName% static 119.29.29.29
if '%errorlevel%' EQU '0' (	
echo �޸�����DNS�ɹ�   
) else (
echo �޸�����DNSʧ��   
)
REM �޸ĵ�ǰ����dns
ipconfig /flushdns
@echo 127.0.0.1 localhost>%systemroot%\system32\drivers\etc\hosts 
REM HOSTS���
@echo ����ͬ������ʱ��...���Ժ�..   
@sc config W32Time start= auto >nul 2>nul
REM ʱ�����ѡ���Զ�����
@w32tm /register >nul 2>nul
REM ע��ʱ�����
@net start W32Time >nul 2>nul
REM ����ʱ�����
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxNegPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxPosPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
REM �޸�ע���ֵ���޸� �޸�ʱ�� ��������С���
@w32tm /config /manualpeerlist:"ntp1.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM �����޸�ʱ��
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
@w32tm /config /manualpeerlist:"ntp2.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM �����޸�ʱ��
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
REM ����������ʾ
Echo wscript.Echo MsgBox ("��������ɡ���Ҫ�������Ժ������Ч���Ƿ���������", 36, "��ʾ")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
ECHO ��������������˵�
pause>nul
GOTO Page 2

:application
CLS
COLOR 2f
MODE con: COLS=55 LINES=25
ECHO.
ECHO ===================================================#
ECHO                Windows  ���߰�װ   �汾:6.0
ECHO               �����������Ѱ��������Ѱ�   
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#         
ECHO.
ECHO    # 01��Windows 10 ���ü����      
ECHO    # 02��PotPlayer ��Ƶ������
ECHO    # 03��Office  ���ص�ַ  KMS��ַ   ʹ�÷���
ECHO    # 04��Bandizip
ECHO    # 05��΢�������п�ϼ�
ECHO    #-----------------------------------------------#
ECHO                                      ����1����һҳ #
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO ====================================================
set /p op=.            �����������Ų��س�������07����
if %op%==01 goto Windows 10
if %op%==02 goto PotPlayer
if %op%==03 goto office tool plus kms
if %op%==04 goto Bandizip
if %op%==05 goto chang yong yun hang ku 
if %op%==1 goto Page 2
goto cho

:Windows 10
@echo off 
start https://cnczca.lanzoui.com/i5QNIsvuu8h
GOTO application

:PotPlayer
@echo off 
start http://potplayer.tv/?lang=zh_CN
GOTO application

:office tool plus kms
@echo off 
start https://www.coolhub.top/tech-articles/kms_list.html
GOTO office tool plus

:office tool plus
@echo off 
start https://otp.landian.vip/zh-cn/download.html
GOTO office tool plus shiyong

:office tool plus shiyong 
@echo off 
start https://www.bilibili.com/video/BV1eU4y1V7NU
GOTO application


:Bandizip
@echo off 
start https://www.bandisoft.com/bandizip/
GOTO application

:chang yong yun hang ku 
@echo off 
start http://dreamcast2.ysepan.com/
GOTO application

:cho
CLS
COLOR 0a
MODE con: COLS=30 LINES=5
echo.
echo �������󣬰�������������˵�
pause>nul
GOTO Page 2