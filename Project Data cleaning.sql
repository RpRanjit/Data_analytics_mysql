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
FROM layoffs_sample2;
INSERT INTO layoffs_sample2
SELECT *,
ROW_NUMBER() OVER
(PARTITION BY 
company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions, row_num
FROM layoffs_sample
)


