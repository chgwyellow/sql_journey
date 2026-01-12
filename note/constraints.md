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

---

## UNIQUE

Ensures that all values in a column are unique. Use **UNIQUE** when you need uniqueness but the column is not the PRIMARY KEY.

> **Note**: Unlike PRIMARY KEY, a UNIQUE column **can** contain NULL values (and multiple NULLs are allowed in most databases).

```sql
CREATE TABLE contacts (
    name VARCHAR(100),
    phone VARCHAR(15) UNIQUE
);
```

---

## CHECK

Defines a condition that values in a column must satisfy.

If a value doesn't pass the CHECK constraint, the entire row insertion will be rejected.

```sql
CHECK(expr)
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK(age > 0)
);
CREATE TABLE palindromes (
    word VARCHAR(100) CHECK(REVERSE(word) = word)
);
```

---

## Named CONSTRAINT

You can give constraints custom names for easier identification and management.

Like defining a function in other programming languages, you must **name** the CONSTRAINT.

```sql
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK(age >= 0)
);
```

---

## Multiple Column Constraints

You can create constraints that apply to multiple columns together, creating a composite constraint.

```sql
CREATE TABLE companies (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);
-- The combination of name and address must be UNIQUE, but individually they don't need to be

CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT make_money CHECK(sale_price > purchase_price)
);
```
