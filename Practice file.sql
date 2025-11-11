-- WHERE CLAUSE -- 

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

-- AND, OR & OR NOT -- LOGICAL OPERATORS --

SELECT * FROM employee_demographics 
WHERE birth_date > "1985-01-01"
AND gender = "Male"
;

SELECT * FROM employee_demographics 
WHERE birth_date > "1985-01-01"
OR gender = "Male"
;

SELECT * FROM employee_demographics 
WHERE birth_date > "1985-01-01"
OR NOT gender = "Male"
;

-- LIKE STATEMENT % AND _ --

SELECT * FROM employee_demographics 
WHERE first_name LIKE 'A%'
;

SELECT * FROM employee_demographics 
WHERE first_name LIKE 'Z___'
;

-- GROUP BY -- 

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, salary
FROM employee_salary
GROUP BY Occupation, salary
;

-- ORDER BY --

SELECT *
FROM employee_demographics
ORDER BY first_name DESC 
;

SELECT * 
FROM employee_demographics
ORDER BY 5, 4
;

SELECT * 
FROM employee_demographics
ORDER BY gender, age ASC
;

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

-- STRING TRIM FUCTIONS --

SELECT TRIM('   ADNAN SHAFIQ    ');

SELECT LTRIM('   ADNAN SHFAIQ'); 

SELECT RTRIM('ADNAN SHAFIQ    ');

-- SUB STRING --

SELECT first_name, birth_date,
LEFT (first_name, 4), 
RIGHT (first_name, 4),
SUBSTRING(birth_date, 6, 2) AS BIRTH_MONTH
FROM employee_demographics;

-- REPLACE -- WILL BE USED TO REPLACE A CHARACTER WITH SPECIFIC CHARACTER YOU DESIRE OR WANT -- 

SELECT first_name, replace(first_name, 'A', 'Z')
FROM employee_demographics
;

-- LOCATE FUNCTION -- 

SELECT LOCATE ('N', 'ADNAN SHAFIQ');

SELECT first_name, LOCATE('AD', first_name)
FROM employee_demographics
;

-- CONCAT -- COMBINING THE COLUMNS --

SELECT first_name, last_name, 
CONCAT(first_name, ' ',  last_name) AS FULL_NAME
FROM employee_demographics
;

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

-- WINDOW FUNCTIONS --
-- Window functions are like GROUP BY, but they don't roll everything into one row.
-- They allow us to look at partitions (groups) while keeping each row unique.
-- They also offer ROW_NUMBER, RANK, and DENSE_RANK functionality.

-- Example 1: Basic GROUP BY
SELECT gender, AVG(salary) AS AVG_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY gender;

-- Example 2: GROUP BY with names included
SELECT Demo.first_name, Demo.last_name, gender, AVG(salary) AS AVG_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY Demo.first_name, Demo.last_name, gender;

-- GROUP BY rolls everything up into one row per group.
-- WINDOW FUNCTIONS allow row-level detail.

-- Example 3: Average salary over all employees (no partition)
SELECT gender, AVG(salary) OVER () AS Avg_Salary_All
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 4: Average salary partitioned by gender
SELECT gender, AVG(salary) OVER (PARTITION BY gender) AS Avg_Salary_By_Gender
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 5: Include names with partitioned average
SELECT Demo.first_name, Demo.last_name, gender,
       AVG(salary) OVER (PARTITION BY gender) AS Avg_Salary_By_Gender
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 6: Using SUM() over partitions instead of AVG()
SELECT Demo.first_name, Demo.last_name, gender,
       SUM(salary) OVER (PARTITION BY gender) AS Total_Salary_By_Gender
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 7: Rolling total (cumulative sum) within gender partition
SELECT Demo.first_name, Demo.last_name, gender, salary,
       SUM(salary) OVER (PARTITION BY gender ORDER BY Demo.employee_id) AS Rolling_Total
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 8: ROW_NUMBER() assigns a unique ID to each row
SELECT Demo.employee_id, Demo.first_name, Demo.last_name, gender, salary,
       ROW_NUMBER() OVER () AS Row_No
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 9: ROW_NUMBER() restarting for each gender
SELECT Demo.employee_id, Demo.first_name, Demo.last_name, gender, salary,
       ROW_NUMBER() OVER (PARTITION BY gender ORDER BY Demo.employee_id) AS Row_No
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 10: Rank employees by highest salary within each gender
SELECT Demo.employee_id, Demo.first_name, Demo.last_name, gender, salary,
       ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS Row_No
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 11: Compare ROW_NUMBER vs RANK
SELECT Demo.employee_id, Demo.first_name, Demo.last_name, gender, salary,
       ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS Row_No,
       RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS Rank_No
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- Example 12: Add DENSE_RANK for comparison
SELECT Demo.employee_id, Demo.first_name, Demo.last_name, gender, salary,
       ROW_NUMBER() OVER (PARTITION BY gender ORDER BY salary DESC) AS Row_No,
       RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS Rank_No,
       DENSE_RANK() OVER (PARTITION BY gender ORDER BY salary DESC) AS Dense_Rank_No
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id;

