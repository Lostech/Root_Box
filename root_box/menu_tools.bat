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
echo :: Waehlen Sie nun das gewuenschte Tool aus oder brechen Sie ab:             ::
echo :: (1) AndroidInfo oeffnen                                                   ::
echo :: (2) ADB Shell oeffnen                                                     ::
echo :: (3) APK Backup oeffnen                                                    ::
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
IF %tool%==m (goto menu)
goto :menu_tools

:tools_1
cd "%~dp0tools/
call "Android_Info.bat"
goto :menu_tools

:tools_2
cd "%~dp0tools/
call "ADB_Shell.bat"
goto :menu_tools

:tools_3
cd "%~dp0tools/
call "APK_Backup.bat"
goto :menu_tools

:menu
call "%~dp0menu.bat"
goto :exit

:exit
exit