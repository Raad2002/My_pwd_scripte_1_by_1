@echo off
:: Vérifie si le script est lancé en tant qu'administrateur
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Lancement du script en mode administrateur...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

@echo off
fltmc >nul || exit /b
call "%~dp0MAS_AIO.cmd" /HWID /Ohook /Z-ESU
cd \
(goto) 2>nul & (if "%~dp0"=="%SystemRoot%\Setup\Scripts\" rd /s /q "%~dp0")
