-- DISTINCT
SELECT DISTINCT author_lname
FROM books;

SELECT DISTINCT CONCAT(author_fname, ' ', author_lname)
FROM books;

SELECT DISTINCT author_fname,
    author_lname
FROM books;

-- ORDER BY
SELECT book_id,
    released_year
FROM books
ORDER BY released_year;

SELECT title,
    released_year
FROM books
ORDER BY released_year DESC;

SELECT author_fname,
    author_lname,
    released_year,
    pages
FROM books
ORDER BY released_year,
    pages;

