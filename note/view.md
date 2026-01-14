# View

A **view** is a `virtual table` that stores a query and produces a result set when invoked.

The main advantage of using views is **reusability** - you can execute complex queries without writing them repeatedly.

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

## Updatable Views

**Are views updatable?**

Only a small portion of views are updatable. A view becomes **non-updatable** if it contains:

1. Aggregation functions (SUM, COUNT, AVG, etc.)
2. DISTINCT
3. GROUP BY
4. HAVING
5. UNION or UNION ALL
6. Subquery in the SELECT list
7. Certain types of JOINs
8. Reference to non-updatable view in the FROM clause
9. Subquery in the WHERE clause that refers to a table in the FROM clause
10. Only literal values (no table references)
11. ALGORITHM = TEMPTABLE

> **Important:** When you UPDATE, INSERT, or DELETE data through a view, it **actually modifies the underlying table**.

---

## Modifying Views

What if you need to update a view because the underlying table structure has changed?

Use the `CREATE OR REPLACE` syntax:

```sql
CREATE OR REPLACE VIEW <view_name> AS <queries>;
```

This allows you to modify an existing view without dropping it first.

---

## Dropping Views

To remove a view from the database:

```sql
Drop VIEW <view_name>;
```

---

# SQL Mode

MySQL has various server settings (SQL modes) that control how it handles queries and data validation.

## Viewing SQL Modes

Check current SQL mode settings:

```sql
SELECT @@GLOBAL.sql_mode;   -- Server-wide setting
SELECT @@SESSION.sql_mode;  -- Current session setting
```

**Example Result:**

```text
ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
```

If you haven't modified the session mode, both `GLOBAL` and `SESSION` modes should be **identical**.

## Modifying SQL Modes

> **⚠️ Warning:** Do not modify SQL modes without proper understanding and authorization, as it may affect data integrity and application behavior.

If you need to change the SQL mode:

```sql
-- Change globally (affects all new connections)
SET GLOBAL sql_mode = 'modes';

-- Change for current session only
SET SESSION sql_mode = 'modes';
```

**Example:**

```sql
-- Remove ONLY_FULL_GROUP_BY mode from current session
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
```

**Tip:** Copy the current mode result, remove unwanted modes, and paste the modified list into the command.
