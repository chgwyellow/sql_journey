# Database Trigger

SQL statements that are `AUTOMATICALLY RUN` when a specific table is changed.

Triggers are powerful database objects that can enforce business rules, maintain data integrity, and automate tasks.

However, they come with significant debugging challenges that developers must understand.

---

## Syntax

```sql
CREATE TRIGGER trigger_name
trigger_time trigger_event ON table_name FOR EACH ROW
BEGIN
...
END;
```

---

## Parameters

| TRIGGER_TIME | TRIGGER_EVENT | Description                              |
|--------------|---------------|------------------------------------------|
| BEFORE       | INSERT        | Executes before the INSERT operation     |
| BEFORE       | UPDATE        | Executes before the UPDATE operation     |
| BEFORE       | DELETE        | Executes before the DELETE operation     |
| AFTER        | INSERT        | Executes after the INSERT operation      |
| AFTER        | UPDATE        | Executes after the UPDATE operation      |
| AFTER        | DELETE        | Executes after the DELETE operation      |

### Special Keywords

- **`NEW`**: Represents the new row being inserted or updated (available in INSERT and UPDATE triggers)
- **`OLD`**: Represents the existing row being updated or deleted (available in UPDATE and DELETE triggers)

---

## Example

You can make a simple validation before inserting new data.

> **NOTE:** In CLI, you have to use DELIMITER to change the ; to any other sign temporarily, but in GUI such as DBeaver, eliminate it.

```sql
DELIMITER $$ -- Change the delimiter temporarily from ; to $$

CREATE TRIGGER must_be_adult
 BEFORE INSERT ON users FOR EACH ROW
 BEGIN
  IF NEW.age < 18 -- NEW is a placeholder here which is the inserted data
  THEN
   SIGNAL SQLSTATE '45000' -- Specific SQL Error code 
    SET MESSAGE_TEXT = 'Must be an adult!!!'; -- Error message
  END IF;
 END;
$$

DELIMITER ; -- Change the delimiter back to ;
```

### More Examples

**Automatic timestamp update:**

```sql
CREATE TRIGGER update_modified_time
 BEFORE UPDATE ON products FOR EACH ROW
 BEGIN
  SET NEW.updated_at = NOW();
 END;
```

**Audit logging:**

```sql
CREATE TRIGGER log_salary_changes
 AFTER UPDATE ON employees FOR EACH ROW
 BEGIN
  IF OLD.salary != NEW.salary THEN
   INSERT INTO salary_audit (employee_id, old_salary, new_salary, changed_at)
   VALUES (NEW.id, OLD.salary, NEW.salary, NOW());
  END IF;
 END;
```

---

## ⚠️ Debugging Challenges

Triggers are notoriously difficult to debug for several reasons:

### 1. **Hidden Execution (Invisible Logic)**

Triggers execute automatically and silently in the background. When you run a simple `INSERT`, `UPDATE`, or `DELETE` statement, you might not realize that triggers are firing behind the scenes.

**Problem:**

- Developers may not be aware that triggers exist on a table
- The actual behavior differs from what the SQL statement appears to do
- New team members may be confused by "mysterious" data changes

**Example:**

```sql
-- You execute this simple statement
INSERT INTO users (name, age) VALUES ('John', 25);

-- But unknown to you, 3 triggers might fire:
-- 1. BEFORE INSERT trigger validates age
-- 2. AFTER INSERT trigger creates audit log
-- 3. AFTER INSERT trigger sends notification to another system
```

### 2. **Error Tracking Difficulty**

When a trigger fails, error messages can be cryptic and don't always clearly indicate which trigger caused the problem.

**Problem:**

- Error messages may not specify the trigger name
- Stack traces are limited in SQL environments
- Multiple triggers on the same table can make it hard to identify the culprit

**Example:**

```sql
-- Error message might just say:
-- ERROR 1644 (45000): Must be an adult!!!
-- But which trigger threw this error? On which table?
```

### 3. **Cascading Effects (Chain Reactions)**

Triggers can call other triggers, creating complex chains of execution that are hard to trace.

**Problem:**

