-- Not null
CREATE TABLE cats2 (name VARCHAR(50) NOT NULL, age INT NOT NULL);
INSERT INTO cats2 (name)
VALUES ('Bilbo');

-- Error
INSERT INTO cats2 (name, age)
VALUES ('Bilbo', 7);

-- Correct
-- Default
CREATE TABLE cats3 (
    name VARCHAR(50) DEFAULT unnamed,
    age INT DEFAULT 99
);

INSERT INTO cats3 (name)
VALUES ('poppy');

-- age is 99
-- Not null and default
CREATE TABLE cats4 (
    name VARCHAR(50) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 99
);
INSERT INTO cats4 (name, age)
VALUES (NULL, NULL);

-- Error
-- Primary Key
CREATE TABLE unique_cats (
    cat_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO unique_cats (cat_id, name, age)
VALUES (1, 'Yoshi', 1);

INSERT INTO unique_cats (cat_id, name, age)
VALUES (1, 'Bingo', 5);

-- Duplicate Error
-- Primary key column doesn't need NOT NULL
CREATE TABLE unique_cats (
    cat_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

-- AUTO INCREMENT
CREATE TABLE unique_cats (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT
);

-- UNIQUE
CREATE TABLE contacts (
    name VARCHAR(100),
    phone VARCHAR(15) UNIQUE
);

--CHECK
CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK(age > 0)
);

CREATE TABLE palindrome (
    word VARCHAR(100) CHECK(REVERSE(word) = word)
);