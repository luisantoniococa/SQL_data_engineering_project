DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
--FOREIGN KEY () REFERENCES ()
);
SELECT * FROM employees;

DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	emp_no INT,
	title VARCHAR(200) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM titles;

DROP TABLE IF EXISTS departments;
CREATE TABLE departments(
	dept_no VARCHAR(10) PRIMARY KEY,
	title VARCHAR(200) NOT NULL
);

SELECT * FROM departments;

DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(10) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;


DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;