-- A Common Table Expression (CTE) is a temporary, named result set.--
-- created using the WITH keyword and used within a single SQL statement.--
-- It helps make complex queries easier to read and manage.--

-- Key characteristics of CTEs:
-- Temporary: CTEs are not stored as permanent database objects. Their existence is limited to the execution of the single statement in which they are defined.
-- Named: You assign a name to each CTE, allowing you to reference it in the subsequent parts of your main query.
-- Defined with WITH clause: CTEs are introduced using the WITH keyword, followed by the CTE name and its defining query.
-- Improved Readability and Organization: They help organize complex queries by breaking them into logical units, making the code easier to understand and maintain.
-- Reusability within a single query: You can reference a CTE multiple times within the same main query.
-- Recursive Capabilities: CTEs can be self-referencing, allowing you to create recursive queries for tasks like traversing hierarchical data (e.g., organizational charts).\ 

SELECT AVG_Salary
FROM (SELECT gender, 
AVG(salary) AS AVG_Salary,
MAX(salary) AS MAX_Salary,
MIN(salary) AS MIN_Salary,
Count(salary) AS C_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY gender) AS AVG_Table
GROUP BY gender ;

-- __________________________________________________________________ --

WITH CTE AS 
(SELECT gender, 
AVG(salary) AS AVG_Salary,
MAX(salary) AS MAX_Salary,
MIN(salary) AS MIN_Salary,
Count(salary) AS C_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY gender) 
SELECT AVG_Salary
FROM CTE ;

WITH CTE (Gender, AVG_Salary, MAX_Salary, MIN_Salary, C_Salary) AS
(SELECT gender, 
AVG(salary) AS AVG_Salary,
MAX(salary) AS MAX_Salary,
MIN(salary) AS MIN_Salary,
Count(salary) AS C_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY gender) 
SELECT *
FROM CTE ;

WITH CTE  AS
(SELECT gender, 
AVG(salary) AS AVG_Salary,
MAX(salary) AS MAX_Salary,
MIN(salary) AS MIN_Salary,
Count(salary) AS C_Salary
FROM employee_demographics AS Demo
JOIN employee_salary AS ESal
    ON Demo.employee_id = ESal.employee_id
GROUP BY gender) 
-- __________________________________________________________________________ --

WITH CTE AS (
    SELECT employee_id, gender, birth_date
    FROM employee_demographics AS Demo
    WHERE birth_date > '1980-01-01'
),
CTE_2 AS (
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary >= 60000
)
SELECT *
FROM CTE
JOIN CTE_2
    ON CTE.employee_id = CTE_2.employee_id;
    

WITH CTE AS (
    SELECT employee_id, gender, birth_date
    FROM employee_demographics
    WHERE birth_date > '1980-01-01'
),
CTE_2 AS (
    SELECT employee_id, salary
    FROM employee_salary
    WHERE salary >= 60000
)
SELECT *
FROM CTE
JOIN CTE_2
ON CTE.employee_id = CTE_2.employee_id;
    
