-- CASE STUDY

SELECt first_name,
last_name,
age,
CASE
	WHEN age <=30 THEN "Young"
    WHEN age BETWEEN 31 and 45 THEN "Mature"
    WHEN age > 45 THEN "Old"
END AS Age_catrgory
FROM parks_and_recreation.employee_demographics;


-- EXAMPLES
-- PAY INCREASES AND BONUSES
-- <50000 - 5%
-- >50000 - 7% 
-- Finance dept -10% Bonus

SELECT * 
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.parks_departments;


SELECT first_name, 
last_name, 
salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_salary,

CASE
	WHEN dept_id = 6 THEN salary * 1.1
END AS Bonus
FROM parks_and_recreation.employee_salary;