-- Question:

-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. Output the city name and the corresponding number of completed trade orders.

-- Solution:

SELECT u.city, COUNT(t.order_id) as total_orders
FROM trades t
LEFT JOIN users u on u.user_id = t.user_id
WHERE status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC
Limit 3;