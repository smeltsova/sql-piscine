CREATE VIEW v_price_with_discount AS
    (SELECT p.name, m.pizza_name, m.price,
           ROUND(m.price - m.price * 0.1) AS discount_price
    FROM person_order AS po
    JOIN menu AS m ON po.menu_id = m.id
    JOIN person AS p ON po.person_id = p.id
    ORDER BY name, pizza_name);