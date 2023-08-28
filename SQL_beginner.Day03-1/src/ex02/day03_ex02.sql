SELECT m.pizza_name, m.price, pi.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
WHERE NOT EXISTS (
    SELECT *
    FROM person_order AS po
    WHERE po.menu_id = m.id
)
ORDER BY pizza_name, price;