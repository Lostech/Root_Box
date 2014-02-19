@echo off
color 1F
cls
set /p version=<"%~dp0root_box/version"
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo %version%
echo ::                                                                           ::
echo ::  Dieses Skript installiert Root Zugriff, SuperUser Verwaltung             ::
echo ::  und eine aktuelle BusyBox auf einem unterstuetzten Android Geraet.       ::
echo ::                                                                           ::
echo ::  Wenn Sie das nicht wollen, koennen Sie jederzeit das Skript mit STRG+C   ::
echo ::  abbrechen oder schliessen Sie einfach das Fenster!                       ::
echo ::                                                                           ::
echo ::  Die Lostech Root Box Batch Skripte sind gemaess GPL v2 Lizenz frei       ::
echo ::  verfuegbar.                                                              ::
echo ::  http://www.gnu.org/licenses/gpl-2.0.txt                                  ::
echo ::                                                                           ::
echo ::                              [weiter zum Hauptmenue mit beliebiger Taste] ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
echo.
pause > NUL
call "%~dp0root_box/menu.bat"
exit