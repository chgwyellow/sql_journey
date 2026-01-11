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
SELECT title,
    released_year
FROM books
WHERE author_lname = 'David'
    OR released_year > 2000;

-- BETWEEN
SELECT title,
    released_year
FROM books
WHERE released_year BETWEEN 2005 AND 2025;

-- IN
SELECT title,
    released_year
FROM books
WHERE author_lname in ('David', 'Carver', 'Lahiri');

-- CASE
SELECT title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'modern lit'
        ELSE '20th century lit'
    END AS 'genre'
FROM books;

SELECT title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*',
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**',
        ELSE '***'
    END AS stock
FROM books;

-- IS NULL
SELECT title,
    stock_quantity
FROM books
WHERE author_lname is NULL;