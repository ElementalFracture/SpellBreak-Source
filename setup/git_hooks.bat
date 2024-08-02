@echo off
setlocal

rem Get the directory of the currently running script
set "SCRIPT_DIR=%~dp0"

REM Change to the parent directory of the script
cd /d %SCRIPT_DIR%..

set "PARENT_DIR=%CD%"

REM Define source and destination directories relative to the parent directory
set "SOURCE_DIR=%PARENT_DIR%\setup\hooks"
set "DEST_DIR=%PARENT_DIR%\.git\hooks"

REM Check if the source directory exists
if not exist "%SOURCE_DIR%" (
    echo Source directory "%SOURCE_DIR%" does not exist.
    goto :end
)

REM Check if the destination directory exists
if not exist "%DEST_DIR%" (
    echo Destination directory "%DEST_DIR%" does not exist.
    goto :end
)

REM Copy files from source to destination
xcopy "%SOURCE_DIR%\*" "%DEST_DIR%\" /Y

echo Files copied from "%SOURCE_DIR%" to "%DEST_DIR%".

REM Iterate over each submodule and copy hooks
for /d %%d in ("%PARENT_DIR%\.git\modules\*") do (
    set "SUBMODULE_HOOKS_DIR=%%d\hooks"
    
    REM Check if the submodule hooks directory exists
    if exist "%%d\hooks" (
        REM Copy files from source to submodule hooks directory
        xcopy "%SOURCE_DIR%\*" "%%d\hooks\" /Y
        echo Files copied from "%SOURCE_DIR%" to "%%d\hooks".
    ) else (
        echo Submodule hooks directory "%%d\hooks" does not exist.
    )
)

:end
endlocal