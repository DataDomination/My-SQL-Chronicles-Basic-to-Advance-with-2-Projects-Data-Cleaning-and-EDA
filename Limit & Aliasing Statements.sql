-- LIMIT & ALIASING -- 

SELECT *
FROM employee_demographics
LIMIT 5
;

SELECT *
FROM employee_demographics
LIMIT 4, 2
;

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics 
Group by gender
HAVING avg_age > 35
;
