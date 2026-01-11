# Logical Operator

There are many condition combination in the real world, so are they in the programming.

Logical operators can gather many conditions and make comparison.

## NOT EQUAL

**!=** is the sign for **NOT EQUAL**.

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
