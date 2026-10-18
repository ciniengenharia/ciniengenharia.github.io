@echo off
chcp 65001 >nul
cd /d "%~dp0"
set SITE=%~dp0..
if not exist "%SITE%\assets\css\artigos.css" goto erro
copy /Y "assets\css\artigos.css" "%SITE%\assets\css\artigos.css" >nul
if errorlevel 1 goto erro
echo.
echo PRONTO. Arquivo assets\css\artigos.css atualizado.
echo Agora abra o GitHub Desktop, de Commit e Push.
echo Antes, descarte a pasta estilo-artigos com Discard changes.
pause
exit /b 0
:erro
echo.
echo ERRO: coloque a pasta estilo-artigos dentro da pasta do site e rode de novo.
pause
exit /b 1
