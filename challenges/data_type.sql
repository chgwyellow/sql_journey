-- Q1
-- What's a good use case for CHAR
-- Fixed-length data

-- Q2
-- Fill In The Blanks
-- CREATE TABLE inventory (
-- item_name ____________,
-- price ________________,
-- quantity _____________
-- );
-- (price is always < 1,000,000)
CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8, 2),
    quantity INT
);

-- Q3
-- What's the difference between DATETIME and TIMESTAMP?
-- DATETIME storages larger date range than TIMESTAMP, but it also cost more storage capacity.

-- Q4
-- Print Out The Current Time
SELECT CURTIME();

-- Q5
-- Print Out The Current Date (but not time)
SELECT CURDATE();

-- Q6
-- Print Out The Current Day Of The Week (The Number)
SELECT DAYOFWEEK(CURDATE());

-- Q7
-- Print Out The Current Day Of The Week (The Day Name)
SELECT DAYNAME(NOW());

-- Q8
Print out the current day and time using this format: mm/dd/yyyy
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

-- Q9
-- Print out the current day and time using this format: January 2nd at 3:15 / April 1st at 10:18
SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

-- Q10
-- Create a tweets table that stores: The Tweet content A Username Time it was created
CREATE TABLE tweets (
    tweet_content VARCHAR(500),
    username VARCHAR(50),
    CREATED_AT TIMESTAMP DEFAULT NOW()
);