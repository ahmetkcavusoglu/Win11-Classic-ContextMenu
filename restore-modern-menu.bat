@echo off
title Windows 11 Modern Context Menu - Restore

echo.
echo ============================================================
echo    Windows 11 Modern Context Menu Restorer
echo    Modern Sag Tik Menusunu Geri Yukle
echo ============================================================
echo.

REM Yonetici yetkisi kontrolu
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [HATA] Bu script yonetici yetkisiyle calistirilmalidir!
    echo [ERROR] This script must be run as Administrator!
    echo.
    echo Lutfen dosyaya sag tiklayip "Yonetici olarak calistir" secin.
    echo Please right-click and select "Run as Administrator"
    echo.
    pause
    exit /b 1
)

echo [1/3] Registry degisikligi geri aliniyor...
echo [1/3] Reverting registry changes...
echo.

REM Klasik context menu registry anahtarini sil
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f >nul 2>&1

if %errorLevel% equ 0 (
    echo [OK] Registry degisikligi geri alindi!
    echo [OK] Registry changes reverted!
) else (
    echo [INFO] Registry anahtari zaten silinmis veya mevcut degil.
    echo [INFO] Registry key already deleted or doesn't exist.
)

echo.
echo [2/3] Windows Explorer yeniden baslatiliyor...
echo [2/3] Restarting Windows Explorer...
echo.

REM Explorer'i kapat ve yeniden baslat
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [OK] Explorer yeniden baslatildi!
echo [OK] Explorer restarted!
echo.

echo [3/3] Tamamlandi! / Completed!
echo.
echo ============================================================
echo   Modern sag tik menusu geri yuklendi!
echo   Modern right-click menu has been restored!
echo ============================================================
echo.
echo Herhangi bir klasore veya masaustune sag tiklayarak test edin.
echo Right-click on any folder or desktop to test.
echo.
echo Klasik menuyu tekrar aktiflestirmek icin "enable-classic-menu.bat" calistirin.
echo To enable classic menu again, run "enable-classic-menu.bat"
echo.
pause
