-- Reference data/book_data.sql

-- CONCAT
SELECT CONCAT(author_fname, '!!!')
FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) as 'full_name'
FROM books;

-- CONCAT_WS
SELECT CONCAT_WS('!', 'hey', 'hi', 'lol') as 'test';

SELECT CONCAT_WS('-', title, author_fname, author_lname)
FROM books;

-- SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);
-- Hell

-- Combine string methods
SELECT CONCAT(
        SUBSTR(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;

SELECT CONCAT(
        SUBSTR(author_fname, 1, 1),
        '.',
        SUBSTR(author_lname, 1, 1),
        '.'
    ) AS author_initial
FROM books;

-- REPLACE
SELECT REPLACE('Hello World!', 'Hell', '@#$%');

SELECT REPLACE(title, ' ', '-')
FROM books;

-- REVERSE
SELECT REVERSE('Hello World!');

SELECT REVERSE(author_fname)
FROM books;
-- CHAR_LENGTH
SELECT CHAR_LENGTH('Hey!');

SELECT title,
    CHAR_LENGTH(title) as length
FROM books;

-- UPPER
SELECT UPPER(title) FROM books;

-- LOWER
SELECT LOWER(author_fname) FROM books;

-- INSERT
SELECT INSERT('Hello World!', 6, 0, 'OMG');

-- LEFT
SELECT LEFT('Welcome to my house', 5);

-- RIGHT
SELECT RIGHT('Welcome to my house', 3);

-- REPEAT
SELECT REPEAT('lol!', 3);

-- TRIM
SELECT TRIM('  Boston is a beautiful city   ');

SELECT TRIM(LEADING 'xxx' FROM 'xxxyyyzzzxxx');