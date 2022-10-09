USE employees;

/* 1. Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:
- Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше p_salary и которые когда-то работали в департаменте p_dept.
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS getEmployees $$

CREATE PROCEDURE getEmployees(IN p_salary INTEGER, IN p_dept VARCHAR(4))
BEGIN
SELECT a.emp_no, a.first_name, a.gender
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
JOIN dept_emp c
ON a.emp_no = c.emp_no
WHERE b.salary > p_salary AND c.dept_no = p_dept
;

END $$

DELIMITER ;

CALL getEmployees(50000, 'd005');



# 2. Создать функцию, которая получает на вход f_name и выдает максимальную зарплату среди сотрудников с именем f_name.


DELIMITER $$

DROP FUNCTION IF EXISTS f_max_salary_among_emp $$

CREATE FUNCTION f_max_salary_among_emp(f_name VARCHAR (20)) RETURNS INTEGER
DETERMINISTIC READS SQL DATA

BEGIN
DECLARE f_max_salary_emp INTEGER;
SELECT MAX(b.salary) INTO f_max_salary_emp
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
WHERE a.first_name = f_name
GROUP BY a.first_name
ORDER BY MAX(b.salary) DESC;

RETURN f_max_salary_emp;
END $$

DELIMITER ;


SELECT f_max_salary_among_emp('George');



# Следующие запросы относятся к базе данных World (скачайте ее ниже, и запустите все запросы, как мы делали с employees):

USE world;

# 1. Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).

SELECT a.Name AS CountryName, COUNT(b.Name) AS CitiesCount
FROM country a
JOIN city b
ON a.Code = b.CountryCode
WHERE a.IndepYear = 1991
GROUP BY b.CountryCode;


# 2. Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).

SELECT Code, Name, Population, LifeExpectancy
FROM country
WHERE Code LIKE 'ARG';

# 3. В какой стране самая высокая продолжительность жизни?

SELECT Name, MAX(LifeExpectancy)
FROM country
WHERE LifeExpectancy IN(
SELECT MAX(LifeExpectancy)
FROM country)
GROUP BY Code;

# 4. Перечислите все языки, на которых говорят в регионе «Southeast Asia».

SELECT a.Region, b.Language
FROM country a
JOIN countrylanguage b
ON a.Code = b.CountryCode
WHERE a.Region LIKE 'Southeast Asia';


# 5. Посчитайте сумму SurfaceArea для каждого континента.

SELECT Continent, SUM(SurfaceArea) AS TotalArea
FROM country
GROUP BY Continent;



