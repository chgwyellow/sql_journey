# Joins & Relationships

## Relationships

1. **One-to-One** Relationship

    A customer has one row of customer details.

    This is `not very common` in real-world applications.

2. **One-to-Many** Relationship

    A customer can have multiple orders.

    This has the same concept as a many-to-one relationship.

    Many reviews can point to the same book.

    This is the `most frequently seen` relationship in real-world applications.

    In this situation, we use `FOREIGN KEY` to relate tables.

    We usually choose the `PRIMARY KEY` from table A to be the FOREIGN KEY in table B.

    The main purpose of setting a FOREIGN KEY is to maintain data integrity.

    A FOREIGN KEY will prevent inserting data if the referenced value doesn't exist in the parent table. This is called a `FOREIGN KEY CONSTRAINT`.

    The data type of the 2 related columns must be the **same**.

    ```sql
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    ```

3. **Many-to-Many** Relationship

    A book can have many authors, and an author can write many books.

    This is `relatively common` in real-world applications.

---

## Joins

When joining tables, the first table appears on the left, and subsequent tables follow to the right.

### CROSS JOIN

Joins tables together without any conditions, creating a Cartesian product.

This is `rarely used` in real-world applications and is often **meaningless**.

```sql
SELECT * FROM customers, orders;
```

---

### INNER JOIN

Selects only the **overlapping** rows between tables where the join condition is met.

Specifies which columns to use for joining tables.

It is the `default` join type.

```sql
SELECT * FROM customers c
JOIN orders o
    ON c.id = o.customer_id;
```

---

### LEFT JOIN

Selects all data from the `left table`. If the right table doesn't have corresponding data, it will show **NULL**.

```sql
SELECT c.first_name,
    c.last_name,
    o.order_date,
    o.amount
FROM customers c
    LEFT JOIN orders o ON c.id = o.customer_id;
-- This way, you can find which customers don't have any orders.
```

---

### RIGHT JOIN

Similar to LEFT JOIN, but selects all data from the `right table` instead.

```sql
SELECT c.first_name,
    c.last_name,
    o.order_date,
    o.amount
FROM customers c
    RIGHT JOIN orders o ON c.id = o.customer_id;
```

---

## ON DELETE CASCADE

Automatically deletes related rows in child tables when a row in the parent table is deleted.

This maintains referential integrity by preventing orphaned records.

**Syntax:**

```sql
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);
```

**Example:**

When you delete a customer, all their orders will be automatically deleted:

```sql
-- Delete a customer
DELETE FROM customers WHERE id = 1;
-- All orders with customer_id = 1 are automatically deleted
```

**Alternative Options:**

- **ON DELETE SET NULL** - Sets the foreign key to NULL when parent is deleted
- **ON DELETE RESTRICT** - Prevents deletion if child records exist (default)
- **ON DELETE NO ACTION** - Similar to RESTRICT

> **Warning**: Use CASCADE carefully as it can delete large amounts of data unintentionally. Always ensure this behavior aligns with your business logic.

---
