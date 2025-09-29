--- CTEs:

# We want to create this subquiries by using CTE 
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
  ON dem.employee_id=sal.employee_id
GROUP BY gender;

# better readability compared to subquries 
WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
  ON dem.employee_id=sal.employee_id
GROUP BY gender
)
SELECT * # you can only use it right after you create it, this is temporary memory
FROM CTE_Example
;

# You can create multiple tables by CTE and join them together
WITH CTE_Example AS 
(
SELECT employee_id, gender,birth_date 
FROM employee_demographics dem
WHERE birth_date>'1985-01-01'
),
CTE_Example2 As 
(SELECT employee_id, salary
FROM employee_salary sal
WHERE salary>50000
)
SELECT * # you can only use it right after you create it, this is temporary memory
FROM CTE_Example
JOIN CTE_Example2
   ON CTE_Example.employee_id=CTE_Example2.employee_id
;






