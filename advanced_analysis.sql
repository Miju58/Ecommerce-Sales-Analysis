SHOW DATABASES;
USE ecommerce_analysis;
CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code INT,
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales DECIMAL(10,2)
);
SELECT * FROM superstore LIMIT 10;
SHOW TABLES;
SELECT * FROM superstore LIMIT 10;
      -- Total Sales
SELECT ROUND(SUM(sales),2) AS total_sales
FROM superstore;
-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore;


-- Top 10 Products
SELECT product_name,
       ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


      -- Region Wise Sales
SELECT region,
       ROUND(SUM(sales),2) AS sales
FROM superstore
GROUP BY region
ORDER BY sales DESC;

     -- Category Wise Sales
SELECT category,
       ROUND(SUM(sales),2) AS sales
FROM superstore
GROUP BY category
ORDER BY sales DESC;

	-- Monthly Sales Trend
SELECT 
    MONTH(order_date) AS month_number,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY MONTH(order_date)
ORDER BY month_number;

	-- Top 5 Customers
SELECT 
    customer_name,
    ROUND(SUM(sales),2) AS total_spent
FROM superstore
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;

	-- Top Selling Cities
SELECT 
    city,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;

	-- Sub-Category Performance
SELECT 
    sub_category,
    ROUND(SUM(sales),2) AS sales
FROM superstore
GROUP BY sub_category
ORDER BY sales DESC;

	-- Sales By Segment
SELECT 
    segment,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;