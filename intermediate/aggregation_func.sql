-- COUNT
SELECT COUNT(*) AS total
FROM books;

SELECT COUNT(*)
FROM books
WHERE title LIKE '%the%';

-- GROUP BY
SELECT
	author_lname,
	COUNT(*) AS book_written
FROM
	books
GROUP BY
	author_lname
ORDER BY
	book_written DESC;

SELECT
    released_year,
    COUNT(*)
FROM
    books
GROUP BY
    released_year;