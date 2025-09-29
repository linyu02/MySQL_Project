-- Limit & ALison

SELECT  *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3 # the firt 3 row after the first two entries
;

SELECT  *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2,1 # the firt row after the first two entries
;

-- Aliasing

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age)>40;



