USE [xyz_dmart]

CREATE TABLE fact_sales (
	fact_sales_id int identity (1,1),
	product_key int NULL,
	product_cost_price decimal (25,2) NULL,
	subtotal_product_cost_price decimal (25,2) NULL,
    	subtotal_sold_price decimal (25,2) NULL,
	profit decimal (25,2) NULL,
	order_key int NULL,
	order_items_key int NULL,
	category_key int NULL,
	department_key int NULL,
	sales_date_key int NULL,
	quantity int NULL,
	the_month int NULL,
	the_week int NULL,
	the_day_of_week int NULL
)

INSERT INTO fact_sales(product_key, product_cost_price, subtotal_product_cost_price, subtotal_sold_price, profit, order_key, 
order_items_key, category_key, department_key, sales_date_key, quantity, the_month, the_week, the_day_of_week)
SELECT
pro.product_key product_key,
sum(pro.product_price) product_cost_price,
sum(doi.subtotal_cost_price) subtotal_product_cost_price,
(sum(doi.subtotal_cost_price) + sum(doi.subtotal_cost_price)* 0.2) subtotal_sold_price,
((sum(doi.subtotal_cost_price) + sum(doi.subtotal_cost_price)*0.2) - (sum(doi.subtotal_cost_price))) Profit,
doi.order_key order_key,
doi.order_items_key order_items_key,
pro.category_key category_key,
depart.depart_key department_key,
salesdate.DateKey sales_date_key,
doi.order_quantity quantity,
salesdate.TheMonth the_month,
salesdate.WeekNumberOfYear the_week,
salesdate.TheDayOfWeek the_day_of_week

FROM dbo.dimension_order_items doi
LEFT JOIN dbo.dimension_products pro ON pro.product_key = doi.product_key
LEFT JOIN dbo.dimension_categories cat ON pro.category_key = cat.category_key
LEFT JOIN dbo.dimension_departments depart ON cat.department_key = depart.depart_key
LEFT JOIN dbo.dimension_orders ord ON ord.order_key = doi.order_key
LEFT JOIN dbo.dimension_date salesdate ON ord.order_date = salesdate.TheDate

GROUP BY pro.product_key, 
doi.order_key,
doi.order_items_key,
pro.category_key,
depart.depart_key,
salesdate.DateKey,
doi.order_quantity,
salesdate.TheMonth,
salesdate.WeekNumberOfYear,
salesdate.TheDayOfWeek











