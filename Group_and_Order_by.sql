--- Group By

SELECT gender 
FROM employee_demographics
GROUP BY gender 
;

SELECT first_name # If it is not aggregate, then we get error
FROM employee_demographics
GROUP BY gender 
;


# curious about the average age across gender
SELECT gender, AVG(age) # we need to select both columns first
FROM employee_demographics
GROUP BY gender 
;

# curious about the average, max, min, count age across gender
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) 
FROM employee_demographics
GROUP BY gender 
;

--- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name DESC
;

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC #be careful about the order of these features- how you want to orgranize these data
;

SELECT *
FROM employee_demographics
ORDER BY 5,4 # not recommended
;





