-- CONCAT -- COMBINING THE COLUMNS --

SELECT first_name, last_name, 
CONCAT(first_name, ' ',  last_name) AS FULL_NAME
FROM employee_demographics
;
