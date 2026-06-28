-- WHERE AND HAVING CLAUSE

SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;

-- at above case first we have to group by to use where becasue the gender hasn't been grouped so we can't
-- use where that's why we use HAVING

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

-- Trying using bith WHERE and HAVING clauses
SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE "%manager%"
GROUP BY occupation
HAVING AVG(salary) > 70000;
