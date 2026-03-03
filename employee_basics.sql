-- TABLE CREATION
CREATE TABLE employee(
	emp_id SERIAL PRIMARY KEY,
	fname VARCHAR(50) NOT NULL,
	lname VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	dept VARCHAR(20),
	salary DECIMAL(10,2) DEFAULT 30000.00,
	hiring_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- INSERTING VALUES
INSERT INTO employee (emp_id, fname, lname, email, dept, salary, hiring_date) VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000, '2020-04-20');

INSERT INTO employee (emp_id, fname, lname, email, dept, salary, hiring_date) 
VALUES
(11, 'Rohan', 'Mehra', 'rohan.mehra@example.com', 'IT', 58000, '2021-08-10'),
(12, 'Sneha', 'Iyer', 'sneha.iyer@example.com', 'HR', 49000, '2020-02-19'),
(13, 'Karan', 'Malhotra', 'karan.malhotra@example.com', 'Finance', 62000, '2019-09-05'),
(14, 'Pooja', 'Bansal', 'pooja.bansal@example.com', 'Marketing', 51000, '2022-01-12'),
(15, 'Manish', 'Tiwari', 'manish.tiwari@example.com', 'IT', 57000, '2018-11-23'),
(16, 'Aarti', 'Kulkarni', 'aarti.kulkarni@example.com', 'Finance', 64000, '2021-04-17'),
(17, 'Nikhil', 'Chopra', 'nikhil.chopra@example.com', 'Marketing', 53000, '2019-06-29'),
(18, 'Divya', 'Reddy', 'divya.reddy@example.com', 'HR', 48000, '2020-07-14'),
(19, 'Siddharth', 'Joshi', 'siddharth.joshi@example.com', 'IT', 60000, '2022-03-08'),
(20, 'Meera', 'Kapoor', 'meera.kapoor@example.com', 'Finance', 63000, '2018-05-21');

-- SELECT ALL
SELECT * FROM employee;

-- SELECT USING WHERE CLAUSE
SELECT * FROM employee
WHERE emp_id = 10;

SELECT * FROM employee
WHERE dept = 'IT';

-- OR OPERATOR
SELECT * FROM employee
WHERE dept = 'HR' OR dept = 'Marketing';

-- AND OPERATOR
SELECT * FROM employee
WHERE dept = 'IT' AND salary >= 50000.00;

SELECT * FROM employee
WHERE salary > 50000;

-- IN OPERATOR
SELECT * FROM employee
WHERE dept IN ('IT', 'HR', 'Marketing');

-- NOT IN OPERATOR
SELECT * FROM employee
WHERE dept NOT IN ('HR', 'Marketing');

-- BETWEEN OPERATOR
SELECT * FROM employee
WHERE salary BETWEEN 50000 AND 60000;

-- DISTINCT
SELECT DISTINCT dept FROM employee;

-- ORDER BY
SELECT * FROM employee
ORDER BY hiring_date DESC;

-- LIMIT
SELECT * FROM employee
LIMIT 3;

-- LIKE 
SELECT * FROM employee
WHERE fname LIKE 'A%';

SELECT * FROM employee
WHERE fname LIKE '%a';

SELECT * FROM employee
WHERE dept LIKE '__';

SELECT * FROM employee
WHERE fname LIKE '_a%';

SELECT * FROM employee
WHERE fname LIKE '%i%';

-- AGGREGATION FUNCTION
-- COUNT(), MIN(), MAX(), SUM(), AVERAGE()

-- GROUP BY 
SELECT dept, COUNT(emp_id) 
FROM employee
GROUP BY dept;

SELECT dept, SUM(salary) 
FROM employee
GROUP BY dept;

-- STRING FUNCTIONS

-- CONCAT 
SELECT CONCAT(fname, lname)
FROM employee;

SELECT emp_id, CONCAT(fname, ' ', lname) AS full_name, dept 
FROM employee;

-- CONCAT_WS
SELECT CONCAT_WS(' ', fname, lname) AS full_name
FROM employee;

-- SUBSTRING is like that of SLICING
SELECT SUBSTR('Hello SQL!!', 7, 11);

-- REPLACE
SELECT REPLACE('Saniya Shaikh', 'Saniya', 'Zahid');

SELECT REPLACE(dept, 'IT', 'Computer Science')
FROM employee;

-- REVERSE
SELECT REVERSE('Hello');

-- LENGTH of characters
SELECT fname, LENGTH(fname)
FROM employee
WHERE LENGTH(fname) >= 5;

-- UPPER and LOWER
SELECT UPPER(fname)
FROM employee;

SELECT LOWER(lname)
FROM employee;

-- LEFT and RIGHT
SELECT LEFT('SANIYA SHAIKH', 6);
SELECT RIGHT('SANIYA SHAIKH', 6);

-- TRIM
SELECT TRIM('      Saniya!!     ');



