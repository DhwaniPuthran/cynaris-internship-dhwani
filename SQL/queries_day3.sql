CREATE DATABASE cynaris_day3;
use cynaris_day3;


CREATE TABLE sales (
    sale_id INTEGER,
    region TEXT,
    category TEXT,
    month TEXT,
    amount REAL
);

INSERT INTO sales VALUES
(1, 'South', 'Electronics', 'January', 5000),
(2, 'North', 'Clothing', 'January', 2000),
(3, 'South', 'Clothing', 'February', 3000),
(4, 'North', 'Electronics', 'February', 7000),
(5, 'South', 'Electronics', 'March', 4000),
(6, 'West', 'Clothing', 'March', 2500),
(7, 'West', 'Electronics', 'January', 6000),
(8, 'North', 'Clothing', 'March', 1500),
(9, 'South', 'Clothing', 'January', 3500),
(10, 'West', 'Electronics', 'February', 8000);

SELECT * FROM sales;




-- 8 Aggregate Queries 

-- 1. Count total sales records
SELECT COUNT(*) AS total_sales
FROM sales;

-- 2. Calculate total sales amount
SELECT SUM(amount) AS total_revenue
FROM sales;

-- 3. Calculate average sales amount
SELECT AVG(amount) AS average_sales
FROM sales;

-- 4. Find maximum sales amount
SELECT MAX(amount) AS highest_sale
FROM sales;

-- 5. Find minimum sales amount
SELECT MIN(amount) AS lowest_sale
FROM sales;

-- 6. Calculate total revenue by region
SELECT region, SUM(amount) AS total_revenue
FROM sales
GROUP BY region;

-- 7. Calculate total revenue by category
SELECT category, SUM(amount) AS total_revenue
FROM sales
GROUP BY category;

-- 8. Calculate total revenue by month
SELECT month, SUM(amount) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY monthly_revenue DESC;




-- Group a sales table by region, category, and month
SELECT region,category,month
FROM sales
GROUP BY region,category,month;

-- Filter aggregated results using HAVING
SELECT region,category,month, AVG(amount) AS avg_amt
FROM sales
GROUP BY region,category,month
HAVING AVG(amount) > 2000;


-- Write one window function using SUM OVER()
SELECT
    sale_id,
    region,
    amount,
    SUM(amount) OVER() AS overall_revenue
FROM sales;
