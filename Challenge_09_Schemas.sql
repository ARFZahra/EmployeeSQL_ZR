-- Drop tables if they exist
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

-- Create the titles table
CREATE TABLE titles (
  title_id VARCHAR(5) NOT NULL,
  title VARCHAR(30),
  PRIMARY KEY(title_id)
);

SELECT *
FROM titles;


--create a table for the employees
CREATE TABLE employees(
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(5) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1) NOT NULL,
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT *
FROM employees;


-- Create the departments table
CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL,
  dept_name VARCHAR(30) NOT NULL,
  PRIMARY KEY(dept_no)
);

SELECT *
FROM departments;


-- Create the dept_emp table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY(emp_no, dept_no)
);

SELECT *
FROM dept_emp;


-- Create the dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY(dept_no, emp_no)
);

SELECT *
FROM dept_manager;


--create a table  for the salaries
CREATE TABLE salaries(
  emp_no INT,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT *
FROM salaries;









