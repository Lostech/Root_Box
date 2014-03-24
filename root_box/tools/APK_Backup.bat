@echo off
if not exist "%~dp0..\apk_backup" md "%~dp0..\apk_backup"
:menu_backup
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Dies ist das APK Backup Menue.                                            ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die gewuenschte Backup Methode aus oder brechen Sie ab:   ::
echo :: (1) APK Backup fuer regulaere Android Geraete starten                     ::
echo :: (2) APK Backup fuer Rockchip RK30 basierte Geraete starten                ::
echo :: (3) Backup Datei Ordner oeffnen                                           ::
echo :: (z) Tools Menue                                                           ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET backup=
SET /P backup= Auswahl: 
if '%backup%'=='' (
goto :menu_backup
)
IF %backup%==1 (goto backup_1)
IF %backup%==2 (goto backup_2)
IF %backup%==3 (goto backup_folder)
IF %backup%==z (goto tools_menu)
IF %backup%==m (goto menu)
goto :menu_backup

:backup_1
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
cd %~dp0../adb
adb_minimal.exe wait-for-device > NUL
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  ADB Verbindung vorhanden, starte APK Backup der System Apps...             ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_minimal.exe pull /system/app "%~dp0..\apk_backup\system_apps"
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Starte APK Backup der Data (Benutzer) Apps...                              ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_minimal.exe pull /data/app "%~dp0..\apk_backup\data_apps"
goto :backup_folder

:backup_2
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
cd %~dp0../adb
adb_rk30.exe wait-for-device > NUL
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  ADB Verbindung vorhanden, starte APK Backup der System Apps...             ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_rk30.exe pull /system/app "%~dp0..\apk_backup\system_apps"
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Starte APK Backup der Data (Benutzer) Apps...                              ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
start /B /wait adb_rk30.exe pull /data/app "%~dp0..\apk_backup\data_apps"
goto :backup_folder

:backup_folder
start "" "%~dp0..\apk_backup"
goto :menu_backup

:tools_menu
call "%~dp0..\menu_tools.bat"
goto :exit

:menu
call "%~dp0..\menu.bat"
goto :exit

:exit
exit