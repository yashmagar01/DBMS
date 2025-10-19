-- ============================================
-- Employee Management System - SQL Script
-- For MySQL Community Edition
-- Created by Yash Magar, Snehal Mathole and Varad Mohnalkar for MSBTE Microproject
-- Aim: Simple, clear SQL creating EMS database with sample data and essential features
-- ============================================

-- Create Database
CREATE DATABASE ems_db;
USE ems_db;

-- ============================================
-- 1) Table: Department
-- Stores departments (e.g., HR, IT)
-- ============================================
CREATE TABLE Department (
  dept_id INT AUTO_INCREMENT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL UNIQUE,
  location VARCHAR(100)
);

-- ============================================
-- 2) Table: Job
-- Stores job roles and salary range
-- ============================================
CREATE TABLE Job (
  job_id INT AUTO_INCREMENT PRIMARY KEY,
  job_title VARCHAR(50) NOT NULL UNIQUE,
  min_salary DECIMAL(10, 2) NOT NULL,
  max_salary DECIMAL(10, 2) NOT NULL
);

-- ============================================
-- 3) Table: Employee
-- Stores employee information
-- ============================================
CREATE TABLE Employee (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  dob DATE,
  gender ENUM('Male', 'Female', 'Other') NOT NULL,
  hire_date DATE NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(15),
  dept_id INT,
  job_id INT,
  manager_id INT DEFAULT NULL,
  salary DECIMAL(10, 2),

  -- Foreign key constraints
  CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id),
  CONSTRAINT fk_emp_job FOREIGN KEY (job_id) REFERENCES Job(job_id),
  CONSTRAINT fk_emp_manager FOREIGN KEY (manager_id) REFERENCES Employee(emp_id)
);

-- ============================================
-- 4) Table: Project
-- Stores projects belonging to departments
-- ============================================
CREATE TABLE  Project (
  project_id INT AUTO_INCREMENT PRIMARY KEY,
  project_name VARCHAR(100) NOT NULL UNIQUE,
  dept_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE,

  CONSTRAINT fk_proj_dept FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- ============================================
-- 5) Table: Employee_Project
-- Junction table for many-to-many Employee-Project relations
-- ============================================
CREATE TABLE Employee_Project (
  emp_id INT NOT NULL,
  project_id INT NOT NULL,
  role_in_project VARCHAR(100),
  allocated_hours INT DEFAULT 0,
  assigned_date DATE NOT NULL,

  PRIMARY KEY (emp_id, project_id),
  CONSTRAINT fk_ep_emp FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
  CONSTRAINT fk_ep_proj FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

-- ============================================
-- 6) Table: Attendance
-- Stores daily attendance records
-- ============================================
CREATE TABLE Attendance (
  attendance_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT NOT NULL,
  attendance_date DATE NOT NULL,
  status ENUM('Present', 'Absent', 'Leave') NOT NULL,
  check_in TIME,
  check_out TIME,
  work_hours DECIMAL(4,2) DEFAULT 0.0,
  
  CONSTRAINT fk_att_emp FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- ============================================
-- 7) Table: Leave_Request
-- Stores employee leave requests and their status
-- ============================================
CREATE TABLE Leave_Request (
  leave_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  reason VARCHAR(255),
  approved_by INT DEFAULT NULL,
  status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',

  CONSTRAINT fk_leave_emp FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
  CONSTRAINT fk_leave_approver FOREIGN KEY (approved_by) REFERENCES Employee(emp_id)
);

-- ============================================
-- Sample Data Insertions
-- ============================================

-- Insert into Department
INSERT INTO Department (dept_name, location) VALUES
('Human Resources', 'Mumbai'),
('Information Technology', 'Pune'),
('Finance', 'Mumbai'),
('Marketing', 'Pune'),
('Research & Development', 'Nashik');

-- Insert into Job
INSERT INTO Job (job_title, min_salary, max_salary) VALUES
('HR Executive', 20000.00, 35000.00),
('Software Engineer', 30000.00, 60000.00),
('Senior Software Engineer', 50000.00, 90000.00),
('Accountant', 25000.00, 45000.00),
('Project Manager', 60000.00, 120000.00);

