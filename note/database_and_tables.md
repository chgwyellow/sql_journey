# Database and Tables

## Database

<table>
<tr>
<td width="50%">

**Key Concepts**

- A database contains multiple tables
- Think of it as **a bunch of tables** grouped together
- Each database serves a specific application or purpose

</td>
<td width="50%">

**Common Commands**

```sql
-- Switch database
USE database_name;

-- Check current database
SELECT DATABASE();
```

</td>
</tr>
</table>

> **GUI Tip**: In DBeaver or other SQL clients, double-click a database to switch to it easily!

## Table

**The true heart of SQL!**

A table is a collection of related data held in a **structured** format within a database.

### Data Types

**String**

| Type | Description | Example |
|------|-------------|---------|
| **CHAR(n)** | Fixed-length string | `'CA'`, `'NY'` |
| **VARCHAR(n)** | Variable-length string | `'Hello World'`, `'SQL'` |

If you insert a value whose length exceeds the limit, MySQL will raise an error.

**Numerical**

| Type | Description | Example |
|------|-------------|---------|
| **INT** | Integer - whole numbers | `42`, `1000`, `-5` |
| **TINYINT** | Integer - range from -128 to 127 | Suitable for small numbers |
| **DECIMAL(m,n)** | Decimal numbers with high precision but uses more storage | `19.99`, `100.50` |
| **FLOAT** | Less precise than DECIMAL, 4 bytes storage with ~7 digits precision | `20.7384963` |
| **DOUBLE** | Similar to FLOAT, 8 bytes storage with ~15 digits precision | `193.1249672063` |

For integers, **INT** is usually the best choice.

For **DECIMAL(m,n)**: `m` represents the total number of digits, and `n` represents the number of digits after the decimal point.

**Choosing between DECIMAL and FLOAT/DOUBLE**: Use DECIMAL for exact precision (e.g., financial data), and FLOAT/DOUBLE for approximate values where performance matters.

**Date**

| Type | Description | Example |
|------|-------------|---------|
| **DATE** | Date values (YYYY-MM-DD) | `'2026-01-07'` |
| **TIME** | Time values (HH:MM:SS) | `'17:32:46'` |
| **DATETIME** | Date and Time values (YYYY-MM-DD HH:MM:SS) | `'2026-10-21 06:25:53'` |

**String Handling Tips**

> ⚠️ **Important**: Use single quotes `'text'` for strings in SQL, not double quotes!

```sql
-- ✅ Correct
SELECT * FROM users WHERE name = 'John';

-- ❌ Avoid
SELECT * FROM users WHERE name = "John";

-- Escape single quotes with backslash
INSERT INTO restaurants (name) VALUES ('Domino\'s Pizza');

-- Double quotes inside strings are fine
INSERT INTO quotes (text) VALUES ('She said "Hello!"');
```

---

### ALTER TABLE

Modifies the structure of an existing table.

> **Note**: When adding a column with **NOT NULL** constraint but no **DEFAULT** value, existing rows will be filled with **empty string** for text columns and **0** for numeric columns.

#### ADD COLUMN

Adds new columns to an existing table.

```sql
ALTER TABLE <table_name>
ADD COLUMN <column_name> <data_type>;
ALTER TABLE companies
ADD COLUMN city VARCHAR(25);
ALTER TABLE companies
ADD COLUMN phone VARCHAR(15) NOT NULL;
```

#### DROP COLUMN

Removes a column from an existing table.

```sql
ALTER TABLE <table_name>
DROP COLUMN <column_name>;
ALTER TABLE companies
DROP COLUMN city;
```

#### RENAME

Renames a table or column.

```sql
-- RENAME TABLE
RENAME TABLE <old_table> TO <new_table>;
RENAME TABLE companies TO suppliers;
```

```sql
-- RENAME COLUMN
ALTER TABLE <table_name>
RENAME COLUMN <old_col> TO <new_col>;
ALTER TABLE suppliers
RENAME COLUMN phone TO cellphone;
```

#### MODIFY

Changes a column's data type or attributes.

> **Warning**: Converting data types (e.g., from string to numeric or vice versa) can cause data loss or unexpected results.

```sql
ALTER TABLE <table_name>
MODIFY <col> <data_type>;
ALTER TABLE suppliers
MODIFY name VARCHAR(150);
```

**CHANGE** - Renames a column and optionally changes its data type.

```sql
ALTER TABLE <table_name>
CHANGE <old_col> <new_col> <data_type>;
ALTER TABLE suppliers
CHANGE name company_name VARCHAR(255);
```

#### ALTER CONSTRAINTS

Adds or removes constraints from a table.

```sql
-- Add constraint
ALTER TABLE <table_name>
ADD CONSTRAINT <constraint_name> CHECK(expr);
ALTER TABLE house
ADD CONSTRAINT positive_price CHECK(purchase_price >= 0);
```

Drop constraints from table.

```sql
-- Drop constraint
ALTER TABLE <table_name>
DROP CONSTRAINT <constraint_name>;
ALTER TABLE house
DROP CONSTRAINT positive_price;
```
