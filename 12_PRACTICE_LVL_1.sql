CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
	emp_id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    dept_id INT,
    salary INT
);

INSERT INTO employees 
VALUES
(1,	"Asha Singh", 24, 1, 35000),
(2,	"Rohan Mehta", 28, 2, 2000),
(3,	"Meera Jain", 22, 1, 30000),
(4,	"Vikram Rao", 30, 3, 50000),
(5,	"Neha Patil", 26, 2, 38000);

CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO departments 
VALUES
(1, "HR"),
(2, "Finance"),
(3, "IT");

CREATE TABLE projects (
	project_id INT PRIMARY KEY,
    project_name VARCHAR(20),
    dept_id INT,
    budget INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO projects
VALUES
(101,	"Website Revamp",	3,	200000),
(102,	"Recruitment Drive",	1,	50000),
(103,	"Audit Work",	2,	120000);

CREATE TABLE attendance (
	id INT PRIMARY KEY,
	emp_id INT,
    date DATE,
    status VARCHAR(10),
    CONSTRAINT status_check CHECK (status IN ("Presnt", "Absent"))
);

SHOW DATABASES;

SHOW TABLES;

DESCRIBE employees;

INSERT INTO employees 
VALUES 
(6, "Rose Owens", 24, 2, 45000),
(7, "Dizney Rudolph", 26, 2, 56000);

UPDATE employees
SET salary = 32000
WHERE emp_id = 2;

SELECT * FROM employees;

INSERT INTO departments
VALUE
(4, "Marketing");

SELECT * FROM departments;

INSERT INTO projects
VALUE
(104,	"SQL Project",	4,	210000);

SELECT * FROM projects;

SELECT name, salary FROM employees;

SELECT * FROM departments;

SELECT name, salary 
FROM employees
WHERE salary > 35000;

SELECT * 
FROM employees
WHERE dept_id = 1;

SELECT * 
FROM employees
WHERE age < 26;

SELECT *
FROM employees
WHERE dept_id IN (2,3);

SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 45000;

SELECT *
FROM employees
WHERE name LIKE "R%";

SELECT *
FROM employees
LIMIT 3;

SELECT * 
FROM employees
ORDER BY salary DESC
LIMIT 2;

SELECT *
FROM employees
ORDER BY salary ASC;

SELECT *
FROM employees
ORDER BY age DESC;
USE company_db;

SELECT * 
FROM employees;

SELECT SUM(salary)
FROM employees;

SELECT AVG(age)
FROM employees;

SELECT count(*)
FROM employees
WHERE dept_id = 2;

SELECT dept_id, SUM(salary) 
FROM employees
GROUP BY dept_id;

SELECT dept_id, count(*) 
FROM employees
GROUP BY dept_id;

SELECT dept_id, sum(salary)
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 60000;

UPDATE employees
SET salary = 48000
WHERE emp_id = 4;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET dept_id = 4
WHERE name = "Dizney Rudolph";

DELETE 
FROM employees
WHERE emp_id = 2;

DELETE 
FROM projects
WHERE budget < 60000;

SELECT *
FROM projects;

ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id);

-- --FOREIGN KEY ERROR

INSERT INTO employees VALUES (10, 'Test User', 23, 4, 20000);

ALTER TABLE employees
DROP FOREIGN KEY fk_dept;

ALTER TABLE employees
ADD CONSTRAINT fk_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

DELETE 
FROM departments 
WHERE dept_id = 1;

ALTER TABLE employees
ADD COLUMN email VARCHAR(30);

ALTER TABLE employees
MODIFY salary BIGINT; 

ALTER TABLE employees
CHANGE COLUMN age emp_age INT;

TRUNCATE TABLE attendance;

SELECT e.name, d.dept_name 
FROM employees as e
JOIN departments as d
ON e.dept_id = d.dept_id;

SELECT p.project_name, d.dept_name 
FROM projects as p
JOIN departments as d
ON p.dept_id = d.dept_id;

SELECT d.dept_name, p.project_name
FROM departments as d
LEFT JOIN projects as p
ON d.dept_id = p.dept_id;

SELECT dept_name as name
FROM departments 
UNION 
SELECT project_name
FROM projects;

SELECT dept_name AS name
FROM departments
UNION
SELECT project_name
FROM projects;

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT name 
FROM employees
WHERE dept_id IN (SELECT dept_id FROM projects WHERE budget > 100000);

CREATE VIEW emp_details
AS SELECT e.name, d.dept_name, e.salary
FROM employees as e
JOIN departments as d
ON e.dept_id = d.dept_id; 

SELECT * 
FROM emp_details;

-- DROP VIEW emp_details;
