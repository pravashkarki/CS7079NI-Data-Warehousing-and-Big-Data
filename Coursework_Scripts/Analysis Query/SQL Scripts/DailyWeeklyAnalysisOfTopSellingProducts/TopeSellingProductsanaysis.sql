
/* Helps us to know the top selling products*/
USE [xyz_dmart]

SELECT 
	SUM(quantity) total_quanity, 
	pro.product_name,
	fas.product_key
FROM dbo.fact_sales fas
INNER JOIN dbo.dimension_products pro 
ON fas.product_key = pro.product_key
GROUP BY pro.product_name, fas.product_key
ORDER BY total_quanity desc;

/* Monthly Analysis based on top selling products */
SELECT 
	MONTH(dat.TheDate) TheMonth,
	SUM(fas.subtotal_sold_price) total_sales_per_month,
	SUM(fas.profit) total_profit_generated,
	pro.product_name product_name,
	fas.department_key department_key
FROM dbo.dimension_date dat
INNER JOIN dbo.fact_sales fas 
ON fas.sales_date_key = dat.DateKey
INNER JOIN dbo.dimension_products pro 
ON pro.product_key = fas.product_key
WHERE pro.product_name = 'Perfect Fitness Perfect Rip Deck'
GROUP BY MONTH(dat.TheDate), department_key, pro.product_name
ORDER BY total_sales_per_month DESC;

/* Per day Analysis based on above result top of top selling products*/
SELECT 
	DAY(dat.TheDate) TheDay,
	SUM(fas.subtotal_sold_price) total_sales_per_month,
	SUM(fas.profit) total_profit_per_month,
	pro.product_name product_name,
	fas.department_key department_key
FROM dbo.dimension_date dat
INNER JOIN dbo.fact_sales fas 
ON fas.sales_date_key = dat.DateKey
INNER JOIN dbo.dimension_products pro 
ON pro.product_key = fas.product_key
WHERE pro.product_name = 'Perfect Fitness Perfect Rip Deck'
GROUP BY DAY(dat.TheDate), fas.department_key, pro.product_name
ORDER BY total_sales_per_month DESC;