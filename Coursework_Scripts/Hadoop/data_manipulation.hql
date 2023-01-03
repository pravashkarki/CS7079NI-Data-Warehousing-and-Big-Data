--Creating data mart database to store dimension and fact tables

DROP DATABASE IF EXISTS xyz_dmart CASCADE;

CREATE DATABASE xyz_dmart;

SHOW DATABASES;

USE xyz_dmart;

--Creating dimension and fact tables

DROP TABLE IF EXISTS dimension_departments;

CREATE EXTERNAL TABLE dimension_departments (
	depart_key int
	)
partitioned by (depart_name string)  
row format delimited
fields terminated by ','
stored as ORC;

DROP TABLE IF EXISTS dimension_orders;

CREATE EXTERNAL TABLE dimension_orders (
	order_key int,
	order_status string,
	order_date timestamp
	)
row format delimited
fields terminated by ','
stored as ORC;

DROP TABLE IF EXISTS dimension_products;

CREATE EXTERNAL TABLE dimension_products (
	product_key int,
	category_key int,
	product_name string,
	product_price DECIMAL (15,3)
	)
row format delimited
fields terminated by ','
stored as ORC;


DROP TABLE IF EXISTS dimension_order_items;

CREATE EXTERNAL TABLE dimension_order_items ( 
	order_items_key int,
	order_key int,
	product_key int,
	subtotal_cost_price DECIMAL (15, 3)
	)
partitioned by (order_quantity int)
row format delimited
fields terminated by ','
stored as ORC;

DROP TABLE IF EXISTS dimension_categories;

CREATE EXTERNAL TABLE dimension_categories (
	category_key int,
	department_key int,
	category_name string
	)
row format delimited
fields terminated by ','
stored as ORC;

DROP TABLE IF EXISTS FactRetail_sales;

CREATE EXTERNAL TABLE fact_sales (
	product_key int,
	product_cost_price decimal (25,2),
	subtotal_product_cost_price decimal (25,2),
        subtotal_sold_price decimal (25,2),
	profit decimal (25,2),
	order_key int,
	order_items_key int,
	category_key int,
	department_key int,
	salesdate timestamp,
	Quantity int
)
row format delimited
fields terminated by ','
stored as ORC;

set hive.exec.dynamic.partition.mode=nonstrict;


--Loading required data in tables

INSERT INTO dimension_orders 
SELECT order_id, order_status, order_date FROM staging_retail.orders;


INSERT INTO dimension_departments partition (depart_name)
SELECT department_id, department_name FROM staging_retail.departments;


INSERT INTO dimension_products 
SELECT product_id, product_category_id, product_name, product_price FROM staging_retail.products;

INSERT INTO dimension_order_items partition (order_quantity)
SELECT order_item_id, order_item_order_id, order_item_product_id, order_item_subtotal, order_item_quantity FROM staging_retail.order_items;


INSERT INTO dimension_categories 
SELECT category_id, category_department_id, category_name FROM staging_retail.categories;


INSERT INTO fact_sales
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

