--- JOINS
---- INNER JOIN
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal # only bring the rows with the same employee_id
   ON dem.employee_id = sal.employee_id
;

# select the actual column
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal # only bring the rows with the same employee_id
   ON dem.employee_id = sal.employee_id
;

--- LEFT JOIN
SELECT *
FROM employee_demographics AS dem # left table 
LEFT JOIN employee_salary AS sal # only bring the rows in the right table  with the same employee_id
   ON dem.employee_id = sal.employee_id
;
--- LEFT JOIN
SELECT *
FROM employee_demographics AS dem # left table 
RIGHT JOIN employee_salary AS sal # only bring the rows in the right table  with the same employee_id
   ON dem.employee_id = sal.employee_id
;

--- SELF JOIN
SELECT *
FROM employee_salary;

# when we need to match two person together and makes one of them to be the secret santa
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
   ON emp1.employee_id +1 = emp2.employee_id
;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
   ON emp1.employee_id +1 = emp2.employee_id
; # Notice that one row is missing, because the largest employee_id will never have a match (since no larger id exists).

--- JOIN multiple tables together

SELECT *
FROM employee_demographics as dem
JOIN employee_salary as sal
   on dem.employee_id=sal.employee_id
INNER JOIN parks_departments pd
   on sal.dept_id=pd.department_id
;




