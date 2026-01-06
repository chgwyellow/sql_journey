# Notes

## What is Database?

- A structured set of computerized data with an accessible interface.
- MySQL is actually not a database, it's a **database management system** which interacts with the database.

## Database and Tables

### Database

- Database contents lots of tables, so you can say database is just **a bunch of tables**.
- The key word "**USE**" can specify the database we would like to use, and "**SELECT**" can tell us what is the database we are using now.
- In GUI, double click the database can switch database easily.

### Table

- The true heart of SQL!
- a collection of related data held in a **structured** format within a database.

#### Data Type

- **INT**
  - Stands for integer, it's a whole number.
- **Varchar**
  - Stands for **Variable-length** string.
  - Using single quote **'This is a string'** instead of double quote **"Do not use this"**, if there is a single quote between '', it's time to use escape character **( \ )**, e.g. **'Domino\ 's pizza'**.
  - We can use double quote in a string, e.g. **'She says "ha ha ha"'**.

## Insert Data

- Choose the columns you would like to add the data first.
- Remember keeping the data type.
- After defining the columns we would like to insert data, we can inject multiple data with several values.
- Null is not a number, even not equal to zero.
- The column which was not being specified will create the null value while inserting the data.

---

## Constraints

- We can add constraints to limit the column condition

### NOT NULL

- **NOT NULL** force the inserted data can not be an empty value.

### DEFAULT

- **DEFAULT** will add the default value for the empty data.
- **DEFAULT** can not replace to **NOT NULL** definitely, because we can set **NULL** manually.

### PRIMARY KEY

- Prevent the overlap data occur.
- Usually used in id column.
- Primary key must be unique and not null.

### AUTO INCREMENT

- Get used to be a partner with Primary Key.
- It will increase automatically from 1.
- With Auto Increment, we don't need to assign the id or Primary Key value manually.
- 