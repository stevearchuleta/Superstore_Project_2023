SELECT * FROM superstore_project_2023.orders;

-- =================================================================================
-- A) Find the total sales and profit for each category where the total profit is greater than $2500, ordered by the total profit in descending order.
-- (first find the minimum profit and maximum profit; note: use a  FROM subquery)
SELECT ROUND(MIN(total_profit), 2) as min_profit, ROUND(MAX(total_profit), 2) as max_profit
FROM (
    SELECT o.category, SUM(r.Profit) as total_profit
    FROM orders o
    JOIN returns r ON o.order_id = r.order_id
    GROUP BY o.category
) as profit_summary;
/*
1. The query starts by selecting data from the orders table and aliasing it as o.
2. Then it joins the returns table, aliased as r, with the orders table on the order_id column.
3. It selects the category column from the orders table and the sum of the Profit column from the returns table. 
   The sum is aliased as total_profit.
4. Then it groups the selected data by the category column from the orders table.
5. After executing the subquery, it selects the minimum and maximum of the total_profit column and rounds these values to two decimal places.
*/
-- (then find total profit geater than 2500)
SELECT o.category, ROUND(SUM(r.Sales), 2) as total_sales, ROUND(SUM(r.Profit), 2) as total_profit
FROM orders o
JOIN returns r ON o.order_id = r.order_id
GROUP BY o.category
HAVING total_profit > 2500
ORDER BY total_profit DESC;
/*
1. The query starts by selecting data from the orders table and aliasing it as o.
2. Then it joins the returns table, aliased as r, with the orders table on the order_id column.
3. It selects the category column from the orders table, the sum of the Sales column, and the sum of the Profit column from the returns table. 
   The sums are being rounded to two decimal places and are being aliased as total_sales and total_profit, respectively.
4. Then it groups the selected data by the category column from the orders table.
5. It applies the HAVING clause to filter the groups such that only those where the total profit is greater than 2500 are included in the result set.
6. Lastly, it orders the result set by the total_profit column in descending order.
*/


-- =================================================================================
-- B) Find the top 3 categories which have the highest number of returned orders.
SELECT r.Category, COUNT(*) as returned_orders
FROM returns r
GROUP BY r.Category
ORDER BY returned_orders DESC
LIMIT 3;
/*
The query starts by selecting data from the returns table and aliasing it as r.
It selects the Category column from the returns table and counts the number of returned orders for each category.
Then it groups the selected data by the Category column from the returns table.
It orders the result set by the returned_orders column in descending order to get the categories with the highest number of returns at the top.
Lastly, it limits the result set to the top 3 rows.
*/




-- =================================================================================
-- C) Find the categories which have unique product ids greater than 10, greater than 5, greater than 3, greater than 2.
SELECT o.category, COUNT(DISTINCT o.product_id) as unique_products
FROM orders o
JOIN returns r ON o.order_id = r.order_id
GROUP BY o.category
HAVING unique_products > 1;
/*
1. The query begins by selecting data from the orders table and aliasing it as "o".
2. It then joins the returns table, aliased as "r", with the orders table on the order_id column.
3. It selects the category column from the orders table and counts the distinct product_id entries, which is aliased as "unique_products".
4. The selected data is then grouped by the category column from the orders table.
5. It applies the HAVING clause to filter the groups such that only those where the count of unique products is greater than 12 are included in the result set.
   I started with unique_products > 10, which returned 0 rows, then 5, then 3...  
   I can deduce that each category in my data set has at most 2 unique products associated with returned orders. 
   This is deduced from the fact that when I set the HAVING condition to unique_products > 2, I start getting results.
   When I increase the number in the HAVING clause to 3, 5, or 10, I get no results. 
   This suggests that there are no categories that have more than 2 unique products associated with returns in your data set.
   PROOF: "find the maximum count of distinct products associated with each category in the returns dataset using the following query:"
   */
   SELECT o.category, COUNT(DISTINCT o.product_id) as unique_products
FROM orders o
JOIN returns r ON o.order_id = r.order_id
GROUP BY o.category
ORDER BY unique_products DESC
LIMIT 1;
-- This type of analysis can be useful for identifying trends or patterns in my data. 
-- For example, it seems that returns are not concentrated in a few products within a category but are likely spread across many different products.


-- =================================================================================
-- D) Find the number of returned orders per month where the reason for return is 'Wrong Color'.
-- (First check if the reason_returned column has any 'Wrong Color' entries).
SELECT COUNT(*) 
FROM returns 
WHERE reason_returned LIKE '%Wrong Color%';

 
SELECT MONTH(r.return_date) as return_month, COUNT(*) as color_issue_returns
FROM returns r
WHERE r.reason_returned LIKE '%Wrong Color%'
GROUP BY return_month;

