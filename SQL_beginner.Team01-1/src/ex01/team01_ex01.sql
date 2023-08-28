WITH Curr AS (SELECT c.id, c.name FROM currency c GROUP BY c.id, c.name),

t1 AS ((SELECT u.name,
u.lastname,
c.name AS currency_name,
money,
(SELECT rate_to_usd
FROM currency c
WHERE b.currency_id = c.id AND c.updated < b.updated
ORDER BY c.updated DESC
LIMIT 1) AS rate_to_usd
FROM balance b
JOIN Curr AS c ON c.id = b.currency_id
LEFT JOIN "user" u ON u.id = b.user_id)),

t2 AS ((SELECT u.name,
u.lastname,
c.name AS currency_name,
money,
(SELECT rate_to_usd
FROM currency c
WHERE b.currency_id = c.id AND c.updated > b.updated
ORDER BY c.updated
LIMIT 1) AS rate_to_usd
FROM balance b
JOIN Curr AS c ON c.id = b.currency_id
LEFT JOIN "user" u ON u.id = b.user_id)),

t AS (SELECT t1.name, t1.lastname, t1.currency_name, t1.money, COALESCE(t1.rate_to_usd, t2.rate_to_usd) AS rate_to_usd
FROM t1
JOIN t2 ON t1.currency_name = t2.currency_name AND t1.money = t2.money)

SELECT DISTINCT COALESCE(name, 'not defined') AS name, COALESCE(lastname, 'not defined') AS lastname, currency_name,
money * rate_to_usd AS currency_in_usd
FROM t
ORDER BY 1 DESC, 2, 3;