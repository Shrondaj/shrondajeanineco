@echo off
REM ============================================
REM Quick Setup Script for Shronda Jeanine & Company Website
REM Save this as: setup.bat
REM Right-click and "Run as Administrator"
REM ============================================

echo.
echo ========================================
echo Shronda Jeanine ^& Company Website Setup
echo ========================================
echo.

REM Check if Git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo Please install Git first using:
    echo choco install git -y
    pause
    exit /b 1
)

echo [OK] Git is installed
echo.

REM Configure Git
echo Setting up Git configuration...
git config --global user.name "Shronda Jeanine"
git config --global user.email "shrondajeanine@shrondajeanineco.com"
echo [OK] Git configured
echo.

REM Ask user for directory location
echo Where do you want to create the website folder?
echo Current location: %CD%
echo.
set /p CONTINUE="Press ENTER to use current location, or type a new path: "

if not "%CONTINUE%"=="" (
    cd /d "%CONTINUE%"
)

echo.
echo Creating website in: %CD%
echo.

REM Clone the repository
echo Cloning repository from GitHub...
git clone https://github.com/shrondaj/shrondajeanineco.git

if %errorlevel% neq 0 (
    echo [ERROR] Failed to clone repository!
    echo.
    echo Please check:
    echo 1. Your internet connection
    echo 2. Repository exists at: https://github.com/shrondaj/shrondajeanineco
    echo 3. You have access to the repository
    pause
    exit /b 1
)

cd shrondajeanineco
echo [OK] Repository cloned
echo.

REM Create directory structure
echo Creating folders...
mkdir assets\images 2>nul
echo [OK] Folders created
echo.

REM Instructions for next steps
echo.
echo ========================================
echo SETUP ALMOST COMPLETE!
echo ========================================
echo.
echo Next steps:
echo.
echo 1. Copy all website files to this folder:
echo    %CD%
echo.
echo 2. Add your logo to: %CD%\assets\logo.png
echo.
echo 3. After adding files, run:
echo    cd %CD%
echo    git add .
echo    git commit -m "Complete website setup"
echo    git push origin main
echo.
echo 4. Enable GitHub Pages:
echo    - Go to: https://github.com/shrondaj/shrondajeanineco
echo    - Settings ^> Pages ^> Source: main branch ^> Save
echo.
echo 5. Your site will be live at:
echo    https://shrondaj.github.io/shrondajeanineco/
echo.
echo ========================================
echo.

REM Open folder in explorer
echo Opening project folder...
start .

pause
