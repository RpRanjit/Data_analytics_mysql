-- temporary tabel

CREATE TEMPORARY TABLE temp_table(
first_name VARCHAR(50),
last_name VARCHAR(50),
book_name VARCHAR(50)
);

INSERT INTO temp_table
VALUES( 'Ram', 'Naam', 'Harry Potter: The Sorccer Stone');

SELECT *
FROM temp_table;


-- However there is another way to do it 

SELECT *
FROM parks_and_recreation.employee_salary;

-- by using teemporary table we can select the new table where salary is greater or equal to than 50,000 or other conditions

CREATE TEMPORARY TABLE temp_salary_50K
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM temp_salary_50K