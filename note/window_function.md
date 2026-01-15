# Window Function

## OVER

The `OVER()` clause constructs a window for performing calculations across a set of rows.

Window functions perform aggregate operations on groups of rows, but they produce a result **for each row**.

**Key Difference**: Unlike `GROUP BY` which returns only one row per group, window functions preserve all rows while adding aggregated columns.

When `OVER()` is empty, the window includes all records in the result set.

```sql
SELECT emp_no, department, salary, AVG(salary) OVER() AS avg_salary
FROM employees;
```

---

## PARTITION BY

Inside `OVER()`, use `PARTITION BY` to divide rows into groups (partitions).

The concept of `PARTITION BY` is to split the large window into multiple smaller windows.

It's similar to using `GROUP BY`, but without collapsing rows.

```sql
SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;
```

---

## ORDER BY

Inside `OVER()`, use `ORDER BY` to sort rows within each window.

This enables **rolling** or **cumulative** calculations.

```sql
SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_payroll,
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll
FROM employees;
```

---

## RANK

Returns the rank of the current row within its partition, **with gaps**.

Rows with identical values receive the same rank, and subsequent ranks are skipped.

**Example**: If two rows tie for rank 2, the next rank will be 4 (not 3).

```sql
SELECT
    emp_no,
    department,
    salary,
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees;
```

---

## DENSE_RANK

Similar to `RANK()`, but **without gaps** in the ranking sequence.

Rows with identical values receive the same rank, but the next rank continues sequentially.

**Example**: If two rows tie for rank 2, the next rank will be 3.

```sql
SELECT
    emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank
FROM employees
ORDER BY overall_rank;
```

---

## ROW_NUMBER

Returns the sequential number of the current row within its partition.

The numbering starts at 1 and increments by 1 for each row, regardless of duplicate values.

```sql
SELECT
    emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees
ORDER BY department;
```

---

## NTILE

Divides the rows in each partition into `n` approximately equal groups (buckets).

Returns the group number (1 to n) for each row.

```sql
SELECT
    emp_no,
    department,
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
    NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;
```

---

## FIRST_VALUE

Returns the first value in the current window frame.

**Related Function**: `NTH_VALUE(expr, n)` retrieves the nth value in the window.

```sql
SELECT
    emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) AS highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) AS highest_paid_overall
FROM employees;
```

---

## LEAD & LAG

Access data from subsequent or preceding rows within the same result set **without using a self-join**.

**LEAD(expr [, offset [, default]])**: Returns the value from a row that is `offset` rows **after** the current row.

**LAG(expr [, offset [, default]])**: Returns the value from a row that is `offset` rows **before** the current row.

- **expr**: The column or expression to retrieve
- **offset**: Number of rows to look ahead/behind (default is 1)
- **default**: Value to return if the offset goes beyond the window boundary (default is NULL)

**Use Cases**:

- Calculate differences between consecutive rows
- Compare current values with previous/next values
- Analyze trends and changes over time

```sql
SELECT
    emp_no,
    department,
    salary,
    LEAD(salary) OVER(ORDER BY salary DESC) AS next_lower_salary,
    LAG(salary) OVER(ORDER BY salary DESC) AS next_higher_salary,
    salary - LEAD(salary) OVER(ORDER BY salary DESC) AS salary_diff_to_next
FROM employees;
```

```sql
-- Example: Compare each employee's salary with the previous employee in their department
SELECT
    emp_no,
    department,
    salary,
    LAG(salary, 1, 0) OVER(PARTITION BY department ORDER BY salary DESC) AS prev_salary,
    salary - LAG(salary, 1, 0) OVER(PARTITION BY department ORDER BY salary DESC) AS salary_difference
FROM employees
ORDER BY department, salary DESC;
```
