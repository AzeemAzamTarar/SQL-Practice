-- Question:

-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

-- Solution:

SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl on p.page_id = pl.page_id 
WHERE pl.page_id is NULL
ORDER BY p.page_id