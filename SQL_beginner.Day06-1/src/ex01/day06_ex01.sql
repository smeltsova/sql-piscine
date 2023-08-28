WITH q AS (
    SELECT po.person_id, m.pizzeria_id,
           (SELECT
            CASE
                WHEN COUNT(po.id) = 1 THEN 10.5
                WHEN COUNT(po.id) = 2 THEN 22
                ELSE 30
            END
            ) AS discount
    FROM person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    GROUP BY po.person_id, m.pizzeria_id
    ORDER BY person_id, pizzeria_id
)
INSERT INTO person_discounts
SELECT row_number() over () AS id,
  q.person_id,
  q.pizzeria_id,
  q.discount
FROM q;
