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
