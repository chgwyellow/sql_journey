# Logical Operator

There are many condition combination in the real world, so are they in the programming.

Logical operators can gather many conditions and make comparison.

>**NOTE:** When comparing the date type, using CAST() to convert the data to the corresponding type.

## NOT EQUAL

`!=` is the sign for **NOT EQUAL**.

It eliminates the unnecessary data.

```sql
SELECT title, released_year FROM books WHERE released_year != 2017;
```

>**NOTE:** Technically, `=` and `!=` are **COMPARISON** operators instead of logical operators.

---

## NOT LIKE

In short, returns the LIKE opposition.

```sql
SELECT title FROM books WHERE title NOT LIKE '% %';
```

---

## GREATER THAN

`>` is the sign of **GREATER THAN**.

It doesn't include the value itself.

```sql
SELECT * FROM books WHERE released_year > '2000';
```

We can use `>` to make **True** of **False** result, which 1 is equal to True and vice versa.

```sql
SELECT 80 > 100; -- 0
```

---

## LESS THAN

`<` is the sign of **LESS THAN**.

Apparently, it's another side of **GREAT THAN**.

```sql
SELECT * FROM books WHERE released_year < '1995';
```

>**NOTE:** You can combine `=` with `<` and `>` to `<=` and `>=`.

---

## AND

Put multiple conditions together.

Only the **all** of conditions are True would return the result.

```sql
SELECT title, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2000;
```

---

## OR

Put multiple conditions together as the **AND** can do, but **only one thing is True**, the whole thing is True.

```sql
SELECT title, released_year FROM books WHERE author_lname = 'David' OR released_year > 2000;
```

---

## BETWEEN

Choose a range of data.

```sql
BETWEEN X AND Y
SELECT title, released_year FROM books WHERE released_year BETWEEN 2005 AND 2025;
```

>**NOTE:** You can use **NOT** BETWEEN X AND Y as well.

---

## IN

Select some values in a set, so you don't have to write lots of **OR** clause.

You can use **NOT IN** as well.

```sql
<NOT> IN(sets)
SELECT title, released_year FROM books WHERE author_lname in ('David', 'Carver', 'Lahiri');
```

---

## CASE

This concept likes a decision tree.

In **CASE** statement, there are bunch of **WHEN...THEN** clause. They like the if statement in any other programming language.

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

When you would like to filter the NULL, do not use `=`!

**IS** is the key word to find **NULL**.

```sql
SELECT title, stock_quantity FROM books WHERE author_lname is NULL;
```
