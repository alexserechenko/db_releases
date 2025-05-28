@ECHO OFF



echo Maak een backup van je spfile...
copy "C:\ORABASE\WINDOWS.X64_193000_DB_HOME\DATABASE\SPFILECDBA.ORA" "C:\Users\itiaf\OneDrive\Desktop\Opleiding\releases\release 2.2\backup_spfile.ora"




if errorlevel 1 (
    echo Fout bij het maken van de backup.
    pause
    exit /b 1
) else (
    echo Backup succesvol gemaakt in "C:\Users\itiaf\OneDrive\Desktop\Opleiding\releases"
)

pause
REM Ga naar de directory van de batch file
cd /d %~dp0

REM Start sqlplus met je start.sql script
sqlplus /nolog @start.sql

REM Check of de vorige opdracht succesvol was
if %ERRORLEVEL%==0 (
    echo Success 
    call clean.bat 
    PAUSE
) else (
    echo Failed with error code: %ERRORLEVEL%
    PAUSE
)



PAUSE
