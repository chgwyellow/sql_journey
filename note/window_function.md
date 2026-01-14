# WINDOW FUNCTION

Window functions perform aggregate operations on groups of rows, but they produce a result FOR EACH ROW.

Compared with `GROUP BY` which only show a row of the result for every group, window functions allow every row of result appearing and show the aggregation column as well.

Windows like groups of data that is somehow grouped together in some way.

## OVER

The OVER() clause constructs a window.

When it's empty, the window will include all records.

```sql
SELECT emp_no, department, salary, AVG(salary) OVER()
FROM employees e ;
```

