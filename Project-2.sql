-- EXPLORATORY DATA ANALYSIS -- 
-- WHEN YOU ARE DOING EDA FOR AN ORGANIZATION YOU KNOW IN MOST OF THE TIME WHAT YOU WANT TO EXTRACT AND WHAT ARE 
-- THE ORGANIZATIONAL GOALS AND OBJECTIVES ARE EVEN IF YOU DON'T KNOW -- 
-- AS FOR THIS PROJECT WE WILL JUST TRY LOOK AND CHECK WHAT TYPE OF USEFUL INFORMATION WE CAN EXTRACT OUT OF THIS 
-- PROJECT FROM BASIC TO ADVANCE -- 

SELECT * 
FROM 2layoffs;

-- CHECKING TOTAL LAID OFF AND PERCENTAGE OF TOTAL LAID OFFS -- 

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM 2layoffs;

SELECT * 
FROM 2layoffs
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- CHECKING  FUNDS RAISED IN MILLIONS --  

SELECT * 
FROM 2layoffs
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- CHECKING COMPANY AND SUM OF TOTAL LAID OFFS -- 

SELECT company, SUM(total_laid_off)
FROM 2layoffs
GROUP BY company
ORDER BY 2 DESC; 

-- NOW WE NEED TO CHECK MINIMUM & MAXIMUM DATE RANGE -- 

SELECT MIN(`date`), MAX(`date`)
FROM 2layoffs;

-- NOW WE WILL CHECK BY INDUSTRY HOW MANY INDIVIDUALS WERE LAID OFF WITH IN THESE THREE YEARS -- 

SELECT industry, SUM(total_laid_off)
FROM 2layoffs
GROUP BY industry 
ORDER BY 2 DESC; 

-- NOW WE WILL CHECK THE COUNTRY WHICH WERE HIT THE MST DURING THE PANDEMIC ERA -- 

SELECT country, SUM(total_laid_off)
FROM 2layoffs
GROUP BY country 
ORDER BY 2 DESC; 

-- WE WILL ALSO CHECK BY DATE THE SUM OF TOTAL LAID OFF -- 
SELECT `date`, SUM(total_laid_off)
FROM 2layoffs
GROUP BY `date`
ORDER BY 1 DESC; 

-- WE CHECK THE SAME BY YEAR AS WELL -- 

SELECT YEAR (`date`), SUM(total_laid_off)
FROM 2layoffs
GROUP BY YEAR (`date`)
ORDER BY 1 DESC; 

SELECT YEAR (`date`), SUM(total_laid_off)
FROM 2layoffs
GROUP BY YEAR (`date`)
ORDER BY 2 DESC; 

-- NOW WE WILL CHECK THE STAGE OF THE COMPANY -- 

SELECT stage , SUM(total_laid_off)
FROM 2layoffs
GROUP BY stage
ORDER BY 1 DESC; 

SELECT stage , SUM(total_laid_off)
FROM 2layoffs
GROUP BY stage
ORDER BY 2 DESC; 

-- NOW WE WILL CHECK THE PERCENTAGE OF LAID OFF FOR THE COMPANIES -- NOT A GOOD IDEA BUT WE WILL CHECK -- 
-- DUE TO LACK OF DATA THIS IS IRRELEVANT -- 

SELECT company, SUM(percentage_laid_off)
FROM 2layoffs
GROUP BY company
ORDER BY 1 DESC; 

SELECT company, SUM(percentage_laid_off)
FROM 2layoffs
GROUP BY company
ORDER BY 2 DESC; 

-- CHECK THE AVG LAID OFF IN A COMPANY-- 

SELECT company, AVG(percentage_laid_off)
FROM 2layoffs
GROUP BY company
ORDER BY 2 DESC; 

-- CHECKING VIA MONTH TOTAL LAID OFF -- 

SELECT SUBSTRING(`date`, 6, 2) AS `MONTH`, SUM(total_laid_off)
FROM 2layoffs
GROUP BY `MONTH` 
ORDER BY 1 ASC; 


SELECT SUBSTRING(`date`, 1, 7) AS Timeline, SUM(total_laid_off)
FROM 2layoffs
GROUP BY Timeline 
ORDER BY 1 ASC; 


-- NOW WE WILL TRY TO GROUP EVERY THING FROM THE 1ST MONTH -- FORR ROLLIONG SUM OF THIS DATA -- CTE FUNCTION 

WITH ROLLING AS 
	(
		SELECT SUBSTRING(`date`, 1, 7) AS Timeline, SUM(total_laid_off) AS TLAID_OFF 
		FROM 2layoffs
		GROUP BY Timeline 
		ORDER BY 1 ASC
	)
SELECT Timeline, TLAID_OFF, SUM(TLAID_OFF) OVER(ORDER BY Timeline) AS Rolling_Total
FROM ROLLING;  

-- WE CAN CHECK TOTAL LAID OFF BY YEAR AS WELL -- 

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM 2layoffs
GROUP BY company, YEAR(`date`)
ORDER BY 2 DESC; 

-- NOW WE WILL RANK THE COMPANY BY THE HIGHEST LAID OFF -- CTE --

WITH company_year (company, years, total_laid_off) AS 
(
	SELECT 
		company, 
        YEAR(`date`) AS years,
        SUM(total_laid_off) AS total_laid_off
   FROM 2layoffs
   GROUP BY company, YEAR(`date`)
),
company_year_rank AS 
(
	SELECT *, 
		DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS CRANKING 
    FROM company_year
    WHERE years IS NOT NULL 
)
SELECT * 
FROM company_year_rank
WHERE CRANKING <= 5
ORDER BY years, CRANKING; 
 




























