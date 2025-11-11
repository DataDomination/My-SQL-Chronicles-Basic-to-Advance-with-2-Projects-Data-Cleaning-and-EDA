-- WHERE STATEMENT -- 

SELECT * FROM employee_salary
WHERE first_name = "Bilal"
; 

SELECT * FROM employee_salary
WHERE salary >= 60000 
; 

SELECT * FROM employee_salary
WHERE salary < 60000 
; 

SELECT * FROM employee_demographics 
WHERE gender != "male"
;

SELECT * FROM employee_demographics 
WHERE birth_date < "1985-01-01"
;
