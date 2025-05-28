@ECHO OFF

TITLE DBonly started from : %cd%

cd /d %~dp0

sqlplus /nolog @start.sql

if %ERRORLEVEL%==0 (
	echo Success 
	call clean.bat 
	PAUSE
) else (echo Failed with error code: %ERRORLEVEL%
		PAUSE
		)

PAUSE

