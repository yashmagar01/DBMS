Create database pr15;
Use pr15;

CREATE TABLE dept (
  deptno INT PRIMARY KEY,
  dname  VARCHAR(20),
  loc    VARCHAR(20)
) ENGINE=InnoDB;

CREATE TABLE emp (
  empno    INT PRIMARY KEY,
  ename    VARCHAR(30),
  job      VARCHAR(20),
  mgr      INT NULL,
  hiredate DATE,
  sal      DECIMAL(7,2),
  comm     DECIMAL(7,2),
  deptno   INT,
  CONSTRAINT fk_emp_dept FOREIGN KEY (deptno) REFERENCES dept(deptno)
) ;

INSERT INTO dept (deptno, dname, loc) VALUES
(10, 'SALES',   'Mumbai'),
(20, 'IT',      'Pune'),
(30, 'HR',      'Nagpur'),
(40, 'FINANCE', 'Nashik'),
(50, 'R&D',     'Aurangabad');
INSERT INTO emp VALUES
(1001, 'YASH MAGAR',       'MANAGER',    NULL, '2023-06-15', 90000.00, 7000.00, 10),
(1002, 'ADITI PATIL',      'SALESMAN',   1001, '2023-07-10', 30000.00, 5000.00, 10),
(1003, 'ROHAN DESHMUKH',   'SALESMAN',   1001, '2023-08-01', 32000.00, 4000.00, 10),
(1004, 'SNEHA RANE',       'CLERK',      1001, '2023-09-05', 22000.00,   NULL,  10),
(1005, 'PRAKASH SHINDE',   'SALESMAN',   1001, '2023-10-12', 28000.00, 3500.00, 10),
(1006, 'KAVITA KULKARNI',  'ACCOUNTANT', 1001, '2024-01-20', 35000.00,   NULL,  10);
INSERT INTO emp VALUES
(1010, 'SAGAR PAWAR',      'MANAGER',    NULL, '2022-05-15', 80000.00,   NULL,  20),
(1011, 'NEHA JOSHI',       'DEVELOPER',  1010, '2023-03-01', 65000.00,   NULL,  20),
(1012, 'ARJUN SHARMA',     'DEVELOPER',  1010, '2023-04-10', 62000.00,   NULL,  20),
(1013, 'PRIYA KULKARNI',   'TESTER',     1010, '2023-05-08', 45000.00,   NULL,  20);
INSERT INTO emp VALUES
(1020, 'MEERA NAIR',       'MANAGER',    NULL, '2022-09-01', 70000.00,   NULL,  30),
(1021, 'RAHUL GUPTA',      'CLERK',      1020, '2023-02-15', 25000.00,   NULL,  30);
INSERT INTO emp VALUES
(1032, 'SONALI DESHPANDE', 'MANAGER',    NULL, '2021-11-11', 75000.00,   NULL,  40),
(1030, 'AMIT PATIL',       'ACCOUNTANT', 1032, '2023-01-25', 48000.00,   NULL,  40),
(1031, 'KIRAN MORE',       'CLERK',      1032, '2023-01-30', 23000.00,   NULL,  40);
INSERT INTO emp VALUES
(1040, 'DEVENDRA KALE',    'SCIENTIST',  NULL, '2024-02-20', 90000.00,   NULL,  50);

-- stpe 1
SELECT
  d.deptno,
  d.dname,
  MIN(e.sal) AS Minimum
FROM dept AS d
JOIN emp  AS e ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;

-- step 2
SELECT
  d.deptno,
  d.dname,
  SUM(e.sal) AS Total
FROM dept AS d
JOIN emp  AS e ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.deptno;

-- step 3
SELECT
  d.deptno,
  d.dname,
  COUNT(e.empno) AS emp_count
FROM dept AS d
JOIN emp  AS e ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname
HAVING COUNT(e.empno) > 5
ORDER BY d.deptno;

-- step 4
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
ORDER BY ename ASC;

-- step 5
SELECT
  d.deptno,
  d.dname,
  COUNT(e.empno) AS emp_count
FROM dept AS d
LEFT JOIN emp AS e ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname
ORDER BY d.dname;
