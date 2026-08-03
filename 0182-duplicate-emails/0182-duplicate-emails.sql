# Write your MySQL query statement below
SELECT Email 
FROM (SELECT email AS "Email",COUNT(email) AS "CON" FROM Person GROUP BY email) T
WHERE CON>1;