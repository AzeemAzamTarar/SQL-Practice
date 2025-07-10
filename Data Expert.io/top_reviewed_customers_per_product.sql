-- Question: Top Reviewed Customers per Product

-- Using the table playground.product_reviews, write a SQL query to identify, for each product, the customer who provided the highest review score. If there are ties in review score, the customer with the most helpful votes should be considered top. The output should include columns for product_id, customer_id, review_score, and helpful_votes, capturing the details of the top review for each product ordered in ascending order of product_id

-- These are the tables to query for this question:

-- playground.product_reviews
    -- seller_id int
    -- customer_id int
    -- product_id int
    -- review_date date
    -- review_score double
    -- helpful_votes int


-- Your answer should include these columns:
    -- product_id integer
    -- customer_id integer
    -- review_score double
    -- helpful_votes integer

SELECT 
    product_id, 
    customer_id, 
    MAX(review_score) as review_score, 
    MAX(helpful_votes) as helpful_votes
FROM playground.product_reviews 
GROUP BY product_id, customer_id
ORDER BY product_id
LIMIT 100