-- SUBQUERIES -- A QUERY WITH IN ANOTHER QUERY -- DIFFERENT VARIACE -- FROM -- WHERE -- SELECT -- 

SELECT * 
FROM employee_demographics;
    
SELECT * 
FROM employee_salary;

SELECT * 
FROM city_departments;

SELECT * 
FROM employee_demographics
WHERE employee_id IN 
					(SELECT employee_id
                     FROM employee_salary
                     WHERE dept_id = 2)
;

SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary; 

SELECT 
	first_name, 
    salary, 
  (SELECT AVG(salary) FROM employee_salary) AS AVG_Salary
FROM employee_salary ;

SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender; 

SELECT *
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS Avg_Table ; 

SELECT gender, AVG(`MAX(age)`)
FROM 
(SELECT gender, AVG(age), MAX(age), MIN(age), Count(age)
FROM employee_demographics
GROUP BY gender) AS Avg_Table 
GROUP BY gender
; 

SELECT gender, AVG(Max_Age)
FROM 
(SELECT gender, 
AVG(age) AS AVG_age, 
MAX(age) AS Max_age, 
MIN(age) AS Min_Age, 
Count(age) AS C_Age
FROM employee_demographics
GROUP BY gender) AS Avg_Table 
GROUP BY gender
; 
