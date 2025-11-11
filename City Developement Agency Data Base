-- ------------------------------------------------------------
-- STEP 1: Delete the database if it already exists
-- ------------------------------------------------------------
DROP DATABASE IF EXISTS City_Development_Agency;
-- ------------------------------------------------------------
-- STEP 2: Create a new database
-- ------------------------------------------------------------
CREATE DATABASE City_Development_Agency;
-- ------------------------------------------------------------
-- STEP 3: Select (use) the database
-- ------------------------------------------------------------
USE City_Development_Agency;
-- ------------------------------------------------------------
-- STEP 4: Create table for employee demographic details
-- ------------------------------------------------------------
CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,           -- Unique ID for each employee
  first_name VARCHAR(50),             -- Employee’s first name
  last_name VARCHAR(50),              -- Employee’s last name
  age INT,                            -- Employee’s age
  gender VARCHAR(10),                 -- Gender information (Male/Female/Other)
  birth_date DATE,                    -- Employee’s date of birth
  PRIMARY KEY (employee_id)           -- Primary Key (ensures each ID is unique)
);
-- ------------------------------------------------------------
-- STEP 5: Create table for employee salary and job information
-- ------------------------------------------------------------
CREATE TABLE employee_salary (
  employee_id INT NOT NULL,           -- Employee ID (links to employee_demographics)
  first_name VARCHAR(50) NOT NULL,    -- Employee’s first name (for easy reference)
  last_name VARCHAR(50) NOT NULL,     -- Employee’s last name
  occupation VARCHAR(50),             -- Job title or designation
  salary INT,                         -- Salary amount
  dept_id INT                         -- Department ID (links to city_departments)
);
-- ------------------------------------------------------------
-- STEP 6: Insert records into employee_demographics table
-- ------------------------------------------------------------
INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1, 'Adeel', 'Sheikh', 45, 'Male', '1978-11-23'),
(2, 'Zara', 'Ali', 31, 'Female', '1992-06-14'),
(3, 'Hamza', 'Rauf', 38, 'Male', '1985-04-09'),
(4, 'Noor', 'Khalid', 27, 'Female', '1996-09-11'),
(5, 'Bilal', 'Akram', 50, 'Male', '1973-12-02'),
(6, 'Sana', 'Rasheed', 42, 'Female', '1981-08-21'),
(7, 'Tariq', 'Mehmood', 36, 'Male', '1987-02-18'),
(8, 'Iqra', 'Hassan', 29, 'Female', '1994-07-04'),
(9, 'Ahmad', 'Zeeshan', 40, 'Male', '1983-05-22'),
(10, 'Farah', 'Latif', 34, 'Female', '1989-03-14'),
(11, 'Usman', 'Qureshi', 33, 'Male', '1990-10-07'),
(12, 'Hira', 'Shahid', 28, 'Female', '1995-04-19');
-- ------------------------------------------------------------
-- STEP 7: Insert records into employee_salary table
-- ------------------------------------------------------------
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Adeel', 'Sheikh', 'Director of City Development', 95000, 1),
(2, 'Zara', 'Ali', 'Infrastructure Analyst', 62000, 2),
(3, 'Hamza', 'Rauf', 'Public Safety Officer', 54000, 3),
(4, 'Noor', 'Khalid', 'Healthcare Coordinator', 57000, 4),
(5, 'Bilal', 'Akram', 'Chief Financial Officer', 88000, 6),
(6, 'Sana', 'Rasheed', 'City Engineer', 73000, 2),
(7, 'Tariq', 'Mehmood', 'Education Consultant', 65000, 5),
(8, 'Iqra', 'Hassan', 'Finance Executive', 60000, 6),
(9, 'Ahmad', 'Zeeshan', 'Urban Planner', 70000, 1),
(10, 'Farah', 'Latif', 'Health Officer', 55000, 4),
(11, 'Usman', 'Qureshi', 'Operations Specialist', 60000, 3),
(12, 'Hira', 'Shahid', 'Business Analyst', 60000, 6);
-- ------------------------------------------------------------
-- STEP 8: Create table for city departments
-- ------------------------------------------------------------
CREATE TABLE city_departments (
  department_id INT NOT NULL AUTO_INCREMENT,  -- Auto ID for each department
  department_name VARCHAR(50) NOT NULL,       -- Department’s name
  PRIMARY KEY (department_id)                 -- Primary Key for department
);
-- ------------------------------------------------------------
-- STEP 9: Insert records into city_departments table
-- ------------------------------------------------------------
INSERT INTO city_departments (department_name)
VALUES
('City Development'),
('Infrastructure'),
('Public Safety'),
('Healthcare'),
('Education'),
('Finance');
-- ------------------------------------------------------------
-- STEP 10: Verify all tables are created
-- ------------------------------------------------------------
SHOW TABLES;
-- ------------------------------------------------------------
-- STEP 11: View all data from each table
-- ------------------------------------------------------------
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;
SELECT * FROM city_departments;
-- ------------------------------------------------------------
-- STEP 12: Join all three tables to see full employee information
-- ------------------------------------------------------------
CREATE TABLE Consolidated_Table AS
SELECT 
  e.first_name,
  e.last_name,
  e.age,
  s.occupation,
  s.salary,
  d.department_name
FROM employee_demographics e
JOIN employee_salary s ON e.employee_id = s.employee_id
JOIN city_departments d ON s.dept_id = d.department_id;

SELECT * FROM Consolidated_Table;




























