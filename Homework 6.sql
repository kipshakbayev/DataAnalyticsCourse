# 1. Выведите список всех менеджеров, а именно их emp_no, имена/фамилии, номер департамента, который они курируют, и дату найма в компанию.

SELECT a.emp_no, b.first_name, b.last_name, a.dept_no, b.hire_date
FROM dept_manager a
JOIN employees b
ON a.emp_no = b.emp_no;


# 2. Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента. Может быть таких сотрудников несколько?

SELECT a.emp_no, b.first_name, b.last_name, a.dept_no, b.hire_date
FROM dept_manager a
JOIN employees b
ON a.emp_no = b.emp_no
WHERE b.last_name LIKE 'Markovitch';

# 3. Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, у которых имя начинается на М, а фамилия заканчивается на H.

SELECT a.first_name, a.last_name, a.hire_date, b.title
FROM employees a
JOIN titles b
ON a.emp_no = b.emp_no
WHERE a.first_name LIKE 'M%'
AND a.last_name LIKE '%H';

# 4. Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная и минимальная зарплата за весь период работы
# в компании. Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.

DROP TEMPORARY TABLE IF EXISTS salaries_g;
CREATE TEMPORARY TABLE salaries_g
SELECT emp_no, MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM salaries
GROUP BY emp_no;

SELECT a.first_name, a.last_name, b.max_salary, b.min_salary
FROM employees a
JOIN salaries_g b
ON a.emp_no = b.emp_no;

