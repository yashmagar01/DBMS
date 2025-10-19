Create database pr14;
Use pr14;

create table emp(
		sal INT,
        job Varchar(20),
        deptno INT,
        comm INT
);

-- Data for table emp
INSERT INTO emp (sal, job, deptno, comm) VALUES (56000, 'Manager', 10, 5000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (48000, 'Developer', 10, 2000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (52000, 'Developer', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (58000, 'Manager', 20, 3000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (45000, 'Salesperson', 30, 1500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (47000, 'Salesperson', 30, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (62000, 'Senior Developer', 10, 6000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (51000, 'Analyst', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (43000, 'Salesperson', 30, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (55000, 'Manager', 30, 4000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (48000, 'Developer', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (60000, 'Developer', 10, 3000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (75000, 'Product Manager', 20, 5000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (53000, 'Manager', 30, 3500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (49000, 'Support', 10, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (47000, 'Salesperson', 30, 2000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (45000, 'Developer', 20, 1000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (64000, 'Senior Analyst', 10, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (72000, 'Project Lead', 20, 4500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (69000, 'Senior Salesperson', 30, 7000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (59000, 'Manager', 10, 3000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (52000, 'Business Analyst', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (42000, 'Intern', 30, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (50000, 'Support', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (45000, 'Intern', 30, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (66000, 'Senior Developer', 10, 3500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (74000, 'Project Manager', 20, 6000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (55000, 'Sales Manager', 30, 2500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (61000, 'Senior Contributor', 10, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (68000, 'Lead Developer', 20, 4000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (72000, 'Manager', 30, 5500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (47000, 'Sales Coordinator', 10, 1500);
INSERT INTO emp (sal, job, deptno, comm) VALUES (59000, 'Senior Salesperson', 20, 5000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (60000, 'Developer', 30, 3000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (54000, 'Team Leader', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (75000, 'Director', 10, 8000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (52000, 'System Analyst', 20, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (63000, 'Senior Consultant', 30, NULL);
INSERT INTO emp (sal, job, deptno, comm) VALUES (72000, 'Manager', 10, 3000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (67000, 'Sales Director', 20, 6000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (49000, 'Junior Developer', 30, 1000);
INSERT INTO emp (sal, job, deptno, comm) VALUES (50000, 'Sales Assistant', 10, 1200);
INSERT INTO emp (sal, job, deptno, comm) VALUES (64000, 'Technical Lead', 20, 3500);

-- step 1
SELECT
  MAX(sal) AS Maximum,
  MIN(sal) AS Minimum,
  SUM(sal) AS Sum,
  AVG(sal) AS Average
FROM emp;

-- step 2
SELECT
  COUNT(*) AS `number of managers`
FROM emp
WHERE UPPER(job) = 'MANAGER';

-- stpe 3
SELECT
  (MAX(sal) - MIN(sal)) AS DIFFERENCE
FROM emp;

-- step 4
SELECT
  COUNT(*) AS `dept10_with_commission`
FROM emp
WHERE deptno = 10
  AND COALESCE(comm, 0) > 0;
