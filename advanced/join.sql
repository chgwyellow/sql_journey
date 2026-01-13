-- CROSS JOIN
SELECT *
FROM customers,
    orders;

-- INNER JOIN
SELECT c.first_name,
    c.last_name,
    o.order_date,
    o.amount
FROM customers c
    JOIN orders o ON c.id = o.customer_id;

SELECT c.first_name,
    c.last_name,
    SUM(o.amount) AS total
FROM customers c
    JOIN orders o ON c.id = o.customer_id
GROUP BY c.first_name,
    c.last_name
ORDER BY total;

-- LEFT JOIN
SELECT c.first_name,
    c.last_name,
    o.order_date,
    o.amount
FROM customers c
    LEFT JOIN orders o ON c.id = o.customer_id;

SELECT c.first_name,
    c.last_name,
    IFNULL(SUM(o.amount), 0) AS total
FROM customers c
    LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.first_name,
    c.last_name;

-- RIGHT JOIN
SELECT c.first_name,
    c.last_name,
    o.order_date,
    o.amount
FROM customers c
    RIGHT JOIN orders o ON c.id = o.customer_id;

