@echo off
setlocal enabledelayedexpansion

:: Capture ANSI escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

echo %ESC%[94m[INFO]%ESC%[0m Generating solution...
cd ..

REM Check Premake
set "PREMAKE_PATH=Tools\Premake\premake5.exe"
if not exist "%PREMAKE_PATH%" (
    echo %ESC%[91m[ERROR]%ESC%[0m Premake not found at: %PREMAKE_PATH%
    echo Please check Tools/Premake directory
    exit /b 1
)

REM Check directory structure
if not exist "Tools\Premake" (
    echo %ESC%[91m[ERROR]%ESC%[0m Premake directory structure incorrect
    echo Expected: Tools/Premake/premake5.exe
    exit /b 1
)

REM Run Premake
echo %ESC%[93m[STATUS]%ESC%[0m Running Premake...
%PREMAKE_PATH% vs2022

REM Verify solution
if exist "BitEngine.sln" (
    echo %ESC%[92m[SUCCESS]%ESC%[0m Solution generated: BitEngine.sln
) else (
    echo %ESC%[91m[ERROR]%ESC%[0m Solution generation failed
    echo Check Premake output for errors
    exit /b 1
)

endlocal
exit /b 0