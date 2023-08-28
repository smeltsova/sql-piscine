WITH users_volume AS
        (SELECT u.id,
            COALESCE(u.name, 'not defined') AS name,
            COALESCE(u.lastname, 'not defined') AS lastname,
            b.type,
            SUM(b.money) AS volume,
            b.currency_id
        FROM "user" AS u
        FULL JOIN balance b on u.id = b.user_id
        GROUP BY u.id, b.type, b.currency_id),

    users_currency_volume AS
        (SELECT uv.name, uv.lastname, uv.type, uv.volume,
                COALESCE(c.name, 'not defined') AS currency_name,
                COALESCE(
                    (SELECT rate_to_usd
                     FROM currency
                     WHERE id = uv.currency_id
                     ORDER BY updated DESC
                     LIMIT 1),
                    1) AS last_rate_to_usd
        FROM users_volume AS uv
        LEFT JOIN currency c on uv.currency_id = c.id
        GROUP BY uv.name, uv.lastname, uv.type, uv.volume, uv.currency_id, c.name)

SELECT *, last_rate_to_usd * volume AS total_volume_in_usd
FROM users_currency_volume
ORDER BY 1 DESC, 2, 3;
