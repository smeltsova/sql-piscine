WITH pa AS
    (SELECT p.address, pi.name, pi.id AS pizzeria_id
    FROM pizzeria AS pi
    JOIN person_visits AS pv ON pv.pizzeria_id = pi.id
    JOIN person AS p ON pv.person_id = p.id
    GROUP BY 1, 2, 3
    ORDER BY 1, 2)
SELECT pa.address, pa.name, COUNT(*) AS count_of_orders
FROM pa
JOIN menu AS m ON pa.pizzeria_id = m.pizzeria_id
JOIN person_order AS po ON po.menu_id = m.id
JOIN person AS p ON p.id = po.person_id AND p.address = pa.address
GROUP BY pa.address, pa.name;
