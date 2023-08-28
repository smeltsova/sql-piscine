DROP FUNCTION IF EXISTS fnc_persons_male;
DROP FUNCTION IF EXISTS fnc_persons_female;


CREATE FUNCTION fnc_persons(pgender varchar DEFAULT 'female')
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar)
AS $$
    select *
    from person
    WHERE gender = pgender;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();