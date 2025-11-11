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
