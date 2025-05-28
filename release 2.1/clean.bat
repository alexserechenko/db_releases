@echo off
REM Verwijder alle bestanden in C:\temp
del /q "C:\temp\*.*"

REM (optioneel) Verwijder lege submappen
for /d %%x in ("C:\temp\*") do rd /s /q "%%x"

pause