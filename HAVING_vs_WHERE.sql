---- Having vs Where
# filter out the aggregate entries 
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
Having AVG(age)>40
;

SELECT occupation, AVG(salary)
FROM employee_salary
GROUP BY occupation
Having AVG(salary)>50000
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%' # find the occupation includes manager
GROUP BY occupation # make them aggregate together 
Having AVG(salary)>75000 # find the manager occupation whose average salary if larger than 75000
;

