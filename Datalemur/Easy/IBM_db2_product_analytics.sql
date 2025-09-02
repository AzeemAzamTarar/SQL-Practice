-- Question: 

-- IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.
-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.

-- Solution:

With unique_queries as (
SELECT e.employee_id, 
       COALESCE(COUNT(DISTINCT q.query_id), 0) AS unique_queries
FROM employees e
LEFT JOIN queries q on e.employee_id = q.employee_id 
AND q.query_starttime >= ('2023-07-01') AND q.query_starttime < ('2023-10-01')
GROUP BY e.employee_id
)
SELECT unique_queries,
       COUNT( DISTINCT employee_id) as employee_count
FROM unique_queries
GROUP BY unique_queries
ORDER BY unique_queries
LIMIT 10;