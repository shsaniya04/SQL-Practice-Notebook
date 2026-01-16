CREATE DATABASE employee;

USE employee;

CREATE TABLE employyeInfo (
	empId INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT NOT NULL
);

INSERT INTO employyeInfo 
VALUES
(1, "Adam", 25000),
(2, "Bob", 30000),
(3, "Casey", 4000);

SELECT * FROM employyeInfo;

CREATE TABLE emp (
	id INT ,
    salary INT DEFAULT 25000
);

INSERT INTO emp (id) VALUES (1245);

SELECT * FROM emp;

create table city (


