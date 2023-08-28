SELECT m.pizza_name,
       pi.name AS pizzeria_name
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
JOIN person_order po on m.id = po.menu_id
JOIN person AS p ON po.person_id = p.id
WHERE p.name = 'Denis' OR p.name = 'Anna'
ORDER BY 1, 2;