-- CASE STATEMENT -- LET'S YOU APPLY LOGIC TO YOU STATEMENT LIKE IF STATEMENTS -- 

SELECT 
	  first_name, 
      last_name, 
      age,
	CASE
	    WHEN age <= 30 THEN 'YOUNG PERSON' 
        ELSE 'ADULT'
	END AS AGE_STATUS
FROM employee_demographics;

SELECT 
	  first_name, 
      last_name, 
      age,
	CASE
	    WHEN age <= 30 THEN 'YOUNG PERSON' 
        WHEN age BETWEEN 40 AND 50 THEN 'OLD'
        WHEN age > 50 THEN 'MUMMYFIED' 
        ELSE 'ADULT'
	END AS AGE_STATUS
FROM employee_demographics;

-- PAY INCREASE AND BONUS -- 
-- < 50000 = 5% --
-- = 50000 = 6% --
-- > 50000 = 8% --
-- FINANCE TEAM WILL GET AN ADDITIONAL BONUS OF 10% -- FOR THEIR PERMANCES -- 

SELECT *
FROM city_departments;

SELECT first_name, last_name, salary, 
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary = 50000 THEN salary + (salary * 0.06) 
    WHEN salary > 50000 THEN salary + (salary * 0.08) 
END AS SALARY_INCREASE, 
CASE 
	WHEN dept_id = 6 THEN salary + (salary * 0.10)
END AS BONUS
FROM employee_salary
;
    
SELECT first_name, last_name, salary, 
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary = 50000 THEN salary * 1.06
    WHEN salary > 50000 THEN salary * 1.08
END AS SALARY_INCREASE, 
CASE 
	WHEN dept_id = 6 THEN salary * 1.10
END AS BONUS
FROM employee_salary
;
