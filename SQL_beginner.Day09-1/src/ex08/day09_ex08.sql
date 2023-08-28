CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE(fibonacci_numbers integer) AS $$
    WITH RECURSIVE fib(num1, num2) AS (
        VALUES (0, 1)

        UNION ALL

        SELECT num2, num1 + num2
        FROM fib
        WHERE num2 < pstop
    )
    SELECT num1 FROM fib
    $$ LANGUAGE SQL;

SELECT *
FROM fnc_fibonacci(100);
SELECT *
FROM fnc_fibonacci();