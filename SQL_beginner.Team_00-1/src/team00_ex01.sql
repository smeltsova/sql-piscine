WITH final_tours AS
(SELECT t.sum + nodes.cost AS total_cost,
       '{' || tour || ',' || point2 || '}' AS tour
FROM v_tours_all_cities AS t
JOIN nodes ON t.last_point = nodes.point1
WHERE nodes.point2 = 'a')
SELECT *
FROM final_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM final_tours)

UNION ALL

SELECT *
FROM final_tours
WHERE total_cost = (SELECT MAX(total_cost) FROM final_tours)
ORDER BY total_cost, tour;