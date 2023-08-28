SELECT DISTINCT m.id AS menu_id
FROM menu AS m
WHERE NOT EXISTS (
    SELECT *
    FROM person_order AS po
    WHERE po.menu_id = m.id
)
ORDER BY 1;