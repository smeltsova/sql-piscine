CREATE TABLE nodes (
	point1 CHAR,
	point2 CHAR,
	cost INT
);

INSERT INTO nodes (point1, point2, cost)
VALUES  ('a', 'b', 10), ('b', 'a', 10),
		('b', 'c', 35), ('c', 'b', 35),
		('b', 'd', 25), ('d', 'b', 25),
		('c', 'd', 30), ('d', 'c', 30),
		('c', 'a', 15), ('a', 'c', 15),
		('d', 'a', 20), ('a', 'd', 20);

CREATE VIEW v_tours_all_cities AS
WITH RECURSIVE recursive_tour AS (
	SELECT
	    point1::bpchar AS tour,
	    point1 AS last_point,
	    0 AS sum
	FROM nodes
	WHERE
	    point1 = 'a'

	UNION

	SELECT
	    l.tour || ',' || r.point2 AS tour,
	    r.point2 AS last_point,
	    l.sum + r.cost AS sum
	FROM nodes AS r
	join recursive_tour AS l
	on l.last_point = r.point1
	WHERE l.tour NOT LIKE '%' || r.point2 || '%'
)
SELECT * FROM recursive_tour
WHERE length(tour) = 7;

WITH final_tours AS
(SELECT t.sum + nodes.cost AS total_cost,
       '{' || tour || ',' || point2 || '}' AS tour
FROM v_tours_all_cities AS t
JOIN nodes ON t.last_point = nodes.point1
WHERE nodes.point2 = 'a')
SELECT *
FROM final_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM final_tours)
ORDER BY total_cost, tour;