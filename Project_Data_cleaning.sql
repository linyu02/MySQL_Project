--- Data cleaning
SELECT *
FROM layoffs;

-- 1. remove duplicates
-- 2. standardize the data
-- 3. Null values or blank values
-- 4. remove any columns or rows that are unnecessary (save time when your querying data, bu usually not directly on raw data

# copy all data from the row table to the staging one
CREATE TABLE layoff_staging
LIKE layoffs;

SELECT *
FROM layoff_staging;

INSERT layoff_staging
SELECT *
FROM layoffs;

--- remove duplicates 

--- a. identify duplicates 
SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company,industry, total_laid_off, 'date') AS row_num  #date is a key word in SQL
FROM layoff_staging;

### remark: Use ' ' for values (strings). Use identifier quotes (``, "", or []) for column/table names
WITH duplicate_cte AS (
SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company,industry, total_laid_off, percentage_laid_off, `date`)
 AS row_num  
FROM layoff_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num>1;
# no duplicates in this table
# But if there are duplicate, we only want to keep one 

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM layoff_staging2;

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER( 
PARTITION BY company,industry, total_laid_off, percentage_laid_off, `date`)
 AS row_num  
FROM layoff_staging;

SELECT *
FROM layoff_staging2
WHERE row_num>1;

DELETE
FROM layoff_staging2
WHERE row_num>1;

--- standardizing data
SELECT company, (TRIM(company))
FROM layoff_staging2;

UPDATE layoff_staging2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoff_staging2
ORDER BY 1; # There are null entries and crypto, crypto currency should all be one categories

SELECT *
FROM layoff_staging2
WHERE industry LIKE 'Crypto%';

# update all of them into Crypto
UPDATE layoff_staging2
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT country
FROM layoff_staging2
ORDER BY 1;

SELECT *
FROM layoff_staging2
WHERE country LIKE 'United States%'
ORDER BY 1;

UPDATE layoff_staging2
SET country='United States'
WHERE country LIKE 'United States%';

# If we try to do time-series visualizations, we need to change the `date` to a date column
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y') #'%m/%d/%Y' specific date format in mySQL
FROM layoff_staging2;

SELECT `date`
FROM layoff_staging2;

UPDATE layoff_staging2
SET `date`=STR_TO_DATE(`date`, '%m/%d/%Y'); 

ALTER TABLE layoff_staging2
MODIFY column `date` DATE;

SELECT *
FROM layoff_staging2;

SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
# we might want to remove it

SELECT DISTINCT industry
FROM layoff_staging2;

SELECT *
FROM layoff_staging2
WHERE industry = ''
OR industry is NULL;

SELECT *
FROM layoff_staging2
WHERE company="Bally's Interactive";  # This gives us nothing

SELECT *
FROM layoff_staging2
WHERE company LIke "airbnb%";   # This gives us nothing again


SELECT *
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;
# we might want to remove it, deleting data needs confidence 

DELETE
FROM layoff_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# drop one columns
SELECT *
FROM layoff_staging2;

ALTER TABLE layoff_staging2
DROP COLUMN row_num;







