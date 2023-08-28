CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    (SELECT pi.name AS pizzeria_name
    FROM person_visits AS pv
    JOIN person AS p ON pv.person_id = p.id
    JOIN menu AS m ON pv.pizzeria_id = m.pizzeria_id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
    WHERE p.name = 'Dmitriy'
      AND m.price < 800
      AND pv.visit_date = '2022-01-08')
WITH DATA