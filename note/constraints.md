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

The value should be unique and the PRIMARY KEY has been established, this time, you can use **UNIQUE** to limit the column constraint.

**UNIQUE** can not be **NULL**.

```sql
CREATE TABLE contacts (
    name VARCHAR(100),
    phone VARCHAR(15) UNIQUE
);
```

---

## CHECK

Define the condition for the specific column.

If the value doesn't pass the CHECK, the whole row will be invalid and deny to insert.

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

You can define a CONSTRAINT yourself, it is like to add a CHECK after the column name.

As defining a function in any other programming languages, you have to **name** this CONSTRAINT.

```sql
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK(age >= 0)
);
```

---

## Multiple columns CONSTRAINT

You can make a CONSTRAINT for multiple columns, it is like a combination.

```sql
CREATE TABLE companies (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);
-- Name and address combine together to be UNIQUE, but either of them should be UNIQUE

CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL,
    CONSTRAINT make_money CHECK(sale_price > purchase_price)
);
```
