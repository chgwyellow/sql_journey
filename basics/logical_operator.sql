-- NOT EQUAL
SELECT title,
    released_year
FROM books
WHERE released_year != 2017;

-- NOT LIKE
SELECT title
FROM books
WHERE title NOT LIKE '% %';