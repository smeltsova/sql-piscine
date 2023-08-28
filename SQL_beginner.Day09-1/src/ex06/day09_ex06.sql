CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                              IN pprice numeric DEFAULT 500,
                                                              IN pdate date DEFAULT '2022-01-08')
    RETURNS TABLE(pizzeria_name varchar)
    AS $$
    BEGIN
    RETURN QUERY (
        SELECT DISTINCT pi.name
    FROM person_visits AS pv
    JOIN person AS p ON pv.person_id = p.id
    JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
    JOIN menu AS m ON m.pizzeria_id = pv.pizzeria_id
    WHERE p.name = pperson AND m.price < pprice AND pv.visit_date = pdate
    );
    END;
    $$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');