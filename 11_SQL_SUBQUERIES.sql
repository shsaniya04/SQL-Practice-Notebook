CREATE DATABASE subquery;

USE subquery;

CREATE TABLE students (
	rollno INT,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(20)
);

INSERT INTO students
VALUES
(101, 'anil', 78, "Pune"),
(102, 'bhumika', 93, "Mumbai"),
(103, 'chetan', 85, "Mumbai"),
(104, 'dhruv', 96, "Delhi"),
(105, 'emanuel', 92, "Delhi"),
(106, 'farah', 82, "Delhi");

SELECT * FROM students;

SELECT AVG(marks) 
FROM students;

SELECT name, marks
FROM students
WHERE marks > 87.667;

SELECT name, marks
FROM students
WHERE marks > ( SELECT AVG(marks) FROM students);

SELECT rollno
FROM students
WHERE rollno % 2 = 0;

SELECT rollno, name 
FROM students
WHERE ROLLNO IN (102, 104, 106);

SELECT rollno, name 
FROM students
WHERE ROLLNO IN (SELECT rollno FROM students WHERE rollno % 2 = 0);

SELECT MAX(marks)
FROM (SELECT * FROM students WHERE city = "Delhi") as temp;

SELECT MAX(marks)
FROM students
WHERE city = "Mumbai";

CREATE VIEW view1 as
SELECT rollno, name, marks FROM students;

SELECT * 
FROM view1
WHERE marks > 90;