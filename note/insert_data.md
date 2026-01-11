# Insert Data

**Key Points**

1. Choose the columns you want to add data to first
2. Remember to keep the correct data type
3. You can insert multiple rows with several VALUES statements
4. `NULL` is not a number, not even equal to zero
5. Unspecified columns will have a `NULL` value

</td>
</tr>
</table>

**Syntax Example:**

```sql
-- Single insert
INSERT INTO cats (name, age)
VALUES ('Yoshi', 1);

-- Multiple insert
INSERT INTO cats (name, age)
VALUES 
  ('Yoshi', 1),
  ('Keith', 5),
  ('Joggy', 3);
```
