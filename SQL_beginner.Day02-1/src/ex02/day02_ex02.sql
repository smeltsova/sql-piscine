SELECT COALESCE(p.name, '-') AS person_name,
       s.visit_date,
       COALESCE(pi.name, '-') AS pizzeria_name
FROM (SELECT *
      FROM person_visits AS pv
      WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-1-03') AS s
FULL JOIN person AS p ON s.person_id = p.id
FULL JOIN pizzeria AS pi ON s.pizzeria_id = pi.id
ORDER BY 1, 2, 3;