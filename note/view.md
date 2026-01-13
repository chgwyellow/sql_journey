# View

It's a virtual table storing queries when invoked produce a result set.

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
