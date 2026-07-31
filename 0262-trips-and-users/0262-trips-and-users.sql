# Write your MySQL query statement below
SELECT request_at AS Day,
ROUND(SUM(CASE WHEN status='cancelled_by_driver' OR status='cancelled_by_client' THEN 1 ELSE 0 END) / COUNT(request_at),2) AS "Cancellation Rate" 
FROM  Trips T JOIN Users C ON T.client_id=C.users_id AND C.banned='No'
JOIN Users U ON T.driver_id=U.users_id AND U.banned='No'
WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;
