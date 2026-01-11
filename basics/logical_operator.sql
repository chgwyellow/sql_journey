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
SELECT *
FROM books
WHERE pages < 200;

-- AND
SELECT title,
    released_year
FROM books
WHERE author_lname = 'Eggers'
    AND released_year > 2000;

-- OR
SELECT title, released_year FROM books WHERE author_lname = 'David' OR released_year > 2000;

-- BETWEEN
SELECT title, released_year FROM books WHERE released_year BETWEEN 2005 AND 2025;