WITH q AS
    (SELECT person_id, COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY person_id
    ORDER BY 2 DESC, 1
    LIMIT 4)
SELECT p.name, q.count_of_visits
FROM q
JOIN person AS p ON q.person_id = p.id
ORDER BY
    count_of_visits DESC, -- ?
    name;
