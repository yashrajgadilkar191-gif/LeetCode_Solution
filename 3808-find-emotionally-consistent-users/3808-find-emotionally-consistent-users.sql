# Write your MySQL query statement below
SELECT R.user_id, reaction AS dominant_reaction, 
ROUND(COUNT(1) / CAST(MAX(total_reaction) AS  DECIMAL(10,2)),2) reaction_ratio
FROM reactions R
JOIN (SELECT user_id, COUNT(1) total_reaction FROM reactions GROUP BY user_id) C 
ON R.user_id = C.user_id
GROUP BY R.user_id, reaction
HAVING reaction_ratio >= 0.6 AND MAX(total_reaction) > 4
ORDER BY reaction_ratio DESC, user_id