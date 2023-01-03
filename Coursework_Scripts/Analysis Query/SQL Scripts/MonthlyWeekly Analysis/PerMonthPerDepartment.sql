USE [xyz_dmart]

SELECT 
	MONTH(dat.TheDate) TheMonth,
	SUM(fas.subtotal_sold_price) total_sales_per_month,
	pro.product_name productName,
	fas.department_key departmentKey
FROM dbo.dimension_date dat
INNER JOIN dbo.fact_sales fas 
ON fas.sales_date_key = dat.DateKey
INNER JOIN dbo.dimension_products pro 
ON pro.product_key = fas.product_key
GROUP BY MONTH(dat.TheDate), fas.department_key, pro.product_name
ORDER BY total_sales_per_month DESC;

SELECT 
	fas.the_week WeekD,
	SUM(fas.subtotal_sold_price) total_sales_per_month,
	pro.product_name product_name,
	department_key department_key
FROM dbo.dimension_date dat
INNER JOIN dbo.fact_sales fas 
ON fas.sales_date_key = dat.DateKey
INNER JOIN dbo.dimension_products pro 
ON pro.product_key = fas.product_key
GROUP BY fas.the_week, department_key, pro.product_name
ORDER BY total_sales_per_month DESC;