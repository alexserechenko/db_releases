ACCEPT instance    PROMPT 'Instance (CDBA) : '
ACCEPT syspassword PROMPT 'Syspassword on &&instance : ' HIDE

CONNECT sys/&&syspassword@&&instance as sysdba

SET LINESIZE 888 PAGESIZE 888 TRIMSPOOL ON SERVEROUTPUT ON SIZE UNLIMITED 

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI:SS';

-- GLOBAL_NAME
COLUMN global_name NEW_VALUE v_global_name NOPRINT
SELECT global_name FROM global_name;

COLUMN rundate NEW_VALUE v_rundate NOPRINT
SELECT TO_CHAR(sysdate,'YYYYMMDD_HH24MI') rundate FROM dual;

SPOOL ./104335.&&v_global_name..&&v_rundate..log

WHENEVER SQLERROR EXIT 1
WHENEVER OSERROR EXIT 2

PROMPT 'Recompile invalids'
BEGIN
 utl_recomp.recomp_serial;
END;
/

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI') BEGIN FROM DUAL;

SELECT instance_name, host_name FROM v$instance;

COLUMN total_invalid_objects FORMAT A50
COLUMN owner FORMAT A30
COLUMN object_name FORMAT A50
COLUMN object_type FORMAT A19

SELECT 
  'INVALID_COUNT_BEFORE : ' || COUNT(*) OVER () total_invalid_objects
,  owner
, object_name
, object_type
FROM dba_invalid_objects;


--START .\PAUSE.sql
----

SET TIME ON
SET TIMING ON
SET ECHO OFF
SET DEFINE OFF

ALTER SESSION SET CONTAINER = DEV;

START .\01_undo_2.0_release.sql

/* START .\01_create_roles_table.sql
START .\02_insert_roles.sql
START .\03_create_employees_table.sql
START .\04_check_employees.sql */

--PROMPT Running synonyms.sql...
--START .\PAUSE.sql
--START .\synonyms.sql

SET ECHO OFF

----
SET LINESIZE 250
PROMPT 'Recompile invalids'
BEGIN
 utl_recomp.recomp_serial;
END;
/

SELECT 
  'INVALID_COUNT_AFTER : ' || COUNT(*) OVER () total_invalid_objects
,  owner
, object_name
, object_type
FROM dba_invalid_objects;

SELECT TO_CHAR(SYSDATE,'DD/MM/YYYY HH24:MI') EINDE FROM DUAL;

SPOOL OFF



EXIT
