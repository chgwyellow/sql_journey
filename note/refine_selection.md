# Refine Selection

This section covers techniques to enhance query results, such as limiting rows and eliminating duplicates.

## DISTINCT

Eliminates duplicate values from the result set.

```sql
SELECT DISTINCT <columns> FROM <table>;
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;
SELECT DISTINCT author_fname, author_lname FROM books; -- As the same above
```

## ORDER BY

Sorts results by one or more columns in ascending or descending order. **Ascending** is the default.

You can also use column aliases in the ORDER BY clause.

```sql
SELECT book_id, released_year FROM books ORDER BY released_year;
SELECT title, released_year FROM books ORDER BY released_year DESC;
```

---

## LIMIT

Controls the number of results returned.

It is commonly used with sorted data.

The default starting row is index 0. LIMIT can accept two arguments: starting position and number of rows.

```sql
LIMIT <start_row>, <return_number_of_rows>
SELECT book_id FROM books LIMIT 5;
SELECT book_id FROM books LIMIT 2, 5; -- start from 3rd row
```

---

## LIKE

Enables pattern matching for partial string searches. For example, if you're searching for an author but only remember part of the name (like 'David', 'Dave', or 'Dae'), you can use LIKE with wildcards.

'**%**' is a wildcard that represents zero or more characters of any type.

'**_**' is a placeholder that represents exactly one character.

What if you need to search for literal **%** or **_** characters?

Use the escape character (**\\**) to search for literal wildcards.

```sql
SELECT author_fname FROM books WHERE author_fname LIKE '%da%';
SELECT * FROM books WHERE title LIKE '%\\%%';
```
