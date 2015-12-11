@echo off

rem Usage: call ssh-tunnel.cmd user@host [port]

set "port=25"
if not "%~2"=="" set "port=%~2"

echo.Running local SOCKS v5 proxy on port 8080 through %~1 (Ctrl+C to stop) ...
"%ProgramFiles(x86)%\Putty\plink.exe" -ssh -T -P %port% -D 8080 "%~1"

pause
