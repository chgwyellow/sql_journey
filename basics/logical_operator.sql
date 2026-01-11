-- NOT EQUAL
SELECT title,
    released_year
FROM books
WHERE released_year != 2017;

-- NOT LIKE
SELECT title
FROM books
WHERE title NOT LIKE '% %';

-- GREATER THAN
SELECT released_year
FROM books
WHERE released_year > '2000';

SELECT 80 > 100;

-- LESS THAN
SELECT * FROM books WHERE pages < 200;