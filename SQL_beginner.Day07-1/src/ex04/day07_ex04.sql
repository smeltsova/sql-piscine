WITH vc AS
    (SELECT person_id, COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY person_id
    HAVING COUNT(*) > 3)
SELECT p.name, vc.count_of_visits
FROM vc
JOIN person AS p ON vc.person_id = p.id;
