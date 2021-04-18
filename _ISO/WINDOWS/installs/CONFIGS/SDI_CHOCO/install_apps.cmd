@echo off

:: Script para automatizar a instalacao dos programas

:: Caso seja necessario adicionar, remover ou atualizar
:: algum programa, abra a pasta Programas que se encontra na raiz
:: da particao E2B e adicione o arquivo na pasta correspondente,
:: x32, x64 ou fora da pasta caso seja versao unica, e faca as
:: alteracoes nas variaveis abaixo de acordo com o nome do arquivo,
:: seguindo o padrao e adicionando sua chamada no bloco correspondente
:: mais abaixo.

:: Para uma melhor experiencia adicione o parametro de instalacao
:: silenciosa para os programas a serem instalados. Pesquise no
:: Google o parametro a ser utilizado.

:: IMPORTANTE, caso o nome do arquivo contenha espacos
:: eh necessario colocar o nome entre aspas "". Confira abaixo.

:: SET nome.seuapp="Nome do App.exe"

:: x32
SET nome.chrome32=GoogleChromeStandaloneEnterprise.msi
SET nome.java32=jre-8u281-windows-i586.exe
SET nome.qbittorrent32=qbittorrent_4.3.4.1_setup.exe
SET nome.vlc32=vlc-3.0.12-win32.exe
SET nome.7zip32=7z1900.exe

:: x64
SET nome.chrome64=GoogleChromeStandaloneEnterprise64.msi
SET nome.java64=jre-8u281-windows-x64.exe
SET nome.qbittorrent64=qbittorrent_4.3.4.1_x64_setup.exe
SET nome.vlc64=vlc-3.0.12-win64.exe
SET nome.7zip64=7z1900-x64.exe

:: x86
SET nome.foxit=FoxitReader1011_L10N_Setup_Prom.exe
SET nome.anydesk=AnyDesk.exe


cls
echo.
echo -----   Iniciando instalacao dos programas   -----
echo.
echo.


:: Verifica se o sistema é 32 ou 64 bits
IF EXIST %SystemRoot%\SysWOW64 goto x64


:: ### Bloco do x32 ###
echo Windows 32 bits!
echo.
echo Instalando Google Chrome...
start /w msiexec /i C:\DRIVERS\APPS\x32\%nome.chrome32% /qn
echo Instalando Java 8...
start /wait "" C:\DRIVERS\APPS\x32\%nome.java32% /s REBOOT=Suppress
echo Instalando Qbittorrent...
start /wait "" C:\DRIVERS\APPS\x32\%nome.qbittorrent32% /S
echo Instalando VLC...
start /wait "" C:\DRIVERS\APPS\x32\%nome.vlc32% /S
echo Instalando 7zip...
start /wait "" C:\DRIVERS\APPS\x32\%nome.7zip32% /S
goto x86


:: ### Bloco do x64 ###
:x64 
echo Windows 64 bits!
echo.
echo Instalando Google Chrome...
start /w msiexec /i C:\DRIVERS\APPS\x64\%nome.chrome64% /qn
echo Instalando Java 8...
start /wait "" C:\DRIVERS\APPS\x64\%nome.java64% /s REBOOT=Suppress
echo Instalando Qbittorrent...
start /wait "" C:\DRIVERS\APPS\x64\%nome.qbittorrent64% /S
echo Instalando VLC...
start /wait "" C:\DRIVERS\APPS\x64\%nome.vlc64% /S
echo Instalando 7zip...
start /wait "" C:\DRIVERS\APPS\x64\%nome.7zip64% /S
goto x86


:: ### Bloco do x86 ###
:x86 
echo Instalando Foxit Reader...
start /wait "" C:\DRIVERS\APPS\%nome.foxit% /ForceInstall /VERYSILENT DESKTOP_SHORTCUT="1" AUTO_UPDATE="2" LAUNCHCHECKDEFAULT=”0″ /NORESTART
echo Instalando AnyDesk...
start /wait "" C:\DRIVERS\APPS\%nome.anydesk% --install "C:\Program Files (x86)\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent


:: ### Bloco dos Runtimes ###
echo Instalando DirectX Runtimes...
start /wait "" "C:\DRIVERS\APPS\Windows\DirectX Jun 2010\DXSETUP.exe" /silent
echo Instalando Visual C++ Runtimes...
start /wait "" "C:\DRIVERS\APPS\Windows\Visual-C-Runtimes-All-in-One-Mar-2021\install_all.bat"

echo Instalacao concluida!
echo.
pause

goto :eof
exit
