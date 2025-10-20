-- EMS Database Setup Script
-- Run this in MySQL Workbench to create the database and tables

-- Create database
CREATE DATABASE IF NOT EXISTS ems_demo;
USE ems_demo;

-- Create department table
CREATE TABLE IF NOT EXISTS department (
  dept_id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create job table
CREATE TABLE IF NOT EXISTS job (
  job_id INT PRIMARY KEY AUTO_INCREMENT,
  job_title VARCHAR(100) NOT NULL UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create employee table
CREATE TABLE IF NOT EXISTS employee (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  dept_id INT,
  job_id INT,
  salary DECIMAL(10,2),
  hire_date DATE DEFAULT (CURRENT_DATE),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dept_id) REFERENCES department(dept_id) ON DELETE SET NULL,
  FOREIGN KEY (job_id) REFERENCES job(job_id) ON DELETE SET NULL
);

-- Insert sample departments
INSERT INTO department (dept_name) VALUES 
  ('Engineering'),
  ('Human Resources'),
  ('Sales'),
  ('Finance'),
  ('Marketing')
ON DUPLICATE KEY UPDATE dept_name = dept_name;

-- Insert sample jobs
INSERT INTO job (job_title) VALUES 
  ('Developer'),
  ('Manager'),
  ('Analyst'),
  ('Designer'),
  ('Accountant')
ON DUPLICATE KEY UPDATE job_title = job_title;

-- Insert sample employees
INSERT INTO employee (first_name, last_name, email, dept_id, job_id, salary) VALUES
  ('Alice', 'Johnson', 'alice.j@company.com', 1, 1, 80000),
  ('Bob', 'Smith', 'bob.s@company.com', 1, 2, 95000),
  ('Carol', 'Williams', 'carol.w@company.com', 2, 2, 75000),
  ('David', 'Brown', 'david.b@company.com', 3, 3, 65000);

-- Create MySQL user for the application (if not exists)
-- Run these commands separately if needed:
-- CREATE USER IF NOT EXISTS 'ems_web'@'localhost' IDENTIFIED BY 'Demo@123';
-- GRANT ALL PRIVILEGES ON ems_demo.* TO 'ems_web'@'localhost';
-- FLUSH PRIVILEGES;

-- Verify setup
SELECT 'Database setup complete!' AS status;
SELECT COUNT(*) AS employee_count FROM employee;
SELECT COUNT(*) AS department_count FROM department;
SELECT COUNT(*) AS job_count FROM job;
