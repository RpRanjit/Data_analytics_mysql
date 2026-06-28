-- JOINS

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary;

-- INNER JOIN= shows all the rows that have same value in a columns 
SELECT p_ed.employee_id, age, gender, occupation, salary
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_ed.employee_id = p_es.employee_id;
    
    
-- OUTER JOINS
-- LEFT JOIN = shows every rows that are present in LFET and only common rows that are in RIGHT
-- RIGHT JOIN = shows every rows that sre present in RIGHT and only common rows that are in LEFT
-- IF the rows doesn't matches it shows Null

SELECT *
FROM parks_and_recreation.employee_demographics AS p_ed
LEFT JOIN parks_and_recreation.employee_salary AS p_es
	ON p_ed.employee_id = p_es.employee_id;
    
SELECT *
FROM parks_and_recreation.employee_demographics AS p_ed
RIGHT JOIN parks_and_recreation.employee_salary AS p_es
	ON p_ed.employee_id = p_es.employee_id;
    
    
-- SELF JOIN
-- JOIN itself like taking gifts for each other by assigining each employee for another

SELECT emp_1.employee_id AS  santa_emp_id,
emp_1.first_name AS santa_first_name,
emp_1.last_name AS santa_last_name,
emp_2.employee_id AS  emp_id,
emp_2.first_name AS first_name,
emp_2.last_name AS last_name
FROM parks_and_recreation.employee_salary AS emp_1
JOIN parks_and_recreation.employee_salary AS emp_2
	ON emp_1.employee_id + 1 = emp_2.employee_id;
    
    
    -- JOINING MULTIPLE  TABLES
SELECT *
FROM parks_and_recreation.employee_demographics AS p_ed
JOIN parks_and_recreation.employee_salary AS p_es
	ON p_ed.employee_id = p_es.employee_id
JOIN parks_and_recreation.parks_departments as p_pd
	ON p_es.dept_id = p_pd.department_id
;
    


SELECT * 
FROM parks_and_recreation.parks_departments;