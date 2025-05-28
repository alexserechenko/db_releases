PROMPT Automatisch geheugenbeheer wordt uitgeschakeld...
ALTER SYSTEM SET memory_target = 0 SCOPE=SPFILE SID='CDBA';
ALTER SYSTEM SET memory_max_target = 0 SCOPE=SPFILE SID='CDBA';

PROMPT Totale SGA grootte wordt ingesteld op 600 MB...
ALTER SYSTEM SET sga_target = 600M SCOPE=SPFILE SID='CDBA';
ALTER SYSTEM SET sga_max_size = 600M SCOPE=SPFILE SID='CDBA';

PROMPT Shared pool grootte wordt ingesteld op 412 MB...
ALTER SYSTEM SET shared_pool_size = 412M SCOPE=SPFILE SID='CDBA';

PROMPT Large pool grootte wordt ingesteld op 24 MB...
ALTER SYSTEM SET large_pool_size = 24M SCOPE=SPFILE SID='CDBA';

PROMPT Java pool grootte wordt ingesteld op 4 MB...
ALTER SYSTEM SET java_pool_size = 4M SCOPE=SPFILE SID='CDBA';

PROMPT Streams pool grootte wordt ingesteld op 8 MB...
ALTER SYSTEM SET streams_pool_size = 8M SCOPE=SPFILE SID='CDBA';

PROMPT Alle geheugeninstellingen zijn aangepast. Database wordt herstart.

ACCEPT dummy PROMPT 'Druk op ENTER om verder te gaan'
