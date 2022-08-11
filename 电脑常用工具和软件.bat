@ECHO off
TITLE Window  优化辅助工具


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
ECHO                Windows  工具    
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO.
ECHO    # 01、去除快捷方式小箭头
ECHO    # 02、去除UAC小盾牌
ECHO    # 03、网络异常修复 
ECHO    # 04、垃圾清理
ECHO    # 05、系统激活(查看)
ECHO    # 06、系统配置(查看)
ECHO. 
ECHO    #-----------------------------------------------#
ECHO                                      输入2进入二页 #
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO ====================================================

set /p cp=.            请输入操作序号并回车（例如07）：
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
ECHO        去除快捷方式小箭头和后缀
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto lnk1
If ErrorLevel 2 If Not ErrorLevel 3 Goto lnk2

:lnk1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2

:lnk2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2

:uacico
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO             去除UAC小盾牌
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.恢复
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto uacico1
If ErrorLevel 2 If Not ErrorLevel 3 Goto uacico2

:uacico1
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2

:uacico2
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
taskkill /f /im explorer.exe
start %systemroot%\explorer
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2

:LJmenu
CLS
MODE con: COLS=40 LINES=15
ECHO.
ECHO.
ECHO    **********************************
ECHO.
ECHO               垃圾清理
ECHO.
ECHO                1.执行
ECHO.
ECHO                2.返回
ECHO.
ECHO    **********************************
ECHO.
ECHO.
Choice /C 12 /N /M 选择（1、2）：
If ErrorLevel 1 If Not ErrorLevel 2 Goto LJmenu1
If ErrorLevel 2 If Not ErrorLevel 3 Goto Page 2

:LJmenu1
CLS
MODE con: COLS=40 LINES=15
Color 2f
ECHO.
ECHO.
ECHO   清理垃圾文件，速度由电脑文件大小而定。
ECHO   在没看到结尾信息时。请勿关闭本窗口
ECHO.
ECHO               1.执行
ECHO.
ECHO               2.返回
Choice /C 12 /N /M 选择（1、2）：
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
Echo wscript.Echo MsgBox ("请耐心等待，正在开启系统配置", 36, "提示")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 dxdiag  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
GOTO Page 2

:LJmenu3
Cls
MODE con: COLS=200 LINES=50
Color 2f
ECHO 正在清除系统垃圾文件，请稍等......
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
echo 正在清除驱动在安装时留下的解压文件，请稍等......
del /f /s /q  %SystemDrive%\AMD\*.*
del /f /s /q  %windir%\Intel\*.*
del /f /s /q  %windir%\NVIDIA\*.*
del /f /s /q  %windir%\Prog\*.*
ECHO.
ECHO.
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2



:Network
CLS
@echo 正在重置网络设置中...
REM 重置网络设置   
@taskkill  /f /t /im  IEXPLORE.exe >nul 2>nul
@netsh winsock reset all >nul 2>nul
@netsh int ipv4 reset all >nul 2>nul
@netsh int portproxy reset all >nul 2>nul
@netsh int tcp reset all >nul 2>nul
@netsh int teredo reset all >nul 2>nul
@echo 清理IE设置代理中..   
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DefaultConnectionSettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v SavedLegacySettings /t REG_BINARY /d 4600000000 /f >nul 2>nul
rem 禁用代理
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>nul
rem 删除代理IP地址
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>nul
rem 禁用自动配制脚本（地址也被删除）
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /f >nul 2>nul
@echo 清理ie缓存中..
rem 清理ie缓存
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
@RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
@for /f "tokens=4*" %%a in ('netsh interface show interface ^| findstr "已连接"') do set "ConName=%%~a"
netsh interface ip set dns %ConName% static 119.29.29.29
if '%errorlevel%' EQU '0' (	
echo 修改网卡DNS成功   
) else (
echo 修改网卡DNS失败   
)
REM 修改当前网卡dns
ipconfig /flushdns
@echo 127.0.0.1 localhost>%systemroot%\system32\drivers\etc\hosts 
REM HOSTS清空
@echo 正在同步本地时间...请稍候..   
@sc config W32Time start= auto >nul 2>nul
REM 时间服务选择自动启动
@w32tm /register >nul 2>nul
REM 注册时间服务
@net start W32Time >nul 2>nul
REM 启动时间服务
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxNegPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
@reg add HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config\ /v MaxPosPhaseCorrection /t REG_DWORD /d 0xffffffff /f >nul 2>nul
REM 修改注册表值，修改 修改时间 的最大和最小间隔
@w32tm /config /manualpeerlist:"ntp1.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM 联网修改时间
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
@w32tm /config /manualpeerlist:"ntp2.aliyun.com" /syncfromflags:manual /reliable:yes /update >nul 2>nul
REM 联网修改时间
@w32tm /resync >nul 2>nul
@w32tm /resync >nul 2>nul
REM 重启电脑提示
Echo wscript.Echo MsgBox ("操作已完成。需要重启电脑后才能生效，是否重启电脑", 36, "提示")>tmp.vbs
@For /f %%i in ('cscript /nologo tmp.vbs') do If %%i==6 Start shutdown -r -t 0  >nul 2>nul
@Del /q tmp.vbs  >nul 2>nul
ECHO 按任意键返回主菜单
pause>nul
GOTO Page 2

:application
CLS
COLOR 2f
MODE con: COLS=55 LINES=25
ECHO.
ECHO ===================================================#
ECHO                Windows  工具安装 
ECHO              以下软件有免费版的下载免费版
ECHO             如发现病毒本工具不承担任何后果
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#         
ECHO.
ECHO    # 01、Windows 10 永久激活工具      
ECHO    # 02、PotPlayer 视频播放器
ECHO    # 03、Office  下载地址  KMS地址   使用方法
ECHO    # 04、Bandizip
ECHO    # 05、微软常用运行库合集
ECHO    #-----------------------------------------------#
ECHO                                      输入1进入一页 #
ECHO    #+++++++++++++++++++++++++++++++++++++++++++++++#
ECHO ====================================================
set /p op=.            请输入操作序号并回车（例如07）：
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
echo 输入有误，按任意键返回主菜单
pause>nul
GOTO Page 2
