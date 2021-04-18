:: Environment variables that are already available:
:: %USB% is the USB drive - e.g. D:
:: %BIT% will either be X86 or AMD64
:: %WINVER% will be 7 or 8 or 10
:: %CONFIGDIR% will be %USB%\_ISO\WINDOWS\INSTALLS\CONFIGS\SDI_CHOCO
:: %log% will be the log file
:: %errlog% will be a log file to record errors
:: %systemdrive%\DRIVERS folder will hold all files that were in %USB%\_ISO\WINDOWS\INSTALLS\CONFIGS\SDI_CHOCO

:: use loganddisplay to show the console text output of any command and then append to log file (e.g. dir C:\  %loganddisplay%)
set loganddisplay= ^> %~n0_temp.txt 2^>^&1 ^& type %~n0_temp.txt ^>^> %log% ^& type %~n0_temp.txt ^& del /Q /F %~n0_temp.txt

:: Copy bespoke apps
::xcopy /herky %USB%\_ISO\WINDOWS\INSTALLS\APPS\FOXIT\*.* %systemdrive%\DRIVERS\APPS\FOXIT\
::REM copy .cmd file C:\DRIVERS\APPS folder so it will auto-run during startup.cmd
::xcopy %USB%\_ISO\WINDOWS\INSTALLS\APPS\FOXIT\Foxauto.cmd %systemdrive%\DRIVERS\APPS\

xcopy /herky %USB%\Programas %systemdrive%\DRIVERS\APPS\

goto :eof

exit
