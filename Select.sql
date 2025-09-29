SELECT * 
#select everything
FROM Parks_and_Recreation.employee_demographics;
#choose which folder.table, ; is telling my SQL my sentence stops here

SELECT first_name, last_name, birth_date
FROM Parks_and_Recreation.employee_demographics;
# choose the columns in the table 

SELECT first_name, 
last_name, 
birth_date,
age,
(age+10)*10 # you can do the calculations for the columns
FROM Parks_and_Recreation.employee_demographics;

# Distinct values within the columns
SELECT gender
FROM Parks_and_Recreation.employee_demographics;

SELECT DISTINCT gender 
FROM Parks_and_Recreation.employee_demographics;

SELECT DISTINCT first_name,gender
FROM Parks_and_Recreation.employee_demographics;



