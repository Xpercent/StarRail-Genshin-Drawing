@echo off
setlocal enabledelayedexpansion

REM 设置文件夹路径
set "downloadsFolder=..\downloads"
set "sevenZipFolder=7-Zip"

REM 获取7z.exe的完整路径
set "sevenZipPath=%~dp0%sevenZipFolder%\7z.exe"

REM 切换到downloads文件夹
cd /d "%downloadsFolder%"

REM 遍历所有的7z文件并解压
for %%i in (*.7z) do (
    echo 正在解压: "%%i"
    "%sevenZipPath%" x "%%i" -y -aoa -o"..\"
)
timeout /t 1 /nobreak >nul
echo 正在创建桌面快捷方式，请勿关闭本窗口.
::设置程序或文件的完整路径（必选）
set Program=%cd%\..\cq.exe
::设置快捷方式名称（必选）
set LnkName=抽签
::设置程序的工作路径，一般为程序主目录，此项若留空，脚本将自行分析路径
set WorkDir=%cd%\..
::设置快捷方式显示的说明（可选）
set Desc=制作者YX
if not defined WorkDir call:GetWorkDir "%Program%"
(echo Set WshShell=CreateObject("WScript.Shell"^)
echo strDesKtop=WshShell.SpecialFolders("DesKtop"^)
echo Set oShellLink=WshShell.CreateShortcut(strDesKtop^&"\%LnkName%.lnk"^)
echo oShellLink.TargetPath="%Program%"
echo oShellLink.WorkingDirectory="%WorkDir%"
echo oShellLink.WindowStyle=1
echo oShellLink.Description="%Desc%"
echo oShellLink.Save)>makelnk.vbs
echo 桌面快捷方式创建成功！ 
makelnk.vbs
del /f /q makelnk.vbs
exit
goto :eof
:GetWorkDir
set WorkDir=%~dp1
set WorkDir=%WorkDir:~,-1%
goto :eof

echo 解压完成
pause
