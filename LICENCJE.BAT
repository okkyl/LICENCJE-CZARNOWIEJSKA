@echo off
call variables.bat
:ConnectScript
echo Szukam Serwera
ping -n 2 -4 %serverip% > NUL
if not %ERRORLEVEL%==0 GOTO ConnectScript



:menu
cls
echo [92m===========================================================
echo [93m LICENCJOWIEJSKA
echo [92m===========================================================
echo.[91m
echo. Kmiecik Bartlomiej Czarnowiejska 2021
echo.
echo.
echo Program automatycznie mapuje i usuwa dysk sieciowy podczas wybrania opcji.
systeminfo | findstr /B /C:"OS Name"
echo.
echo.
echo [95m
echo h) Licencja HOME	p) Licencja PRO
echo.
echo r) RENT          s) Snappy
echo.
echo.
echo.[96m
set /p opcja=Wybierz:  
echo [0m
if %opcja%==h goto installhome
if %opcja%==p goto installpro
if %opcja%==r goto rent
if %opcja%==s goto snappy
goto menu


:installhome
cls
echo [92m=======================================
echo [93m LICENCJA HOME
echo [92m=======================================
echo.[0m
NET USE Z: "\\%serverip%\Sources" /user:%login% %password% /persistent:no
Z:
cd Z:\Images\MARXpress_Windows_10_Home
MARXpress.exe
net use * /delete /y
goto menu


:installpro
cls
echo [92m=======================================
echo [93m LICENCJA PRO
echo [92m=======================================
echo.[0m
NET USE Z: "\\%serverip%\Sources" /user:%login% %password% /persistent:no
Z:
cd Z:\Images\MARXpress_Windows_10_Pro
MARXpress.exe
net use * /delete /y
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
NET USE Z: "\\%serverip%\Sources" /user:%login% %password% /persistent:no
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
net use * /delete /y
goto menu

:snappy
cls
echo [92m=======================================
echo [93m SNAPPY
echo [92m=======================================
echo.[0m
echo.
echo.
NET USE Z: "\\%serverip%\Sources" /user:%login% %password% /persistent:no
Z:
cd Z:\Images\Models\Snappy
SDI_R2111.exe
net use * /delete /y
goto menu
