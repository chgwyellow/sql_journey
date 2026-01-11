# DATE & TIME

CURDATE() retrieves the current date.
CURTIME() takes the current time.
NOW() returns the current timestamp.

In MySQL, DATETIME and TIMESTAMP are similar, the primary difference is the storage capacity.

TIMESTAMP is smaller than DATETIME because it only store the datetime from **1970-01-01 00:00:00** to **2038-01-19 03:14:07 UTC**.

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

Shows the day of the month for **date**.

You can use **DAY()** to have the same effect.

```sql
SELECT birthdate, DAY(birthdate) FROM people;
```

---

### DAYOFWEEK

Shows the day in a week for **date**.

1 = Sunday, 2 = Monday, and so on.

```sql
SELECT birthdate, DAYOFWEEK(birthdate) FROM people;
```

--

### DAYOFYEAR

Shows the day of the year for **date**.

```sql
SELECT birthdate, DAYOFYEAR(birthdate) FROM people;
```

---

### MONTHNAME

It gives the actual name of month.

```sql
SELECT birthdate, MONTHNAME(birthdate) FROM people;
```

### DATE_FORMAT

This function allow you to format the date with arguments.

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

It returns the hour of time.

```sql
SELECT birthtime, HOUR(birthtime) FROM people;
```

---

### MINUTE

It returns the minute of time.

```sql
SELECT birthtime, MINUTE(birthtime) FROM people;
```

---

### SECOND

It returns the second of time.

```sql
SELECT birthtime, SECOND(birthtime) FROM people;
```

---

## DATE MATH Function

### DATEDIFF

It calculates first day subtract to second day.

Moreover, it only counts the date value and ignore the time attributes.

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

Add or Subtract the particular date with an interval, and the interval can be date or time unit.

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

>**Note:** Actually, there are many time math function as well. Such as TIMEDIFF, ADD_TIME, SUB_TIME, and etc. Besides, you can also use **plus(+)** and **minus(-)** sign to calculate the date and time.
