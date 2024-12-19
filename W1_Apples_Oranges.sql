SELECT s1.sale_date, (IFNULL(s1.sold_num, 0) - IFNULL(s2.sold_num, 0)) AS 'diff'
FROM sales s1, sales s2
WHERE s1.sale_date = s2.sale_date AND s1.fruit = 'apples' 
AND s2.fruit = 'oranges'
ORDER BY s1.sale_date