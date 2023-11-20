--1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name",
	   e.gender AS "sex",
	   s.salary AS "salary"
FROM employees AS e
JOIN salaries AS s 
ON e.emp_no = s. emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986

SELECT  first_name AS "first name",
		last_name AS "last name",
		hire_date AS "hire date"
FROM employees 
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.		

SELECT d.dept_no AS "department number",
	   d.dept_name AS "department name", 
	   dm.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name"
FROM departments AS d
	JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
 		JOIN employees AS e
		ON dm.emp_no = e.emp_no
;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name",
	   de.dept_no AS "department number",
	   d.dept_name AS "department name"
FROM employees AS e
	JOIN dept_emp AS de 
	ON de.emp_no = e.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
;
	   
-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT  first_name AS "first name",
		last_name AS "last name",
		gender AS "sex"
FROM employees 
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name"
FROM employees AS e
WHERE emp_no IN
	(SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN
		(SELECT dept_no 
		FROM departments
		WHERE dept_name = 'Sales'
		)
	)
;
--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no AS "employee number",
	   e.last_name AS "last name",
	   e.first_name AS "first name",
	   d.dept_name AS "department name"
FROM employees AS e
	JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
		JOIN departments AS d
		ON de.dept_no = d.dept_no
		WHERE dept_name = 'Sales' 
		OR dept_name = 'Development';
		
--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name AS "Last Names", COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY "Last Names" ORDER BY "Last Name Count" DESC;


	   