@echo off
title Windows 11 Classic Context Menu - Enable

echo.
echo ============================================================
echo    Windows 11 Classic Context Menu Restorer
echo    Klasik Sag Tik Menusunu Aktiflestir
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

echo [1/3] Registry degisikligi yapiliyor...
echo [1/3] Modifying registry...
echo.

REM Klasik context menu icin registry anahtari olustur
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

if %errorLevel% equ 0 (
    echo [OK] Registry degisikligi basarili!
    echo [OK] Registry modification successful!
) else (
    echo [ERROR] Hata olustu! / Error occurred!
    pause
    exit /b 1
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
echo   Klasik sag tik menusu aktiflesti!
echo   Classic right-click menu has been enabled!
echo ============================================================
echo.
echo Herhangi bir klasore veya masaustune sag tiklayarak test edin.
echo Right-click on any folder or desktop to test.
echo.
echo Geri almak icin "restore-modern-menu.bat" dosyasini calistirin.
echo To restore modern menu, run "restore-modern-menu.bat"
echo.
pause
