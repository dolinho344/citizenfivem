@echo off
title VALORANT CLEAN UNINSTALLER
color 0C
cls

echo =============================================
echo 🔥 INICIANDO DESINSTALACAO TOTAL DO VALORANT
echo =============================================
timeout /t 1 >nul

:: [1] Finaliza processos do jogo e Vanguard
echo [1/5] Encerrando processos relacionados...
taskkill /f /im Valorant.exe >nul 2>&1
taskkill /f /im VanguardTray.exe >nul 2>&1
taskkill /f /im vgtray.exe >nul 2>&1

:: [2] Desinstala o Vanguard
echo [2/5] Desinstalando Vanguard...
sc stop vgc >nul 2>&1
sc stop vgk >nul 2>&1
sc delete vgc >nul 2>&1
sc delete vgk >nul 2>&1
timeout /t 1 >nul

:: [3] Remove pastas do Vanguard e Valorant
echo [3/5] Removendo arquivos e pastas...
rd /s /q "C:\Riot Games" >nul 2>&1
rd /s /q "C:\Program Files\Riot Vanguard" >nul 2>&1
rd /s /q "%ProgramData%\Riot Games" >nul 2>&1
rd /s /q "%AppData%\Riot Games" >nul 2>&1
rd /s /q "%LocalAppData%\Riot Games" >nul 2>&1

:: [4] Limpa entradas de registro do Vanguard
echo [4/5] Limpando entradas de registro...
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\vgc" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\vgk" /f >nul 2>&1

:: [5] Finalizando
echo [5/5] Concluido!
echo Valorant e Vanguard foram completamente removidos.
echo Agora voce pode reinstalar do zero.
echo =============================================
pause
