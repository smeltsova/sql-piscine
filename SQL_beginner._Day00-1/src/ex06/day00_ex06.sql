SELECT
    (SELECT person.name
     FROM person
     WHERE person.id = po.person_id) AS name,
    CASE
        WHEN (SELECT person.name
            FROM person
            WHERE person.id = po.person_id) = 'Denis' THEN true
        ELSE false
    END AS check_name
FROM person_order AS po
WHERE (po.menu_id = 13 OR po.menu_id = 14 OR po.menu_id = 18)
       AND (po.order_date = '2022-01-07');