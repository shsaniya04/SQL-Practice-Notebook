CREATE DATABASE stu_crs;

USE stu_crs;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(10)
);

INSERT INTO student
VALUES 
(101, "Saniya"),
(102, "Zahid"),
(103, "Rose");

CREATE TABLE course (
	id INT PRIMARY KEY,
    name VARCHAR(10)
);

INSERT INTO course
VALUES
(103, "Science"),
(106, "English"),
(105, "Maths"),
(101, "Geography"),
(104, "History");

SELECT *
FROM student as s
INNER JOIN course as c
ON s.id = c.id;


