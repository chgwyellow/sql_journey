-- Reference data/book_data.sql

-- CONCAT
SELECT CONCAT(author_fname, '!!!') FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) as 'full_name' FROM books;

-- CONCAT_WS
SELECT CONCAT_WS('!', 'hey', 'hi', 'lol') as 'test';

SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books;

-- SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4); -- Hell

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