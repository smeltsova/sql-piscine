WITH q AS (SELECT m.pizzeria_id,
                  COUNT(*) AS count_of_orders,
                  ROUND(AVG(m.price), 2) AS average_price,
                  MAX(m.price) AS max_price,
                  MIN(m.price) AS min_price
           FROM person_order AS po
           JOIN menu AS m ON po.menu_id = m.id
           GROUP BY m.pizzeria_id)
SELECT pi.name, count_of_orders, average_price,  max_price,  min_price
FROM q
JOIN pizzeria AS pi ON q.pizzeria_id = pi.id
ORDER BY name;
