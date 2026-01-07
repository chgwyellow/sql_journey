<div align="center">

# SQL Mastery Journey

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-00758F?style=flat-square&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![DBeaver](https://img.shields.io/badge/Tool-DBeaver-382923?style=flat-square&logo=dbeaver&logoColor=white)](https://dbeaver.io/)
![Status](https://img.shields.io/badge/Status-In%20Progress-blue?style=flat-square)
![Last Update](https://img.shields.io/badge/Updated-Jan%202026-green?style=flat-square)

**A comprehensive journey through SQL fundamentals and beyond**

*From basics to mastery - documenting every step of the SQL learning path*

</div>

---

## Learning Contents

- [SQL Mastery Journey](#sql-mastery-journey)
  - [Learning Contents](#learning-contents)
  - [About This Project](#about-this-project)
  - [Project Structure](#project-structure)
  - [Learning Notes](#learning-notes)
    - [What is Database?](#what-is-database)
    - [Database and Tables](#database-and-tables)
      - [Database](#database)
      - [Table](#table)
    - [Insert Data](#insert-data)
    - [Constraints](#constraints)
      - [NOT NULL](#not-null)
      - [DEFAULT](#default)
      - [PRIMARY KEY](#primary-key)
      - [AUTO\_INCREMENT](#auto_increment)
    - [CRUD Operations](#crud-operations)
      - [CREATE](#create)
      - [READ](#read)
      - [UPDATE](#update)
      - [DELETE](#delete)
      - [WHERE Clause](#where-clause)
      - [Aliases (AS)](#aliases-as)
    - [String Functions](#string-functions)
      - [CONCAT](#concat)
      - [CONCAT\_WS](#concat_ws)
      - [SUBSTRING](#substring)

---

## About This Project

This repository serves as my personal learning journal for mastering SQL. All queries are written and tested in **DBeaver** before being committed here for version control and future reference.

**Learning Approach**: Practice in DBeaver → Document here → Push to GitHub

---

## Project Structure

```
SQL_Mastery_Journey/
├── basics/          # Fundamental SQL syntax
├── intermediate/    # Advanced SQL techniques
├── advanced/        # Expert-level SQL topics
├── challenges/      # SQL challenges and exercises
└── README.md        # You are here!
```

---

## Learning Notes

### What is Database?

<table>
<tr>
<td>

**Definition**

- A structured set of computerized data with an accessible interface
- Organized collection of data that can be easily accessed, managed, and updated

</td>
</tr>
<tr>
<td>

**MySQL vs Database**

- MySQL is **NOT** a database itself
- MySQL is a **Database Management System (DBMS)** that interacts with databases
- Think of it as the tool that helps you manage your data

</td>
</tr>
</table>

---

### Database and Tables

#### Database

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

#### Table

**The true heart of SQL!**

A table is a collection of related data held in a **structured** format within a database.

**Data Types**

| Type | Description | Example |
|------|-------------|---------|
| **INT** | Integer - whole numbers | `42`, `1000`, `-5` |
| **VARCHAR(n)** | Variable-length string | `'Hello World'`, `'SQL'` |
| **DATE** | Date values | `'2026-01-07'` |
| **DECIMAL(m,n)** | Decimal numbers | `19.99`, `100.50` |

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

### Insert Data

<table>
<tr>
<td>

**Key Points**

1. Choose the columns you want to add data to first
2. Remember to keep the correct data type
3. You can insert multiple rows with several VALUES statements
4. `NULL` is not a number, not even equal to zero
5. Unspecified columns will have a `NULL` value

</td>
</tr>
</table>

**Syntax Example:**

```sql
-- Single insert
INSERT INTO cats (name, age)
VALUES ('Yoshi', 1);

-- Multiple insert
INSERT INTO cats (name, age)
VALUES 
  ('Yoshi', 1),
  ('Keith', 5),
  ('Joggy', 3);
```

---

### Constraints

Constraints are rules applied to columns to limit what data can be stored.

#### NOT NULL

```sql
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

- Forces the column to **always** have a value
- Cannot insert or update with `NULL`

#### DEFAULT

```sql
CREATE TABLE products (
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);
```

- Provides a default value when no value is specified
- ⚠️ **Note**: `DEFAULT` cannot replace `NOT NULL` completely - you can still manually set `NULL`

#### PRIMARY KEY

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

**Characteristics:**

- Must be **UNIQUE**
- Cannot be **NULL**
- Prevents duplicate data
- Usually used for ID columns

#### AUTO_INCREMENT

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100)
);
```

- Perfect companion to `PRIMARY KEY`
- Automatically increments starting from 1
- No need to manually assign ID values

---

### CRUD Operations

| Operation | SQL Command |
|-----------|-------------|
| **Create** | `INSERT INTO` |
| **Read** | `SELECT` |
| **Update** | `UPDATE ... SET` |
| **Delete** | `DELETE FROM` |

---

#### CREATE

```sql
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);
```

---

#### READ

**Basic SELECT:**

```sql
-- Get all columns
SELECT * FROM cats;

-- Get specific columns
SELECT name, age FROM cats;
```

> The `*` symbol means **"give me all columns"**

---

#### UPDATE

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

#### DELETE

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

#### WHERE Clause

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

#### Aliases (AS)

Rename columns in your query results without changing the actual table.

```sql
SELECT cat_id AS id, name AS cat_name
FROM cats;
```

**Result:**

```
| id | cat_name |
|----|----------|
| 1  | Yoshi    |
| 2  | Keith    |
```

> **Note**: This only changes the display name, not the actual column name in the database!

---

### String Functions

#### CONCAT

Stands for concatenate, combining the string or text.

```sql
SELECT CONCAT(author_fname, '!!!') FROM books;
```

**Result:**

```text
| CONCAT(author_fname, '!!!') |
|-----------------------------|
| Jhumpa!!!                   |
| Neil!!!                     |
```

> **Note**: If the argument is **NULL**, the final answer will be **NULL**.

---

#### CONCAT_WS

The first argument is a separator and it will smooch the rest values.

```sql
SELECT CONCAT_WS('!', 'hey', 'hi', 'lol') as 'test';
```

**Result:**

```text
| test       |
|------------|
| hey!hi!lol |
```

> **Note**: If the argument is **NULL**, the **NULL** argument will not be smooched. Moreover, the separator can not be **NULL**.

---

#### SUBSTRING

It takes a single larger string and returns a small portion of that string.
The first position in SQL is **1** instead of 0.

```sql
-- formula
SUBSTRING('string', <start_position>, <length>);

--- example
SELECT SUBSTRING('Hello World', 1, 4);
```

**Result:**

```text
| SUBSTRING('Hello World', 1, 4) |
|--------------------------------|
| Hell                           |
```
