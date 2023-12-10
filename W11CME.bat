@echo off
title W11CME
:begin
echo Windows 11 Context menu editor
echo This batch file changes the Windows 11 style of the right click menu
echo.
echo Free and opensource made by mommyune
echo https://mommyune.com
echo ========================================================================
echo Select a option from below:
echo.
echo    1) Windows 11 style
echo       Changes to the default Windows 11 style richt click menu.
echo.
echo    2) Windows 10 style
echo       Changes to the older Windows 10 style richt click menu
echo.
echo    3) Close
echo       Closes the menu 
echo.
echo ========================================================================

set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3

cls
goto begin

:op1
cls
echo Adding the context menu back
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
timeout 3
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
timeout 3
cls
goto begin

:op2
cls
echo Removing the context menu
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
timeout 3
echo.
echo Restarting Windows explorer...
powershell $open_folders = @((New-Object -com shell.application).Windows()).Document.Folder.Self.Path; Stop-Process -Name explorer -Force;  foreach ($element in $open_folders){Invoke-Item $($element)}
timeout 3
cls
goto begin

:op3
:End