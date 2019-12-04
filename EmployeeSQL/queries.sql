--List the following details of each employee: employee number, last name, first name, gender, and salary

SELECT e.emp_no, last_name, first_name, gender, salary 
FROM employees as e 
INNER JOIN salaries as s 
ON e.emp_no=s.emp_no;
------------------------------
--List employees who were hired in 1986

SELECT emp_no, first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date)= '1986'
------------------------------
--List the manager of each department with the following information: department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date 
FROM departments as d
INNER JOIN dept_manager as dm 
ON d.dept_no=dm.dept_no
INNER JOIN employees as e
ON dm.emp_no=e.emp_no;
------------------------------
--List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no;
------------------------------
--List all employees whose first name is "Hercules" and last names begin with "B"

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name= 'Hercules' AND last_name LIKE 'B%'
------------------------------
--List all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales';
------------------------------
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de 
ON e.emp_no=de.emp_no
INNER JOIN departments as d
ON de.dept_no=d.dept_no
WHERE dept_name='Sales' OR dept_name='Development';
------------------------------
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

SELECT last_name, COUNT(last_name) as last_name_count FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
