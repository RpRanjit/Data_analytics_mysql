#WHERE clause

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000 and salary <=60000;

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE age > 35 
and gender = "Female";

# In WHERE clause we also use Pemdas rule

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE (age >= 40 or gender = "Male") and birth_date > "1985-10-10" ;

SELECT * FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' and age = 44) or age > 45;


#LIKE statement (use for looking patterns no the exact"
# use '%' = for anything and '_' = for specific case where you know the no of digits

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'le%';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE last_name LIKE '%o%';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__%';

SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1985%';


