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
echo :: (1) Root Automatik (fuer unbekannte Geraete)                              ::
echo :: (2) TechniPad 8 Root                                                      ::
echo :: (3) TechniPad 10(G) Root                                                  ::
echo :: (4) TechniPad Mini Root                                                   ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET device=
SET /P device= Auswahl: 
if '%device%'=='' (
goto :menu_technisat
)
IF %device%==1 (goto menu_auto)
IF %device%==2 (goto menu_tpad8)
IF %device%==3 (goto menu_tpad10_all)
IF %device%==4 (goto menu_tpadmini)
IF %device%==m (goto menu)
goto :menu_technisat

:menu_auto
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Die Automatik versucht die Rootmethode fuer ein unbekanntes Geraet oder   ::
echo :: Software zu bestimmen. Dies wird nicht immer erfolgreich sein!            ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Rockchip RK30 basierte Geraete starten              ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_auto
)
IF %rootmethod%==1 (goto auto_root_rk30)
IF %rootmethod%==m (goto menu)
goto :menu_auto

:menu_tpad8
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und lesen Sie die Versionsangaben ab:                                 ::
echo ::                                                                           ::
echo :: Variante 1:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.2.2                                                    ::
echo :: Build Version:   GE.TPad.S8_W.V1.01                                       ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Variante 1 starten                                  ::
echo :: (2) Root Methode unbekannt / Automatik versuchen                          ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_tpad8
)
IF %rootmethod%==1 (goto tpad8_root1)
IF %rootmethod%==2 (goto auto_root_rk30)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :menu_tpad8

:menu_tpad10_all
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende TechniPad Variante aus oder brechen     ::
echo :: Sie ab:                                                                   ::
echo :: (1) Root Methoden fuer TechniPad 10                                       ::
echo :: (2) Root Methoden fuer TechniPad 10G                                      ::
echo :: (3) Root Methode unbekannt / Automatik versuchen                          ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_tpad10_all
)
IF %rootmethod%==1 (goto tpad10)
IF %rootmethod%==2 (goto tpad10g)
IF %rootmethod%==3 (goto auto_root_rk30)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :menu_tpad10_all

:tpad10
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und lesen Sie die Versionsangaben ab:                                 ::
echo ::                                                                           ::
echo :: Variante 1:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.2.2                                                    ::
echo :: Build Version: GE.TPad.S10_W.V1.03                                        ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Variante 1 starten                                  ::
echo :: (2) Root Methode unbekannt / Automatik versuchen                          ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl:
if '%rootmethod%'=='' (
goto :tpad10
)
IF %rootmethod%==1 (goto tpad10_root2)
IF %rootmethod%==2 (goto auto_root_rk30)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :tpad10

:tpad10g
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und lesen Sie die Versionsangaben ab:                                 ::
echo ::                                                                           ::
echo :: Variante 1:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.1.1                                                    ::
echo :: Build Version: GE.Technisat.S10_g.V107                                    ::
echo ::                                                                           ::
echo :: Variante 2:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.2.2                                                    ::
echo :: Build Version: GE.TPad.S10_G.V1.05                                        ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Variante 1 starten                                  ::
echo :: (2) Root Methode fuer Variante 2 starten                                  ::
echo :: (3) Root Methode unbekannt / Automatik versuchen                          ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl:
if '%rootmethod%'=='' (
goto :tpad10g
)
IF %rootmethod%==1 (goto tpad10_root1)
IF %rootmethod%==2 (goto tpad10_root3)
IF %rootmethod%==3 (goto auto_root_rk30)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :tpad10g

:menu_tpadmini
cls
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::                                                                           ::
echo :: Rufen Sie in den Tablet Einstellungen die Systeminfo "Ueber das Tablet"   ::
echo :: auf und lesen Sie die Versionsangaben ab:                                 ::
echo ::                                                                           ::
echo :: Variante 1:                                                               ::
echo :: -----------                                                               ::
echo :: Android Version: 4.2.2                                                    ::
echo :: Build Version:   GE.TPad.V1.07                                            ::
echo ::                                                                           ::
echo :: Waehlen Sie nun die entsprechende Root Methode oder brechen Sie ab:       ::
echo :: (1) Root Methode fuer Variante 1 starten                                  ::
echo :: (2) Root Methode unbekannt / Automatik versuchen                          ::
echo :: (z) TechniSat Geraetemenue                                                ::
echo :: (m) Hauptmenue                                                            ::
echo ::                                                                           ::
echo :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo.
SET rootmethod=
SET /P rootmethod= Auswahl: 
if '%rootmethod%'=='' (
goto :menu_tpadmini
)
IF %rootmethod%==1 (goto tpadmini_root1)
IF %rootmethod%==2 (goto auto_root_rk30)
IF %rootmethod%==z (goto menu_technisat)
IF %rootmethod%==m (goto menu)
goto :menu_tpadmini

:menu
call "%~dp0menu.bat"
goto :exit

:tpad8_root1
call "%~dp0/devices/root_GE.TPad.S8_W.V1.01.bat"
goto :exit

:tpad10_root1
call "%~dp0/devices/root_GE.Technisat.S10_g.V107.bat"
goto :exit

:tpad10_root2
call "%~dp0/devices/root_GE.TPad.S10_W.V1.03.bat"
goto :exit

:tpad10_root3
call "%~dp0/devices/root_GE.TPad.S10_G.V1.05.bat"
goto :exit

:tpadmini_root1
call "%~dp0/devices/root_GE.TPad.V1.07.bat"
goto :exit

:auto_root_rk30
call "%~dp0/devices/root_auto_rk30.bat"
goto :exit

:exit
exit