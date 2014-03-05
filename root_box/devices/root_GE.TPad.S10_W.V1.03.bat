@echo off
color 1F
cd %~dp0
cls
set /p supersu=<../apk/supersu
set /p busybox=<../apk/busybox
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo ::                Lostech TechniPad 10G Root V1.0                            ::
echo ::                                                                           ::
echo ::  Dieses Skript installiert Root Zugriff, SuperUser Verwaltung             ::
echo ::  und eine aktuelle BusyBox auf einem TechniPad 10G mit                    ::
echo ::                                                                           ::
echo ::  Android Version: 4.2.2                                                   ::
echo ::  Build Version:   GE.TPad.S10_W.V1.03                                     ::
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
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und kontrollieren Sie, ob die Versionsangaben dort mit folgenden      ::
echo :: Versionsangaben uebereinstimmen:                                          ::
echo ::                                                                           ::
echo :: Android Version: 4.2.2                                                    ::
echo :: Build Version:   GE.TPad.S10_W.V1.03                                      ::
echo ::                                                                           ::
echo :: Stimmen die Versionen nicht ueberein, wird der Root Vorgang               ::
echo :: hoechstwahrscheinlich fehlschlagen. Es wird empfohlen STRG+C oder durch   ::
echo :: Schliessen des Fensters den Vorgang abzubrechen.                          ::
echo :: Fahren Sie fort, wenn die Versionen uebereinstimmen.                      ::
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
echo :: "Ueber das Tablet" auf und tippen 7x die Build-Nummer an, um die          ::
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
echo :: Es sollte nun die Seriennummer des Tablets angezeigt werden. Ist dies     ::
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
echo :: Das Tablet kann nun gerootet werden.                                      ::
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
echo ת  Starte Tablet neu...                                                       ת
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
adb_rk30.exe kill-server
pause > NUL
cd %~dp0
call ../menu.bat

