-- Controleer of alles correct is toegevoegd
SELECT 
    e.id,
    e.first_name,
    e.last_name,
    e.email,
    r.role_name
FROM 
    employees e
LEFT JOIN 
    roles r ON e.role_id = r.id;