/*
The query starts by selecting data from the returns table and aliasing it as r.
It selects the month from the return_date column and counts the number of returned orders where the reason for return is 'Defective'.
Then it groups the selected data by the return_month.
*/



-- =================================================================================
-- E) Find the average profit by category for average profit greater than 500.
SELECT o.category, ROUND(AVG(r.Profit), 2) as avg_profit
FROM orders o
JOIN returns r ON o.order_id = r.order_id
GROUP BY o.category
HAVING avg_profit > 500;
/*
1. The query starts by selecting data from the orders table and aliasing it as "o".
2. It then joins the returns table, aliasing it as "r", with the orders table on the order_id column.
3. It selects the category column from the orders table and calculates the average of the Profit column from the returns table. The average is being rounded to two decimal places and is being aliased as "avg_profit".
4. The selected data is then grouped by the category column from the orders table.
5. It applies the HAVING clause to filter the groups such that only those where the average profit is greater than 500 are included in the result set.
*/

-- =================================================================================
-- F) Find the customers who returned orders more than 5 times in the 'Furniture' category.
SELECT r.Customer_Name
FROM returns r
WHERE r.Category = 'Furniture'
GROUP BY r.Customer_Name
HAVING COUNT(*) > 5;
/*
The query starts by selecting data from the returns table and aliasing it as r.
It selects the Customer_Name column from the returns table where the Category is 'Furniture'.
Then it groups the selected data by the Customer_Name column.
It applies the HAVING clause to filter the groups such that only those where the count of returned orders is greater than 5 are included in the result set.
*/



-- =================================================================================
-- G) Find the reason returned where the average sale for the reason returned was greater than 500.
SELECT r.reason_returned, ROUND(AVG(r.Sales), 2) as avg_sales
FROM returns r
GROUP BY r.reason_returned
HAVING avg_sales > 500;
/*
1. The query starts by selecting data from the returns table and aliasing it as "r".
2. It selects the reason_returned column from the returns table and calculates the average of the Sales column. The average is being rounded to two decimal places and is being aliased as "avg_sales".
3. The selected data is then grouped by the reason_returned column from the returns table.
4. It applies the HAVING clause to filter the groups such that only those where the average sales is greater than 1000 are included in the result set.
*/

-- =================================================================================
-- H) Find the average profit margin by category for returned items, where the average profit margin is greater than 10%.
-- first find the min max average profit margin, so that I can select a proper value into the HAVING clause)
SELECT ROUND(MIN(avg_profit_margin), 2) as min_avg_profit_margin, ROUND(MAX(avg_profit_margin), 2) as max_avg_profit_margin
FROM (
    SELECT r.Category, AVG(r.Profit_Margin) as avg_profit_margin
    FROM returns r
    GROUP BY r.Category
) as profit_margin_summary;
/*
The query starts by selecting data from the returns table and aliasing it as r.
It selects the Category column from the returns table and calculates the average of the Profit_Margin column for each category. 
The average is being aliased as avg_profit_margin.
Then it groups the selected data by the Category column from the returns table.
After executing the subquery, it selects the minimum and maximum of the avg_profit_margin column and rounds these values to two decimal places.
*/
SELECT r.Category, ROUND(AVG(r.Profit_Margin), 2) as avg_profit_margin
FROM returns r
GROUP BY r.Category
HAVING avg_profit_margin > .2;
/*
The query starts by selecting data from the returns table and aliasing it as r.
It selects the Category column from the returns table and calculates the average of the Profit_Margin column for each category.
The average is being rounded to two decimal places and is being aliased as avg_profit_margin.
Then it groups the selected data by the Category column from the returns table.
It applies the HAVING clause to filter the groups such that only those where the average profit margin is greater than 10 are included in the result set.
*/


-- =================================================================================
-- I) Find the total sales value for returned orders, aggregated by the month when the original order was placed, and list them in descending order of total sales.
SELECT o.order_month, ROUND(SUM(r.Sales), 2) as total_sales
FROM orders o
JOIN returns r ON o.order_id = r.order_id
GROUP BY o.order_month
ORDER BY total_sales DESC;
/*
1. The query starts by selecting data from the orders table and aliasing it as "o".
2. It then joins the returns table, aliasing it as "r", with the orders table on the order_id column.
3. It selects the order_month column from the orders table and sums the Sales column from the returns table. 
   The sum is being rounded to two decimal places and is being aliased as "total_sales".
4. The selected data is then grouped by the order_month column from the orders table.
5. Lastly, it orders the result set by the total_sales column in descending order.
*/

