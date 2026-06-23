-- UNION
-- JOIn is use to join the columns of same or multiple tabales
-- But UNION is use to join rows from same or multiple columns

SELECT age, gender
FROM parks_and_recreation.employee_demographics
UNION
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

-- here  by default the union is distinct and we get unique character present in two tables
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION 
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

-- here UNION ALL shows each and every character present in two tables even though they have duplicates
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;



-- here  by default the union is distinct and we get unique character present in two tables
SELECT first_name, last_name,  'Old man' AS Label 
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name,  'Old lady' AS Label 
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'female'
UNION 
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;