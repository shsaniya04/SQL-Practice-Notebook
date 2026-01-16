create database teacher_dept;

use teacher_dept;

create table dept (
	id INT PRIMARY KEY,
    name VARCHAR(10)
);

INSERT INTO dept
VALUES 
(101, "Science"),
(102, "Maths"),
(103, "English");

UPDATE dept
SET id = 111
WHERE id = 103;

SELECT * FROM dept;

create table teacher (
	id INT PRIMARY KEY,
    name VARCHAR(20),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
VALUES
(101, "Saniya", 102),
(102, "Zahid", 101),
(103, "Asma", 103),
(104, "Zenia", 102);

SELECT * FROM teacher;