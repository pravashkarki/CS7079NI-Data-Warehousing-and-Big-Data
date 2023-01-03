USE xyz_dmart;

SELECT 
	SUM(quantity) total_quanity, 
	pro.product_name,
	fas.product_key
FROM fact_sales fas
INNER JOIN dimension_products pro 
ON fas.product_key = pro.product_key
GROUP BY pro.product_name, fas.product_key
ORDER BY total_quanity desc;