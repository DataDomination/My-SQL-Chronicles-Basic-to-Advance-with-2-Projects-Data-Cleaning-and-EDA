-- HAVING VS GROUP --

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender 
HAVING AVG(age) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%BUSINESS ANALYST%'
GROUP BY occupation
HAVING AVG (salary) >= 60000
;
