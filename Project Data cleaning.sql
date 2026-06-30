-- DATA CLEANING

SELECT *
FROM layoffs;

-- 1. Remove duplicates
-- 2. Standradize it like spelling mistake 
-- 3. Null Value and Blank values
-- 4. Remove unnecessary rows and columns 


-- AT first create a table which have same values as real raw data so that any mistake occurs doesn't affect the real one

CREATE TABLE layoffs_sample
LIKE layoffs;

SELECT *
FROM layoffs_sample;

-- INSERTING ALL data from layoffs to layoffs_sample

INSERT layoffs_sample
SELECT *
FROM layoffs;

SELECT *
FROM layoffs_sample;

-- Now erasing the duplicaes

SELECT *
FROM layoffs_sample;

SELECT *,
ROW_NUMBER() OVER( PARTITION BY
company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_sample;

-- using CTE
WITH duplicate_cte  AS (
SELECT *,
ROW_NUMBER() OVER( PARTITION BY
company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_sample
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


SELECT *
FROM layoffs_sample
WHERE company = '&Open';

-- WEll it difficult to delete duplicate in mysql so we will use aonther method
-- AT first go to the table right click -> go to copy to clipboard -> Create statement
--  add row_num
CREATE TABLE `layoffs_sample2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_sample2
;

INSERT INTO layoffs_sample2
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY 
company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_sample;

SELECT *
FROM layoffs_sample2;
-- safe mode is ON so DELETE, UPDATE CAN'T BE USE
SET SQL_SAFE_UPDATES = 0;

DELETE
FROM layoffs_sample2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM layoffs_sample2
WHERE row_num > 1;

SELECT *
FROM layoffs_sample2;


-- Standardizing data

SELECT *
FROM layoffs_sample2;

SELECT company
FROM layoffs_sample2;

SELECT DISTINCT company
FROM layoffs_sample2;


-- TRIM-> DELETE THE WHITE SPACE AROUND THE DATA
SELECT company, TRIM(company)
FROM layoffs_sample2;

-- Now UPDATING THE company to TRIM (company) for better analysis

UPDATE layoffs_sample2
SET company = TRIM(company);

SELECT company, TRIM(company)
FROM layoffs_sample2;

-- Company have same business but different name
SELECT *
FROM layoffs_sample2;
-- BUT the industry may be different so
-- OR they have same names but written differently so watch carefully
-- for industry
SELECT industry
FROM layoffs_sample2;

SELECT DISTINCT industry
FROM layoffs_sample2
ORDER BY 1;

-- LIKE crypto and crypto-current both are same but assigned differently which will be difficult while visulization so manage it
SELECT *
FROM layoffs_sample2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_sample2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoffs_sample2
WHERE industry LIKE 'Crypto%';

-- CHECK OTHERS ALSO
SELECT DISTINCT location
FROM layoffs_sample2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_sample2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_sample2
WHERE country LIKE 'United Sta%';

UPDATE layoffs_sample2
SET country = 'United States'
WHERE country LIKE 'United Sta%';

-- Now the date how is it can't be use for further analysis because  it is in text so it won't be able to visualize so convert into date

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_sample2;

UPDATE layoffs_sample2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM layoffs_sample2;

ALTER TABLE layoffs_sample2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_sample2;



-- Now figuring iut the blank and null values and manipulate them

SELECT *
FROM layoffs_sample2;

-- AT first for company
SELECT *
FROM layoffs_sample2
WHERE company IS NULL
OR company = '';
-- for location
SELECT *
FROM layoffs_sample2
WHERE location IS NULL
OR location = '';

-- for industry
SELECT *
FROM layoffs_sample2
WHERE industry IS NULL
OR industry = '';
-- Now search for other company having same name they may be related to same industry
-- because instead of deleting the blank or null valuse it better to fill it for better analysis

SELECT *
FROM layoffs_sample2
WHERE company = "Airbnb";
-- From above we figure out that they have same company in same location so the industry must be the same so update it
-- Now we  will f igure other blank and null in industry which one have same company but the industry is not listed

SELECT *
FROM layoffs_sample2 AS t1
JOIN layoffs_sample2 AS t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL; 

-- Now update it
UPDATE layoffs_sample2
SET industry = NULL
WHERE industry = '';

UPDATE layoffs_sample2 AS t1
JOIN layoffs_sample2 AS t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE ( t1.industry IS NULL )
AND t2.industry IS NOT NULL;


-- now deleting the rows where total_laid_off  and percentage_laid_off is null

SELECT *
FROM layoffs_sample2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- WE don't know if these data will be use full in fute=ure or not so we are making new table and deleting it in case for its future use

CREATE TABLE layoffs_sample3
LIKE layoffs_sample2;

INSERT INTO layoffs_sample3
SELECT *
FROM layoffs_sample2;

SELECT *
FROM layoffs_sample3;

-- NOW  delete the rows and row_num column

DELETE
FROM layoffs_sample3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_sample3
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

ALTER TABLE layoffs_sample3
DROP COLUMN row_num;

SELECT *
FROM layoffs_sample3;

