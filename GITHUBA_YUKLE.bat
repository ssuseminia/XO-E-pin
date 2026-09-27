@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"

echo ============================================
echo   XO E-pin - GitHub Toplu Yukleme
echo ============================================
echo.

where git >nul 2>nul
if errorlevel 1 (
  echo [HATA] Bilgisayarinda Git bulunamadi.
  echo Git'i kur: https://git-scm.com/download/win
  pause
  exit /b 1
)

if not exist .git (
  git init -b main
)

rem Bu repo icin Git kimligini ayarla
git config user.name "ssuseminia"
git config user.email "122688164+ssuseminia@users.noreply.github.com"
git config core.quotepath false

rem Ana dali garantiye al
git branch -M main

rem Remote'u ayarla
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  git remote add origin https://github.com/ssuseminia/XO-E-pin.git
) else (
  git remote set-url origin https://github.com/ssuseminia/XO-E-pin.git
)

echo Dosyalar hazirlaniyor...
git add -A

git diff --cached --quiet
if errorlevel 1 (
  echo Commit olusturuluyor...
  git commit -m "XO E-pin sitesini yukle"
  if errorlevel 1 (
    echo.
    echo [HATA] Commit olusturulamadi.
    pause
    exit /b 1
  )
) else (
  echo Yeni degisiklik yok. Mevcut commit kullanilacak.
)

echo.
echo GitHub'a yukleniyor...
git push -u origin main
if errorlevel 1 (
  echo.
  echo [HATA] Yukleme tamamlanamadi.
  echo GitHub giris ekrani acilirsa hesabina giris yap ve tekrar calistir.
  pause
  exit /b 1
)

echo.
echo ============================================
echo   TAMAMLANDI!
echo   https://github.com/ssuseminia/XO-E-pin
echo ============================================
pause
