-- WINDOW function

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
GROUP BY gender;

-- using above method we can only get the avg_sal lary of male and female into two unique character but if we add other things like p_ed.first_name
-- or p_ed.last_name it will not operate properly 

SELECT p_ed.first_name, p_ed.last_name, gender, AVG(salary) AS avg_salary
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
GROUP BY p_ed.first_name, p_ed.last_name, gender ;

-- Now using window function
SELECT p_ed.first_name, p_ed.last_name, gender, AVG(salary) OVER(PARTITION BY GENDER )
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
;

SELECT p_ed.first_name, p_ed.last_name, gender, salary,  
SUM(salary) OVER(PARTITION BY GENDER ORDER BY p_ed.employee_id) AS Rolling_Total
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
;

SELECT p_ed.first_name, p_ed.last_name, gender, salary,  
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary)
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
;
-- In ROW_NUMBER it doesn't have duplicate by RANK() does
 SELECT p_ed.first_name, p_ed.last_name, gender, salary,  
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary) AS rank_num
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
;

-- DENSE_RANK also give the duplicate number but not by the position, rank but  numerically

SELECT p_ed.first_name, p_ed.last_name, gender, salary,  
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary) AS dense_rank_num
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_es.employee_id = p_ed.employee_id
;