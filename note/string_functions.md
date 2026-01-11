# String Functions

## CONCAT

Stands for concatenate, which combines strings or text together.

```sql
SELECT CONCAT(author_fname, '!!!') FROM books;
```

**Result:**

```text
| CONCAT(author_fname, '!!!') |
|-----------------------------|
| Jhumpa!!!                   |
| Neil!!!                     |
```

> **Note**: If the argument is **NULL**, the final answer will be **NULL**.

---

## CONCAT_WS

The first argument is a separator that will join the remaining values together.

```sql
SELECT CONCAT_WS('!', 'hey', 'hi', 'lol') as 'test';
```

**Result:**

```text
| test       |
|------------|
| hey!hi!lol |
```

> **Note**: If an argument is **NULL**, it will be skipped. However, the separator itself cannot be **NULL**.

---

## SUBSTRING

Extracts a portion of a string and returns it.

In SQL, string positions start at **1** (not 0 like in many programming languages).

Without the length argument, it will extract from the start position to the end of the string.

You can use a negative number to count backward from the end of the string.

```sql
-- formula
SUBSTRING('string', <start_position>, <length>);
SUBSTR('string', <start_position>, <length>); -- they are the same!

--- example
SELECT SUBSTRING('Hello World', 1, 4);
```

**Result:**

```text
| SUBSTRING('Hello World', 1, 4) |
|--------------------------------|
| Hell                           |
```

---

## REPLACE

Replaces all occurrences of a substring with another string.

```sql
REPLACE('string', from_str, to_str);
SELECT REPLACE('Hello World!', 'H', 'h');
```

**Result:**

```text
| SELECT REPLACE('Hello World!', 'H', 'h') |
|------------------------------------------|
| hello World!                             |
```

---

## REVERSE

Reverses the entire string.

If you pass **NULL**, the result will be **NULL**.

```sql
REVERSE('string');
SELECT REVERSE('Hello World!');
```

**Result:**

```text
| SELECT REVERSE('Hello World!') |
|--------------------------------|
| !dlroW olleH                   |
```

---

## CHAR_LENGTH

Returns the number of characters in a string.

> **Note**: **LENGTH** also returns string length, but measures in bytes instead of characters.

```sql
CHAR_LENGTH('string');
SELECT CHAR_LENGTH('Hey!');
```

**Result:**

```text
| SELECT CHAR_LENGTH('Hey!') |
|----------------------------|
| 4                          |
```

---

## UPPER & LOWER

Converts the string to all uppercase or lowercase.

```sql
UPPER('string');
SELECT UPPER('xddd');
```

**Result:**

```text
| SELECT UPPER('xddd') |
|----------------------|
| XDDD                 |
```

```sql
LOWER('string');
SELECT LOWER('OH NO!');
```

**Result:**

```text
| SELECT LOWER('OH NO!') |
|------------------------|
| oh no!                 |
```

---

## INSERT

This is a **function**, not a statement!

It has slight differences from the **REPLACE** function.

```sql
INSERT('original_string', start_pos, replaced_char_amount, 'insert_string');
SELECT INSERT('Hello World!', 6, 0, 'OMG');
```

**Result:**

```text
| SELECT INSERT('Hello World!', 6, 0, 'OMG') |
|--------------------------------------------|
| HelloOMG World!                            |
```

## LEFT & RIGHT

Returns the leftmost or rightmost portion of a string.

```sql
LEFT('string', number_char);
SELECT LEFT('Welcome to my house', 5);
```

**Result:**

```text
| SELECT LEFT('Welcome to my house', 5) |
|---------------------------------------|
| Welco                                 |
```

```sql
RIGHT('string', number_char);
SELECT RIGHT('Welcome to my house', 3);
```

**Result:**

```text
| SELECT RIGHT('Welcome to my house', 3) |
|----------------------------------------|
| use                                    |
```

## REPEAT

Repeats a string a specified number of times.

```sql
REPEAT('string', repeat_time);
SELECT REPEAT('lol!', 3);
```

**Result:**

```text
| SELECT REPEAT('lol!', 3) |
|--------------------------|
| lol!lol!lol!             |
```

## TRIM

Removes leading and trailing spaces, but preserves spaces between characters.

It can also remove specific text from the **leading**, **both**, or **trailing** positions.

```sql
TRIM('string');
SELECT TRIM('  Boston is a beautiful city   ');
```

**Result:**

```text
| SELECT TRIM('  Boston is a beautiful city   ') |
|------------------------------------------------|
| Boston is a beautiful city                     |
```

```sql
TRIM(<[LEADING, BOTH, TRAILING]> 'text' FROM 'ori_string' )
SELECT TRIM(LEADING 'xxx' FROM 'xxxyyyzzzxxx');
```

**Result:**

```text
| SELECT TRIM(LEADING 'xxx' FROM 'xxxyyyzzzxxx') |
|------------------------------------------------|
| yyyzzzxxx                                      |
```
