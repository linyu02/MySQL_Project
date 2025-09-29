-- Case statement
SELECT first_name, last_name, age,
CASE 
    WHEN age<=30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age>=50 THEN "On Death's Door"
END AS AGE_Bracket
FROM employee_demographics
;

-- Pay increase and Bonus
--- <=50000 =5%
---- >50000=7%
--- Finance =10%

SELECT first_name, last_name, salary,
CASE 
    WHEN salary <=50000 THEN salary+salary*0.05 
    WHEN salary >50000 THEN salary+salary*0.07
END AS new_salary
FROM employee_salary
; 


SELECT first_name, last_name, salary, dept_id,
CASE 
    WHEN dept_id=6 THEN salary*0.1 
END AS Bonus
FROM employee_salary
;