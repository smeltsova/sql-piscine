--WITH last AS (SELECT MAX(order_date) AS max FROM person_order)
--DELETE FROM person_order
--WHERE person_order.order_date = (SELECT last.max FROM last);


DELETE FROM person_order
    WHERE order_date = '2022-02-25';

DELETE FROM menu
    WHERE pizza_name = 'greek pizza';

