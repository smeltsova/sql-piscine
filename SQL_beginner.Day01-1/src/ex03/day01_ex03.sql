SELECT pv.visit_date AS action_date, pv.person_id
FROM person_visits as pv
INTERSECT
SELECT po.order_date AS action_date, po.person_id
FROM person_order AS po
ORDER BY action_date, person_id DESC;