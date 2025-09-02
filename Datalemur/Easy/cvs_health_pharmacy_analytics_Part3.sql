-- Question:

-- CVS Health wants to gain a clearer understanding of its pharmacy sales and the performance of various products.
-- Write a query to calculate the total drug sales for each manufacturer. Round the answer to the nearest million and report your results in descending order of total sales. In case of any duplicates, sort them alphabetically by the manufacturer name.
-- Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".

-- Solution:

SELECT manufacturer, CONCAT('$',sale,' million') as sales_mil
FROM (SELECT manufacturer, Round((sum(total_sales)/1000000)) as sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY sale DESC , manufacturer DESC) as subquery
