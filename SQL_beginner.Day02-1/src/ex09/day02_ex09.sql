WITH female_order AS
    (SELECT p.name, m.pizza_name, p.id AS person_id
     FROM person_order AS po
         JOIN menu m on po.menu_id = m.id
         JOIN person p on po.person_id = p.id
     WHERE p.gender = 'female' AND
           (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'cheese pizza'))
SELECT DISTINCT o1.name
FROM female_order AS o1
WHERE o1.pizza_name = 'pepperoni pizza' AND
    EXISTS ( SELECT *
             FROM female_order AS o2
        WHERE o1.person_id = o2.person_id AND o2.pizza_name = 'cheese pizza'
             )
ORDER BY name;