# Write your MySQL query statement below
WITH CTE AS(
    SELECT m1.first_player AS 'player_id', m1.first_score AS 'score' FROM Matches m1
    UNION ALL
    SELECT m2.second_player AS 'player_id', m2.second_score AS 'score' FROM Matches m2
),
ACTE AS(
    SELECT c.player_id, p.group_id, SUM(c.score) AS 'total' 
    FROM CTE c JOIN Players p USING(player_id) GROUP BY c.player_id)

SELECT DISTINCT a.group_id, FIRST_VALUE(a.player_id) OVER 
(PARTITION BY a.group_id ORDER BY a.total DESC, a.player_id) AS 'player_id' FROM ACTE a