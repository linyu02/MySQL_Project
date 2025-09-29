-- Windows functions

--- compare group by and windows functions

# Group by
SELECT gender, AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
   on dem.employee_id = sal.employee_id
GROUP BY gender; 

# Window functions --- over
SELECT dem.first_name, dem.last_name, gender, salary, AVG(salary) OVER () ave_sal # have their own individual rows 
FROM employee_demographics dem
JOIN employee_salary sal
   on dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender, salary, AVG(salary) OVER (PARTITION BY gender) AS ave_sal_gender # have their own individual rows 
FROM employee_demographics dem
JOIN employee_salary sal
   on dem.employee_id = sal.employee_id;
   
SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS ave_salary
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id
Group by dem.first_name, dem.last_name, gender; #when group by (dem.first_name, dem.last_name, gender), data are breaken down by this vectors

SELECT dem.first_name, dem.last_name, gender, SUM(salary) OVER (PARTITION BY gender) AS sum_salary
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id;
     
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER (PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total # Adding new amount to existing amount
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id;
     
     
--- Special things that only windows can do:

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER() # won't repeat themselves
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id;
     
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender) # won't repeat themselves
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id;

# How to rank the salary from the highest to the lowest
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, #no duplicate
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,  # next number positioning, might have duplicates 
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num # next number numerically, might have duplicates 
FROM employee_demographics dem
JOIN employee_salary sal
     ON dem.employee_id = sal.employee_id;


