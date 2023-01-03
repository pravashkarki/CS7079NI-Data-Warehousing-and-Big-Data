USE [xyz_dmart]

SELECT 
	SUM(fas.Profit) total_profit,
	depart.depart_name department_name,
	fas.department_key
FROM dbo.fact_sales fas
INNER JOIN dbo.dimension_departments depart 
ON depart.depart_key = fas.department_key
GROUP BY depart.depart_name, fas.department_key
ORDER BY Total_profit DESC;