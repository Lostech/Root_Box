@echo off
color 1F
cd %~dp0
cls
set /p supersu=<../apk/supersu
set /p busybox=<../apk/busybox
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo ::                    Lostech RK30 Auto Root RK30 V1.0                       ::
echo ::                                                                           ::
echo ::  Dieses Skript versucht automatisch den Root Zugriff, SuperUser           ::
echo ::  Verwaltung und eine aktuelle BusyBox auf einem unbekanntem Rockchip RK30 ::
echo ::  basiertem Android Geraet zu installieren.                                ::
echo ::                                                                           ::
echo ::                                                                           ::
echo ::  Wenn Sie das nicht wollen, koennen Sie jederzeit das Skript mit STRG+C   ::
echo ::  abbrechen oder schliessen Sie einfach das Fenster!                       ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die "Entwickleroptionen" auf.       ::
echo :: Werden diese nicht angezeigt, so rufen sie die Systeminfo                 ::
echo :: "Ueber das ..." auf und tippen 7x die Build-Nummer an, um die             ::
echo :: "Entwickleroptionen" einzublenden.                                        ::
echo :: Aktivieren Sie im Menue "Entwickleroptionen" das "USB-Debugging".         ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Verbinden Sie das Tablet per USB Kabel mit dem PC und installieren Sie    ::
echo :: ggfs. die ADB Treiber. Sollten die Treiber bereits installiert sein,      ::
echo :: brechen Sie das Treiber Setup ab, das als naechstes gestartet wird.       ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Starte Treiber Setup...                                                   ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
start /wait ../drivers/rk/DriverInstall.exe
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: ...Treiber Setup beendet                                                  ::
echo ::                                                                           ::
echo :: Es sollte nun eine ADB Verbindung aufgebaut werden koennen. Falls im      ::
echo :: spaeterem Verlauf die Verbindung nicht direkt aufgebaut wird, entfernen   ::
echo :: Sie kurz das USB Kabel und stecken es erneut ein.                         ::
echo :: Sollte dann immer noch keine Verbindung aufgebaut werden, deaktivieren    ::
echo :: das "USB-Debugging" und aktivieren es anschliessend neu.                  ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Teste ADB Treiber...                                                      ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung und lese Seriennummer                             ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
cd %~dp0../adb
adb_rk30.exe wait-for-device > NUL
adb_rk30.exe get-serialno
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Es sollte nun die Seriennummer des Geraets angezeigt werden. Ist dies     ::
echo :: nicht der Fall, brechen Sie das Skript mit STRG+C ab oder schliessen Sie  ::
echo :: Sie das Fenster und kontrollieren Sie die Treiber Installation!           ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Die automatische Erkennung versucht nun die Root Methode zu bestimmen.    ::
echo :: Wenn Sie das nicht wollen, brechen Sie das Skript mit STRG+C ab oder      ::
echo :: schliessen Sie das Fenster!                                               ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
pause > NUL
adb_rk30.exe wait-for-device > NUL

for /f "tokens=*" %%i in ('adb_rk30.exe shell ls /system/xbin/su') do set su=%%i
if "%su%" == "/system/xbin/su" (
echo "/system/xbin/su" gefunden
set method=1
goto :result
) else (
echo "/system/xbin/su" nicht gefunden
)

for /f "tokens=*" %%i in ('adb_rk30.exe shell ls /system/xbin/rksu') do set su=%%i
if "%su%" == "/system/xbin/rksu" (
echo "/system/xbin/rksu" gefunden
set method=2
goto :result
) else (
echo "/system/xbin/rksu" nicht gefunden
)

echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Es konnte keine Root Methode bestimmt werden. Das Skript wird beendet.    ::
echo ::                                                                           ::
echo ::                                            [beenden mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
goto :exit

:result
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Das Geraet kann nun mit Methode %method% gerootet werden.                        ::
echo :: Wenn Sie das nicht wollen, brechen Sie das Skript mit STRG+C ab oder      ::
echo :: schliessen Sie das Fenster!                                               ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Root Vorgang gestartet                                                    ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe wait-for-device
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Lade Datei "su" hoch                                                       ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe push ../su/rk30/su /sdcard/su
echo.
echo.
if "%method%" == 2 (goto :method2)
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Mounte /system neu (rw)                                                    ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell su -c mount -o remount,rw /system
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Erstelle Backup von vorhandener "su" Datei                                 ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell su -c dd if=/system/xbin/su of=/system/xbin/suu
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Setze Rechte des "su" Backups                                              ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell su -c chmod 06755 /system/xbin/suu
:method2
if "%method%" == 1 (goto :method_all)
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Mounte /system neu (rw)                                                    ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell rksu -c mount -o remount,rw /system
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Erstelle Backup von vorhandener "rksu" Datei                               ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell rksu -c dd if=/system/xbin/rksu of=/system/xbin/suu
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Setze Rechte des "su" Backups                                              ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell rksu -c chmod 06755 /system/xbin/suu
:method_all
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Installiere neue "su" Datei                                                ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell suu -c dd if=/sdcard/su of=/system/xbin/su
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Setze Rechte fuer "su"                                                     ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell suu -c chmod 06755 /system/xbin/su
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Lade SuperUser Datei                                                       ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
echo Verwende APK: %supersu%
adb_rk30.exe push ../apk/%supersu% /sdcard/%supersu%
adb_rk30.exe shell suu -c dd if=/sdcard/%supersu% of=/data/app/%supersu%
adb_rk30.exe shell rm /sdcard/%supersu% 
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Setze Rechte fuer SuperSu                                                  ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell suu -c chmod 06755 /data/app/%supersu%
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Lade BusyBox Datei                                                         ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
echo Verwende APK: %busybox%
adb_rk30.exe push ../apk/%busybox% /sdcard/%busybox%
adb_rk30.exe shell suu -c dd if=/sdcard/%busybox% of=/data/app/%busybox%
adb_rk30.exe shell rm /sdcard/%busybox% 
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Setze Rechte fuer BusyBox                                                  ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe shell suu -c chmod 06755 /data/app/%busybox%
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Starte Geraet neu...                                                       ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe reboot
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Warte auf ADB Verbindung...                                                ת
echo ת  (muss ggfs. im Entwicklermenue erneut aktiviert werden)                    ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
adb_rk30.exe wait-for-device
echo.
echo.
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Root Zugriff, SuperUser Verwaltung und aktuelle BusyBox sollten nun       ::
echo :: verfuegbar sein.                                                          ::
echo ::                                                                           ::
echo ::                                            [beenden mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.

:exit
adb_rk30.exe kill-server
pause > NUL
cd %~dp0
call ../menu.bat

