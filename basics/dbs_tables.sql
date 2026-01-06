-- show databases
SHOW DATABASES;

--  Create database
CREATE DATABASE < name >;
CREATE DATABASE soap_store;

--  Drop database
DROP DATABASE < name >;
DROP DATABASE soap_store;

-- Change database
USE < database_name >;
USE soap_store;

-- Check the database been used
SELECT DATABASE();

-- Create table
CREATE TABLE <table_name> (column_name datatype, column_name datatype);
CREATE TABLE cats(name VARCHAR(100), age INT);

-- Look over all tables
SHOW TABLES;

-- Look detail of a table
SHOW COLUMNS FROM <table_name>;
DESC <table_name>;
SHOW COLUMNS FROM dogs;
DESC cats;

-- Delete table
DROP TABLE <table_name>;
DROP TABLE cats;

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