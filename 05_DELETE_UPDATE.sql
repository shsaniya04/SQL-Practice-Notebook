CREATE DATABASE payment_db;

USE payment_db;

CREATE TABLE payment (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    mode VARCHAR(20),
    city VARCHAR(50)
);

INSERT INTO payment
VALUES
(101, 'Olivia Barrett', 'Netbanking', 'Portland'),
(102, 'Ethan Sinclair', 'Credit Card', 'Miami'),
(103, 'Maya Hernandez', 'Credit Card', 'Seattle'),
(104, 'Liam Donovan', 'Netbanking', 'Denver'),
(105, 'Sophia Nguyen', 'Credit Card', 'New Orleans'),
(106, 'Caleb Foster', 'Debit Card', 'Minneapolis'),
(107, 'Ava Patel', 'Debit Card', 'Phoenix'),
(108, 'Lucas Carter', 'Netbanking', 'Boston'),
(109, 'Isabella Martinez', 'Netbanking', 'Nashville'),
(110, 'Jackson Brooks', 'Credit Card', 'Boston');

SELECT mode, count(id)
FROM payment
GROUP BY mode;

SELECT city, count(id)
FROM payment
GROUP BY city;

-- SET SQL_SAFE_UPDATE = 0;
UPDATE payment
SET mode = "Debit Card"
WHERE id = 108;

DELETE FROM payment
WHERE id = 110;

SELECT * FROM payment;