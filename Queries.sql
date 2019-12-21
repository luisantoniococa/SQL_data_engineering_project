-- we need to get the first name, last name, employer number, gender
-- and the salary of the employees

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
;

-- employees hired in 1986

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date between '01/01/1986' AND '01/01/1987'
;

--manager of each department
ALTER TABLE departments RENAME title TO dept_name;

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no
;
