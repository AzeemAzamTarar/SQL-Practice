-- Question: Customers with More Than 20 Orders

-- Write a SQL query to display all loyal customers from the playground.superstore table. 
-- A customer is considered loyal if they have placed more than 20 orders. The query should return the customer ID, customer name, and the total number of orders for each of these customers. Display the result in descending order of their orders and then ascending order of their names.

-- These are the tables to query for this question:

-- playground.superstore
    -- row_id int
    -- order_id string
    -- order_date date
    -- ship_date date
    -- ship_mode string
    -- customer_id string
    -- customer_name string
    -- segment string
    -- country string
    -- city string
    -- state string
    -- postal_code int
    -- region string
    -- product_id string
    -- category string
    -- sub_category string
    -- product_name string
    -- sales string
    -- quantity string
    -- discount string
    -- profit double

-- Your answer should include these columns:
    -- customer_id varchar
    -- customer_name varchar
    -- order_count integer

with orders as (
SELECT 
    customer_id, 
    customer_name, 
    COUNT(order_id) as order_count
FROM playground.superstore 
GROUP BY customer_id, customer_name)

SELECT customer_id, customer_name, order_count
FROM orders 
WHERE order_count > 20 
ORDER BY order_count desc, customer_name
LIMIT 1