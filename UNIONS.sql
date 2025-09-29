-- UNION

# union of distinct, remove all the duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;

# union of distinct with removing all the duplicates
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

# Add multiple filters and combine rows from different tables together

SELECT first_name, last_name, 'OLD MAN' AS Lable
FROM employee_demographics
WHERE age>40 AND gender='Male'
UNION
SELECT first_name, last_name, 'OLD Lady' AS Lable
FROM employee_demographics
WHERE age>40 AND gender='female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Lable
FROM employee_salary
WHERE salary>70000
ORDER BY first_name, last_name
;






