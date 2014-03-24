@echo off
if not exist "%~dp0..\info" md "%~dp0..\info"
:menu_tools
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Dies ist das AndroidInfo Menue.                                           ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die gewuenschte AndroidInfo aus oder brechen Sie ab:      ::
echo :: (1) AndroidInfo fuer regulaere Android Geraete starten                    ::
echo :: (2) AndroidInfo fuer regulaere Android Geraete starten (ADB Root)         ::
echo :: (3) AndroidInfo fuer Rockchip RK30 basierte Geraete starten               ::
echo :: (4) AndroidInfo fuer Rockchip RK30 basierte Geraete starten (ADB Root)    ::
echo :: (5) AndroidInfo Datei Ordner oeffnen                                      ::
echo :: (z) Tools Menue                                                           ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET tool=
SET /P tool= Auswahl: 
if '%tool%'=='' (
goto :menu_tools
)
IF %tool%==1 (goto tools_1)
IF %tool%==2 (goto tools_2)
IF %tool%==3 (goto tools_3)
IF %tool%==4 (goto tools_4)
IF %tool%==5 (goto tools_folder)
IF %tool%==z (goto tools_menu)
IF %tool%==m (goto menu)
goto :menu_tools

:tools_1
call "AndroidInfo_Regular.bat"
goto :menu_tools

:tools_2
call "AndroidInfo_Regular_root.bat"
goto :menu_tools

:tools_3
call "AndroidInfo_RK30.bat"
goto :menu_tools

:tools_4
call "AndroidInfo_RK30_root.bat"
goto :menu_tools

:tools_folder
start "" "%~dp0..\info"
goto :menu_tools

:tools_menu
call "%~dp0..\menu_tools.bat"
goto :exit

:menu
call "%~dp0..\menu.bat"
goto :exit

:exit
exit