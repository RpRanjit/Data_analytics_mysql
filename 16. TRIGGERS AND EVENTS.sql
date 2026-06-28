-- triggers and events

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM parks_and_recreation.employee_salary



DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO parks_and_recreation.employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Raam', 'Doe', 'Consultant', 65000, 2);


SELECT *
FROM parks_and_recreation.employee_salary;

SELECT *
FROM parks_and_recreation.employee_demographics;



-- EVENTS
-- a trigger takes place when an even takes place where an event occurs when we schedule something to happen

SELECT *
FROM parks_and_recreation.employee_demographics;

DELIMITER $$
CREATE EVENT delete_retries1
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM parks_and_recreation.employee_demographics
    WHERE age >=60;
END $$
DELIMITER ;

SELECT *
FROM parks_and_recreation.employee_demographics;

SHOW VARIABLES LIKE 'event%';