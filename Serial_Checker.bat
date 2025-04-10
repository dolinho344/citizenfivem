@echo off
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit
)
mode con: cols=100 lines=35
title Serial Checker
echo **********************************
color 0F
echo **********************************
:start
cls
echo.
echo [90m^> [90m^CPU[37m
wmic cpu get serialnumber
echo.
echo [90m^> [90m^BIOS[37m
wmic bios get serialnumber
echo.
echo [90m^> [90m^Motherboard[37m
wmic baseboard get serialnumber
echo.
echo [90m^> [90m^BIOS UUID[37m
wmic path win32_computersystemproduct get uuid
echo.
echo [90m^> [90m^TPM[37m
powershell.exe -Command "(Get-TpmEndorsementKeyInfo -Hash Sha256).PublicKeyHash"
echo.
echo [90m^> [90m^MAC Adresi[37m
getmac
echo.
pause>nul
goto start
