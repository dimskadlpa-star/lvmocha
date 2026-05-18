@echo off
echo Checking for remote updates...
echo.

"C:\Program Files\Git\cmd\git.exe" fetch origin >nul 2>&1

for /f "delims=" %%a in ('"C:\Program Files\Git\cmd\git.exe" rev-parse HEAD') do set LOCAL=%%a
for /f "delims=" %%a in ('"C:\Program Files\Git\cmd\git.exe" rev-parse origin/main') do set REMOTE=%%a

if not "%LOCAL%"=="%REMOTE%" (
    echo ⚠️  WARNING: Remote repository has new updates!
    echo.
    echo Please pull changes:
    echo   git pull origin main
    echo.
) else (
    echo ✓ Your branch is up-to-date with origin/main
    echo.
)
