CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

SELECT * FROM train LIMIT 5;
SELECT COUNT(*) FROM train;
DESCRIBE train;

SELECT SUM(Sales) AS total_revenue 
FROM train;

SELECT `Region`, SUM(Sales) AS total_sales
FROM train
GROUP BY `Region`
ORDER BY total_sales DESC;

SELECT `Product Name`, SUM(Sales) AS revenue
FROM train
GROUP BY `Product Name`
ORDER BY revenue DESC
LIMIT 5;

SELECT `Customer Name`, SUM(Sales) AS total_spent
FROM train
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;

SELECT `Category`, SUM(Sales) AS total_sales
FROM train
GROUP BY `Category`
ORDER BY total_sales DESC;

SELECT `Sub-Category`, SUM(Sales) AS total_sales
FROM train
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;

SELECT `Segment`, SUM(Sales) AS total_sales
FROM train
GROUP BY `Segment`
ORDER BY total_sales DESC;

SELECT `City`, SUM(Sales) AS total_sales
FROM train
GROUP BY `City`
ORDER BY total_sales DESC
LIMIT 5;

SELECT 
DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d/%m/%Y'), '%Y-%m') AS month,
SUM(Sales) AS monthly_sales
FROM train
GROUP BY month
ORDER BY month;

SELECT 
`Customer Name`,
COUNT(`Order ID`) AS total_orders
FROM train
GROUP BY `Customer Name`
HAVING total_orders > 1
ORDER BY total_orders DESC;

SELECT 
`Customer Name`,
SUM(Sales) AS total_sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS rank_position
FROM train
GROUP BY `Customer Name`;

