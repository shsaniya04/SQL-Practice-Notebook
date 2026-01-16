CREATE DATABASE joins;

USE joins;

CREATE TABLE employees (
	id INT,
    name VARCHAR(20),
    dept_id INT
);

INSERT INTO employees VALUES
(1, 'Amit', 10),
(2, 'Sonia', 20),
(3, 'Rahul', 10),
(4, 'Meera', NULL),
(5, 'Vishal', 30);

SELECT * FROM employees;

CREATE TABLE department (
	dept_id INT,
    dept_name VARCHAR(20)
);

INSERT INTO department VALUES
(10, 'HR'),
(20, 'Finance'),
(40, 'Marketing');

SELECT * FROM department;

SELECT *
FROM employees as a
INNER JOIN department as b
ON a.dept_id = b.dept_id;

SELECT *
FROM employees as a
LEFT JOIN department as b
ON a.dept_id = b.dept_id;

SELECT *
FROM employees as a
RIGHT JOIN department as b
ON a.dept_id = b.dept_id;

SELECT *
FROM employees as a
LEFT JOIN department as b
ON a.dept_id = b.dept_id
UNION
SELECT *
FROM employees as a
RIGHT JOIN department as b
ON a.dept_id = b.dept_id;

SELECT * 
FROM employees as a
LEFT JOIN department as b
ON a.dept_id = b.dept_id
WHERE a.dept_id IS NULL;

SELECT * 
FROM employees as a
RIGHT JOIN department as b
ON a.dept_id = b.dept_id
WHERE a.id IS NULL;

SELECT * 
FROM employees as a
JOIN department as b
ON a.dept_id = b.dept_id;