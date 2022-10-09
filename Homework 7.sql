# 1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания по количеству сотрудников.

SELECT COUNT(emp_no) AS emp_no, gender
FROM employees
WHERE gender IN ('M', 'F')
GROUP BY gender
ORDER BY emp_no DESC;

# 2. Найдите среднюю зарплату в разрезе должностей сотрудников (title), округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.


SELECT DISTINCT a.title, ROUND(AVG(b.salary), 2) AS avg_salary
FROM titles a
JOIN salaries b
ON a.emp_no = b.emp_no
GROUP BY a.title
ORDER BY avg_salary DESC;


/*
3. Найдите всех сотрудников, которые работали как минимум в 2 департаментах. Вывести их имя, фамилию и количество департаментов, в которых они работали.
Показать записи в порядке возрастания.
*/

SELECT a.first_name, a.last_name, COUNT(b.dept_no) AS dept_no
FROM employees a
JOIN dept_emp b
ON a.emp_no = b.emp_no
GROUP BY a.emp_no
HAVING COUNT(b.dept_no) > 1
ORDER BY a.emp_no;

# 4. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.

SELECT a.first_name, a.last_name, MAX(b.salary) AS max_salary
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
WHERE b.salary IN (
SELECT MAX(salary)
FROM salaries)
GROUP BY a.emp_no;


# 5. Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.

SELECT DISTINCT MONTH(hire_date) AS month_hire_date, COUNT(emp_no) AS employees_number
FROM employees
GROUP BY month_hire_date
ORDER BY month_hire_date;

# 6. Создайте VIEW на базе 1-го запроса.

CREATE VIEW v_employees AS
SELECT COUNT(emp_no) AS emp_no, gender
FROM employees
WHERE gender IN ('M', 'F')
GROUP BY gender
ORDER BY emp_no DESC;

SELECT * FROM v_employees;

DROP VIEW v_employees;