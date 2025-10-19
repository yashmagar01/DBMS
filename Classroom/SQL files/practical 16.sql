create database pr16;
Use pr16;

CREATE TABLE dept (
  deptno INT PRIMARY KEY,
  dname  VARCHAR(20),
  loc    VARCHAR(20)
) ;

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

-- Data
INSERT INTO dept (deptno, dname, loc) VALUES
(10,'SALES','Mumbai'),
(20,'IT','Pune'),
(30,'HR','Nagpur');

INSERT INTO emp VALUES
(1100,'SUMIT PATIL','MANAGER',NULL,'2023-05-10',85000.00,NULL,10),
(1101,'NIKHIL','CLERK',1100,'2023-06-15',25000.00,500.00,10),
(1102,'RIYA','SALESMAN',1100,'2023-07-01',30000.00,1500.00,10),
(1103,'PRANAV','DEVELOPER',NULL,'2023-08-01',60000.00,NULL,20),
(1104,'MANSI','ANALYST',1100,'2023-09-05',52000.00,NULL,20);

SELECT e.empno, e.ename, e.deptno, d.loc
FROM emp e
JOIN dept d ON d.deptno = e.deptno
WHERE e.ename = 'NIKHIL';
SELECT e.empno, e.ename, d.dname
FROM emp e
JOIN dept d ON d.deptno = e.deptno
WHERE d.dname = 'SALES'
ORDER BY e.empno;

SELECT e.empno, e.ename, d.dname
FROM emp e
JOIN dept d ON d.deptno = e.deptno
WHERE d.dname <> 'SALES'
ORDER BY e.empno;


SELECT w.ename, w.sal
FROM emp w
JOIN emp m ON w.mgr = m.empno
WHERE m.ename = 'SUMIT PATIL'
ORDER BY w.sal DESC;
