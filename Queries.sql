-- 1 we need to get the first name, last name, employer number, gender
-- and the salary of the employees

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
;

-- 2 employees hired in 1986

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE e.hire_date between '01/01/1986' AND '01/01/1987'
;

--3 manager of each department
ALTER TABLE departments RENAME title TO dept_name;

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
FROM departments d
JOIN dept_manager m ON d.dept_no = m.dept_no
JOIN employees e ON m.emp_no = e.emp_no
;
-- 4 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp
--JOIN dept_emp ON dept_emp.emp_no = e.emp_no AND departments.dept_no = dept_emp.dept_no
--JOIN departments d ON dept_emp.dept_no = d.dept_name
WHERE e.emp_no=dept_emp.emp_no AND d.dept_no = dept_emp.dept_no
;

--5 first name hercules and last name starts with B
SELECT *
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
;

--6 employees in the sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp
WHERE d.dept_name ='Sales' AND e.emp_no=dept_emp.emp_no AND d.dept_no = dept_emp.dept_no
;

--7 employees in the sales and development department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_emp
WHERE (d.dept_name ='Sales' OR d.dept_name ='Development') AND e.emp_no=dept_emp.emp_no AND d.dept_no = dept_emp.dept_no
;
--8 The frequency of last names descending order
SELECT e.last_name, COUNT(*) 
FROM employees e
GROUP BY e.last_name 
ORDER BY COUNT(*) DESC
;
