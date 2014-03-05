@echo off
:menu
if not exist "%~dp0info" md "%~dp0info"
cd "%~dp0"
color 1F
cls
set /p version=<version
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo %version%
echo ::                                                                           ::
echo :: Waehlen Sie eine Option aus:                                              ::
echo :: (1) Root Automatik (fuer unbekannte Geraete)                              ::
echo :: (2) TechniSat Geraete                                                     ::
echo :: (t) Tools                                                                 ::
echo :: (u) Un-Root                                                               ::
echo :: (x) beenden                                                               ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET choice=
SET /P choice= Auswahl: 
if '%choice%'=='' (
goto :menu
)
IF %choice%==1 (goto menu_auto)
IF %choice%==2 (goto menu_technisat)
IF %choice%==t (goto menu_tools)
IF %choice%==u (goto menu_unroot)
IF %choice%==x (goto exit)
goto :menu

:auto_root_rk30
call "%~dp0/devices/root_auto_rk30.bat"
goto :exit

:menu_technisat
call "%~dp0menu_technisat.bat"
goto :exit

:menu_auto
call "%~dp0menu_auto.bat"
goto :exit

:menu_tools
call "%~dp0menu_tools.bat"
goto :exit

:menu_unroot
call "%~dp0menu_unroot.bat"
goto :exit

:exit
exit