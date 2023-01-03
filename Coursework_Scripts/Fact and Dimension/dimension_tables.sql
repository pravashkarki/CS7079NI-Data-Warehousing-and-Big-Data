
USE [xyz_dmart]


CREATE TABLE dimension_departments (
	[depart_key] int NOT NULL,
	[depart_name] nvarchar (45) NOT NULL
	);

INSERT INTO dimension_departments(depart_key, depart_name) 
SELECT department_id, department_name FROM xyz_dwh.dbo.departments; 


CREATE TABLE dimension_orders (
	[order_key] int NOT NULL,
	[order_status] nvarchar (45) NOT NULL,
	[order_date] DATETIME2
	);

INSERT INTO dimension_orders(order_key, order_status, order_date) 
SELECT order_id, order_status, order_date FROM xyz_dwh.dbo.orders;


CREATE TABLE dimension_products (
	[product_key] int NOT NULL,
	[category_key] int NOT NULL,
	[product_name] VARCHAR(200)  NOT NULL,
	[product_price] decimal(25,2) NOT NULL,
	);

INSERT INTO dimension_products(product_key, category_key, product_name, product_price) 
SELECT product_id, product_category_id, product_name, product_price FROM xyz_dwh.dbo.products;


CREATE TABLE dimension_order_items (
	[order_items_key] int NOT NULL,
	[order_key] int NOT NULL,
	[product_key] int NOT NULL,
	[subtotal_cost_price] decimal (25,2)  NOT NULL,
	[order_quantity] smallint NOT NULL
	);

INSERT INTO dimension_order_items(order_items_key, order_key, product_key, subtotal_cost_price, order_quantity) 
SELECT order_item_id, order_item_order_id, order_item_product_id, order_item_subtotal, order_item_quantity FROM xyz_dwh.dbo.order_items;


CREATE TABLE dbo.dimension_categories (
	[category_key] int NOT NULL,
	[department_key] int NOT NULL,
	[category_name] VARCHAR (100) NOT NULL
	);

INSERT INTO dimension_categories(category_key, department_key, category_name) 
SELECT category_id, category_department_id as departmentKey, category_name  FROM xyz_dwh.dbo.categories;
