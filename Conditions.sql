--- Conditions
SELECT *
FROM employee_salary
WHERE salary <=50000
;

SELECT *
FROM employee_demographics
WHERE gender !='Female'
;

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

--- And or not --- Logical Operations
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender ='Male'
;
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender ='Male'
;

SELECT *
FROM employee_demographics
WHERE (first_name='Leslie' AND age=44) OR age>55
;

--- Like statement
--- % and _ 
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%' # % means anything after it/ before it
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%' # % means anything after it
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__' # _ denoted as a space holder
;

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__%' # _ denoted as a space holder
;

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;


