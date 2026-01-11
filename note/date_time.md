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


