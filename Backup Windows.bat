@echo off
::Criado por; Rodrigo Albuquerque
::Backup de Arquivos Windows 1.1
mode con: lines=30 cols=65
color 1f
title Backup Windows 1.1
::Adicione sua unidade de backup caso não esteja aqui
set uni=a: b: c: d: e: f: g: h: i: j:
::Inicio do Script
:retorno
echo.
echo   		  +-----------------+
echo   		  + Backup Arquivos +
echo   		  +-----------------+
echo.
echo.
set /p "unidade=-Digite a letra da unidade para Backup, exemplo> g: "
::Laço For para comparação... 
for %%a in (%uni%) do ( if /i %unidade%== %%a goto inicio)
::Caso a unidade esteja errada retorna!!!
  echo.
  echo -Unidade errada ou ausente, tente novamente!!!
  pause> nul
  cls
  goto retorno
::Opções de Backup
:inicio
cls
echo.
echo              +=------------+-----------=+
echo              +   1: Backup + Desktop    +
echo              +   2: Backup + Imagens    +
echo              +   3: Backup + Videos     +
echo              +   4: Backup + Documentos +
echo              +   5: Backup + Musicas    +
echo              +   6: Backup + Downloads  +
echo              +--------------------------+
echo              +-------------+------------+
echo              +   7: Trocar unidade      +
echo              +--------------------------+
echo              +   8: Sair                + 
echo              +=------------+-----------=+
echo.
::Choice + errorlevel
choice /c "12345678" /n /m "-Digite>"
  goto %errorlevel%
:1 
xcopy %userprofile%\Desktop\*.* /exclude:removelnk.txt %unidade% /s /e /y    
  goto inicio
:2
xcopy %userprofile%\Pictures\*.* %unidade% /s /e /y
  goto inicio
:3
xcopy %userprofile%\Videos\*.* %unidade% /s /e /y
  goto inicio 
:4
xcopy %userprofile%\Documents\*.* %unidade% /s /e /y
  goto inicio
:5
xcopy %userprofile%\Music\*.* %unidade% /s /e /y
  goto inicio
:6
xcopy %userprofile%\Downloads\*.* %unidade% /s /e /y
  goto inicio
:7
  cls
  goto retorno
:8
  exit
pause >nul
