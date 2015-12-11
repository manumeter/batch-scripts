@echo off

rem Usage: call passwd.cmd [length [mode]]
rem        modes:
rem          -n = numbers
rem          -l = numbers + lowercase letters
rem          -u = numbers + lowercase letters + uppercase letters
rem          -s = numbers + lowercase letters + uppercase letters + special chars

set "length=%~1"
if "%length%"=="" set "length=32"
set "mode=70"
if "%~2"=="-n" set "mode=10"
if "%~2"=="-l" set "mode=36"
if "%~2"=="-u" set "mode=62"
if "%~2"=="-s" set "mode=70"

call :passwd %length% %mode%

rem Function

	goto :eof
	:passwd
		setlocal
			set /a cnt=%1
			set /a mode=%2
			set "chars=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.,:;!$"
			:pwdloop
				set /a rnd=%random%%%%mode%
				call set "rnd=%%chars:~%rnd%,1%%"
				set "return=%return%%rnd%"
			set /a cnt-=1
			if %cnt% gtr 0 goto :pwdloop
		endlocal & set "passwd=%return%"
	goto :eof
