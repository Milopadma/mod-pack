@echo off
setlocal enabledelayedexpansion

:: ask user for minecraft install directory
echo Please enter your Minecraft install directory (the folder containing the 'mods' folder):
set /p minecraft_dir=

:: check if the mods directory exists
if not exist "%minecraft_dir%\mods" (
    echo Error: 'mods' directory not found in %minecraft_dir%
    echo Please make sure you entered the correct Minecraft directory.
    pause
    exit /b 1
)

:: check if the towers mod exists
if not exist "%minecraft_dir%\mods\towers-1.0.1.jar" (
    echo Error: 'towers-1.0.1.jar' not found in the mods directory.
    echo Please make sure the mod is correctly installed.
    pause
    exit /b 1
)

:: run git pull
echo Updating...
git pull

:: wait a moment
echo Finalizing update...
timeout /t 2 /nobreak >nul

:: display success message
echo Update completed successfully!
pause 