CREATE DATABASE student_db;

USE student_db;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(30),
    marks INT,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
VALUES
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 98, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

ALTER TABLE student
CHANGE COLUMN name full_name VARCHAR(30);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM student
WHERE marks < 80;

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;
