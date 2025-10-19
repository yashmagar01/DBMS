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