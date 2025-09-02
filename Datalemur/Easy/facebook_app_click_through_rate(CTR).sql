Question: 

-- Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
-- Definition and note:
-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.

-- Solution:

with cte as (
SELECT app_id ,
SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS impressions,
SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS clicks
FROM events
WHERE DATE(timestamp) BETWEEN date('01-01-2022') AND date('12-31-2022')
GROUP BY app_id )

SELECT app_id, ROUND((100.0 * clicks / impressions)::numeric, 2) AS ctr
FROM cte;