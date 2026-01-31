CREATE TABLE people (
    name VARCHAR(100),
    birthdate Date,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES (
        'Yoshi',
        '2025-03-29',
        '11:37:21',
        '2025-03-29 11:37:21'
    ),
    (
        'Aily',
        '2021-07-19',
        '12:40:59',
        '2021-07-19 12:40:59'
    ),
    (
        'Cony',
        '2003-01-26',
        '18:19:53',
        '2003-01-26 18:19:53'
    );

SELECT birthdate,
    DAY(birthdate)
FROM people;

SELECT birthdate,
    DAYOFWEEK(birthdate)
FROM people;

SELECT birthdate,
    DAYOFYEAR(birthdate)
FROM people;

SELECT birthdate,
    MONTHNAME(birthdate)
FROM people;

-- DATEDIFF
SELECT DATEDIFF(CURDATE(), '2025-12-21 04:23:14');

-- DATEADD
SELECT DATE_ADD(CURDATE(), interval 1 year);