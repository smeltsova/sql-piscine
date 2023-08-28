SET enable_seqscan =off;

CREATE INDEX idx_person_name ON person(UPPER(name));

EXPLAIN ANALYZE
SELECT name
FROM person
WHERE UPPER(name) = 'KATE';

