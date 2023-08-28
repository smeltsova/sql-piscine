WITH total AS
    (WITH ord AS (SELECT m.pizzeria_id, COUNT(po.id) as count, 'order' AS action_type
              FROM person_order AS po
                       JOIN menu AS m ON po.menu_id = m.id
              GROUP BY pizzeria_id
              ORDER BY count DESC),
          vis AS (SELECT pv.pizzeria_id, COUNT(*) as count, 'visit' AS action_type
              FROM person_visits AS pv
              GROUP BY pizzeria_id
              ORDER BY count DESC)
    SELECT name, count, action_type
    FROM (SELECT *
          FROM ord
          RIGHT JOIN pizzeria AS pi ON ord.pizzeria_id = pi.id) AS ord_name

    UNION ALL

    SELECT name, count, action_type
    FROM (SELECT *
          FROM vis
          RIGHT JOIN pizzeria AS pi ON vis.pizzeria_id = pi.id) AS vis_name

    ORDER BY action_type, count DESC)
SELECT name, COALESCE(SUM(count), 0) AS total_count
FROM total
GROUP BY name
ORDER BY total_count DESC, name;