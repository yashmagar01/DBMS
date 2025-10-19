-- step 1
create user jay;
Create database pr5;
use pr5;

create table EMP (
	empno INT,
    empname VARCHAR(20),
    salary decimal(10, 2),
    phno BIGINT(10)
);

create table Dept (
	deptno int,
    empno int,
    deptname varchar(20),
    location varchar(50),
    jobtype varchar(10)
);

-- step 2
Grant select on EMP to jay;
Grant select on Dept to jay;

Create view  emp_data as
select empno, empname, salary, phno 
from EMP;
Create view dept_data as
select deptno, empno, deptname, location, jobtype
from Dept;

-- step 3
GRANT SELECT, INSERT, UPDATE ON EMP TO jay;

-- step 4
GRANT SELECT ON Dept TO jay;
GRANT UPDATE(deptno, empno) ON Dept TO jay;

-- step 5
alter user jay;

-- step 6
REVOKE CREATE, CREATE view ON EMP from jay;
REVOKE CREATE, CREATE view ON Dept from jay;

-- step 7
REVOKE SELECT, UPDATE, INSERT ON EMP from jay;

-- step 8
Create role emp_pvr;

-- step 9
GRANT create, create view ON EMP to emp_pvr;

-- step 10
CREATE user john;
GRANT emp_pvr to jay, john;




