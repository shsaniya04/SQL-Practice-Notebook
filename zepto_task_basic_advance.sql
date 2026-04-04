-- 
-- 
--  LEVEL 1
-- 
-- 

-- 
--    1. Basic Data Retrieval
-- 
SELECT *
FROM zepto
LIMIT 0;

SELECT product_name, mrp, selling_price
FROM zepto;

SELECT * 
FROM zepto
LIMIT 100;

SELECT DISTINCT product_name
FROM zepto
ORDER BY product_name;

-- 
--    2. Filtering (WHERE Clause)
-- 

SELECT product_name, mrp
FROM zepto
WHERE mrp >= 1000
ORDER BY mrp;

SELECT product_name, discount_percent
FROM zepto
WHERE discount_percent = 50;

SELECT product_name, mrp
FROM zepto
WHERE mrp <= 500
ORDER BY mrp;

SELECT product_name, out_of_stock
FROM zepto
WHERE out_of_stock = 'TRUE';

SELECT product_name, out_of_stock
FROM zepto
WHERE out_of_stock = 'False';

SELECT product_name, available_quantity
FROM zepto
WHERE available_quantity >= 2;

-- 
--    3. Sorting (ORDER BY)
-- 

SELECT DISTINCT product_name, mrp
FROM zepto
ORDER BY mrp;

SELECT DISTINCT product_name, selling_price
FROM zepto
ORDER BY selling_price DESC;

SELECT DISTINCT product_name, mrp
FROM zepto
ORDER BY mrp DESC
LIMIT 5;

SELECT DISTINCT product_name, selling_price
FROM zepto
ORDER BY selling_price
LIMIT 5;

-- 
--    4. Basic Calculations
-- 

SELECT product_name, mrp, selling_price, 
	(mrp- selling_price) AS discount_amount
FROM zepto;


SELECT product_name, mrp, selling_price, discount_percent,
	(100.0 -(100.0 * selling_price/mrp)) AS calculated_discount_percent
FROM zepto;

-- SAME AS ABOVE DISCOUNT PERCENTAGE CALCULATION
-- SELECT product_name, mrp, selling_price, discount_percent,
--        ((mrp - selling_price) * 100.0 / mrp) AS calculated_discount
-- FROM zepto;

-- TO ADD COLUMN WITH CALCULATED VALUES
ALTER TABLE zepto
ADD COLUMN discount_amt NUMERIC
GENERATED ALWAYS AS (mrp - selling_price);

-- ADD COLUMN WITH FLOAT VALUE
ALTER TABLE zepto
ADD COLUMN dis_per FLOAT
GENERATED ALWAYS AS (
    FLOOR(100 - (100 * selling_price::FLOAT / mrp))
);

SELECT COUNT(*) AS mismatch_count
FROM zepto
WHERE discount_percent <> dis_per;

-- SAME AS ABOVE (!=    ==    <>)
-- SELECT discount_percent, dis_per
-- FROM zepto
-- WHERE discount_percent != dis_per;

-- 
-- 	  5. Conditional Filtering
-- 

SELECT product_name, mrp, discount_percent
FROM zepto
WHERE mrp > 1000 AND discount_percent > 30;

SELECT product_name,selling_price, discount_percent
FROM zepto
WHERE selling_price < 1000 AND discount_percent > 30;


SELECT product_name, selling_price, discount_percent
FROM zepto
WHERE discount_percent < 50;

-- 
-- 6. NULL & Data Quality Checks
-- 

SELECT * 
FROM zepto
WHERE category IS NULL
OR
product_name IS NULL
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
quantity IS NULL
OR
discount_amt IS NULL
OR
dis_per IS NULL;

SELECT product_name AS products, weight_in_grams
FROM zepto
WHERE weight_in_grams IS NULL;

-- 23.	Replace NULL weights with 0 using a query
SELECT product_name, COALESCE(weight_in_grams, 0) AS weight_in_grams
FROM zepto
WHERE weight_in_grams IS NULL;

-- 
--  7. Text Operations
-- 

SELECT product_name
FROM zepto
WHERE product_name LIKE 'A%';

SELECT product_name
FROM zepto
WHERE product_name LIKE '%Banana%';

SELECT UPPER(product_name) AS UPPER_PRODUCT_NAME
FROM zepto;

SELECT LENGTH(product_name) AS length_str
FROM zepto;

-- 
--  8. Limiting & Pagination
-- 

SELECT product_name, discount_percent
FROM zepto
ORDER BY discount_percent DESC
LIMIT 10;

-- 29.	Skip first 10 rows and fetch next 10 rows.
SELECT * 
FROM zepto
OFFSET 10
LIMIT 10;

-- 
--  9. Derived Thinking Questions
-- 

