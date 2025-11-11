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
