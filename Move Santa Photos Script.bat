@echo off
:main
echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the source folder.

:main_prompt
set /P "destfolder=Please enter the date for the folder to move the photos to, enter 'p' to view and modify paths, or enter 'q' to quit:"
if "%destfolder%" == "p" (goto path_menu)
if "%destfolder%" == "q" (exit \b)
::Need to test, but this should check if destfolder contains only numbers; this is what should activate the rest of the script
set "var="&for /f "delims=0123456789\/-_" %%i in ("%destfolder%") do set "var=%destfolder%"%
if defined var (echo Error: Command or Date not recognized.&goto main_prompt)
if "%srcpath%" == "" (echo Error: Please set a source path, or try closing and re-launching the program.& goto main_prompt)
if "%destpath%" == "" (echo Error: Please set a destination path, or try closing and re-launching the program.& goto main_prompt)
::If destfolder is a number or valid symbol, and both paths exist...
mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"

:path_menu
::TODO: Display and explain paths here
::Maybe use a "Choice" to determine wether or not we are modifying the paths?
Choice /C SDB /M "Please press 'S' to modify the source path, 'D' to modify the destination path, or press 'B' to go back.
IF %ERRORLEVEL% EQU 1 goto update_source
IF %ERRORLEVEL% EQU 2 goto update_destination
IF %ERRORLEVEL% EQU 3 goto main & cls

:update_source
set /P "input=Please paste or enter the desired source path: "
if not exist %input% (echo Error: Path not found. Please enter a valid path. & goto path_menu)
setx srcpath %input%
echo Success! Source path has been updated.
goto path_menu

:update_destination
set /P "input=Please paste or enter the desired destination path: "
if not exist %input% (echo Error: Path not found. Please enter a valid path. & goto path_menu)
setx destpath %input%
echo Success! Destination path has been updated.
goto path_menu