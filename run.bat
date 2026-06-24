@echo off
REM Digital Voting System run helper
REM Usage: double-click run.bat or run from a command prompt in this folder.

setlocal enabledelayedexpansion
cd /d "%~dp0"

REM Find Python executable.
set "PYTHON_EXEC=python"
where python >nul 2>&1
if errorlevel 1 (
    if exist "C:\python 313\python.exe" (
        set "PYTHON_EXEC=C:\python 313\python.exe"
    ) else (
        echo ERROR: Python was not found on PATH.
        echo Install Python 3.8+ and add it to PATH, or edit this file to point to your python executable.
        pause
        exit /b 1
    )
)

echo Using Python: %PYTHON_EXEC%
echo.
echo Select the component to run:
echo  1) Web app (web_app.py)
echo  2) Desktop GUI (gui_voting_system.py)
echo  3) CLI terminal (final.py)
echo  4) Exit
set /p choice=Enter choice [1-4]: 

if "%choice%"=="1" goto run_web

if "%choice%"=="2" goto run_gui
if "%choice%"=="3" goto run_cli
if "%choice%"=="4" goto end

echo Invalid choice. Exiting.
pause
exit /b 1

:run_web
echo Starting web_app.py...\r\n
"%PYTHON_EXEC%" web_app.py
goto end

:run_gui
echo Starting gui_voting_system.py...\r\n
"%PYTHON_EXEC%" gui_voting_system.py
goto end

:run_cli
echo Starting final.py...\r\n
"%PYTHON_EXEC%" final.py
goto end

:end
endlocal
