# CRUD Operations

| Operation | SQL Command |
| --------- | ------------- |
| **Create** | `INSERT INTO` |
| **Read** | `SELECT` |
| **Update** | `UPDATE ... SET` |
| **Delete** | `DELETE FROM` |

---

## CREATE

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

---

## READ

**Basic SELECT:**

```sql
-- Get all columns
SELECT * FROM cats;

-- Get specific columns
SELECT name, age FROM cats;
```

> The `*` symbol means **"give me all columns"**

---

## UPDATE

```sql
UPDATE table_name 
SET column1 = value1, column2 = value2
WHERE condition;
```

> ⚠️ **Warning**: If you omit the `WHERE` clause, **ALL rows** will be updated!

**Best Practice:**

```sql
-- 1. First, SELECT to verify what you're changing
SELECT * FROM cats WHERE name = 'Misty';

-- 2. Then UPDATE
UPDATE cats SET age = 14 WHERE name = 'Misty';

-- 3. Verify the change
SELECT * FROM cats WHERE name = 'Misty';
```

---

## DELETE

```sql
DELETE FROM table_name
WHERE condition;
```

> 🚨 **DANGER**: Without a `WHERE` clause, you'll delete **ALL rows**!

```sql
-- ✅ Safe - deletes specific rows
DELETE FROM cats WHERE age = 4;

-- ⚠️ DANGEROUS - deletes everything!
DELETE FROM cats;
```

**Important Notes:**

- Deleting all rows doesn't delete the table itself
- Use `DROP TABLE` to remove the entire table

---

## WHERE Clause

The `WHERE` clause filters data based on conditions.

```sql
SELECT * FROM cats WHERE age = 4;
UPDATE cats SET breed = 'Tabby' WHERE age > 5;
DELETE FROM cats WHERE name = 'Fluffy';
```

**Key Points:**

- Works with `SELECT`, `UPDATE`, and `DELETE`
- The column in `WHERE` doesn't have to be in the `SELECT` list
- You can use comparison operators: `=`, `>`, `<`, `>=`, `<=`, `!=`

---

## Aliases (AS)

Rename columns in your query results without changing the actual table.

```sql
SELECT cat_id AS id, name AS cat_name
FROM cats;
```

**Result:**

```text
| id | cat_name |
|----|----------|
| 1  | Yoshi    |
| 2  | Keith    |
```

> **Note**: This only changes the display name, not the actual column name in the database!
