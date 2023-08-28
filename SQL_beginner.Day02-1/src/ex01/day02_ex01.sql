SELECT d::date AS missing_date
FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day') AS gs(d)
LEFT JOIN (SELECT *
           FROM person_visits AS ps
           WHERE ps.person_id = 1 OR ps.person_id = 2
           ) AS s
ON gs.d::date = s.visit_date
WHERE s.person_id IS NULL
ORDER BY missing_date;