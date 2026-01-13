# View

It's a `virtual table` storing queries when invoked produce a result set.

The best advantage to use view is that you don't need to write the queries again and again and again.

```sql
CREATE VIEW <view_name> AS <queries>;

CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
```

You can treat view as a normal table in MySQL.

```sql
SELECT * FROM full_reviews;
```

**View is `updatable`?**

Well, there is only tiny portion of views are.

With the following queries, the view is no longer updatable:

1. Aggregation functions
2. DISTINCT
3. GROUP BY
4. HAVING
5. UNION
6. Subquery in the select list
7. Certain Joins
8. Reference to nonupdatable view in the FROM clause.
9. Subquery in the WHERE clause that refers to a table in the FROM clause.
10. Refers only to literal values.
11. ALGORITHM = TEMPTABLE

> **Note:** Updating, inserting, deleting to the view, it actually modify the original table.
