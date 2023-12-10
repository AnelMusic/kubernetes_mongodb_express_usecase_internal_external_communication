@echo off

set "envFile=.env"
set "yamlFile=.\secrets\mongodb-secret.yaml"

REM Read .env file to get MongoDB root credentials
for /f "usebackq tokens=1,* delims==" %%a in ("%envFile%") do (
    if /i "%%a"=="MONGODB_ROOT_USERNAME" set "USERNAME=%%b"
    if /i "%%a"=="MONGODB_ROOT_USERPASSWORD" set "PASSWORD=%%b"
)

REM Check if USERNAME and PASSWORD exist in .env file
if not defined USERNAME (
    echo MONGODB_ROOT_USERNAME not found in .env file.
    exit /b 1
)

if not defined PASSWORD (
    echo MONGODB_ROOT_USERPASSWORD not found in .env file.
    exit /b 1
)

REM Encode USERNAME and PASSWORD as base64 using PowerShell
for /f "delims=" %%a in ('powershell -Command "[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes('%USERNAME%'))"') do set "BASE64_USERNAME=%%a"
for /f "delims=" %%a in ('powershell -Command "[Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes('%PASSWORD%'))"') do set "BASE64_PASSWORD=%%a"

REM Define placeholders and update the mongodb-secret.yaml content
set "PLACEHOLDER_USERNAME=$MONGODBROOTUSERNAME"
set "PLACEHOLDER_PASSWORD=$MONGODBROOTPASSWORD"
set "TEMP_FILE=%TEMP%\mongodb-secret-temp.yaml"

REM Replace placeholders in mongodb-secret.yaml with base64-encoded values
(
    for /f "delims=" %%a in ('type "%yamlFile%"') do (
        set "line=%%a"
        setlocal enabledelayedexpansion
        if "!line!" equ "" (
            echo.
        ) else (
            set "line=!line:%PLACEHOLDER_USERNAME%=%BASE64_USERNAME%!"
            set "line=!line:%PLACEHOLDER_PASSWORD%=%BASE64_PASSWORD%!"
            echo(!line!
        )
        endlocal
    )
) > "%TEMP_FILE%"

move /y "%TEMP_FILE%" "%yamlFile%" > nul

echo Credentials inserted into mongodb-secret.yaml.
