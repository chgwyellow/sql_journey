-- Q1
-- Print the number of books in the database
SELECT COUNT(*)
FROM books;

-- Q2
-- Print out how many books were released in each year
SELECT released_year,
    Count(*)
FROM books
GROUP BY released_year;

-- Q3
-- Print out the total number of books in stock
SELECT SUM(stock_quantity)
FROM books;

-- Q4
-- Find the average released_year for each author
SELECT AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

-- Q5
-- Find the full name of the author who wrote the longest book
SELECT CONCAT(author_fname, ' ', author_lname) AS author,
    pages
FROM books
WHERE pages = (
    SELECT MAX(pages)
    FROM books
);

-- Q6
-- year | # books | avg pages
SELECT released_year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year
ORDER BY released_year;