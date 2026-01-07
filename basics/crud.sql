-- Create
-- Insert into statement as we've learned before.

-- Read
SELECT * FROM cats; -- This will give you all columns in cats table

SELECT name FROM cats; -- This provides the name column data to you

SELECT age FROM cats;

SELECT name, age FROM cats;

-- WHERE
SELECT * FROM cats WHERE age=4; -- Filter the cats whose age is 4

SELECT name FROM cats WHERE age=4;

SELECT cat_id FROM cats;

SELECT name, breed FROM cats;

SELECT name, age  FROM cats WHERE breed = 'Tabby';

SELECT cat_id, age FROM cats WHERE cat_id = age;

SELECT * FROM cats WHERE cat_id = age;

-- Alias
SELECT cat_id AS id FROM cats;

-- Update
UPDATE <table> SET <column_name> = <value>, <column_name> = <value>;

UPDATE cats SET breed = 'Shorthair' WHERE breed = 'Tabby';

UPDATE cats SET age = 14 WHERE name = 'Misty';

UPDATE cats SET name = 'Jack' WHERE name = 'Jackson';

UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';

UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';

