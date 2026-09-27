@echo off
chcp 65001 >nul
color 0A
title XO E-pin - GitHub Demo Güncelleme
cd /d "%~dp0"
echo ===============================================
echo     XO E-Pin - GitHub Pages Demo Guncelleme
echo ===============================================
echo.
where git >nul 2>&1 || (echo [HATA] Git kurulu degil. https://git-scm.com/ adresinden kur. & pause & exit /b 1)
if not exist .git (
  git init
  git branch -M main
  git remote add origin https://github.com/ssuseminia/XO-E-pin.git 2>nul
) else (
  git remote set-url origin https://github.com/ssuseminia/XO-E-pin.git
  git branch -M main
)
git config user.name "ssuseminia"
git config user.email "ssuseminia@users.noreply.github.com"
echo [1/3] Dosyalar hazirlaniyor...
git add -A
echo [2/3] Yeni demo surumu kaydediliyor...
git commit -m "XO E-Pin GitHub Pages demo store v3"
if errorlevel 1 echo Degisiklik yoksa bu mesaj normaldir.
echo [3/3] GitHub'a gonderiliyor...
git push -u origin main --force
if errorlevel 1 (
 echo.
 echo [HATA] Yukleme tamamlanamadi. GitHub girisi istenirse giris yapip tekrar calistir.
 pause
 exit /b 1
)
echo.
echo ===============================================
echo TAMAMLANDI!
echo Site: https://ssuseminia.github.io/XO-E-pin/
echo ===============================================
pause
