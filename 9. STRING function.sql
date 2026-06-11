-- 	STRING Functions

SELECT LENGTH("alHello");

SELECT first_name, LENGTH(first_name) AS len_name
FROM parks_and_recreation.employee_demographics
ORDER BY 2;


SELECT first_name, UPPER(first_name) as Up_name, LOWER(first_name) as Low_name
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

-- TRIM = cut white spaces
-- LTRIM cur left white sapce
-- RTRIM cur right white sapce
SELECT TRIM("  HELLO   ");
SELECT LTRIM("  HELLO   ");
SELECT RTRIM("  HELLO   ");


-- SUBSTRING OF LEFT AND RIGHT
SELECT first_name, 
LEFT(first_name, 2),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2)
FROM parks_and_recreation.employee_demographics;

-- REPLACE

SELECT first_name, REPLACE(first_name, 'A', 'W')
FROM parks_and_recreation.employee_demographics;

-- LOCATE
SELECT LOCATE('A', "Happy Birthday");
SELECT first_name, LOCATE('A', first_name)
FROM parks_and_recreation.employee_demographics;

-- CONCAT combine comumns

SELECT first_name , last_name,
CONCAT(first_name, ' ',last_name) AS Full_Name
FROM parks_and_recreation.employee_demographics;