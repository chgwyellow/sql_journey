# Database Trigger

SQL statements that are `AUTOMATICALLY RUN` when a specific table is changed.

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

| TRIGGER_TIME | TRIGGER_EVENT |
|--------------| --------------|
| BEFORE       | INSERT        |
| AFTER        | UPDATE        |
|              | DELETE        |

---

