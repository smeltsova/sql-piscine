WITH date(day) AS
        (SELECT d::date
         FROM generate_series(date '2022-01-01', date '2022-01-10', '1 day')  AS gs(d)),
    visit AS
        (SELECT *
         FROM person_visits AS ps
         WHERE ps.person_id = 1 OR ps.person_id = 2)
SELECT date.day AS missing_date
FROM date
LEFT JOIN  visit
ON date.day = visit.visit_date
WHERE visit.person_id IS NULL
ORDER BY missing_date;