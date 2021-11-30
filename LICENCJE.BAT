@echo off
:menu
call variables.bat
cls
echo [92m===========================================================
echo [93m LICENCJOWIEJSKA
echo [92m===========================================================
echo.[91m
echo.
echo.
echo Program automatycznie mapuje i usuwa dysk sieciowy podczas wybrania opcji.
echo.
echo.
echo [95m
echo h) Licencja HOME	p) Licencja PRO
echo.
echo                 r) RENT
echo.
echo.
echo.[96m
set /p opcja=Wybierz:  
echo [0m
if %opcja%==h goto installhome
if %opcja%==p goto installpro
if %opcja%==r goto rent
goto menu


:installhome
cls
echo [92m=======================================
echo [93m LICENCJA HOME
echo [92m=======================================
echo.[0m
NET USE Z: "\\%serverip%" /user:%login% %password% /persistent:no
Z:
cd Z:\Images\MARXpress_Windows_10_Home
MARXpress.exe
net use * /delete
pause
goto menu


:installpro
cls
echo [92m=======================================
echo [93m LICENCJA PRO
echo [92m=======================================
echo.[0m
NET USE Z: "\\%serverip%" /user:%login% %password% /persistent:no
Z:
cd Z:\Images\MARXpress_Windows_10_Pro
MARXpress.exe
net use * /delete
pause
goto menu


:rent
cls
echo [92m=======================================
echo [93m AMSO RENT
echo [92m=======================================
echo.[0m
echo.
echo.
echo.
NET USE Z: "\\%serverip%" /user:%login% %password% /persistent:no
Z:
cd Z:\Programs\
echo Instaluje LibreOffice
libre.msi /passive
echo.
echo Instaluje Chrome
chrome.msi /passive
echo.
echo Instaluje Teams
teams.exe /passive
echo.
echo.
echo.
echo.
echo.
pause
goto menu