SET enable_seqscan =off;

SELECT m.pizza_name, p.name
FROM menu AS m
JOIN pizzeria p on m.pizzeria_id = p.id;

EXPLAIN ANALYZE
SELECT m.pizza_name, p.name
FROM menu AS m
JOIN pizzeria p on m.pizzeria_id = p.id;

