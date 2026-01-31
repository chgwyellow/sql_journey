# CTE (Common Table Expression)

## What is CTE?

**CTE (Common Table Expression)** is a temporary named result set that exists only during the execution of a single SQL statement.

**Key Benefits:**

- ✅ Improves query readability and maintainability
- ✅ Can be referenced multiple times, avoiding repeated subqueries
- ✅ Supports recursive queries (Recursive CTE)
- ✅ Clear logic, easier to debug and modify

---

## Basic Syntax

```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```

**Syntax Breakdown:**

| Part | Description |
| --- | --- |
| `WITH` | CTE keyword |
| `cte_name` | Name of the CTE (custom) |
| `AS (...)` | CTE query definition |
| Final `SELECT` | Main query that uses the CTE |

---

## Basic Example

Assuming we have an `employees` table:

```sql
-- Calculate average salary per department
WITH dept_avg_salary AS (
    SELECT 
        department,
        AVG(salary) AS avg_salary,
        COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT 
    department,
    ROUND(avg_salary, 2) AS avg_salary,
    employee_count
FROM dept_avg_salary
ORDER BY avg_salary DESC;
```

---

## Multiple CTEs (Comma-Separated)

Define multiple CTEs in the same query, separated by **commas**.

```sql
WITH dept_avg AS (
    SELECT 
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_earners AS (
    SELECT 
        e.emp_no,
        e.department,
        e.salary,
        d.avg_salary
    FROM employees e
    JOIN dept_avg d ON e.department = d.department
    WHERE e.salary > d.avg_salary
)
SELECT 
    emp_no,
    department,
    salary,
    ROUND(avg_salary, 2) AS dept_avg_salary
FROM high_earners
ORDER BY department, salary DESC;
```

> 💡 **Tip**: The second CTE can reference the first CTE's results!

---

## CTE vs Subquery

### Using Subquery (Harder to Read)

```sql
SELECT 
    e.emp_no,
    e.department,
    e.salary,
    (SELECT AVG(salary) 
     FROM employees 
     WHERE department = e.department) AS dept_avg
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department = e.department
);
```

### Using CTE (Clearer)

```sql
WITH dept_avg AS (
    SELECT 
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT 
    e.emp_no,
    e.department,
    e.salary,
    ROUND(d.avg_salary, 2) AS dept_avg
FROM employees e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_salary;
```

**Comparison:**

| Feature | Subquery | CTE |
| --- | --- | --- |
| Readability | ❌ Poor, complex nested structure | ✅ Clear, layered logic |
| Reusability | ❌ Need to rewrite same query | ✅ Define once, reference multiple times |
| Debugging | ❌ Hard to test individually | ✅ Can execute and test separately |
| Recursive Queries | ❌ Not supported | ✅ Supported |

---

## CTE with Window Functions

```sql
-- Rank employees by salary within each department
WITH salary_ranking AS (
    SELECT 
        emp_no,
        department,
        salary,
        RANK() OVER (
            PARTITION BY department 
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
)
SELECT 
    emp_no,
    department,
    salary,
    dept_rank
FROM salary_ranking
WHERE dept_rank <= 3  -- Top 3 in each department
ORDER BY department, dept_rank;
```

---

## Recursive CTE

Recursive CTEs can reference themselves, commonly used for **hierarchical data** or **sequence generation**.

### Syntax Structure

```sql
WITH RECURSIVE cte_name AS (
    -- 1. Anchor Member (Base Case)
    SELECT ...
    
    UNION ALL
    
    -- 2. Recursive Member
    SELECT ...
    FROM cte_name
    WHERE termination_condition
)
SELECT * FROM cte_name;
```

### Example 1: Generate Number Sequence

```sql
WITH RECURSIVE number_sequence AS (
    -- Base: Start from 1
    SELECT 1 AS n
    
    UNION ALL
    
    -- Recursive: Add 1 each time, until 10
    SELECT n + 1
    FROM number_sequence
    WHERE n < 10
)
SELECT n FROM number_sequence;
```

**Result:** 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

### Example 2: Organization Hierarchy

Assuming `employees` table has `emp_id` and `manager_id`:

```sql
WITH RECURSIVE org_chart AS (
    -- Base: Find top manager (no supervisor)
    SELECT 
        emp_id,
        emp_name,
        manager_id,
        1 AS level
    FROM employees
    WHERE manager_id IS NULL
    
    UNION ALL
    
    -- Recursive: Find next level employees
    SELECT 
        e.emp_id,
        e.emp_name,
        e.manager_id,
        o.level + 1
    FROM employees e
    JOIN org_chart o ON e.manager_id = o.emp_id
)
SELECT * FROM org_chart
ORDER BY level, emp_id;
```

> ⚠️ **Warning**: Recursive CTEs must have a **termination condition** (`WHERE` clause), or they'll loop infinitely!

---

## Real-World Use Cases

### 1. Data Analysis - Salary Grade Statistics

```sql
WITH salary_grades AS (
    SELECT 
        emp_no,
        department,
        salary,
        CASE
            WHEN salary >= 100000 THEN 'High'
            WHEN salary >= 70000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_grade
    FROM employees
)
SELECT 
    department,
    salary_grade,
    COUNT(*) AS employee_count,
    ROUND(AVG(salary), 2) AS avg_salary
FROM salary_grades
GROUP BY department, salary_grade
ORDER BY department, salary_grade;
```

### 2. Find Missing Sequence Numbers

```sql
WITH RECURSIVE all_emp_numbers AS (
    SELECT MIN(emp_no) AS n FROM employees
    UNION ALL
    SELECT n + 1
    FROM all_emp_numbers
    WHERE n < (SELECT MAX(emp_no) FROM employees)
)
SELECT a.n AS missing_emp_no
FROM all_emp_numbers a
LEFT JOIN employees e ON a.n = e.emp_no
WHERE e.emp_no IS NULL;
```

---

## Key Takeaways

| Key Point | Description |
| --- | --- |
| **Syntax** | `WITH cte_name AS (query) SELECT * FROM cte_name` |
| **Multiple CTEs** | Separated by commas, later CTEs can reference earlier ones |
| **Scope** | Only valid within the current query (not permanent) |
| **Recursive CTE** | Requires `RECURSIVE` keyword and termination condition |
| **Advantages** | More readable, maintainable, and debuggable than subqueries |
| **Use Cases** | Complex query decomposition, hierarchical data, sequence generation |

---

## Best Practices

✅ **Use meaningful CTE names** - e.g., `dept_avg_salary` instead of `temp1`

✅ **Properly decompose complex queries** - Each CTE handles one logical step

✅ **Test CTEs individually first** - Ensure each CTE's logic is correct

✅ **Watch for termination conditions** - Avoid infinite loops in recursive CTEs

❌ **Avoid overuse** - Simple queries don't need CTEs

❌ **Don't do unnecessary calculations in CTEs** - Impacts performance
