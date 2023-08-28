SELECT DISTINCT p.name
FROM person_order AS po
JOIN menu m on po.menu_id = m.id
JOIN person p on po.person_id = p.id
WHERE (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
  AND p.gender = 'male'
  AND (p.address = 'Moscow' OR p.address = 'Samara')
ORDER BY name DESC;