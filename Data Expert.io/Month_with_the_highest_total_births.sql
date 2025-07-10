-- Question: Month with the Highest Total Births

-- Determine the month with the highest total number of births in the playground.us_birth_stats table. The output should show the month and the total number of births.

-- These are the tables to query for this question:

-- playground.us_birth_stats
    -- year int
    -- month int
    -- date_of_month int
    -- day_of_week int
    -- births int

-- Your answer should include these columns:
    -- month integer
    -- total_births integer


SELECT 
    month, 
    SUM(births) as total_births
FROM playground.us_birth_stats 
GROUP BY month
ORDER BY total_births desc
LIMIT 1