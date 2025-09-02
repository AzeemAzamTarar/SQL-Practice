-- Question: 

-- A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one product from every product category listed in the products table.
-- Write a query that identifies the customer IDs of these Supercloud customers.

Solution:

With supercloud_customers as ( 
SELECT c.customer_id, 
       COUNT(DISTINCT p.product_category) as product_count
FROM customer_contracts c
LEFT JOIN products p on p.product_id = c.product_id
GROUP BY c.customer_id
)

SELECT customer_id
FROM supercloud_customers
WHERE product_count = (SELECT COUNT(DISTINCT product_category) FROM products)
