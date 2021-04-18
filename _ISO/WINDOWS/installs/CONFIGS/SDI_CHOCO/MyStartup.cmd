@echo off
:: Environment variables that are already available:
:: %USB% is the USB drive - e.g. D:  NOTE: IT MAY BE DISCONNECTED BY NOW!
:: %BIT% will either be X86 or AMD64
:: %WINVER% will be 7 or 8 or 10
:: %log% will be the log file
:: %errlog% will be a log file to record errors
:: %systemdrive%\DRIVERS folder will hold all files that were in %USB%\_ISO\WINDOWS\INSTALLS\CONFIGS\SDI_CHOCO

:: use loganddisplay to show the console text output of any command and then append to log file (e.g. dir C:\  %loganddisplay%)
set loganddisplay= ^> %~n0_temp.txt 2^>^&1 ^& type %~n0_temp.txt ^>^> %log% ^& type %~n0_temp.txt ^& del /Q /F %~n0_temp.txt

:: Stop automatic updates (uncomment to enable)
:: reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f

call C:\DRIVERS\install_apps.cmd

goto :EOF
exit