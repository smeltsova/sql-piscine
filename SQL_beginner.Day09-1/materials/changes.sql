----day03

INSERT INTO menu
VALUES (19, 2, 'greek pizza', 800);

INSERT INTO menu
VALUES ((SELECT MAX(id) FROM menu) + 1, (SELECT id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900);

INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24'::date);
INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM pizzeria WHERE name = 'Dominos'),
        '2022-02-24'::date);

INSERT INTO person_order
VALUES((SELECT MAX(id) FROM person_order) + 1,
       (SELECT id FROM person WHERE name = 'Denis'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
       '2022-02-24'::date);
INSERT INTO person_order
VALUES((SELECT MAX(id) FROM person_order) + 1,
       (SELECT id FROM person WHERE name = 'Irina'),
       (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
       '2022-02-24'::date);

UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';

INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (generate_series((SELECT MAX(id) FROM person_order) + 1,
            (SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person))),
       (generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person))),
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       '2022-02-25'::date;

DELETE FROM person_order
    WHERE order_date = '2022-02-25';
DELETE FROM menu
    WHERE pizza_name = 'greek pizza';

-- day04

INSERT INTO person_visits
VALUES((SELECT MAX(id) FROM person_visits) + 1,
       (SELECT id FROM person WHERE name = 'Dmitriy' LIMIT 1),
       (SELECT pi.id
        FROM pizzeria pi
        JOIN menu m on pi.id = m.pizzeria_id
        WHERE m.price < 800
        LIMIT 1),
       '2022-01-08'::date);