- Trigger A on Table X might modify Table Y
- This fires Trigger B on Table Y, which modifies Table Z
- This fires Trigger C on Table Z, and so on...
- Debugging requires understanding the entire chain

**Example:**

```sql
-- Deleting an order might trigger:
DELETE FROM orders WHERE id = 123;

-- Chain reaction:
-- 1. Trigger on orders → updates inventory
-- 2. Trigger on inventory → logs changes
-- 3. Trigger on logs → sends notification
-- 4. If any step fails, which one caused it?
```

### 4. **Performance Issues**

Triggers can cause unexpected performance degradation that's difficult to diagnose.

**Problem:**

- Slow queries might be caused by triggers, not the query itself
- Triggers execute for EACH ROW, so bulk operations can be severely impacted
- Performance profiling tools may not clearly show trigger execution time

**Example:**

```sql
-- This looks like a simple bulk update
UPDATE products SET price = price * 1.1 WHERE category = 'Electronics';

-- But if there's an AFTER UPDATE trigger that logs each change:
-- For 10,000 products, the trigger fires 10,000 times!
```

### 5. **Testing Complexity**

Unit testing becomes more complicated because triggers are tightly coupled to database operations.

**Problem:**

- Cannot easily test table operations in isolation
- Test data setup must account for all triggers
- Mocking or disabling triggers for testing is not straightforward

### 6. **Limited Debugging Tools**

Unlike application code, you cannot easily:

- Set breakpoints in triggers
- Step through trigger code line by line
- Inspect variable values during execution
- Use sophisticated debugging IDEs

---

## Common Use Cases

Despite the debugging challenges, triggers are valuable for:

1. **Data Validation**: Enforce complex business rules that cannot be handled by constraints
2. **Audit Trails**: Automatically log changes to sensitive data
3. **Derived Data**: Automatically update calculated or summary fields
4. **Referential Actions**: Implement custom cascade behaviors
5. **Notifications**: Trigger external actions when data changes

---

## Best Practices

To minimize debugging difficulties:

### ✅ DO

1. **Document All Triggers**: Maintain clear documentation of what triggers exist and what they do
2. **Use Descriptive Names**: Name triggers clearly (e.g., `trg_users_validate_age_before_insert`)
3. **Keep Triggers Simple**: Avoid complex logic; consider moving it to stored procedures
4. **Add Logging**: Include logging statements within triggers for debugging
5. **Use Consistent Error Codes**: Define a standard set of SQLSTATE codes for your application
6. **Limit Trigger Chains**: Avoid triggers that modify other tables with triggers
7. **Comment Your Code**: Explain WHY the trigger exists and what it does

### ❌ DON'T

1. **Don't Overuse Triggers**: Consider if the logic can be in application code instead
2. **Don't Hide Business Logic**: Critical business rules should be visible in application code
3. **Don't Create Long Chains**: Avoid trigger cascades that are hard to follow
4. **Don't Ignore Performance**: Always test triggers with realistic data volumes
5. **Don't Forget to Test**: Include trigger behavior in your test cases

---

## Manage Triggers

**Check all triggers:**

```sql
SHOW TRIGGERS;
```

**Check triggers for a specific table:**

```sql
SHOW TRIGGERS WHERE `Table` = 'users';
```

**View trigger definition:**

```sql
SHOW CREATE TRIGGER trigger_name;
```

**Delete trigger:**

```sql
DROP TRIGGER trigger_name;
```

**Disable/Enable triggers (MySQL 8.0+):**

```sql
-- MySQL doesn't support DISABLE/ENABLE directly
-- You must DROP and recreate the trigger
```

---

## Summary

Triggers are powerful but come with significant trade-offs:

| Advantages                                  | Disadvantages                              |
|---------------------------------------------|--------------------------------------------|
| ✅ Enforce data integrity automatically     | ❌ Hidden execution makes debugging hard   |
| ✅ Centralize business rules in database    | ❌ Performance impact can be unclear       |
| ✅ Ensure consistency across applications   | ❌ Difficult to test in isolation          |
| ✅ Automatic audit logging                  | ❌ Can create complex dependencies         |

**Key Takeaway**: Use triggers judiciously and always document them thoroughly. When debugging issues, always check if triggers might be involved!
