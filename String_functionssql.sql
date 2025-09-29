--- String Function
SELECT LENGTH('skyfall')
; 


SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY LENGTH(first_name)
;

SELECT UPPER('sky');
SELECT LOWER('sky');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

--- TRIM

SELECT TRIM('     sky     ');
SELECT LTRIM('     sky     ');
SELECT RTRIM('     sky     ');

# get the substring 
SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics
;

SELECT first_name,
 LEFT(first_name, 4),
 RIGHT(first_name, 4),
 birth_date
FROM employee_demographics
;

SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics
;

--- Replace
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;

SELECT LOCATE('x','Alexander'); # locate x in our input word

SELECT first_name, LOCATE('an', first_name)
FROM employee_demographics
;

SELECT first_name, last_name, 
CONCAT(first_name,' ', last_name) AS full_name
FROM employee_demographics
;




