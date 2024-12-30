# Write your MySQL query statement below
WITH CTE AS(
    SELECT seller_id, order_date, item_id,
    RANK() OVER (PARTITION BY seller_id ORDER BY order_date) AS 'rnk'
    FROM Orders
),
ACTE AS(
    SELECT c.seller_id, c.item_id, i.item_brand FROM CTE c LEFT JOIN Items i USING (item_id) WHERE c.rnk = 2
)

SELECT u.user_id AS 'seller_id', (
    CASE
    WHEN u.favorite_brand = a.item_brand THEN 'yes'
    ELSE 'no'
    END
) AS '2nd_item_fav_brand' FROM Users u LEFT JOIN ACTE a ON u.user_id = a.seller_id