@echo off
:menu_unroot
cd "%~dp0"
color 1F
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Um den Root Zugriff rueckgaengig zu machen, oeffnen Sie auf dem Geraet    ::
echo :: die "SuperSU" App.                                                        ::
echo :: Rufen Sie dort den Menuepunkt "Einstellungen" ^> "Vollstaendiges Un-Root"  ::
echo :: auf und folgen Sie den Anweisungen.                                       ::
echo :: Sollte die "SuperSU" App nicht mehr installiert sein, so kann Sie erneut  ::
echo :: aus dem Playstore installiert werden.                                     ::
echo ::                                                                           ::
echo :: (1) Play Store fuer "SuperSU" aufrufen                                    ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET choice=
SET /P choice= Auswahl: 
if '%choice%'=='' (
goto :menu_unroot
)
IF %choice%==1 (goto playstore)
IF %choice%==m (goto menu)
goto :menu_unroot

:playstore
start "" "https://play.google.com/store/apps/details?id=eu.chainfire.supersu&hl=de"
goto :menu_unroot

:menu
call "%~dp0menu.bat"
goto :exit

:exit
exit