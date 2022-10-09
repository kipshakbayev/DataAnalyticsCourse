# Вывести всю информацию из таблицы employees
SELECT * FROM employees;

# Вывести всех мужчин из таблицы employees
SELECT * FROM employees
WHERE gender = 'M';

# Вывести всех сотрудников по имени Elvis
SELECT * FROM employees
WHERE first_name = 'Elvis';

# Вывести уникальные/различные названия должностей (поищите в базе данных, посмотрите в какой таблице хранится эта информация)
SELECT DISTINCT title FROM titles;

# Вывести всех сотрудников, кто был трудоустроен в 2000 году (подсказка: столбец hire_date)
SELECT * FROM employees
WHERE hire_date >= '2000-01-01';

# Вывести всех сотрудников, кому больше 60 лет на данный момент (т.е. используем Curdate)
SELECT * FROM employees
WHERE birth_date < CURDATE() - INTERVAL 60 YEAR;

# Вывести количество строк в таблице salaries
SELECT COUNT(*) FROM salaries;

# Вывести количество строк в таблице salaries, где зарплата > 100.000$
SELECT COUNT(*) FROM salaries
WHERE salary > 100000;

