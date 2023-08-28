WITH female_visit AS
    (SELECT DISTINCT pi.name AS pizzeria_name
     FROM person_order AS po
     JOIN person AS p ON po.person_id = p.id
     JOIN menu AS m ON po.menu_id = m.id
     JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
     WHERE p.gender = 'female'),
    male_visit AS
     (SELECT DISTINCT pi.name AS pizzeria_name
     FROM person_order AS po
     JOIN person AS p ON po.person_id = p.id
     JOIN menu AS m ON po.menu_id = m.id
     JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
     WHERE p.gender = 'male')
SELECT DISTINCT s.pizzeria_name
FROM (
    ((SELECT * FROM female_visit)
    EXCEPT
    (SELECT * FROM male_visit))
        UNION
    ((SELECT * FROM male_visit)
    EXCEPT
    (SELECT * FROM female_visit))
) AS s
ORDER BY 1;