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

