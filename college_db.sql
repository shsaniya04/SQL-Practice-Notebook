CREATE DATABASE college_db;

USE college_db;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(30),
    age INT
);

INSERT INTO student
VALUES
(1, "Vishal", 20),
(2, "Saniya", 21),
(3, "Harsh", 22);

 
CREATE TABLE temp (
	eu_id INT,
    FOREIGN KEY (eu_id) REFERENCES student(id)
);

SELECT * FROM student;