SELECT COUNT(*) AS invalid_amount
FROM zepto
WHERE selling_price > mrp;

SELECT product_name, mrp, selling_price, discount_percent
FROM zepto
WHERE discount_percent = 0 AND selling_price < mrp;

-- AVG(discount_percent) AS avg_dis, AVG(selling_price) AS avg_sell, AVG(mrp) AS avg_mrp

SELECT product_name, mrp, selling_price, discount_percent
FROM zepto
    WHERE mrp > (SELECT AVG(mrp) FROM zepto)
 	  AND discount_percent > (SELECT AVG(discount_percent) FROM zepto)
	  AND selling_price > (SELECT AVG(selling_price) FROM zepto);

-- 
-- 10. CASE Statements (Intro)
-- 
SELECT AVG(discount_percent) AS avg_dis, AVG(selling_price) AS avg_sell, AVG(mrp) AS avg_mrp
FROM zepto;
-- 7.6191369606003752	14196.638970785312	15684.320557491289

SELECT 	CASE
			WHEN mrp > 15684 THEN 'Expensive' 
			ELSE 'Affordable' 
		END AS product_category
FROM zepto;

SELECT product_name, discount_percent, 
	CASE 
		WHEN discount_percent > 50 THEN 'High Discount'
		WHEN discount_percent BETWEEN 20 and 50 THEN 'Medium Discount'
		ELSE 'Low Discount'
	END AS discount_category
FROM zepto;

-- 
--  11. Inventory-Based Thinking
-- 

SELECT product_name, available_quantity
FROM zepto
WHERE available_quantity <= 10;

SELECT product_name, available_quantity
FROM zepto
WHERE available_quantity = 0 AND out_of_stock = false;

-- 
-- 
--   LEVEL 2
-- 
-- 

-- 
--  1. Basic Aggregations
-- 

SELECT DISTINCT COUNT(product_name) AS no_of_products
FROM zepto;

SELECT ROUND(AVG(mrp),2) AS avg_mrp
FROM zepto;

SELECT MAX(selling_price), MIN(selling_price)
FROM zepto;

SELECT SUM(available_quantity)
FROM zepto;

SELECT SUM(selling_price)
FROM zepto;

SELECT SUM(selling_price * available_quantity)
FROM zepto;

-- 
-- 	2. GROUP BY Basics
-- 

SELECT category, COUNT(*)
FROM zepto
GROUP BY category;

SELECT category, ROUND(AVG(mrp),2)
FROM zepto
GROUP BY category;

SELECT category, SUM(available_quantity) AS total_inventory
FROM zepto
GROUP BY category;

SELECT category, ROUND(AVG(discount_percent),2)
FROM zepto
GROUP BY category;

SELECT category, ROUND(SUM(selling_price * available_quantity),2) AS revenue
FROM zepto
GROUP BY category;

-- 
-- 3. Sorting Aggregated Results
-- 

SELECT category, ROUND(AVG(mrp),2) as avg_mrp
FROM zepto
GROUP BY category
ORDER BY avg_mrp DESC
LIMIT 5;

SELECT category, ROUND(AVG(discount_percent),2) as avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount 
LIMIT 5;

SELECT category, ROUND(SUM(available_quantity),2) as sum_quantity
FROM zepto
GROUP BY category
ORDER BY sum_quantity DESC 
LIMIT 5;

SELECT category, ROUND(SUM(selling_price * available_quantity),2) as total_quantity
FROM zepto
GROUP BY category
ORDER BY sum_quantity DESC 
LIMIT 5;

-- 
--  4. HAVING Clause (Post-Aggregation Filtering)
-- 

-- ALternate for AVAILABLE QUANTITY
SELECT category, SUM(available_quantity) as sum_quantity
FROM zepto
GROUP BY category
Having SUM(available_quantity) > 50
ORDER BY sum_quantity DESC 
LIMIT 5;

SELECT category, COUNT(*) AS product_count
FROM zepto
GROUP BY category
HAVING COUNT(*) > 50
ORDER BY product_count DESC
LIMIT 5;

SELECT category, AVG(discount_percent)
FROM zepto
GROUP BY category
HAVING AVG(discount_percent) > 0;

SELECT category, COUNT(*) as product_count
FROM zepto
GROUP BY category
HAVING COUNT(*) < 100;

SELECT category , SUM(selling_price * available_quantity) as total_inventory
FROM zepto 
GROUP BY category
HAVING SUM(selling_price * available_quantity) > 10000000;

-- 
--   5. Multi-Level Grouping
-- 

SELECT category, out_of_stock, COUNT(*) AS product_count
FROM zepto
GROUP BY category, out_of_stock
ORDER BY out_of_stock DESC, COUNT(*) DESC;

