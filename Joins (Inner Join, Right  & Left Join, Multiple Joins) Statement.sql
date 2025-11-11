-- JOINS --

SELECT * 
FROM employee_demographics; 

SELECT * 
FROM employee_salary;

-- INNER JOIN -- 

SELECT * 
FROM employee_demographics
INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
; 

SELECT * 
FROM employee_demographics AS Demo
INNER JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
; 

SELECT Demo.employee_id, age, gender, occupation
FROM employee_demographics AS Demo
INNER JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
; 

-- LEFT & RIGHT JOINS -- 

SELECT *
FROM employee_demographics AS Demo
LEFT JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
; 

SELECT *
FROM employee_demographics AS Demo
RIGHT JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
; 

-- SELF JOIN -- IT TIES IT SELF --

SELECT *
FROM employee_salary AS EMP1
JOIN employee_salary AS EMP2
	ON EMP1.employee_id + 1 = EMP2.employee_id
; 

SELECT EMP1.employee_id AS Team1_ID, 
EMP1.first_name AS First_Name_Team1,
EMP1.last_name AS last_Name_Team1,
EMP2.employee_id AS Team2_ID, 
EMP2.first_name AS First_Name_Team2,
EMP2.last_name AS last_Name_Team2
FROM employee_salary AS EMP1
JOIN employee_salary AS EMP2
	ON EMP1.employee_id + 1 = EMP2.employee_id
; 

-- JOINING MULTIPLE TABLES TOGETHER -- INNER JOIN --

-- REFERENCE TABLE -- WE HAVE THESE DEPARTEMENT NAME -- 

SELECT * FROM city_departments;

SELECT * 
FROM employee_demographics AS Demo 
INNER JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
;

SELECT * 
FROM employee_demographics AS Demo 
INNER JOIN employee_salary AS ESalary
	ON Demo.employee_id = ESalary.employee_id
INNER JOIN city_departments AS CD
	ON ESalary.dept_id = CD.department_id
;
