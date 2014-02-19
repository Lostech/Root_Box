@echo off
if not exist "%~dp0info" md "%~dp0info"
:menu
cd "%~dp0"
color 1F
cls
set /p version=<version
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo %version%
echo ::                                                                           ::
echo :: Waehlen Sie eine Option aus:                                              ::
echo :: (1) TechniSat Geraete                                                     ::
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
IF %choice%==1 (goto menu_technisat)
IF %choice%==t (goto menu_tools)
IF %choice%==u (goto menu_unroot)
IF %choice%==x (goto exit)
goto :menu

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