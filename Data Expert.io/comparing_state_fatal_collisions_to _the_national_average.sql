-- Question: Comparing State Fatal Collisions to the National Average

-- Using playground.bad_drivers, write a SQL query to compare each state’s fatal collisions per billion miles to the national average. Include a column that indicates whether the state is "Above Average" or "Below Average". The resultant table should have three columns, "state", "fatal_collisions_per_billion_miles" and "comparison_to_national_avg". Show the result ordered by state name asc.

-- These are the tables to query for this question:

-- playground.bad_drivers
    -- state string
    -- fatal_collisions_per_billion_miles double
    -- percent_speeding int
    -- percent_alcohol_impaired int
    -- percent_not_distracted int
    -- percent_no_previous_accidents int
    -- insurance_premiums double
    -- losses_per_insured_driver double


-- Your answer should include these columns:
    -- state varchar
    -- fatal_collisions_per_billion_miles double
    -- comparison_to_national_avg varchar


WITH avg_cte AS (
  SELECT 
    ROUND(CAST (AVG(fatal_collisions_per_billion_miles) as double), 2) AS avg_fatal
  FROM playground.bad_drivers
),

data_cte AS (
  SELECT 
    state, 
    fatal_collisions_per_billion_miles
  FROM playground.bad_drivers
)

SELECT 
  d.state,
  d.fatal_collisions_per_billion_miles,
  CASE 
    WHEN d.fatal_collisions_per_billion_miles > a.avg_fatal THEN 'Above Average'
    WHEN d.fatal_collisions_per_billion_miles < a.avg_fatal THEN 'Below Average'
    ELSE 'On Average'
  END AS comparison_to_national_avg
FROM data_cte d
CROSS JOIN avg_cte a
ORDER BY d.state
