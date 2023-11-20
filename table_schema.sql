-- Drop Tables if Existing

DROP TABLE if exists titles;
DROP TABLE if exists employees;
DROP TABLE if exists salaries;
DROP TABLE if exists departments;
DROP TABLE if exists dept_emp;
DROP TABLE if exists dept_manager;


CREATE TABLE titles (
    title_id VARCHAR(50)   NOT NULL PRIMARY KEY,
    title VARCHAR(255)   NOT NULL
   );

CREATE TABLE employees (
    emp_no INTEGER   NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(50)  NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    gender VARCHAR(50)   NOT NULL,
    hire_date DATE   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)  
);


CREATE TABLE departments (
    dept_no VARCHAR(50)   NOT NULL PRIMARY KEY,
    dept_name VARCHAR (255)  NOT NULL
);

CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(50)  NOT NULL,
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)	
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(50),
	emp_no INTEGER,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL PRIMARY KEY,
    salary INTEGER   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * 
FROM titles;

SELECT * 
FROM employees;

SELECT * 
FROM departments;

SELECT * 
FROM dept_emp;

SELECT * 
FROM dept_manager;

SELECT * 
FROM salaries;