-- Insert into Employee
INSERT INTO Employee (first_name, last_name, dob, gender, hire_date, email, phone, dept_id, job_id, salary, manager_id) VALUES
('Rahul', 'Sharma', '1990-05-20', 'Male', '2021-06-01', 'rahul.sharma@example.com', '9876543210', 2, 2, 45000.00, NULL),
('Sneha', 'Patil', '1985-11-15', 'Female', '2019-04-12', 'sneha.patil@example.com', '9876543211', 1, 1, 32000.00, NULL),
('Ankit', 'Deshpande', '1992-08-10', 'Male', '2020-02-20', 'ankit.deshpande@example.com', '9876543212', 2, 3, 70000.00, 1),
('Neha', 'Kulkarni', '1995-12-05', 'Female', '2022-01-15', 'neha.kulkarni@example.com', '9876543213', 3, 4, 35000.00, NULL),
('Suresh', 'Rao', '1988-03-22', 'Male', '2018-09-10', 'suresh.rao@example.com', '9876543214', 5, 5, 95000.00, NULL);

-- Insert into Project
INSERT INTO Project (project_name, dept_id, start_date, end_date) VALUES
('Payroll System', 1, '2023-01-01', '2023-06-30'),
('Mobile App', 2, '2023-03-15', '2023-12-31'),
('Annual Financial Audit', 3, '2023-04-01', '2023-09-30'),
('Marketing Campaign', 4, '2023-02-01', '2023-07-31'),
('New Product Development', 5, '2023-05-01', '2024-04-30');

-- Insert into Employee_Project
INSERT INTO Employee_Project (emp_id, project_id, role_in_project, allocated_hours, assigned_date) VALUES
(1, 2, 'Lead Developer', 160, '2023-03-20'),
(3, 2, 'Developer', 140, '2023-04-01'),
(2, 1, 'HR Lead', 120, '2023-01-05'),
(5, 5, 'Project Manager', 180, '2023-05-10'),
(4, 4, 'Marketing Analyst', 130, '2023-02-15');

-- Insert into Attendance
INSERT INTO Attendance (emp_id, attendance_date, status, check_in, check_out, work_hours) VALUES
(1, '2023-07-01', 'Present', '09:00:00', '17:30:00', 8.5),
(2, '2023-07-01', 'Absent', NULL, NULL, 0.0),
(3, '2023-07-01', 'Present', '10:00:00', '18:00:00', 8.0),
(4, '2023-07-01', 'Leave', NULL, NULL, 0.0),
(5, '2023-07-01', 'Present', '09:15:00', '18:15:00', 9.0);

-- Insert into Leave_Request
INSERT INTO Leave_Request (emp_id, start_date, end_date, reason, approved_by, status) VALUES
(4, '2023-07-15', '2023-07-20', 'Personal Leave', 2, 'Approved'),
(2, '2023-08-01', '2023-08-03', 'Medical Leave', NULL, 'Pending'),
(3, '2023-08-10', '2023-08-12', 'Conference', 5, 'Approved'),
(5, '2023-09-05', '2023-09-10', 'Vacation', NULL, 'Pending'),
(1, '2023-10-01', '2023-10-05', 'Training', 2, 'Rejected');

-- ============================================
-- Sample Queries - to demonstrate features
-- ============================================

-- a) Arithmetic Functions Examples
-- Calculate annual salary from monthly salary
SELECT emp_id, first_name, last_name, salary, (salary * 12) AS annual_salary FROM Employee;

-- Calculate work hours difference if check-in/check-out times are stored (demo)
SELECT attendance_id, emp_id, attendance_date,
  TIME_TO_SEC(check_out) / 3600 - TIME_TO_SEC(check_in) / 3600 AS calculated_work_hours
FROM Attendance
WHERE check_in IS NOT NULL AND check_out IS NOT NULL;

-- b) String Functions Examples
SELECT
  emp_id,
  UPPER(first_name) AS first_upper,
  LOWER(last_name) AS last_lower,
  CONCAT(first_name, ' ', last_name) AS full_name,
  LENGTH(first_name) AS fname_length,
  LEFT(last_name, 3) AS last3_chars,
  RIGHT(first_name, 2) AS first2_chars_right,
  REPLACE(email, 'example.com', 'company.com') AS email_new_domain,
  TRIM('  sample string  ') AS trimmed_string,
  SUBSTR(email, 1, LOCATE('@', email) - 1) AS email_username
FROM Employee;

-- c) Logical Operators Examples
-- Employees belonging to dept_id = 1 or salary above 50000
SELECT emp_id, first_name, salary
FROM Employee
WHERE dept_id = 1 OR salary > 50000;

-- Employees neither absent nor on leave today (assuming date '2025-09-12')
SELECT emp_id FROM Attendance
WHERE attendance_date = '2023-07-01' AND NOT status IN ('Absent', 'Leave');

-- d) Relational Operators Examples
-- Employees hired between two dates
SELECT emp_id, first_name, hire_date FROM Employee
WHERE hire_date BETWEEN '2019-01-01' AND '2022-12-31';

-- Employees with salary over 60000
SELECT emp_id, first_name, salary FROM Employee
WHERE salary > 60000;

