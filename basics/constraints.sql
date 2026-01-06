-- Not null
CREATE TABLE cats2 (name VARCHAR(50) NOT NULL, age INT NOT NULL);
INSERT INTO cats2 (name) VALUES ('Bilbo'); -- Error
INSERT INTO cats2 (name, age) VALUES ('Bilbo', 7); -- Correct

-- Default
CREATE TABLE cats3 (name VARCHAR(50) DEFAULT unnamed, age INT DEFAULT 99);
INSERT INTO cats3 (name) VALUES ('poppy'); -- age is 99

-- Not null and default
CREATE TABLE cats4 (
    name VARCHAR(50) NOT NULL DEFAULT 'unnamed', 
    age INT NOT NULL DEFAULT 99
    );
INSERT INTO cats4 (name, age) VALUES (NULL, NULL); -- Error