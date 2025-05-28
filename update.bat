@ECHO OFF

TITLE DBonly started from : %cd%

sqlplus /nolog @c:\temp\104335\start.sql

if %ERRORLEVEL%==0 (echo Success) else (echo Failed with error code: %ERRORLEVEL%)

PAUSE

