CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(100),
    salary DOUBLE
);

INSERT INTO employee VALUES
(101, 'Rahul Sharma', 'IT', 75000),
(102, 'Anita Singh', 'HR', 60000),
(103, 'Vikram Rao', 'Finance', 80000);

CREATE TABLE student (
    name VARCHAR(100),
    email VARCHAR(100),
    course VARCHAR(100),
    regno VARCHAR(50)
);
