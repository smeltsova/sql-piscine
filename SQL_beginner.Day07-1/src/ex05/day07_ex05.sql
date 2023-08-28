SELECT DISTINCT (SELECT name FROM person AS p WHERE po.person_id = p.id)
FROM person_order AS po
ORDER BY 1;