-- Employees with email from company domain (LIKE operator)
SELECT emp_id, email FROM Employee
WHERE email LIKE '%@company.com';

-- e) Aggregate Functions with Group By
-- Count employees in each department
SELECT dept_id, COUNT(*) AS employee_count FROM Employee GROUP BY dept_id;

-- Average salary per job
SELECT job_id, AVG(salary) AS avg_salary FROM Employee GROUP BY job_id;

-- Total allocated hours per project
SELECT project_id, SUM(allocated_hours) AS total_hours FROM Employee_Project GROUP BY project_id;

-- ============================================
--  Index and View
-- ============================================

-- Index on Attendance for faster lookup by employee and date
CREATE INDEX idx_attendance_emp_date ON Attendance(emp_id, attendance_date);

-- View showing active employees with dept and job info (assuming status active is all in table)
CREATE VIEW v_active_employees AS
SELECT e.emp_id, e.first_name, e.last_name, d.dept_name, j.job_title, e.salary
FROM Employee e
JOIN Department d ON e.dept_id = d.dept_id
JOIN Job j ON e.job_id = j.job_id;

-- ============================================
-- Stored Function and Procedure
-- ============================================

DELIMITER $$

-- Function to calculate net salary after 12% PF deduction
CREATE FUNCTION fn_calculate_net_salary(gross_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN gross_salary - (gross_salary * 0.12);
END$$

-- Procedure to increase salary of all employees in a department by a percent
CREATE PROCEDURE sp_increase_dept_salary(IN p_dept_id INT, IN p_percent DECIMAL(5,2))
BEGIN
  UPDATE Employee
  SET salary = salary * (1 + p_percent / 100)
  WHERE dept_id = p_dept_id;
END$$

DELIMITER ;

-- ============================================
-- Trigger - Before insert on attendance to calculate work_hours automatically
-- ============================================

DELIMITER $$

CREATE TRIGGER trg_before_attendance_insert
BEFORE INSERT ON Attendance
FOR EACH ROW
BEGIN
  IF NEW.check_in IS NOT NULL AND NEW.check_out IS NOT NULL THEN
    SET NEW.work_hours = (TIME_TO_SEC(NEW.check_out) - TIME_TO_SEC(NEW.check_in)) / 3600;
  ELSE
    SET NEW.work_hours = 0;
  END IF;
END$$

DELIMITER ;

-- ============================================
-- Cursor Sample: List employees with salary >= input threshold
-- ============================================

DELIMITER $$

CREATE PROCEDURE sp_list_high_earners(IN min_salary DECIMAL(10,2))
BEGIN
  DECLARE done INT DEFAULT FALSE;
  DECLARE empId INT;
  DECLARE empName VARCHAR(100);
  DECLARE empSalary DECIMAL(10,2);

  DECLARE empCursor CURSOR FOR
    SELECT emp_id, CONCAT(first_name, ' ', last_name), salary FROM Employee WHERE salary >= min_salary;
    
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  OPEN empCursor;

  read_loop: LOOP
    FETCH empCursor INTO empId, empName, empSalary;
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- Return result as select
    SELECT empId AS Employee_ID, empName AS Employee_Name, empSalary AS Salary;
  END LOOP;

  CLOSE empCursor;
END$$

DELIMITER ;

-- ============================================
-- User Management: Create users with roles and privileges
-- ============================================

-- Admin users: full privileges
CREATE USER 'team_lead' IDENTIFIED BY 'Password@123';
CREATE USER 'teacher' IDENTIFIED BY 'Password@123';

GRANT ALL PRIVILEGES ON ems_db.* TO 'team_lead';
GRANT ALL PRIVILEGES ON ems_db.* TO 'teacher';

-- Team members: limited DML on Employee, Attendance, Leave_Request
CREATE USER IF NOT EXISTS 'member1' IDENTIFIED BY 'Password@123';
CREATE USER IF NOT EXISTS 'member2' IDENTIFIED BY 'Password@123';

GRANT SELECT, INSERT, UPDATE, DELETE ON ems_db.Employee TO 'member1', 'member2';
GRANT SELECT, INSERT, UPDATE, DELETE ON ems_db.Attendance TO 'member1', 'member2';
GRANT SELECT, INSERT, UPDATE, DELETE ON ems_db.Leave_Request TO 'member1', 'member2';

-- View only user: read access to all tables
CREATE USER IF NOT EXISTS 'viewer' IDENTIFIED BY 'Password@123';
GRANT SELECT ON ems_db.* TO 'viewer';

-- Apply all changes
FLUSH PRIVILEGES;

-- ====================================================
-- End of SQL Script for Employee Management System
-- ====================================================
