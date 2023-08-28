SELECT m.pizza_name,
       pi.name AS pizzeria_name,
       m.price
FROM menu AS m
JOIN pizzeria AS pi
ON m.pizzeria_id = pi.id
WHERE m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name;