--- Exploratory Data Analysis

SELECT *
FROM layoff_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) # The maximum number of total laid off and the maximum percentage of laidoffs
FROM layoff_staging2;

SELECT *
FROM layoff_staging2
WHERE percentage_laid_off=1
ORDER BY total_laid_off DESC;

SELECT company, SUM(total_laid_off) # investigate which company has the most laid offs
FROM layoff_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoff_staging2;

SELECT industry, SUM(total_laid_off) # investigate which industry has the most laid offs
FROM layoff_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off) # investigate which country has the most laid offs
FROM layoff_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT stage, SUM(total_laid_off) # investigate which country has the most laid offs
FROM layoff_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`,6,2) AS `MONTH`, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY `MONTH`
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoff_staging2
GROUP BY `MONTH`
ORDER BY 1 ASC;

--- Rolling total table 
WITH ROLLING_TOTAL AS
(SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoff_staging2
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off, SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM ROLLING_TOTAL;

--- How many are these companies laid off every year:

SELECT company, SUBSTRING(`date`,1,4) AS `YEAR` ,SUM(total_laid_off)# investigate which company has the most laid offs
FROM layoff_staging2
GROUP BY company, YEAR
ORDER BY 3 DESC;


# CTE:
WITH Company_year (company, years, total_laid_off) AS
(SELECT company, SUBSTRING(`date`,1,4) AS `YEAR` ,SUM(total_laid_off)# investigate which company has the most laid offs
FROM layoff_staging2
GROUP BY company, YEAR
ORDER BY 3 DESC
), Company_YEAR_Rank AS
(SELECT *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC ) AS Ranking
FROM Company_year)
SELECT *
FROM Company_YEAR_Rank
WHERE Ranking <=5 ; 