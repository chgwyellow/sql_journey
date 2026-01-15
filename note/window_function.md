# WINDOW FUNCTION

Window functions perform aggregate operations on groups of rows, but they produce a result FOR EACH ROW.

Compared with `GROUP BY` which only show a row of the result for every group, window functions allow every row of result appearing and show the aggregation column as well.

Windows like groups of data that is somehow grouped together in some way.

## OVER

The `OVER()` clause constructs a window.

When it's empty, the window will include all records.

```sql
SELECT emp_no, department, salary, AVG(salary) OVER()
FROM employees e ;
```

---

## PARTITION BY

Inside of the `OVER()`, use `PARTITION BY` to form rows into groups of row.

The concept of `PARTITION BY` is to cut the large window to many piece of small windows.

It's a little bit like using the `GROUP BY` clause in `OVER()`.

```sql
SELECT
 emp_no,
 department,
 salary,
 SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
 SUM(salary) OVER() AS total_payroll
FROM employees e ;
```

---

## ORDER BY

Inside of the `OVER()`, use `ORDER BY` to re-order rows within each window.

In this case, it can make `rolling`.

```sql
SELECT
 emp_no,
 department,
 salary,
 SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_payroll,
 SUM(salary) OVER(PARTITION BY department) AS dept_payroll
FROM employees e ;
```

## RANK

Returns the `rank` of the current row within its partition, with gaps.

Any same values in the window are same will be considered the `same` rank.

It skips the duplicates rank.

```sql
SELECT
 emp_no,
 department,
 salary,
 RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees e ;
```

---

## DENSE RANK

DENSE RANK doesn't like RANK, it won't skip any rank.

```sql
SELECT
 emp_no,
 department,
 salary,
 ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
 RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
 RANK() OVER(ORDER BY salary DESC) AS overall_rank,
 DENSE_RANK() OVER(ORDER BY salary DESC) AS overall_dense_rank
FROM employees e 
ORDER BY overall_rank;
```

---

## ROW NUMBER

Return the `number of the current row` within its partition.

The number range from 1 to the number of partition rows.

```sql
SELECT
 emp_no,
 department,
 salary,
 ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_row_number,
 RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank,
 RANK() OVER(ORDER BY salary DESC) AS overall_salary_rank
FROM employees e 
ORDER BY department;
```

---

## NTILE

Designate a number `n` to separate the window data to `n` pieces.

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
