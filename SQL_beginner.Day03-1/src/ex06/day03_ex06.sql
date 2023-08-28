SELECT m1.pizza_name, pi1.name AS pizzeria_name_1, pi2.name AS pizzeria_name_2, m1.price
FROM menu AS m1
JOIN menu AS m2 ON m1.pizza_name = m2.pizza_name
JOIN pizzeria AS pi1 ON m1.pizzeria_id = pi1.id
JOIN pizzeria AS pi2 ON m2.pizzeria_id = pi2.id
WHERE  m1.price = m2.price AND
       m1.pizzeria_id > m2.pizzeria_id
ORDER BY 1;
