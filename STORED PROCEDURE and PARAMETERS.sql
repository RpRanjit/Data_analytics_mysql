-- STORED Procedure
-- it is a way to save your sql so that you can use it again and again


SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;


-- using stored procedure method
-- USE parks_and_recreation
CREATE PROCEDURE large_salary()
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
;

CALL large_salary()
;
-- The above example is too simple which we don't use it in this case


DELIMITER $$
CREATE PROCEDURE large_salary3()
BEGIN
	SELECT * 
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM parks_and_recreation.employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salary3();
-- Parameters variables that are passed as an input into the  stored procedure

DELIMITER $$
CREATE PROCEDURE large_salary5(a INT)
BEGIN
	SELECT first_name, last_name, salary
    FROM parks_and_recreation.employee_salary
    WHERE a = employee_id;
END $$
DELIMITER ;

CALL large_salary5(1);



