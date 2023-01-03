
USE [xyz_dmart]

SELECT
	MONTH(dat.TheDate) TheMonth,
	SUM(subtotal_sold_price) subtotal_sold_price,
	fas.order_key, fas.category_key, pro.product_name AS product_name, ord.order_status
FROM dbo.fact_sales fas
INNER JOIN dbo.dimension_orders ord ON ord.order_key = fas.order_key
INNER JOIN dbo.dimension_products pro ON pro.product_key = fas.product_key
INNER JOIN dbo.dimension_date dat ON dat.DateKey = fas.sales_date_key
GROUP BY MONTH(dat.TheDate), fas.order_key, fas.category_key, ord.order_status, pro.product_name
HAVING order_status = 'CANCELED'
ORDER BY fas.category_key desc;

SELECT 
	MONTH(dat.TheDate) TheMonth,
	SUM(subtotal_sold_price) subtotal_sold_price,
	fas.order_key, fas.category_key, pro.product_name AS product_name, ord.order_status
FROM dbo.fact_sales fas
INNER JOIN dbo.dimension_orders ord ON ord.order_key = fas.order_key
INNER JOIN dbo.dimension_products pro ON pro.product_key = fas.product_key
INNER JOIN dbo.dimension_date dat ON dat.DateKey = fas.sales_date_key
GROUP BY MONTH(dat.TheDate), fas.order_key, fas.category_key, ord.order_status, pro.product_name
HAVING order_status = 'COMPLETE'
ORDER BY fas.category_key desc;