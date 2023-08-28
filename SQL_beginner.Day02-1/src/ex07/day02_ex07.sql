SELECT DISTINCT pi.name AS pizzeria_name
FROM person_visits AS pv
JOIN person AS p on pv.person_id = p.id
JOIN pizzeria AS pi on pv.pizzeria_id = pi.id
JOIN menu AS m ON m.pizzeria_id = pi.id
WHERE pv.visit_date = '2022-01-08' AND p.name = 'Dmitriy' AND m.price < 800;