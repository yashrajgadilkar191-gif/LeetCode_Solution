# Write your MySQL query statement below
SELECT id,count(id) as num from(SELECT requester_id AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted) t
GROUP BY id ORDER BY count(id) DESC LIMIT 1;