-- TEMPORARY TABLE ARE ONLY AVAILABLE FOR TEMPORARY SESSION AND ONCE YOU EXIT SQL AND RE-ENTER SQL YOU WON'T SEE THEM-- 
-- THEY ARE MOSTLY USE FOR CHECK THE DATA TEMPORARILY & FOR MANUPULATING DATA FOR CHECKING IN MYSQL; NOT FOR PERMANENT USE CASE -- 
-- IT LIVES IN MEMORY OF OUR COMPUTER OR MACHINE NOT STORED IN HARDDRIVE --
    

CREATE TEMPORARY TABLE temp_table4
( first_name VARCHAR (50), 
  last_name VARCHAR (50),
  home_address VARCHAR (100) 
);

INSERT INTO temp_table4 (First_Name, Last_Name, Home_Address) 
VALUES ('Adnan', 'Shafiq', 'House No A-15, Military Society, New Bronzewick, California'); 

SELECT * 
FROM temp_table4; 

-- CREATING TEMPORARY TABLE WITH IN THE EXISTING TABLE -- 

CREATE TEMPORARY TABLE  SALARY_OVER_60K 
SELECT * 
FROM employee_salary
WHERE salary >= 60000
;

SELECT * 
FROM SALARY_OVER_60K
   
-- STORED PROCEDURES ARE A WAY TO SAVE YOUR SQL CODE AND YOU CAN USE IT OVER AND OVER -- 
-- DELIMITERS $$ OR // FOR STORING  MORE THAN 1 STORE PROCEDURES IN SQL -- In SQL, a delimiter is a special character or sequence of characters that signals the end of an 
-- SQL statement or a block of code to the SQL interpreter.--
-- ALTERED STORE PROCES BY RIGHT CLICKING ON THE STORED PROCEDURES IN THE SCHEMAS SECTION --     

DELIMITER $$

CREATE PROCEDURE MAXIMUM_SALARY ()
BEGIN 
	SELECT * 
    FROM employee_salary
    WHERE salary >= 65000; 
END $$ 

DELIMITER ; 

CALL MAXIMUM_SALARY();

DELIMITER $$

CREATE PROCEDURE MAXIMUM_SALARY ()
BEGIN 
	SELECT * 
    FROM employee_salary
    WHERE salary >= 65000; 
    SELECT * 
    FROM employee_salary
    WHERE salary >= 10000; 
END $$ 

DELIMITER ; 

    
 CALL SPARTAN_BOMB ();   
    
 call city_development_agency.`SPARTAN BOMB`();   
    
 -- TRIGGERS AND EVENTS -- A TRIGGER IS A BLOCK OF CODE WHICH EXECUTE AUTOMATICALLY WHEN A PARTICULAR EVENT TAKE PLACE -- 

-- TRIGGER --   

DELIMITER $$
CREATE TRIGGER NEW_EMPLOYEE 
		AFTER INSERT ON employee_salary 
        FOR EACH ROW 
BEGIN 
	INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUE (NEW.employee_id, NEW.first_name, NEW.last_name); 
END $$ 

DELIMITER ;
    
SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;    

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUE (13, 'Adnan', 'Shafiq', 'CEO', 100000, NULL);    
    
-- EVENTS -- IT JUST LIKE A TRIGGER BUT IT IS EXECUTED ON SCHEDULE UNLIKE AN TRIGGER WHICH HAPPENS WHEN A EVENT TAKE PLACE -- 
-- WHEN YOU ARE IMPORTING DATA OR EXPORTING DATA TO SPECIFIC FILE PATH YOU USE AN EVENT TO DO THE TASK AUTOMATICALLY AS PER THE SCHEDULE --

-- CREATE AN EVENT FOR THOSE PEOPLE WHO WILL BE 50 EVERY DAY OR ON A SCHEDULE AND THIS WILL BE DELETED FROM THE TABLE AND THEY WILL RETIRED -- 
 
    
  SELECT * 
  FROM employee_demographics ;


DELIMITER $$ 
CREATE EVENT Remove_Retire_Person 
ON SCHEDULE EVERY 30 SECOND 
DO
BEGIN 
	DELETE  
    FROM employee_demographics
    WHERE age >= 50; 
END $$ 
DELIMITER ;

SHOW VARIABLES LIKE 'event';
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    







