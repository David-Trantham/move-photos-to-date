@echo off
:main
echo Scanning.....
dir %srcpath% /b /a-d | find /c /v ""
echo Photos have been found within the source folder.

:main_prompt
set /P "destfolder=Please enter the date for the folder to move the photos to, enter 'p' to view and modify paths, or enter 'q' to quit.

::Check for 'p' or 'q' here...
::if p, goto path_menu
::if q, exit
::Need to test, but this should check if destfolder contains only numbers; this is what should activate the rest of the script
SET "var="&for /f "delims=0123456789" %%i in ("%destfolder%") do set "var=%destfolder%"%
if defined var (echo %destfolder% NOT numeric)else (echo %destfolder% numeric)

::This is the script that should be activated in the case that destfolder is numeric
mkdir "%destpath%\%destfolder%"
move "%srcpath%\*" "%destpath%\%destfolder%\"
goto eof

::If the input does not match P, Q, or a number:
echo Error: Invalid input.
goto main
:path_menu

::Maybe use a "Choice" to determine wether or not we are modifying the paths?
Choice /C BSD /T 10 /M "Please press ""S"" to modify the source path, ""D"" to modify the destination path, or press ""B"" to go back. 
IF %ERRORLEVEL% EQU 1 goto main
IF %ERRORLEVEL% EQU 2 goto update_source
IF %ERRORLEVEL% EQU 3 goto update_destination

:update_source

goto path_menu

:update_dest

goto path_menu

