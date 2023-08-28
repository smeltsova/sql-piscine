INSERT INTO person_visits
VALUES((SELECT MAX(id) FROM person_visits) + 1,
       (SELECT id FROM person WHERE name = 'Dmitriy' LIMIT 1),
       (SELECT pi.id
        FROM pizzeria pi
        JOIN menu m on pi.id = m.pizzeria_id
        WHERE m.price < 800
        LIMIT 1),
       '2022-01-08'::date);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats WITH DATA;