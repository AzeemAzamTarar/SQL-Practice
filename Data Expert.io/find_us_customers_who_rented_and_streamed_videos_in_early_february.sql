-- Question: Find US Customers Who Rented and Streamed Videos in Early February

-- Find US Customers Who Rented and Streamed Videos in Early February
 
-- Write a SQL query to return the US customers who rented a video on February 1st, 2023, and then streamed the same video between February 2nd and February 8th, 2023. Use the tables playground.rental for rental data and playground.streams for streaming data. The output should include unique user IDs of these customers ordered in ascending order.

-- These are the tables to query for this question:

-- playground.rental
    -- country string
    -- rental_date date
    -- rental_id int
    -- user_id int
    -- playground.streams
    -- country string
    -- stream_date date
    -- rental_id int
    -- user_id int
    -- device_type string
    -- minutes_streamed int


-- Your answer should include these columns:
    -- user_id integer

with rental_customers as (
SELECT * 
FROM playground.rental 
WHERE country = 'US'
AND rental_date = ('2023-02-01')
)

, streams_customers as (
SELECT * 
FROM playground.streams
WHERE stream_date between ('2023-02-02') and ('2023-02-08')
)

SELECT rc.user_id
FROM rental_customers rc 
INNER JOIN streams_customers sc on sc. user_id = rc. user_id
ORDER BY rc.user_id
LIMIT 1
