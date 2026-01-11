# Logical Operators

In the real world, there are many condition combinations, and the same applies to programming.

Logical operators allow you to combine multiple conditions and make comparisons.

> **NOTE:** When comparing date types, use CAST() to convert the data to the corresponding type.

## NOT EQUAL

`!=` is the operator for **NOT EQUAL**.

It filters out unwanted data.

```sql
SELECT title, released_year FROM books WHERE released_year != 2017;
```

> **NOTE:** Technically, `=` and `!=` are **COMPARISON** operators rather than logical operators.

---

## NOT LIKE

Returns the opposite of the LIKE condition.

```sql
SELECT title FROM books WHERE title NOT LIKE '% %';
```

---

## GREATER THAN

`>` is the operator for **GREATER THAN**.

It does not include the value itself (exclusive).

```sql
SELECT * FROM books WHERE released_year > '2000';
```

You can use `>` to produce a **True** or **False** result, where 1 equals True and 0 equals False.

```sql
SELECT 80 > 100; -- 0
```

---

## LESS THAN

`<` is the operator for **LESS THAN**.

It's the opposite of **GREATER THAN**.

```sql
SELECT * FROM books WHERE released_year < '1995';
```

> **NOTE:** You can combine `=` with `<` and `>` to create `<=` and `>=`.

---

## AND

Combines multiple conditions together.

Returns results only when **all** conditions are True.

```sql
SELECT title, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2000;
```

---

## OR

Combines multiple conditions together like **AND**, but returns results when **at least one** condition is True.

```sql
SELECT title, released_year FROM books WHERE author_lname = 'David' OR released_year > 2000;
```

---

## BETWEEN

Selects values within a specified range (inclusive).

```sql
BETWEEN X AND Y
SELECT title, released_year FROM books WHERE released_year BETWEEN 2005 AND 2025;
```

> **NOTE:** You can also use **NOT BETWEEN X AND Y** to exclude a range.

---

## IN

Selects values that match any value in a specified set, eliminating the need for multiple **OR** clauses.

You can also use **NOT IN** to exclude values.

```sql
<NOT> IN(value1, value2, ...)
SELECT title, released_year FROM books WHERE author_lname IN ('David', 'Carver', 'Lahiri');
```

---

## CASE

This concept is like a decision tree.

The **CASE** statement contains multiple **WHEN...THEN** clauses, similar to if-else statements in other programming languages.

```sql
CASE...END
SELECT title, released_year,
CASE 
    WHEN released_year >= 2000 THEN 'modern lit' 
    ELSE '20th century lit'
END AS 'genre'
FROM books;
```

```sql
SELECT title, stock_quantity,
CASE
    WHEN stock_quantity BETWEEN 0 AND 50 THEN '*',
    WHEN stock_quantity BETWEEN 51 AND 100 THEN '**',
    ELSE '***'
END AS stock
FROM books;
```

---

## IS NULL

When filtering for NULL values, do not use `=`!

**IS** is the keyword used to find **NULL** values.

```sql
SELECT title, stock_quantity FROM books WHERE author_lname IS NULL;
```
