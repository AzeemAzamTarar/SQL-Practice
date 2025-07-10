-- Question: Find Viewers with Multiple Article Views in a Day

-- Find Viewers with Multiple Article Views in a Day
 
-- Using the table playground.views, 

    -- write a SQL query to identify all viewers who viewed more than one article on the same day. The table includes columns viewer_id (the ID of the viewer), article_id (the ID of the article viewed), and view_date (the date of the view). 
    -- The result should contain a single column named viewer_id, listing each viewer who meets the criteria without duplicates, and should be sorted in ascending order of viewer_id.

-- These are the tables to query for this question:

-- playground.views
    -- article_id int
    -- author_id int
    -- viewer_id int
    -- view_date date


with article_viewed_daily as (
SELECT 
  viewer_id,
  count(distinct article_id) as article_viewed, 
  view_date
FROM playground.views 
GROUP BY 1, 3
LIMIT 100
)
SELECT 
  viewer_id
FROM article_viewed_daily
WHERE article_viewed >= 2