# Write your MySQL query statement below
WITH employee_department AS
(SELECT D.id,D.name AS Department,salary AS Salary,E.name AS Employee, 
DENSE_RANK()OVER(PARTITION BY D.id ORDER BY E.salary DESC) AS rnk
FROM Department D JOIN Employee E ON D.id=E.departmentId)
SELECT Department, Employee, Salary
FROM employee_department
WHERE rnk <= 3;