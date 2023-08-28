--Session #1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Session #2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Session #1
BEGIN;
--Session #2
BEGIN;
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
--Session #2
COMMIT;
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #1
COMMIT;
--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';