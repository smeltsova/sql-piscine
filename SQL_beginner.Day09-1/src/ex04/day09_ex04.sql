
CREATE FUNCTION fnc_persons_male()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar)
AS $$
    select *
    from person
    WHERE gender = 'male';
$$ LANGUAGE SQL;

CREATE FUNCTION fnc_persons_female()
RETURNS TABLE(id bigint, name varchar, age integer, gender varchar, address varchar)
AS $$
    select *
    from person
    WHERE gender = 'female';
$$ LANGUAGE SQL;


SELECT *
FROM fnc_persons_male();

SELECT *
FROM fnc_persons_female();