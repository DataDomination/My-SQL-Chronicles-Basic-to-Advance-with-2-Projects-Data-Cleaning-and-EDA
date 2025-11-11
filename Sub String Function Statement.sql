-- SUB STRING --

SELECT first_name, birth_date,
LEFT (first_name, 4), 
RIGHT (first_name, 4),
SUBSTRING(birth_date, 6, 2) AS BIRTH_MONTH
FROM employee_demographics;
