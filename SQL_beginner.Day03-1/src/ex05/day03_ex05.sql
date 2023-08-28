WITH ordered AS
    (SELECT DISTINCT pi.name AS pizzeria_name
     FROM person_order AS po
     JOIN person AS p ON po.person_id = p.id
     JOIN menu AS m ON po.menu_id = m.id
     JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
     WHERE p.name = 'Andrey'),
    visited AS (SELECT pi.name AS pizzeria_name
     FROM person_visits AS pv
     JOIN person AS p ON pv.person_id = p.id
     JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
     WHERE p.name = 'Andrey')
SELECT DISTINCT s.pizzeria_name
FROM (
    (SELECT * FROM visited)
       EXCEPT
    (SELECT * FROM ordered)
    ) AS s
ORDER BY 1;