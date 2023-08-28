SELECT vo.action_date, p.name AS person_name
FROM (
    SELECT pv.visit_date AS action_date, pv.person_id
    FROM person_visits as pv
    INTERSECT
    SELECT po.order_date AS action_date, po.person_id
    FROM person_order AS po
) AS vo
JOIN person AS p
    ON p.id = vo.person_id
ORDER BY action_date, person_name DESC;