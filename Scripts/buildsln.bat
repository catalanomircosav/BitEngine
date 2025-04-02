@echo off
setlocal enabledelayedexpansion

:: Capture ANSI escape character
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "ESC=%%b"

echo %ESC%[94m[INFO]%ESC%[0m Building solution...
cd ..

REM Check MSBuild
set "MSBUILD_PATH=%ProgramFiles%\Microsoft Visual Studio\2022\Community\Msbuild\Current\Bin\MSBuild.exe"
if not exist "%MSBUILD_PATH%" (
    echo %ESC%[91m[ERROR]%ESC%[0m MSBuild not found at: %MSBUILD_PATH%
    echo 1. Install Visual Studio 2022 Build Tools
    echo 2. Update the path in buildsh.bat
    exit /b 1
)

REM Check solution
if not exist "BitEngine.sln" (
    echo %ESC%[91m[ERROR]%ESC%[0m Solution file not found: BitEngine.sln
    echo Run gensln.bat first
    exit /b 1
)

REM Build
echo %ESC%[93m[STATUS]%ESC%[0m Starting build...
Msbuild BitEngine.sln /p:Configuration=Debug /p:Platform=x64 /v:minimal

REM Result check
if %ERRORLEVEL% equ 0 (
    echo %ESC%[92m[SUCCESS]%ESC%[0m Build completed
    echo Output in: bin\Debug\
) else (
    echo %ESC%[91m[ERROR]%ESC%[0m Build failed (Code: %ERRORLEVEL%)
    exit /b %ERRORLEVEL%
)

endlocal
exit /b 0