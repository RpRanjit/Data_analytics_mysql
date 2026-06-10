-- GROUP BY

SELECT *
FROM parks_and_recreation.employee_demographics;


SELECT gender
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- Aggregate functions
SELECT gender, AVG(age), MAX(age), MIN(age), count(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;


-- ORDER BY
-- sort the output in ascending or descending order or alphabetical or reverse order
SELECT *
FROM parks_and_recreation.employee_demographics;


SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender;

SELECT *
FROM parks_and_recreation.employee_demographics
-- Here if we use age ahead of gender it will show no difference so we don't use gender for order by
ORDER BY gender, age;

SELECT *
FROM parks_and_recreation.employee_demographics
-- We can also use column numbers although it is best not to use it but some times it comes in handy
ORDER BY 5, 4;
