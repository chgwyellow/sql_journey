# Logical Operator

There are many condition combination in the real world, so are they in the programming.

Logical operators can gather many conditions and make comparison.

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

