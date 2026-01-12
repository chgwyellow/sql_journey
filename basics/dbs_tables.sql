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

-- Alter table
ALTER TABLE companies
ADD COLUMN city VARCHAR(25);

ALTER TABLE companies
DROP COLUMN city;

RENAME TABLE companies TO suppliers;

ALTER TABLE <table_name>
RENAME COLUMN <old_col> TO <new_col>;
ALTER TABLE suppliers
RENAME COLUMN phone TO cellphone;

ALTER TABLE suppliers
MODIFY name VARCHAR(150);

ALTER TABLE suppliers
CHANGE name company_name VARCHAR(255);

ALTER TABLE house
ADD CONSTRAINT 'positive_price' CHECK(purchase_price >= 0);

ALTER TABLE house
DROP CONSTRAINT 'positive_price';