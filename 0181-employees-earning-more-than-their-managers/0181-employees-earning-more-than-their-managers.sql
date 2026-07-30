# Write your MySQL query statement below
SELECT e1.name as "Employee" FROM Employee E JOIN Employee e1 ON E.id=e1.managerId 
WHERE e1.salary>E.salary;