@echo off
if not exist "%~dp0..\apk" md "%~dp0..\apk"
color 1F
cd %~dp0
cls
set /p supersu=<../apk/supersu
set /p busybox=<../apk/busybox
set towelroot=tr_%date%.apk
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo ::              Lostech TowelRoot Root Anleitung (Internet) V1.0             ::
echo ::                                                                           ::
echo ::  TowelRoot muss lokal auf dem Android Geraet installiert werden.          ::
echo ::  Die folgende Anleitung beschreibt die erforderlichen Schritte.           ::
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
echo ::  Die aktuelle TowelRoot APK wird nun aus dem Internet geladen und es      ::
echo ::  wird eine bereits bestehende Internetverbindung benoetigt.               ::
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
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Lade aktuelle TowelRoot APK von geohot Homepage:                           ת
echo ת  https://towelroot.com/tr.apk                                               ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
if exist "%~dp0..\apk\%towelroot%" del "%~dp0..\apk\%towelroot%"
start /wait ../tools/wget.exe https://towelroot.com/tr.apk --no-check-certificate -O "%~dp0..\apk\%towelroot%"
echo.
echo.
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Oeffne APK Ordner                                                          ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
if not exist "%~dp0..\apk\%towelroot%" goto :exit_no_apk
if exist "%~dp0..\apk\%towelroot%" echo TowelRoot APK: "%towelroot%" gefunden!
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Laden Sie nun die oben gelistete TowelRoot APK auf das Geraet.            ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
start "" "%~dp0..\apk"
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie im Android Geraet die "Einstellungen" auf.                      ::
echo :: Im Untermenue "Sicherheit" aktivieren Sie den Punkt "Unbekannte Quellen". ::
echo :: Deaktivieren Sie auch den Punkt "Anwendungen ueberpruefen".               ::
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
echo :: Verbinden Sie Ihr Android Geraet mit dem PC per USB und aktivieren sie    ::
echo :: den Zugriff auf den internen Speicher oder die SD Karte (MTP Zugriff).    ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Oeffne APK Ordner                                                          ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
if not exist "%~dp0..\apk\%towelroot%" goto :exit_no_apk
if exist "%~dp0..\apk\%towelroot%" echo TowelRoot APK: "%towelroot%" gefunden!
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Laden Sie nun die oben gelistete TowelRoot APK auf das Geraet.            ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
start "" "%~dp0..\apk"
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Installieren Sie nun lokal auf dem Android Geraet die von Ihnen           ::
echo :: hochgeladene TowelRoot APK.                                               ::
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
echo :: Fuehren Sie TowelRoot auf Ihrem Android Geraet aus und druecken Sie in    ::
echo :: der App den Button "make it ra1n".                                        ::
echo :: Die App informiert Sie anschliessend, ob der Vorgang erfolgreich war.     ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL

cls
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo ת  Oeffne APK Ordner                                                          ת
echo תתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתתת
echo.
if exist "%~dp0..\apk\%supersu%" echo SuperSU APK: "%supersu%" gefunden!
if exist "%~dp0..\apk\%busybox%" echo BusyBox APK: "%busybox%" gefunden!
echo.
echo.
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Falls der Root Zugriff nun verfuegbar ist, koennen Sie ebenso manuell     ::
echo :: die SuperUser Verwaltung und aktuelle BusyBox installieren.               ::
echo :: Alternativ koennen Sie beides auch aus dem App Store laden.               ::
echo ::                                                                           ::
echo ::                                            [beenden mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
start "" "%~dp0..\apk"
pause > NUL

cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie zum Abschluss im Android Geraet erneut die "Einstellungen" auf. ::
echo :: Im Untermenue "Sicherheit" deaktivieren Sie ggfs. den Punkt               ::
echo :: "Unbekannte Quellen" und aktivieren Sie ggfs. "Anwendungen ueberpruefen", ::
echo :: um die urspruenglichen Einstellungen wiederherzustellen.                  ::
echo ::                                                                           ::
echo ::                                             [weiter mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL
cd %~dp0
call ../menu.bat
exit

:exit_no_apk
echo TowelRoot APK: "%towelroot%" nicht gefunden! Abbruch!
pause > NUL
cd %~dp0
call ../menu.bat