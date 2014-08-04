@echo off
:menu
cd "%~dp0"
color 1F
cls
:menu_towelroot
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: TowelRoot ist eine alternative Root Methode von geohot, die eine Luecke   ::
echo :: in Android-Versionen vor dem 3. Juni 2014 ausnutzt. Neuere Android        ::
echo :: Versionen koennen i.d.R. damit nicht mehr entsperrt werden.               ::
echo ::                                                                           ::
echo :: Waehlen Sie eine TowelRoot Methode aus:                                   ::
echo :: (1) Lokale TowelRoot Version                                              ::
echo :: (2) Aktuellste TowelRoot Version (benoetigt Internetverbindung)           ::
echo :: (3) TowelRoot Homepage (benoetigt Internetverbindung)                     ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET choice=
SET /P choice= Auswahl: 
if '%choice%'=='' (
goto :menu_technisat
)
IF %choice%==1 (goto menu_towelrootlocal)
IF %choice%==2 (goto menu_towelrootinet)
IF %choice%==3 (goto menu_towelroothomepage)
IF %choice%==m (goto menu)
goto :menu_towelroot

:menu
call "%~dp0menu.bat"
goto :exit

:menu_towelrootlocal
call "%~dp0/devices/root_TowelRoot_local.bat"
goto :exit

:menu_towelrootinet
call "%~dp0/devices/root_TowelRoot_Inet.bat"
goto :exit

:menu_towelroothomepage
start /w "" "https://towelroot.com/"
goto :exit

:exit
exit