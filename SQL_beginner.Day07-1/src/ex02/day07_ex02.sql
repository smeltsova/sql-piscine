WITH ord AS (
    SELECT m.pizzeria_id, COUNT(po.id) AS count, 'order' AS action_type
    FROM person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    GROUP BY pizzeria_id
    ORDER BY count DESC
    LIMIT 3
),
    vis AS (
        SELECT pv.pizzeria_id, COUNT(*) AS count, 'visit' AS action_type
        FROM person_visits AS pv
        GROUP BY pizzeria_id
        ORDER BY count DESC
        LIMIT 3
    )
SELECT name, count, action_type
FROM (SELECT *
      FROM ord
      JOIN pizzeria AS pi ON ord.pizzeria_id = pi.id) AS ord_name

UNION ALL

SELECT name, count, action_type
FROM (SELECT *
      FROM vis
      JOIN pizzeria AS pi ON vis.pizzeria_id = pi.id) AS vis_name

ORDER BY action_type, count DESC;
