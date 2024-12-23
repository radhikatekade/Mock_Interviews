WITH CTE AS(
    SELECT product_id, MIN(year) AS 'year'
    FROM Sales
    GROUP BY product_id
)

SELECT p.product_id, p.year AS 'first_year', p.quantity, p.price
FROM Sales p JOIN CTE c ON p.product_id = c.product_id
WHERE p.year = c.year