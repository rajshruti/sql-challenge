SELECT e.emp_no, last_name, first_name, gender, salary 
FROM employees as e 
INNER JOIN salaries as s 
ON e.emp_no=s.emp_no;
------------------------------
SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)= '1986'
------------------------------
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
FROM departments as d
INNER JOIN dept_manager as dm 
ON d.dept_no=dm.dept_no
INNER JOIN employees as e
ON dm.emp_no=e.emp_no;
------------------------------
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no;
------------------------------
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%'
------------------------------
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales';
------------------------------
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales' OR dept_name='Development';
------------------------------
SELECT last_name, COUNT(last_name) as last_name_count FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
