SELECT address,
       ROUND(MAX(age) - MIN(age)::numeric/ MAX(age), 2) AS formula,
       ROUND(AVG(age), 2) AS average,
       (SELECT CASE
           WHEN MAX(age) - MIN(age)::numeric/ MAX(age) > AVG(age) THEN 'true'
           ELSE 'false'
           END) AS comparison
FROM person
GROUP BY address
ORDER BY 1;