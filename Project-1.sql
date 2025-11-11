-- DATA SET WE WILL BE USING WORD WIDE LAYOFFS -- LINK WILL BE SHARED FOR THE DATA SET -- IT IS COPYRIGHT FREE SO, YOU CAN USE THIS DATA FOR YOUR OWN PROJECT -- 
-- WE WILL FIRST CREATE THE DATA BASE FROM THE SCHEMAS COLUMN -- 
-- AND IMPORT THE DATA FROM MY MACHING -- 
-- DATA BASE CREATION --  

SELECT * 
FROM layoffs; 

-- DATA WEANGLING AND PRE-PROCESSING FOR CLEAINING THE DATA SET AND MOVING TOWARDS THE 2ND PROJECT WHICH EDA -- 
-- 1. REMOVE ALL OF THE DUPLICATES IN THE DATA SET BY CHECKING -- 
-- 2. STANDARDIZE THE DATA SET BY THAT I MEAN THAT I WILL UPDATE &  MODIFY THE DATA -- 
-- 3. NULL VALUES OR BANK VALUES --  
-- 4. REMOVE ANY COLUMNS OR ROWS WHICH ARE NOT REQUIRED IN THIS DATA SET -- 

-- WHILE STARTING THE PROJECT WHAT WE ARE GOING TO DO IS WE WILL NOT WORK THE ORIGINAL DATA SET INSTEAD WE WILL WORK ON IT'S DUPLICATES -- 
-- WE WILL COPY THE TABLE FIRST AND THAN START OUR WORK IN STAGES -- 

-- PROCESS THE DATA TABLE IN STAGING -- 

CREATE TABLE 1layoffs
LIKE layoffs;   

SELECT * 
FROM 1layoffs; 

INSERT 1layoffs 
SELECT * 
FROM layoffs; 

-- ____________________________________________--

SELECT * 
FROM 1layoffs; 

SELECT * ,
ROW_NUMBER () OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_no 
FROM 1layoffs;
 
SELECT * 
FROM 1layoffs
WHERE company = 'e Inc.'; 

SELECT * 
FROM 1layoffs
WHERE TRIM(lower(company)) = 'e inc.';

WITH duplicate_cte AS
(
 SELECT * ,
 ROW_NUMBER () OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_no 
 FROM 1layoffs
)
SELECT * 
FROM duplicate_cte 
WHERE  row_no > 1;

-- CREATE ANOTHER TABLE WHERE I CAN MODIFY THE DATA SET REALTIME AS PER MARKET BEST PRACTICES --

CREATE TABLE `2layoffs` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL, 
  `row_no` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT * 
FROM 2layoffs;

INSERT INTO 2layoffs
SELECT * ,
ROW_NUMBER () OVER (PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_no 
FROM 1layoffs;
 
DELETE 
FROM 2layoffs
WHERE row_no > 1; 

SELECT * 
FROM 2layoffs;

-- CHECK THE 1ST COLUMN -- 

SELECT company
FROM 2layoffs
GROUP BY company; 


SELECT company, TRIM(company)
FROM 2layoffs; 

--  UPDATE COLUMNS AND PREPOCESS THESE COLUMNS BY USING OR UTILIZING TRIM FUNCTION -- 

UPDATE `2layoffs`
SET 
   company = TRIM(company),
   location = TRIM(location),
   industry = TRIM(company),
   total_laid_off = TRIM(total_laid_off),
   percentage_laid_off = TRIM(percentage_laid_off),
   `date` = TRIM(`date`),
   stage = TRIM(stage),
   country = TRIM(country),
   funds_raised_millions = TRIM(funds_raised_millions);


SELECT * 
FROM 2layoffs;

SELECT stage
FROM 2layoffs
GROUP BY stage; 

SELECT industry 
FROM 2layoffs
ORDER BY 1; 

SELECT DISTINCT industry 
FROM 2layoffs
ORDER BY 1; 

SELECT * 
FROM 2layoffs
WHERE INDUSTRY LIKE '2TM'; 

SELECT location
FROM 2layoffs
ORDER BY 1; 

SELECT DISTINCT location
FROM 2layoffs
ORDER BY 1; 

SELECT *
FROM 2layoffs 
WHERE location LIKE 'Amsterdam'; 

SELECT * 
FROM 2layoffs; 

SELECT country
FROM 2layoffs
GROUP BY country; 

-- REMOVE THE PERIOD FROM COUNTRY USA -- 

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country) 
FROM 2layoffs
ORDER BY 1; 

UPDATE 2layoffs 
SET country = TRIM(TRAILING '.' FROM country) 
WHERE country LIKE 'United States%';

SELECT DISTINCT country
FROM 2layoffs 
GROUP BY country; 

-- NOW WE WILL FIX DATE'S DATA IN ORDER TO ACHIEVE VISUALIZATION -- 
-- DATE COLUMN FROM TEXT TO DATE & TIME FORMAT -- 

SELECT `date`
FROM 2layoffs; 

-- NOW LET'S CHANGE THE DATE COMUN AND UPDATE IT AS PER EDA REQUIREMENTS -- 

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM 2layoffs; 

-- WE NEED TO UPDATE DATE COLUMN TO DATE & TIME FORMATE IS DATE FUNCTION -- 

UPDATE 2layoffs
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y'); 

-- NOW WE NEED TO MODIFY AND UPDATE THE DATE TYPE FROM TEXT TO DATE & TIME FORMAT -- 

ALTER TABLE 2layoffs
MODIFY COLUMN `date` DATE; 

-- COUNTER CHECKING BY FETCHING THE TABLE -- 

SELECT * 
FROM 2layoffs; 

-- REMOVING ANY BLANK ROWS OR NULL VALUES -- 

-- CHECKING NULL OR BLANK VALUES IN TOTAL LAID OFFS AND PERCENTAGE OF LAID OFF COLUMNS -- 

SELECT * 
FROM 2layoffs
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL; 

-- REMOVE THE ROWS WHICH HAS NULL VALUES IN BOTH COLUMNS -- 

DELETE 
FROM 2layoffs
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL; 

-- CHECKING FOR NULL OR BLANK VALUES IN THE CHECKING INDUSTRY -- 

SELECT * 
FROM 2layoffs
WHERE industry IS NULL 
OR industry = ' '; 

-- CHECKING FOR NULL OR BLANK VALUES IN THE CHECKING COMPANY -- 

SELECT * 
FROM 2layoffs
WHERE company IS NULL 
OR company = ' '; 

-- CHECKING FOR NULL OR BLANK VALUES IN THE COUNTRY SECTION COUNTRY -- 

SELECT * 
FROM 2layoffs
WHERE country IS NULL 
OR country = ' '; 

--  CHECKING FOR NULL OR BLANK VALUES IN THE FUNDS RAISED COLUMN -- 

SELECT * 
FROM 2layoffs
WHERE funds_raised_millions IS NULL 
OR funds_raised_millions = ' '; 

-- NOW WE'RE REMOVING THE EXTRA SUPPORT COLUMN OF ROW FUNCTION -- 

ALTER TABLE 2layoffs
DROP COLUMN row_no; 


-- NOW WE ARE GOING TO CHECK THE COLUMN -- 

SELECT * 
FROM 2layoffs; 

-- ________________________________________--

-- NOW 2ND PROJECT IS EDA (EXPLORATORY DATA ANALYSIS) -- 










































