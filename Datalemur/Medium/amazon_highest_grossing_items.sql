-- Question:

-- Assume you're given a table containing data on Amazon customers and their spending on products in different category, write a query to identify the top two highest-grossing products within each category in the year 2022. The output should include the category, product, and total spend.

-- Solution:

SELECT category, product, total_spend
FROM (
SELECT category, product, SUM(spend) as total_spend,
ROW_NUMBER() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) as rank
FROM product_spend
WHERE transaction_date BETWEEN date('2022-01-01') AND date('2022-12-31')
GROUP BY category, product
) as sub_query
WHERE rank <= 2
ORDER BY category, rank