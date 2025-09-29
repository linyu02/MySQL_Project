--- Triggers and Events
# Trigger: when introducing new entries from table A to B, very useful
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES(NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary(employee_id, first_name, last_name, occupation, 
salary, dept_id)
VALUES(13, "MM", "XX", 'DATA SCIENTIST', 1000000, NULL);

--- EVENTS GOOD FOR AUTOMATION

# retire people age>65 

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retiree
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN 
	SELECT *
	FROM employee_demographics
    WHERE age>=60;
END $$
DELIMITER ;

SELECT *
FROM employee_demographics
WHERE age >= 60;

SHOW VARIABLES LIKE 'event%';


