@echo off
:menu
cd "%~dp0"
color 1F
cls
:menu_technisat
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Waehlen Sie ein TechniSat Geraet aus:                                     ::
echo :: (1) TechniPad 10G Root                                                    ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET device=
SET /P device= Auswahl: 
if '%device%'=='' (
goto :menu_technisat
)
IF %device%==1 (goto menu_tpad10g)
IF %device%==m (goto menu)
goto :menu_technisat

:menu_tpad10g
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und lesen Sie die Versionsangaben ab:                                 ::
echo ::                                                                           ::
echo :: Variante 1:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.1.1                                                    ::
echo :: Build Version:   GE.Technisat.S10_g.V107                                  ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Variante 1 starten                                  ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_tpad10g
)
IF %rootmethod%==1 (goto tpad10g_root1)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :menu_tpad10g

:menu
call "%~dp0menu.bat"
goto :exit

:tpad10g_root1
call "%~dp0/devices/root_GE.Technisat.S10_g.V107.bat"
goto :exit

:exit
exit