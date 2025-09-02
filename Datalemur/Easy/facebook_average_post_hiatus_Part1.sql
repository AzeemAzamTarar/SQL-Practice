-- Question:

-- Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

-- Solution :

SELECT user_id,
(max(date(post_date)) - min(date(post_date))) as days_between
FROM posts
WHERE post_date between date('2021-01-01') AND date('2021-12-31')
GROUP BY user_id
HAVING COUNT(post_id) > 1