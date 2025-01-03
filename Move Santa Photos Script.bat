@echo off
:main
title Move Santa Photos Utility
if "%srcpath%" == "" (echo Error: No source path found. Please set a source path.& goto path_menu)
if "%destpath%" == "" (echo Error: No destination path found. Please set a destination path.& goto path_menu)
echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the source folder.

:main_prompt
echo Welcome to the Main Menu! Please enter a date for the folder to move photos to. (Example: 12012000 for December 1st, 2000)
echo
echo Alternatively, you can enter 'p' to view and modify paths, or enter 'q' to quit.
set /P "destfolder=Input: "
if "%destfolder%" == "p" (cls & goto path_menu)
if "%destfolder%" == "q" (exit /b)
set "var="&for /f "delims=0123456789\/-_" %%i in ("%destfolder%") do set "var=%destfolder%"%
if defined var (cls & echo Error: Command or Date not recognized.&goto main_prompt)
::If destfolder is a number or valid symbol, and both paths exist...
mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"
pause
exit /b

:path_menu
::TODO: Display and explain paths here
echo.
echo Source Path: %srcpath%
echo This should be the folder where photos end up when they are taken.
echo.
echo Destination Path: %destpath%
echo This should be the folder containing the dated photo folders.
echo.
Choice /C SDOBQ /M "Please press 'S' to modify the source path, 'D' to modify the destination path, press 'O' to open the source and destination paths in File Explorer, press 'B' to go back, or press 'Q' to quit.
IF %ERRORLEVEL% EQU 1 goto update_source
IF %ERRORLEVEL% EQU 2 goto update_destination
IF %ERRORLEVEL% EQU 3 cls & goto open_paths
IF %ERRORLEVEL% EQU 4 cls & goto main
IF %ERRORLEVEL% EQU 5 exit /b

:open_paths
start "" "%srcpath%"
start "" "%destpath%"
goto path_menu

:update_source
set /P "input=Please paste or enter the desired source path: "
if not exist %input% (echo Error: Path not found. Please enter a valid path. & goto path_menu)
cls
set "srcpath=%input%"
setx srcpath %srcpath%
echo Success! Source path has been updated.
goto path_menu

:update_destination
set /P "input=Please paste or enter the desired destination path: "
if not exist %input% (echo Error: Path not found. Please enter a valid path. & goto path_menu)
set "destpath=%input%"
setx destpath %destpath%
cls
echo Success! Destination path has been updated.
goto path_menu