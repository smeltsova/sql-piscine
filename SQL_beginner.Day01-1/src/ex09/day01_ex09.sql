SELECT p.name
FROM pizzeria AS p
WHERE p.id NOT IN (SELECT DISTINCT pv.pizzeria_id
                   FROM person_visits AS pv);

SELECT p.name
FROM pizzeria AS p
WHERE NOT EXISTS (SELECT *
                  FROM person_visits AS pv
                  WHERE pv.pizzeria_id = p.id);