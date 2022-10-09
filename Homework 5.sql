# 1. Вывести hire_date в годах, и количество сотрудников, которых наняли в эти года

SELECT COUNT(emp_no) AS emp_no, YEAR(hire_date) AS year_hire_date FROM employees
GROUP BY year_hire_date
ORDER BY year_hire_date;


# 2. Вывести dept_no и рядом количество сотрудников, которые когда-либо работали в этих департаментах.

SELECT COUNT(emp_no) AS emp_no, dept_no FROM dept_emp
GROUP BY dept_no;

# 3. Вывести birth_date и количество сотрудников, которые родились в эти дни. Отфильтровать birth_date не равен 1952-02-13 и вывести только те дни,
# где количество сотрудников > 60. Отсортировать по убыванию (по количеству сотрудников), и далее показать только топ 20 birth_date (по количеству сотрудников). 

SELECT COUNT(emp_no) AS emp, birth_date FROM employees
WHERE birth_date <> '1952-02-13'
GROUP BY birth_date
HAVING emp > 60
ORDER BY emp DESC
LIMIT 20;

# 4. Вывести имена (которые начинается на А) и количество сотрудников с этим именем в компании. Отфильтровать имена, у которых количество сотрудников
# с этим именем больше 250, отсортировать по количеству сотрудников и показать только топ 10 first_name (по количеству сотрудников).

SELECT first_name, COUNT(emp_no) AS emp FROM employees
WHERE first_name LIKE 'A%'
GROUP BY first_name
HAVING emp > 250
ORDER BY emp DESC
LIMIT 10;

# 5. Создать копию таблицы employees, где имена начинается на B. Удалить строки в employees, где имена начинаются на B, далее из копии нашей таблицы
# вставить обратно эти строки. Удалить все строки из копии нашей таблицы, далее дропнуть эту таблицу.

CREATE TABLE employees_g
SELECT * FROM employees
WHERE first_name LIKE 'B%';

SET autocommit = 0;

SELECT * FROM employees;
SELECT * FROM employees_g;

DELETE FROM employees
WHERE first_name LIKE 'B%';

INSERT INTO employees
SELECT * FROM employees_g
WHERE first_name LIKE 'B%';

DELETE FROM employees_g;

DROP TABLE employees_g
