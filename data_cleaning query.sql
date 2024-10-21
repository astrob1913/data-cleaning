SELECT * FROM layoffs;

-- Remove Duplicate --

SELECT * FROM layoffs_2;
INSERT layoffs_2
SELECT * FROM layoffs;

SELECT * FROM layoffs_2;

WITH Duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_2
) 
 SELECT * FROM duplicate_cte
 WHERE row_num>1;
 
 
 CREATE TABLE `layoffs_stagging1` (
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

SELECT * FROM layoffs_stagging1;

INSERT INTO layoffs_stagging1
SELECT *,
ROW_NUMBER() OVER( PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
'date', stage, country, funds_raised_millions) AS row_num
FROM layoffs_2;

SELECT * FROM layoffs_stagging1;

SELECT * FROM layoffs_stagging1
WHERE row_num > 1;

DELETE FROM layoffs_stagging1
WHERE row_num > 1;

SELECT * FROM layoffs_stagging1
WHERE row_num > 1 ;

SELECT * FROM layoffs_stagging1;
 
-- Standardize the data--

SELECT company, TRIM(company) 
FROM layoffs_stagging1 
LIMIT 0, 1000;

UPDATE layoffs_stagging1
SET company = trim(company);

UPDATE layoffs_stagging1
SET location = trim(location);

SELECT distinct(country)
FROM layoffs_stagging1;

UPDATE layoffs_stagging1
SET country = trim(trailing '.' from country)
WHERE country LIKE 'United States%';
 
SELECT * FROM layoffs_stagging1
WHERE country LIKE 'United States.%';

SELECT distinct(industry)
FROM layoffs_stagging1
ORDER BY 1;

UPDATE layoffs_stagging1
SET industry = trim(industry);
 
UPDATE layoffs_stagging1
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';
 
SELECT * FROM layoffs_stagging1
WHERE industry LIKE 'Crypto%';
 
UPDATE layoffs_stagging1
SET total_laid_off = trim(total_laid_off), percentage_laid_off = trim(percentage_laid_off);

UPDATE layoffs_stagging1
SET funds_raised_millions = trim(funds_raised_millions);

SELECT `date`,
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_stagging1;

UPDATE layoffs_stagging1
SET `date`= str_to_date(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_stagging1
MODIFY COLUMN `date` date;

SELECT * FROM layoffs_stagging1;

-- Remove Null or blank values --

SELECT *
FROM layoffs_stagging1
WHERE company = 'Airbnb';

UPDATE layoffs_stagging1
SET industry = null
WHERE industry = '';

SELECT * FROM layoffs_stagging1;

SELECT t1.industry, t2.industry
FROM layoffs_stagging1 t1
JOIN layoffs_stagging1 t2
ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_stagging1 t1
JOIN layoffs_stagging1 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_stagging1 t1
JOIN layoffs_stagging1 t2
ON t1.company = t2.company;

ALTER TABLE layoffs_stagging1
DROP COLUMN row_num;

SELECT * FROM layoffs_stagging1;









 
