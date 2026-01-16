CREATE DATABASE company_db_full;

USE company_db_full;

CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20)
);

INSERT INTO departments
VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations'),
(6, 'Sales');

SELECT * FROM departments;

CREATE TABLE employees (
	emp_id INT PRIMARY KEY,
    name VARCHAR(20),
    age INT,
    dept_id INT,
    salary INT,
    joining_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees 
VALUES
(101, 'Asha Singh', 24, 1, 35000, '2022-03-10'),
(102, 'Rohan Mehta', 28, 2, 42000, '2021-06-18'),
(103, 'Meera Jain', 22, 1, 30000, '2023-01-12'),
(104, 'Vikram Rao', 30, 3, 50000, '2020-11-29'),
(105, 'Neha Patil', 26, 2, 38000, '2021-09-05'),
(106, 'Arjun Sharma', 27, 3, 47000, '2022-12-17'),
(107, 'Priya Nair', 25, 4, 36000, '2023-03-01'),
(108, 'Kabir Khanna', 31, 5, 55000, '2020-01-25'),
(109, 'Simran Kaur', 23, 6, 33000, '2023-05-11'),
(110, 'Aman Verma', 29, 3, 52000, '2019-10-19'),
(111, 'Shreya Gupta', 27, 4, 41000, '2021-12-02'),
(112, 'Dev Malhotra', 26, 6, 37000, '2022-02-16'),
(113, 'Tanvi Joshi', 28, 5, 48000, '2020-08-07'),
(114, 'Sahil Singh', 24, 2, 39000, '2022-04-19'),
(115, 'Lakshmi Rao', 32, 3, 60000, '2018-09-13');

CREATE TABLE projects (
	project_id INT PRIMARY KEY,
    project_name VARCHAR(20),
    dept_id INT,
    project_lead INT,
    budget INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (project_lead) REFERENCES employees(emp_id)
);

INSERT INTO projects VALUES
(201, 'Website Revamp', 3, 104, 200000, '2023-01-10', '2023-09-30'),
(202, 'Recruitment Drive', 1, 101, 50000, '2023-03-15', '2023-07-20'),
(203, 'Audit Compliance', 2, 102, 120000, '2022-11-01', '2023-05-15'),
(204, 'Marketing Campaign', 4, 107, 90000, '2023-02-01', '2023-06-15'),
(205, 'CRM Tool', 3, 106, 300000, '2022-07-10', '2023-12-30'),
(206, 'Inventory Automation', 5, 108, 150000, '2022-04-01', '2023-03-27'),
(207, 'Sales Dashboard', 6, 112, 110000, '2023-05-10', '2023-12-31'),
(208, 'Customer Analytics', 6, 109, 95000, '2023-01-20', '2023-07-30');

CREATE TABLE employee_project (
	emp_id INT,
    project_id INT,
    hours_worked INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


INSERT INTO employee_project 
VALUES
(104, 201, 120),
(110, 201, 98),
(106, 205, 140),
(115, 205, 170),
(107, 204, 66),
(111, 204, 42),
(101, 202, 55),
(103, 202, 40),
(102, 203, 80),
(105, 203, 65),
(108, 206, 100),
(113, 206, 150),
(112, 207, 90),
(109, 207, 85),
(112, 208, 78),
(109, 208, 95);

CREATE TABLE attendance (
	id INT PRIMARY KEY,
    emp_id INT,
    date DATE,
	status VARCHAR(10),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO attendance VALUES
(1, 101, '2023-08-01', 'Present'),
(2, 101, '2023-08-02', 'Absent'),
(3, 102, '2023-08-01', 'Present'),
(4, 103, '2023-08-01', 'Present'),
(5, 104, '2023-08-01', 'Present'),
(6, 105, '2023-08-01', 'Absent'),
(7, 106, '2023-08-02', 'Present'),
(8, 107, '2023-08-02', 'Present'),
(9, 108, '2023-08-01', 'Present'),
(10, 110, '2023-08-01', 'Present'),
(11, 112, '2023-08-01', 'Present');

SELECT * 
FROM employees
WHERE dept_id <> 2;

SELECT *
FROM employees
WHERE salary NOT BETWEEN 30000 AND 45000;

SELECT * 
FROM employees
WHERE LOWER(name) LIKE "%a%";

SELECT *
FROM employees
WHERE age IN (24, 28, 30);

SELECT *
FROM employees
WHERE dept_id = 3
ORDER BY salary DESC
LIMIT 2;

SELECT dept_id, age
FROM employees
WHERE (dept_id, age) IN (SELECT dept_id, MIN(age) FROM employees GROUP BY dept_id);

SELECT *
FROM employees
ORDER BY joining_date DESC 
LIMIT 3;

SELECT e.emp_id, e.name, p.project_name
FROM employees e
LEFT JOIN employee_project AS ep ON e.emp_id = ep.emp_id
LEFT JOIN projects AS p ON ep.project_id = p.project_id;

SELECT d.*
FROM departments AS d
LEFT JOIN employees as e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

SELECT p.project_name, e.name, d.dept_id
FROM projects AS p
JOIN departments AS d ON p.dept_id = d.dept_id
JOIN employees AS e ON e.dept_id = d.dept_id;

SELECT e.emp_id, e.name, d.dept_name
FROM employees AS e
RIGHT JOIN departments  AS d 
ON e.dept_id = d.dept_id;

SELECT dept_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC;

SELECT dept_id, MAX(salary) as max_salary
FROM employees
GROUP BY dept_id;

SELECT dept_id, COUNT(project_id) as count_prjct
FROM projects 
GROUP BY dept_id;
