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
