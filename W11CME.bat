:restart
@echo off
title W11CME
SetLocal EnableExtensions
For /F %%G In ('Echo Prompt $E ^| "%__AppDir__%cmd.exe"') Do Set "ESC=%%G"
echo %ESC%[40m

::: _ __ ___   ___  _ __ ___  _ __ ___  _   _   _   _ _ __   ___ 
:::| '_ ` _ \ / _ \| '_ ` _ \| '_ ` _ \| | | | | | | | '_ \ / _ \
:::| | | | | | (_) | | | | | | | | | | | |_| | | |_| | | | |  __/
:::|_| |_| |_|\___/|_| |_| |_|_| |_| |_|\__, |  \__,_|_| |_|\___|
:::                                     |___/                    

:begin
echo %ESC%[31m
reg query "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" >nul
cls
for /f "delims=: tokens=*" %%R in ('findstr /b ::: "%~f0"') do @echo(%%R
)
echo %ESC%[31mFree and opensource made by mommyune
echo https://mommyune.com
echo %ESC%[37m
echo %ESC%[97mWindows 11 Context menu editor
echo Changes the Windows 11 style of the context (right click) menu.
echo ========================================================================
if %errorlevel% equ 0 (
  echo %ESC%[92mWindows 10 Style is enabled
) else (
  echo %ESC%[92mWindows 11 Style is enabled
)
echo.
echo %ESC%[97mSelect a option from below:
echo.
echo    1) Windows 11 style
echo       %ESC%[37mChanges to the default Windows 11 style richt click menu.
echo.
echo    %ESC%[97m2) Windows 10 style
echo       %ESC%[37mChanges to the older Windows 10 style richt click menu
echo.
echo    %ESC%[97mR) Restart
echo       %ESC%[37mRestarts the menu fully
echo.
echo    %ESC%[97mQ) Quit
echo       %ESC%[37mCloses the menu fully 
echo ========================================================================
echo %ESC%[97m
set /p op=Type option: 
for %%X in ("q" "Q") do if "%op%"==%%X goto opx
for %%R in ("r" "R") do if "%op%"==%%R goto opr
if "%op%"=="1" goto :op1
if "%op%"=="2" goto :op2
goto :begin

:op1
cls
echo Adding the context menu back
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
REM
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
REM
goto :begin

:op2
cls
echo Removing the context menu
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
REM
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
REM
goto :begin

:opr
goto :restart

:opx
:End