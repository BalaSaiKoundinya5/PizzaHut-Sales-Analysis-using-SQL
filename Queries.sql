SELECT * FROM pizza_sales;
-- 1
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

--2
SELECT 
	SUM(total_price) / COUNT(DISTINCT(order_id)) AS Avg_Order_Value
FROM 
	pizza_sales;

-- 3
SELECT
	SUM(quantity) AS Total_Pizzas_Sold
FROM 
	pizza_sales;

-- 4
SELECT
	COUNT(DISTINCT(order_id)) AS Total_Orders

FROM	
	pizza_sales;

-- 5
SELECT 
	CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
	CAST(COUNT(DISTINCT(order_id)) AS DECIMAL(10,2))AS DECIMAL(10,2))
	AS Avg_pizzas_sold
FROM
	pizza_sales;

-- CHART REQUIREMENTS
SELECT * FROM pizza_sales;

-- DAILY TREND
SELECT 
	DATENAME(DW, order_date) AS order_day,
	COUNT(DISTINCT(order_id)) AS Total_Orders
FROM 
	pizza_sales
GROUP BY 
	DATENAME(DW, order_date)
ORDER BY 
	Total_Orders DESC;

-- HOURLY TREND
SELECT 
	DATEPART(HOUR,order_time) AS Order_hour,
	COUNT(DISTINCT(order_id)) AS Number_of_Orders
FROM
	pizza_sales
GROUP BY
	DATEPART(HOUR,order_time)
ORDER BY 
	DATEPART(HOUR,order_time);

-- PERCENTAGE CATEGORY
SELECT pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) 
	AS DECIMAL(10,2)) AS PCT
FROM 
	pizza_sales
GROUP BY 
	pizza_category;

SELECT CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales)
AS DECIMAL(10,2)) AS PCT
FROM pizza_sales;
SELECT SUM(total_price) * 100 FROM pizza_sales;

SELECT 
	pizza_size,
	CAST(SUM(total_price)AS DECIMAL (10,2)) AS Total_Sales, 
	CAST(SUM(total_price) * 100 / 
	(SELECT SUM(total_price) FROM pizza_sales)AS DECIMAL (10,2)) 
	AS Percentage_by_size
FROM 
	pizza_sales
GROUP BY 
	pizza_size
ORDER BY 
	pizza_size;



SELECT * FROM pizza_sales;

SELECT 
	SUM(quantity) AS Total_Pizzas,
	pizza_category
FROM 
	pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas DESC;
	
SELECT * FROM pizza_sales;

SELECT 
	Top 5 pizza_name,
	SUM(quantity) AS Total_pizzas_sold
FROM 
	pizza_sales
GROUP BY 
	pizza_name
ORDER BY 
	Total_pizzas_sold DESC;

SELECT 
	Top 5 pizza_name, SUM(quantity) AS Total_pizzas_sold
	FROM pizza_sales
	GROUP BY pizza_name
	ORDER BY Total_pizzas_sold ASC;

SELECT * FROM pizza_sales;