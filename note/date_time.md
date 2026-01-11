# DATE & TIME

CURDATE() retrieves the current date.
CURTIME() takes the current time.
NOW() returns the current timestamp.

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

---

## TIME Functions

