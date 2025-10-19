CREATE DATABASE EMP;

CREATE TABLE emp (
  empno    INT,
  ename    VARCHAR(10),
  job      VARCHAR(9),
  mgr      INT,
  hiredate DATE,
  sal      DECIMAL(7,2),
  comm     DECIMAL(7,2),
  deptno   INT(10) primary key
);

ALTER TABLE emp
ADD email VARCHAR(50);

ALTER TABLE emp
MODIFY sal DECIMAL(10,2);

ALTER TABLE emp
DROP COLUMN comm;

DROP TABLE emp;

TRUNCATE TABLE emp;

RENAME TABLE emp TO employee;

