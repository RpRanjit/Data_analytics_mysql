-- Subquries - queries inside queries

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE employee_id IN
(SELECT employee_id
FROM parks_and_recreation.employee_salary
WHERE dept_id = 1);


SELECT first_name, 
last_name, 
salary,
(SELECT AVG(salary)
FROM parks_and_recreation.employee_salary) AS AVG_salary 
FROM parks_and_recreation.employee_salary
;


SELECT gender, AVG(age), MAX(age),  MIN(age), COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM (SELECT gender, AVG(age), MAX(age) AS max_age,  MIN(age) AS min_age, COUNT(age) AS count_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender) AS avg_table;

