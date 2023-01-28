-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees as emp
JOIN salaries as sal
ON sal.emp_no = emp.emp_no;
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees as emp
WHERE ((emp.hire_date > '1985-12-31') AND (emp.hire_date < '1987-01-01'));
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, dept.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager
JOIN departments as dept
ON dept.dept_no = dept_manager.dept_no
JOIN employees as emp
ON emp.emp_no = dept_manager.emp_no;
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees as emp
JOIN dept_emp
ON dept_emp.emp_no = emp.emp_no
JOIN departments as dept
ON dept.dept_no = dept_emp.dept_no;
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name,last_name,sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no,last_name,first_name
FROM employees
WHERE emp_no IN
(
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
    )
);
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no,emp.last_name,emp.first_name, dept.dept_name
FROM departments as dept
JOIN dept_emp
ON dept_emp.dept_no = dept.dept_no
JOIN employees as emp
ON emp.emp_no = dept_emp.emp_no
WHERE dept_emp.emp_no IN
(
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no IN
    (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales' OR dept_name = 'Development'
    )
);
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(emp_no) AS "Frequency"
FROM employees as emp
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC;