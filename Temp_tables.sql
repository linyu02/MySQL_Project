--- Temporary Tables ( you apply more advanced data manipulations compared to CTES)
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Lin', 'Yu', 'Interstella');

# When you are using sessions, even if you open a new window, it still works. But if you exit the session, it no longer works
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
Where salary>=50000;




