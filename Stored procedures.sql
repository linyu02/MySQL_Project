-- STORED PROCEDURE # You can store forever and reuse it whenever you want
-- also how to input parameters to our stored procedures
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary 
WHERE salary>=50000;

CALL large_salaries();

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
SELECT *
FROM employee_salary 
WHERE salary>=50000;
SELECT *
FROM employee_salary 
WHERE salary>=10000;

END$$
DELIMITER ;

CALL large_salaries2()



### input parameters in our stored procedures

DELIMITER $$
CREATE PROCEDURE large_salaries5(p_employee_id INT)
BEGIN
SELECT salary
FROM employee_salary 
WHERE employee_id=p_employee_id
;
END$$
DELIMITER ;

CALL large_salaries5(1);

