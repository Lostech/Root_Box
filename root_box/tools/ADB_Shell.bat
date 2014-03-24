@echo off
:menu_shells
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Dies ist das ADB Shell Menue.                                             ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die die gewuenschte ADB Shell aus oder brechen Sie ab:    ::
echo :: (1) ADB Shell fuer regulaere Android Geraete starten                      ::
echo :: (2) ADB Shell fuer fuer Rockchip RK30 basierte Geraete starten            ::
echo :: (z) Tools Menue                                                           ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET shell=
SET /P shell= Auswahl: 
if '%shell%'=='' (
goto :menu_shells
)
IF %shell%==1 (goto shell_1)
IF %shell%==2 (goto shell_2)
IF %shell%==z (goto tools_menu)
IF %shell%==m (goto menu)
goto :menu_shells

:shell_1
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
cd %~dp0../adb
adb_minimal.exe wait-for-device > NUL
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  ADB Verbindung vorhanden, oeffne Shell...                                  ת
echo ת  Shell beenden mit Kommando 'exit'                                          ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_minimal.exe shell
goto :menu_shells

:shell_2
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
cd %~dp0../adb
adb_rk30.exe wait-for-device > NUL
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  ADB Verbindung vorhanden, oeffne Shell...                                  ת
echo ת  Shell beenden mit Kommando 'exit'                                          ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_rk30.exe shell
goto :menu_shells

:tools_menu
call "%~dp0../menu_tools.bat"
goto :exit

:menu
call "%~dp0../menu.bat"
goto :exit