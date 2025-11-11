-- ORDER BY --

SELECT *
FROM employee_demographics
ORDER BY first_name DESC 
;

SELECT * 
FROM employee_demographics
ORDER BY 5, 4
;

SELECT * 
FROM employee_demographics
ORDER BY gender, age ASC
;
