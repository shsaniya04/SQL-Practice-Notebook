create database student;

use student;

create table clg_stu (
	rollno int primary key,
    name varchar(50),
    marks int not null,
    grade varchar(1),
    city varchar(20)
);

insert into clg_stu
values
(101, "Anil", 78, "C", "Pune"),
(102, "Bhumika", 98, "A", "Mumbai"),
(103, "Chetan", 85, "B", "Mumbai"),
(104, "Dhruv", 96, "A", "Delhi"),
(105, "Emanuel", 12, "F", "Delhi"),
(106, "Farah", 82, "B", "Delhi");

SELECT name , marks from clg_stu;

SELECT * from clg_stu;

SELECT DISTINCT city FROM clg_stu;

SELECT name, marks
FROM clg_stu
ORDER BY marks DESC
LIMIT 3;

SELECT city , COUNT(name)
FROM clg_stu
GROUP BY city;

SELECT city, AVG(marks)
FROM clg_stu
GROUP BY city
ORDER BY AVG(marks) DESC;



