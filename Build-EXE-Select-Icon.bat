@echo off
setlocal EnableExtensions
chcp 437 >nul
title Darwin2 Worklist Bridge Builder 1.4.2

set "PROJECT=%~dp0"
set "BUILD_PS1=%PROJECT%Build-Release.ps1"
set "ICON="

echo ============================================================
echo Darwin2 Worklist Bridge Builder
echo Version: 1.4.2
echo ============================================================
echo.

if not exist "%BUILD_PS1%" (
    echo ERROR: Build-Release.ps1 was not found.
    pause
    exit /b 1
)

echo Select an ICO file for the EXE icon.
echo Cancel the dialog to use the default project icon.
echo.

for /f "usebackq delims=" %%I in (`powershell.exe -NoProfile -STA -ExecutionPolicy Bypass -Command "Add-Type -AssemblyName System.Windows.Forms; $d=New-Object System.Windows.Forms.OpenFileDialog; $d.Title='Select EXE Icon'; $d.Filter='Icon files (*.ico)|*.ico'; $d.InitialDirectory='%PROJECT%assets'; if($d.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){[Console]::Write($d.FileName)}"`) do set "ICON=%%I"

if defined ICON (
    echo Selected icon: "%ICON%"
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%BUILD_PS1%" -IconPath "%ICON%"
) else (
    echo Using default project icon.
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%BUILD_PS1%"
)

set "RC=%ERRORLEVEL%"
echo.
if not "%RC%"=="0" (
    echo BUILD FAILED. Exit code: %RC%
    pause
    exit /b %RC%
)

echo BUILD COMPLETED.
echo Output is under the release folder.
pause
exit /b 0
