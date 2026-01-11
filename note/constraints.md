# Constraints

Constraints are rules applied to columns to limit what data can be stored.

## NOT NULL

```sql
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

- Forces the column to **always** have a value
- Cannot insert or update with `NULL`

## DEFAULT

```sql
CREATE TABLE products (
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
);
```

- Provides a default value when no value is specified
- ⚠️ **Note**: `DEFAULT` cannot replace `NOT NULL` completely - you can still manually set `NULL`

## PRIMARY KEY

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

## AUTO_INCREMENT

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100)
);
```

- Perfect companion to `PRIMARY KEY`
- Automatically increments starting from 1
- No need to manually assign ID values
