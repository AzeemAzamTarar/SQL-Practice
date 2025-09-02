-- Question: 

-- Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.
-- Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.
-- Notes:
-- Calculate the following percentages:
-- time spent sending / (Time spent sending + Time spent opening)
-- Time spent opening / (Time spent sending + Time spent opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.

-- Solution:

with timespent_cte as (
SELECT ab.age_bucket,
  SUM(CASE WHEN a.activity_type = 'send' THEN time_spent end) as sum_send_timespent,
  SUM(CASE WHEN a.activity_type = 'open' THEN time_spent end) as sum_open_timespent
FROM activities a
LEFT JOIN age_breakdown ab on a.user_id = ab.user_id
GROUP BY 1)

SELECT age_bucket, Round((sum_send_timespent / (sum_send_timespent + sum_open_timespent)) * 100.0 ,2) as send_perc,
 Round((sum_open_timespent / (sum_send_timespent + sum_open_timespent)) * 100.0 ,2) as open_perc
FROM timespent_cte