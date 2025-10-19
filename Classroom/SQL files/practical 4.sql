CREATE DATABASE EMP;

CREATE TABLE emp (
  empno    INT,
  ename    VARCHAR(10),
  job      VARCHAR(9),
  mgr      INT,
  hiredate DATE,
  sal      DECIMAL(7,2),
  comm     DECIMAL(7,2),
  deptno   INT(10) 
);

INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES (101, 'yash', 'Manager', NULL, '2025-08-18', 90000.00, 5000.00, 10);

UPDATE emp
SET sal = 95000.00, comm = 6000.00
WHERE empno = 101;

DELETE FROM emp
WHERE empno = 101;

SELECT * FROM emp;


