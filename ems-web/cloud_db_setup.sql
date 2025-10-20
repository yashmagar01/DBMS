-- EMS Aiven Database Setup Script
-- Adapted from existing cloud_db_setup.sql for Aiven MySQL
-- For deployment to Aiven MySQL (defaultdb)
create database defaultdb;
USE defaultdb;

-- ============================================
-- Employee Management System - SQL Script
-- Adapted for Aiven MySQL deployment
-- ============================================

-- ============================================
-- 1) Table: users (for authentication)
-- ============================================
CREATE TABLE IF NOT EXISTS users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role ENUM('employee', 'hr', 'admin') DEFAULT 'employee',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- 2) Table: departments
-- ============================================
CREATE TABLE IF NOT EXISTS departments (
  dept_id INT AUTO_INCREMENT PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL,
  user_id_fk INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE,
  UNIQUE KEY unique_dept_user (dept_name, user_id_fk)
);

-- ============================================
-- 3) Table: jobs
-- ============================================
CREATE TABLE IF NOT EXISTS jobs (
  job_id INT AUTO_INCREMENT PRIMARY KEY,
  job_title VARCHAR(100) NOT NULL,
  user_id_fk INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id_fk) REFERENCES users(user_id) ON DELETE CASCADE,
  UNIQUE KEY unique_job_user (job_title, user_id_fk)
);

-- ============================================
-- 4) Table: employees
-- ============================================
CREATE TABLE IF NOT EXISTS employees (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
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

-- Insert sample users (passwords: Admin@123, Hr@123, Employee@123)
INSERT INTO users (name, email, password_hash, role) VALUES
  ('System Admin', 'admin@ems.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj', 'admin'),
  ('HR Manager', 'hr@ems.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj', 'hr'),
  ('Employee User', 'employee@ems.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj', 'employee')
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
SELECT 'Aiven database setup complete!' AS status;
SELECT COUNT(*) AS user_count FROM users;
SELECT COUNT(*) AS employee_count FROM employees;