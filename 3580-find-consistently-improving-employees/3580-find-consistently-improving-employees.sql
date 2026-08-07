# Write your MySQL query statement below
WITH RankRev AS (SELECT p.employee_id, p.review_date, e.name, p.rating,
ROW_NUMBER() OVER (PARTITION BY p.employee_id ORDER BY p.review_date DESC) AS rn
FROM performance_reviews p JOIN employees e ON e.employee_id = p.employee_id),
Last3 AS (SELECT * FROM RankRev WHERE rn <= 3),
Increase AS (SELECT *,
LAG(rating, 1) OVER (PARTITION BY employee_id ORDER BY review_date) AS prev,
LAG(rating, 2) OVER (PARTITION BY employee_id ORDER BY review_date) AS prev2
FROM Last3)

SELECT employee_id, name, rating - prev2 AS improvement_score FROM Increase
WHERE prev2 IS NOT NULL AND rating > prev AND prev > prev2
ORDER BY improvement_score DESC, name;