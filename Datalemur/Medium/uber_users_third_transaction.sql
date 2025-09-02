-- Question: 

-- Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

-- Solution:

With orders as (
SELECT user_id, spend, transaction_date,
row_number() over (partition BY user_id order by transaction_date ASC ) as order_number
FROM transactions)

SELECT user_id, spend, transaction_date
FROM orders 
WHERE order_number = 3