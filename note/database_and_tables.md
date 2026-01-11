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
