# Join & Relationship

## Relationship

1. **One-to-one** relationship

    A customer has a row of customer details.

    It's `not really common` in real world.

2. **One-to-many** relationship

    A customer can have multiple orders.

    It has the same concept to many-to-one relationship.

    Many reviews can point to the same book.

    The `most frequently to see` in real world.

    In this situation, we will use `FOREIGN KEY` to relate tables.

    We usually choose the `PRIMARY KEY` in table A to be the FOREIGN KEY in table B.

    The main purpose of setting FOREIGN KEY is to limit the data correction.

    FOREIGN KEY will end up inserting the data if the FOREIGN KEY doesn't have the existing value, which is called `FOREIGN KEY CONSTRAINT`.

    The data type of the 2 related columns must be the **same**.

    ```sql
    FOREIGN KEY (customer_id) REFERENCES customers(id)
    ```

3. **Many-to-many** relationship

    Book can have many authors and vice versa.

    It is `relatively common`.
