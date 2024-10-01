@ECHO OFF

Echo "Adb&Fastboot installer for Windows by PacApps"
Echo "(t.me/PacApps)"
Echo "Adb&Fastboot version: r29.0.6"
Echo "Installer version: 2.1"
Echo " "

Echo "Install..."

pnputil -i -a driver\android_winusb.inf

mkdir "C:\adb"

Echo "Adding to Path..."
SetLocal EnableExtensions EnableDelayedExpansion
set FolderToAdd=C:\adb
set Key=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
For /f "tokens=2*" %%a In ('Reg.exe query "%key%" /v Path^|Find "Path"') do set "CurPath=%%~b"
reg.exe add "%Key%" /v Path /t REG_EXPAND_SZ /d "!CurPath!;!FolderToAdd!" /F
setx temp "%temp%"
rundll32 user32.dll,UpdatePerUserSystemParameters

copy adb "C:\adb"

Echo "Installed!"
pause