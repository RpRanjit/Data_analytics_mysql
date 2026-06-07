SELECT * FROM parks_and_recreation.employee_demographics;

SELECT first_name,
birth_date,
age,
(age * 10) +10
from parks_and_recreation.employee_demographics;
#In sql arithemation works on PEMDAS rule
#P: Parenthesis, E: Exponentioal, M: Multipication, D: Division, A: Addition, S: Subraction


# we use Distinct to get unique characters

SELECT DISTINCT gender FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT age FROM parks_and_recreation.employee_demographics;