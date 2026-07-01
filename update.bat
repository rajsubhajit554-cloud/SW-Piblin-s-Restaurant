@echo off
echo =========================================
echo       Git Auto Update Script
echo =========================================
echo.

echo Adding all changes to Git...
git add .
if %errorlevel% neq 0 (
    echo Error: Failed to add files to Git.
    pause
    exit /b %errorlevel%
)

echo.
set /p msg="Enter commit message (press Enter for default 'Update website'): "
if "%msg%"=="" set msg=Update website

echo.
echo Committing changes with message: "%msg%"...
git commit -m "%msg%"
if %errorlevel% neq 0 (
    echo Error: Failed to commit changes.
    pause
    exit /b %errorlevel%
)

echo.
echo Pushing changes to remote repository...
git push origin main
if %errorlevel% neq 0 (
    echo Error: Failed to push to remote repository.
    pause
    exit /b %errorlevel%
)

echo.
echo =========================================
echo Git update finished successfully!
echo =========================================
pause
