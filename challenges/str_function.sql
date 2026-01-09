/**
 Q1
 Reverse and Uppercase the following sentence
 "Why does my cat look at me with such hatred?"
 **/
SELECT REVERSE(
        UPPER('Why does my cat look at me with such hatred?')
    );

/**
 Q2
 SELECT
 REPLACE
 (
 CONCAT('I', ' ', 'like', ' ', 'cats'),
 ' ',
 '-'
 );
 What Does This Print Out?
 **/
-- I-like-cats

/**
 Q3
 Replace spaces in titles with '->'
 **/
SELECT REPLACE(title, ' ', '->') AS 'title'
FROM books;

/**
 Q4
 author_lname forwards | backwards
 **/
SELECT author_lname AS 'forwards',
    REVERSE(author_lname) AS 'backwards'
FROM books;

/**
 Q5
 full name in caps
 **/
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps'
FROM books;

/**
 Q6
 blurb
 **/
SELECT CONCAT(title, ' was released in ', released_year) AS 'blurb'
FROM books;

/**
 Q7
 title | character count
 **/
SELECT title,
    CHAR_LENGTH(title) AS 'character count'
FROM books;

/**
 Q8
 short title | author | quantity
 **/
SELECT CONCAT(LEFT(title, 10), '...') AS 'short_title',
    CONCAT(author_lname, ',', author_fname) AS 'author',
    CONCAT(stock_quantity, ' in stock') AS 'quantity'
FROM books;