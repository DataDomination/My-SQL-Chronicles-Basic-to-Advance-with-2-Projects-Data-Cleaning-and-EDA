-- WHAT ARE STRING FUNCTIONS -- 

-- LENGHT FUNCTIONS --

SELECT LENGTH ('ADNAN SHAFIQ'); 

SELECT first_name, LENGTH(first_name) AS NO_CHAR
FROM employee_demographics
ORDER BY 2; 

SELECT UPPER('adnan shafiq'); 

SELECT LOWER('ADNAN SHAFQ'); 

SELECT CONCAT(
	   UCASE(SUBSTRING('adnan', 1,1)), LCASE(SUBSTRING('adnan', 2)), ' ',
       UCASE(SUBSTRING('shafiq', 1,1)), LCASE(SUBSTRING('shafiq', 2))
) AS ProperCase; 

SELECT first_name, UPPER(first_name) AS NAME_UPPER
FROM employee_demographics
ORDER BY 2; 

SELECT first_name,
 CONCAT(
	   UPPER(SUBSTRING(first_name, 1,1)),
       LOWER(SUBSTRING(first_name, 2))
) AS ProperCase
FROM employee_demographics
; 
