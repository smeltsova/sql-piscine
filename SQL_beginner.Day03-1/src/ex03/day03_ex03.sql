WITH female_visit AS
    (SELECT pi.name AS pizzeria_name
     FROM person_visits AS pv
     JOIN person AS p ON pv.person_id = p.id
     JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
     WHERE p.gender = 'female'),
    male_visit AS (SELECT pi.name AS pizzeria_name
     FROM person_visits AS pv
     JOIN person AS p ON pv.person_id = p.id
     JOIN pizzeria AS pi ON pv.pizzeria_id = pi.id
     WHERE p.gender = 'male')
SELECT DISTINCT s.pizzeria_name
FROM (
    ((SELECT * FROM female_visit)
    EXCEPT ALL
    (SELECT * FROM male_visit))
        UNION ALL
    ((SELECT * FROM male_visit)
    EXCEPT ALL
    (SELECT * FROM female_visit))
) AS s
ORDER BY 1;