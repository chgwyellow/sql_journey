# DATE & TIME

**CURDATE()** retrieves the current date.
**CURTIME()** retrieves the current time.
**NOW()** returns the current timestamp (date and time).

In MySQL, DATETIME and TIMESTAMP are similar; the primary difference is their storage capacity.

TIMESTAMP has a smaller range than DATETIME because it only stores datetime values from **1970-01-01 00:00:00** to **2038-01-19 03:14:07 UTC**.

```sql
INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES (
        'Raze',
        CURDATE(),
        CURTIME(),
        NOW()
    );
```

---

## DATE Functions

### DAYOFMONTH

Returns the day of the month for a given **date**.

You can also use **DAY()** for the same result.

```sql
SELECT birthdate, DAY(birthdate) FROM people;
```

---

### DAYOFWEEK

Returns the day of the week for a given **date**.

1 = Sunday, 2 = Monday, and so on.

```sql
SELECT birthdate, DAYOFWEEK(birthdate) FROM people;
```

---

### DAYOFYEAR

Returns the day of the year for a given **date**.

```sql
SELECT birthdate, DAYOFYEAR(birthdate) FROM people;
```

---

### MONTHNAME

Returns the name of the month.

```sql
SELECT birthdate, MONTHNAME(birthdate) FROM people;
```

### DATE_FORMAT

This function allows you to format dates with custom format strings.

```sql
DATE_FORMAT(date, format_string)
SELECT birthdate, DATE_FORMAT(birthdate, '%a, %b %D, %Y') FROM people;
```

**Result:**

```text
| birthdate  | DATE_FORMAT(birthdate, '%a, %b %D, %Y') |
|------------| ----------------------------------------|
| 2025-03-29 | Sat, Mar 29th, 2025                     |
```

---

## TIME Functions

### HOUR

Returns the hour component of a time value.

```sql
SELECT birthtime, HOUR(birthtime) FROM people;
```

---

### MINUTE

Returns the minute component of a time value.

```sql
SELECT birthtime, MINUTE(birthtime) FROM people;
```

---

### SECOND

Returns the second component of a time value.

```sql
SELECT birthtime, SECOND(birthtime) FROM people;
```

---

## DATE MATH Function

### DATEDIFF

Calculates the difference between two dates (expr1 - expr2).

It only considers the date portion and ignores the time component.

```sql
DATEDIFF(expr1, expr2)
SELECT DATEDIFF('2025-12-21 04:23:14', '2026-01-21');
```

**Result:**

```text
| SELECT DATEDIFF('2025-12-21 04:23:14', '2026-01-21') |
|------------------------------------------------------|
| -31                                                  |
```

---

### DATE_ADD & DATE_SUB

Adds or subtracts a specified time interval to/from a date. The interval can be in date or time units.

```sql
DATE_ADD(date, INTERVAL value addunit)
SELECT DATE_ADD(CURDATE(), interval 1 year);
```

**Result:**

```text
| SELECT DATE_ADD(CURDATE(), interval 1 year) |
|---------------------------------------------|
| 2027-01-11                                  |
```

---

> **Note:** There are many other time math functions available, such as TIMEDIFF, ADDTIME, SUBTIME, etc. You can also use the **plus (+)** and **minus (-)** operators to calculate dates and times.
