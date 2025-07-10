-- Question: Find Product Prices

-- Using the table playground.product_prices, create a SQL query to find all products and their prices on 2023-08-17, assuming the initial price of all products was 10 before any price changes. Order the results in ascending order of product_id.

-- These are the tables to query for this question:

-- playground.product_prices
    -- product_id int
    -- new_price int
    -- change_date date


-- Your answer should include these columns:
    -- product_id integer
    -- price integer


SELECT 
  product_id,
  COALESCE(
    (SELECT new_price 
     FROM playground.product_prices 
     WHERE product_id = p.product_id 
       AND change_date <= date('2023-08-17') 
     ORDER BY change_date DESC 
     LIMIT 1),
    10
  ) AS price
FROM (
  SELECT DISTINCT product_id 
  FROM playground.product_prices
) AS p
ORDER BY product_id