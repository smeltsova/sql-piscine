SELECT m.pizza_name, m.price, pi.name AS pizzeria_name, pv.visit_date
FROM menu AS m
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
JOIN person_visits AS pv ON m.pizzeria_id = pv.pizzeria_id
JOIN person AS p ON pv.person_id = p.id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name;