-- Explanatory data analysis

SELECT *
FROM layoffs_sample3;

SELECT MAX(total_laid_off)
FROM layoffs_sample3;

SELECT MAX(percentage_laid_off)
FROM layoffs_sample3;

SELECT *
FROM layoffs_sample3
WHERE percentage_laid_off = 1;

SELECT *
FROM layoffs_sample3
ORDER BY total_laid_off DESC;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_sample3;

SELECT *
FROM layoffs_sample3
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT company, MAX(funds_raised_millions)
FROM layoffs_sample3
GROUP BY company
ORDER BY 2 DESC;


SELECT MIN(`date`), MAX(`date`)
FROM layoffs_sample3;

SELECT industry, SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY country
ORDER BY 2 DESC;

SELECT `date`, SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY `date`
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT MONTH(`date`), SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY MONTH(`date`)
ORDER BY 2 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_sample3
GROUP BY stage
ORDER BY 2 DESC;


SELECT SUBSTRING(`date`,1,7) as `MONTH`, SUM(total_laid_off)
FROM layoffs_sample3
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
;



WITH Rolling_Table AS
(
SELECT SUBSTRING(`date`,1,7) as `MONTH`, SUM(total_laid_off) AS total
FROM layoffs_sample3
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
)
SELECT `MONTH`, total, SUM(total) OVER(ORDER BY `MONTH`) as rolling_total
FROM Rolling_Table;