-- UNION STATEMENT FOR COMBINING ROWS --

SELECT first_name, Last_name
FROM employee_demographics
UNION DISTINCT 
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, Last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

SELECT first_name, last_name, 'OLD MALE' AS Label_Status 
FROM employee_demographics
WHERE AGE > 40 AND GENDER  = 'MALE'
UNION
SELECT first_name, last_name, 'OLD FEMALE'AS Label_Status
FROM employee_demographics
WHERE AGE > 40 AND GENDER  = 'FEMALE'
UNION
SELECT first_name, last_name, 'HIGHLY PAID' AS Label_Status 
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;
