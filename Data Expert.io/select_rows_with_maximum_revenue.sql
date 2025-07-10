-- Question: Select Rows With Maximum Revenue

-- Using the table playground.revenue, write a SQL query to select rows from a given table that have the maximum revenue value for each id. The resultant table should have three columns - "id", "rev", "content". Additionally, the results should be ordered in descending order by revenue.

-- These are the tables to query for this question:

-- playground.revenue
    -- id int
    -- rev int
    -- content string


-- Your answer should include these columns:
    -- id integer
    -- rev integer
    -- content varchar


with max_rev as (
SELECT 
    id, 
    MAX(rev) as rev
FROM playground.revenue 
GROUP BY id
)

SELECT 
    mr.id, 
    mr.rev, 
    r.content
FROM max_rev mr
INNER JOIN playground.revenue r on mr.id = r.id and mr.rev = r.rev
ORDER BY mr.rev DESC
