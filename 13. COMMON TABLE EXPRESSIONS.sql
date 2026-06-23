-- CTEs common table expressions
WITH CTE_EXAMPLE AS
(
SELECT gender, AVG(age) as avg_age, MAX(age) as max_age, MIN(age) as min_age, COUNT(age) as count_age
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_ed.employee_id = p_es.employee_id
GROUP BY gender
)
SELECT AVG(avg_age)
FROM  CTE_EXAMPLE
;

-- AFTER you create a CTE you have to use it right now we can't use it for others like after ';'


WITH CTE_EXAMPLE1 AS
(
SELECT employee_id, gender, birth_date
FROM parks_and_recreation.employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_EXAMPLE2 AS
(
SELECT employee_id ,salary 
FROM parks_and_recreation.employee_salary
WHERE salary > 50000
)
SELECT *
FROM  CTE_EXAMPLE1
JOIN CTE_EXAMPLE2
	 ON CTE_EXAMPLE1.employee_id = CTE_EXAMPLE2.employee_id
;