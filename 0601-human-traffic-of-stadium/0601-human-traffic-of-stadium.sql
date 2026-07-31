# Write your MySQL query statement below

WITH T AS (SELECT *, id - row_number() OVER() AS id_diff FROM stadium WHERE people > 99)
SELECT id, visit_date, people FROM T
WHERE id_diff IN (SELECT id_diff FROM T GROUP BY id_diff HAVING count(*) > 2)
ORDER BY visit_date;