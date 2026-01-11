-- Q1
-- Evaluate the following...
-- SELECT 10 != 10; 
-- 0

-- SELECT 15 > 14 AND 99 - 5 <= 94;
-- 1

-- SELECT 1 IN (5,3) OR 9 BETWEEN 8 AND 10;
-- 1

-- Q2
-- Select All Books Written Before 1980 (non inclusive)
SELECT *
FROM books
WHERE released_year < 1980;

-- Q3
-- Select All Books Written By Eggers Or Chabon
SELECT *
FROM books
WHERE author_lname IN ('Eggers', 'Chabon');

-- Q4
-- Select All Books Written By Lahiri, Published after 2000
SELECT *
FROM books
WHERE author_lname = 'Lahiri'
    AND released_year > 2000;

-- Q5
-- Select All books with page counts between 100 and 200
SELECT *
FROM books
WHERE pages BETWEEN 100 AND 200;

-- Q6
-- Select all books where author_lname starts with a 'C' or an 'S''
SELECT *
FROM books
WHERE author_lname LIKE 'C%'
    OR author_lname LIKE 'S%';

-- Q7
-- If title contains 'stories' -> Short Stories
-- Just Kids and A Heartbreaking Work -> Memoir
-- Everything Else -> Novel
SELECT title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memior'
        ELSE 'Novel'
    END AS TYPE
FROM books;

-- Q8
-- author_fname | author_lname | COUNT
SELECT author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname,
    author_lname;