CREATE DATABASE stu_db;

USE stu_db;

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
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY age VARCHAR(2);

ALTER TABLE student
CHANGE COLUMN age stu_age INT;

ALTER TABLE student
DROP COLUMN stu_age;

ALTER TABLE student
RENAME TO stu;

SELECT * FROM stu;
