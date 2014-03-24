@echo off
if not exist "%~dp0info" md "%~dp0info"
:menu_tools
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Dies ist das Tools Menue.                                                 ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die das gewuenschte Tool aus oder brechen Sie ab:         ::
echo :: (1) AndroidInfo fuer regulaere Android Geraete starten                    ::
echo :: (2) AndroidInfo fuer regulaere Android Geraete starten (ADB Root)         ::
echo :: (3) AndroidInfo fuer Rockchip RK30 basierte Geraete starten               ::
echo :: (4) AndroidInfo fuer Rockchip RK30 basierte Geraete starten (ADB Root)    ::
echo :: (5) AndroidInfo Datei Ordner oeffnen                                      ::
echo :: (6) ADB Shell oeffnen                                                     ::
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
IF %tool%==6 (goto tools_6)
IF %tool%==m (goto menu)
goto :menu_tools

:tools_1
cd "%~dp0tools/
call "AndroidInfo_Regular.bat"
goto :menu_tools

:tools_2
cd "%~dp0tools/
call "AndroidInfo_Regular_root.bat"
goto :menu_tools

:tools_3
cd "%~dp0tools/
call "AndroidInfo_RK30.bat"
goto :menu_tools

:tools_4
cd "%~dp0tools/
call "AndroidInfo_RK30_root.bat"
goto :menu_tools

:tools_folder
start "" "%~dp0info"
goto :menu_tools

:tools_6
cd "%~dp0tools/
call "ADB_Shell.bat"
goto :menu_tools

:menu
call "%~dp0menu.bat"
goto :exit

:exit
exit