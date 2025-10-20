-- EMS Cloud Database Setup Script
-- For deployment to PlanetScale, Railway, or Render MySQL
-- Run this in your cloud database dashboard or via CLI

-- Create database (if not exists)
CREATE DATABASE IF NOT EXISTS ems_cloud;
USE ems_cloud;

-- Users table for authentication
CREATE TABLE IF NOT EXISTS users (
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('employee', 'hr', 'admin') DEFAULT 'employee',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Departments table (user-scoped)
CREATE TABLE IF NOT EXISTS departments (
  dept_id INT PRIMARY KEY AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL,
  user_id_fk INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE,
  UNIQUE KEY unique_dept_user (dept_name, user_id_fk)
);

-- Jobs table (user-scoped)
CREATE TABLE IF NOT EXISTS jobs (
  job_id INT PRIMARY KEY AUTO_INCREMENT,
  job_title VARCHAR(100) NOT NULL,
  user_id_fk INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE,
  UNIQUE KEY unique_job_user (job_title, user_id_fk)
);

-- Employees table (user-scoped)
CREATE TABLE IF NOT EXISTS employees (
  emp_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  dept_id INT,
  job_id INT,
  salary DECIMAL(10,2),
  hire_date DATE DEFAULT (CURRENT_DATE),
  user_id_fk INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL,
  FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE SET NULL,
  FOREIGN KEY (user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE
);

-- Sessions table for JWT token management (optional)
CREATE TABLE IF NOT EXISTS user_sessions (
  session_id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  token_hash VARCHAR(255) NOT NULL,
  expires_at TIMESTAMP NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  UNIQUE KEY unique_token (token_hash)
);

-- Insert sample admin user (password: Admin@123)
INSERT INTO users (name, email, password_hash, role) VALUES
  ('System Admin', 'admin@ems.com', '$2b$10$example.hash.for.admin.password', 'admin')
ON DUPLICATE KEY UPDATE email = email;

-- Insert sample HR user (password: Hr@123)
INSERT INTO users (name, email, password_hash, role) VALUES
  ('HR Manager', 'hr@ems.com', '$2b$10$example.hash.for.hr.password', 'hr')
ON DUPLICATE KEY UPDATE email = email;

-- Insert sample employee user (password: Employee@123)
INSERT INTO users (name, email, password_hash, role) VALUES
  ('Employee User', 'employee@ems.com', '$2b$10$example.hash.for.employee.password', 'employee')
ON DUPLICATE KEY UPDATE email = email;

-- Insert sample departments for admin user
INSERT INTO departments (dept_name, user_id_fk)
SELECT dept_name, 1 FROM (
  SELECT 'Engineering' as dept_name UNION
  SELECT 'Human Resources' UNION
  SELECT 'Sales' UNION
  SELECT 'Finance' UNION
  SELECT 'Marketing'
) as depts
WHERE NOT EXISTS (SELECT 1 FROM departments WHERE dept_name = depts.dept_name AND user_id_fk = 1);

-- Insert sample jobs for admin user
INSERT INTO jobs (job_title, user_id_fk)
SELECT job_title, 1 FROM (
  SELECT 'Developer' as job_title UNION
  SELECT 'Manager' UNION
  SELECT 'Analyst' UNION
  SELECT 'Designer' UNION
  SELECT 'Accountant'
) as jobs
WHERE NOT EXISTS (SELECT 1 FROM jobs WHERE job_title = jobs.job_title AND user_id_fk = 1);

-- Insert sample employees for admin user
INSERT INTO employees (first_name, last_name, email, dept_id, job_id, salary, user_id_fk)
SELECT 'Alice', 'Johnson', 'alice.j@company.com',
       (SELECT dept_id FROM departments WHERE dept_name = 'Engineering' AND user_id_fk = 1 LIMIT 1),
       (SELECT job_id FROM jobs WHERE job_title = 'Developer' AND user_id_fk = 1 LIMIT 1),
       80000, 1
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email = 'alice.j@company.com' AND user_id_fk = 1);

INSERT INTO employees (first_name, last_name, email, dept_id, job_id, salary, user_id_fk)
SELECT 'Bob', 'Smith', 'bob.s@company.com',
       (SELECT dept_id FROM departments WHERE dept_name = 'Engineering' AND user_id_fk = 1 LIMIT 1),
       (SELECT job_id FROM jobs WHERE job_title = 'Manager' AND user_id_fk = 1 LIMIT 1),
       95000, 1
WHERE NOT EXISTS (SELECT 1 FROM employees WHERE email = 'bob.s@company.com' AND user_id_fk = 1);

-- Verify setup
SELECT 'Cloud database setup complete!' AS status;
SELECT COUNT(*) AS user_count FROM users;
SELECT COUNT(*) AS employee_count FROM employees;
SELECT COUNT(*) AS department_count FROM departments;
SELECT COUNT(*) AS job_count FROM jobs;

-- Show sample users (for testing)
SELECT user_id, name, email, role FROM users;
