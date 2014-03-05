@echo off
:menu_auto
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Die Automatik versucht die Rootmethode fuer ein unbekanntes Geraet oder   ::
echo :: Software zu bestimmen. Dies wird nicht immer erfolgreich sein!            ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Rockchip RK30 basierte Geraete starten              ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_auto
)
IF %rootmethod%==1 (goto auto_root_rk30)
IF %rootmethod%==m (goto menu)
goto :menu_auto

:auto_root_rk30
call "%~dp0/devices/root_auto_rk30.bat"
goto :exit

:menu
call "%~dp0menu.bat"
goto :exit

:exit
exit