CREATE SEQUENCE seq_person_discounts
AS bigint
START WITH 1
INCREMENT BY 1;

SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts));

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

----check
INSERT INTO  person_discounts(person_id, pizzeria_id)
VALUES (1, 4);