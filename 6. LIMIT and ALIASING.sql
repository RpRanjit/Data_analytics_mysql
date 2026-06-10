-- LIMIT and Aliasing

-- LIMIT - how many rows you want to have

SELECT * 
FROM parks_and_recreation.employee_demographics
LIMIT 3;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2, 1;
-- HERE 2, 1 shows that 2 = the position from desc i.e. 6(Donna) in this case and 1 = next on row, 


-- ALIASING (AS)

SELECT gender, AVG(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40;