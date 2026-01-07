# Notes

## What is Database?

- A structured set of computerized data with an accessible interface.
- MySQL is actually not a database, it's a **database management system** which interacts with the database.

## Database and Tables

### Database

- A database contains lots of tables, so you can say a database is just **a bunch of tables**.
- The keyword "**USE**" can specify the database we would like to use, and "**SELECT**" can tell us which database we are using now.
- In GUI, double click the database can switch database easily.

### Table

- The true heart of SQL!
- It's a collection of related data held in a **structured** format within a database.

#### Data Type

- **INT**
  - Stands for integer, it's a whole number.
- **Varchar**
  - Stands for **Variable-length** string.
  - Use single quotes **'This is a string'** instead of double quotes **"Do not use this"**. If there is a single quote within the string, use the escape character **( \ )**, e.g. **'Domino\ 's pizza'**.
  - We can use double quotes within a string, e.g. **'She says "ha ha ha"'**.

## Insert Data

- Choose the columns you would like to add data to first.
- Remember to keep the correct data type.
- After defining the columns we would like to insert data into, we can insert multiple rows with several VALUES statements.
- NULL is not a number, not even equal to zero.
- Columns that are not specified will have a NULL value when inserting data.

---

## Constraints

- We can add constraints to limit the column conditions.

### NOT NULL

- **NOT NULL** forces the inserted data to not be an empty value (cannot be NULL).

### DEFAULT

- **DEFAULT** will add a default value for empty data.
- **DEFAULT** cannot replace **NOT NULL** completely, because we can still set **NULL** manually.

### PRIMARY KEY

- Prevents duplicate data from occurring.
- Usually used in the id column.
- A primary key must be unique and not null.

### AUTO INCREMENT

- Usually used as a companion to Primary Key.
- It will increase automatically starting from 1.
- With AUTO_INCREMENT, we don't need to assign the id or Primary Key value manually.

---

## CRUD

- It was made of four parts, create, read, update, and delete individually.

### CREATE

- **INSERT INTO** statement.

### READ

- **SELECT** statement is the basic read method.
- '**\***' is a sign which means **give me all columns**.
- Provides the specific column name to retrieve related data.

### UPDATE

- **UPDATE ... SET ...** pair.
- Add colon to separate the values you would like to change.
- If there is no **WHERE** statement, this update will change all values in the column.
- Before updating the value, remembering **SELECTING** the data you gonna change to confirm the real data.

### DELETE

- 

#### WHERE

- It provides a condition to **filter** the particular data out.
- **WHERE is not only limited with SELECT**.
- The column in WHERE statement **doesn't have to** be selected in SELECT statement.

#### Aliases

- Can rename a column in the **SELECT** statement.
- It won't change the original column name.
