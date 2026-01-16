create database city;

use city;

create table city (
	id int primary key,
    name varchar(50),
    city varchar(50),
    age int not null,
    constraint age_check check (age >= 18 and city = "Delhi")
);

insert into city values (1, "SANA", "Delhi", 21);
insert into city values (2, "ROZI", "Delhi", 18);
select * from city;