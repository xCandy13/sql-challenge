-- departments.csv
-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create new table
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL UNIQUE,
	dept_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- View table columns and datatypes
SELECT * FROM dept_manager;

-- titles.csv
-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create new table
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(25) NOT NULL UNIQUE,
    PRIMARY KEY (title)
);

-- View table columns and datatypes
SELECT * FROM titles;

-- View table columns and datatypes
SELECT * FROM departments;

-- employees.csv
-- Drop table if exists
DROP TABLE IF EXISTS employees CASCADE;

-- Create new table
CREATE TABLE employees (
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title VARCHAR(25) NOT NULL,
    birth_date date,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR(5) NOT NULL,
    hire_date date,
    PRIMARY KEY (emp_no)
	FOREIGN KEY (emp_title) REFERENCES titles (emp_title)
);


-- View table columns and datatypes
SELECT * FROM employees;

-- dept_emp.csv
-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create new table
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- View table columns and datatypes
SELECT * FROM dept_emp;

-- dept_manager.csv
-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create new table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- salaries.csv
-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- Create new table
CREATE TABLE salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- View table columns and datatypes
SELECT * FROM salaries;