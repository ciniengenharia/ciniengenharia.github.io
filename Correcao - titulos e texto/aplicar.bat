@echo off
setlocal
set "SITE=%~dp0.."
cd /d "%SITE%"
if not exist "CNAME" (
  echo ERRO: coloque esta pasta DENTRO da pasta do site e rode de novo.
  pause
  exit /b 1
)
if not exist "servicos\engenharia-eletrica-montenegro\index.html" (
  echo ERRO: aplique antes o pacote das partes 2 a 13.
  pause
  exit /b 1
)
echo Corrigindo titulos e texto das 13 paginas...
robocopy "%~dp0arquivos-novos-e-alterados" "%CD%" /E /NFL /NDL /NJH /NJS /NP >nul
if errorlevel 8 (
  echo ERRO ao copiar os arquivos.
  pause
  exit /b 1
)
echo.
echo Pronto! Titulos e texto corrigidos nas 13 paginas.
echo No GitHub Desktop: Discard changes nas pastas de pacote, depois Commit e Push.
pause
