CREATE DATABASE SuperStore_Project_2023;


CREATE TABLE orders (
   order_id INT,
   order_info_id INT,
   order_id_number INT,
   order_date DATE,
   order_weekday VARCHAR(255),
   order_month INT,
   ship_mode VARCHAR(255),
   product_id INT,
   category VARCHAR(255),
   sub_category VARCHAR(255),
   product_name VARCHAR(255)
);


CREATE TABLE returns (
   order_id INT,
   return_date DATE,
   Category VARCHAR(255),
   Sales DECIMAL(10,2),
   Profit DECIMAL(10,2),
   Profit_Margin DECIMAL(5,2),
   Margin_Category VARCHAR(255),
   State VARCHAR(255),
   Customer_Name VARCHAR(255),
   return_quantity INT,
   reason_returned VARCHAR(255)
);


LOAD DATA LOCAL INFILE 'C:/Users/steve/Documents/SuperStore_Project_2023/Superstore_Project_2023/data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/steve/Documents/SuperStore_Project_2023/Superstore_Project_2023/data/returns.csv'
INTO TABLE returns
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


CREATE VIEW total_revenue_by_category AS
SELECT category, SUM(Sales) as total_revenue
FROM returns
GROUP BY category;


DELIMITER //
CREATE PROCEDURE orders_by_category(IN category_name VARCHAR(255))
BEGIN
   SELECT category, COUNT(*) as total_orders
   FROM orders
   WHERE category = category_name
   GROUP BY category;
END; //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE returns_by_category(IN category_name VARCHAR(255))
BEGIN
   SELECT category, COUNT(*) as total_returns
   FROM returns
   WHERE category = category_name
   GROUP BY category;
END; //
DELIMITER ;
