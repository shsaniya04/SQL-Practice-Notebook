drop table if exists zepto;

CREATE TABLE zepto (
	serial_id SERIAL PRIMARY KEY,
	category VARCHAR(120),
	product_name VARCHAR(150) NOT NULL,
	mrp NUMERIC(8,2),
	discount_percent NUMERIC(5,2),
	available_quantity INTEGER,
	selling_price NUMERIC(8,2),
	weight_in_grams INTEGER,
	out_of_stock BOOLEAN,
	quantity INTEGER
);

SELECT COUNT(*) FROM zepto;

SELECT * FROM zepto
LIMIT 10;

SELECT * FROM zepto
WHERE product_name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discount_percent IS NULL
OR
available_quantity IS NULL
OR
selling_price IS NULL
OR
weight_in_grams IS NULL
OR
out_of_stock IS NULL
OR
quantity IS NULL;

SELECT DISTINCT category
FROM zepto
ORDER BY category;

SELECT out_of_stock, COUNT(serial_id)
FROM zepto
GROUP BY out_of_stock;

SELECT product_name, COUNT(serial_id) AS "No. of SKUs"
FROM zepto
GROUP BY product_name
HAVING COUNT(serial_id) > 1
ORDER BY COUNT(serial_id) DESC;

SELECT * FROM zepto
WHERE mrp = 0 OR discount_percent = 0;

DELETE FROM zepto
WHERE mrp = 0;