USE xyz_dmart;

SELECT 
	SUM(fas.subtotal_sold_price) as sold_price_subtotal,
	fas.product_key,
	pro.product_name productName
FROM fact_sales fas
INNER JOIN dimension_products pro ON pro.product_key = fas.product_key
GROUP BY fas.product_key, pro.product_name
ORDER BY sold_price_subtotal DESC
LIMIT 5;