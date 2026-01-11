-- COUNT
SELECT COUNT(*) AS total
FROM books;

SELECT COUNT(*)
FROM books
WHERE title LIKE '%the%';

-- GROUP BY
SELECT author_lname,
    COUNT(*) AS book_written
FROM books
GROUP BY author_lname
ORDER BY book_written DESC;

SELECT released_year,
    COUNT(*)
FROM books
GROUP BY released_year;

-- Subquery
SELECT title,
    pages
FROM books
WHERE pages = (
        SELECT MAX(pages)
        FROM books
    );

-- SUM
SELECT SUM(pages)
FROM books;

SELECT author_lname,
    SUM(pages) AS pages
FROM books
GROUP BY author_lname,
    author_fname;

-- AVG
SELECT released_year,
    AVG(pages)
FROM books
GROUP BY released_year;

SELECT author_lname,
    AVG(released_year)
FROM books
GROUP BY author_lname;