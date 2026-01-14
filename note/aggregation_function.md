# Aggregation Function

## COUNT

Counts the number of rows in a table or column and returns the total.

**COUNT(*)** includes **NULL**, but COUNT particular column doesn't include **NULL**.

```sql
SELECT COUNT(*) AS total FROM books;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';
```

---

## GROUP BY

Groups identical data into single rows for aggregation.

You can group by multiple columns simultaneously.

```sql
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;
SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;
SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*) FROM books GROUP BY author;
```

---

## MIN & MAX

Returns the minimum and maximum values.

When selecting non-aggregated columns alongside aggregation functions, you must use **GROUP BY**.

```sql
SELECT author_lname, COUNT(*), MAX(pages) FROM books GROUP BY author_lname;
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;
```

---

## SUBQUERIES

A query nested within another query.

Subqueries commonly appear in **WHERE** and **FROM** clauses.

**Tip**: Write the inner query (in **WHERE** or **FROM**) first, then wrap it with the outer query.

```sql
SELECT title, pages
FROM books
WHERE pages = 
(SELECT MAX(pages) FROM books);
```

---

## SUM

Calculates the total sum of numeric values.

Using GROUP BY allows you to calculate sums for specific groups.

For string columns, MySQL will **implicitly** convert numeric strings to numbers. Pure text values are treated as **0**, and **NULL** values are skipped.

```sql
SELECT SUM(pages) FROM books;
SELECT author_lname, SUM(pages) AS pages FROM books GROUP BY author_lname, author_fname;
```

---

## AVG

Calculates the average value, which equals **sum / count**.

```sql
SELECT released_year, AVG(pages) FROM books GROUP BY released_year;
SELECT author_lname, AVG(released_year) FROM books GROUP BY author_lname;
```

---

## HAVING

Filters data **after** it has been grouped by aggregation functions.

**Key Difference**:

- **WHERE** filters rows **before** grouping
- **HAVING** filters groups **after** aggregation

```sql
SELECT 
    title, 
    AVG(rating),
    COUNT(rating) AS review_count
FROM full_reviews 
GROUP BY title HAVING COUNT(rating) > 1;
```

```sql
-- Example: Find authors with more than 3 books
SELECT author_lname, COUNT(*) AS book_count
FROM books
GROUP BY author_lname
HAVING COUNT(*) > 3;
```

---

## ROLLUP

Creates a summary row (super-aggregate) for grouped data, providing subtotals and grand totals.

The **ROLLUP** modifier generates additional rows showing aggregated values at different levels of grouping.

```sql
SELECT 
    title, AVG(rating)
FROM
    full_reviews
GROUP BY title WITH ROLLUP;
```

```sql
-- Example: Show total pages per author with grand total
SELECT 
    author_lname, 
    COUNT(*) AS books, 
    SUM(pages) AS total_pages
FROM books
GROUP BY author_lname WITH ROLLUP;
-- The last row will show NULL for author_lname and totals for all authors
```

**Note**: The ROLLUP row displays **NULL** for the grouped column(s) and shows the overall aggregate value.
