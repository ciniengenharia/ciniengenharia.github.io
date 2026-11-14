@echo off
set "SITE=%~dp0.."
cd /d "%SITE%"
if not exist "CNAME" goto erro
if not exist "treinamentos\index.html" goto antes
robocopy "%~dp0arquivos" "%CD%" /E /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 goto erro
echo.
echo PRONTO. Paginas em ingles, espanhol, italiano e alemao aplicadas.
echo No GitHub Desktop: Discard changes na pasta pacote-idiomas, depois Commit e Push.
pause
exit /b 0
:antes
echo ERRO: aplique e publique primeiro o pacote-treinamentos, depois rode este de novo.
pause
exit /b 1
:erro
echo ERRO: coloque a pasta pacote-idiomas DENTRO da pasta do site e rode de novo.
pause
exit /b 1
