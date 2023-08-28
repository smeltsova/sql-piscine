SELECT p.name AS person_name, m.pizza_name, m.price,
       (m.price * (100 - pd.discount) / 100) AS discount_price,
       pi.name AS pizzeria_name
FROM person_order AS po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
JOIN person_discounts AS pd ON m.pizzeria_id = pd.pizzeria_id AND po.person_id = pd.person_id
JOIN pizzeria AS pi ON m.pizzeria_id = pi.id
ORDER BY person_name, pizza_name;