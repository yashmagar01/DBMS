Create database pr8;
Use pr8;

Create table Emp (
	empno INT Auto_increment Primary Key Not null,
    ename Varchar(50),
    job Varchar(50),
    mgr INT,
    hiredate Date,
    sal Decimal(10,2),
    comm Decimal(10, 2),
    deptno INT,
    city Varchar(50)
);

-- Data for table Emp
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (1, 'Aditi Deshmukh', 'Software Engineer', NULL, '2021-08-15', 65000, 500, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (2, 'Rahul Patil', 'Software Developer', 1, '2020-05-10', 75000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (3, 'Sneha Joshi', 'UI/UX Expert', 1, '2022-01-12', 50000, NULL, 103, 'Thane');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (4, 'Vivek Kulkarni', 'Frontend Developer', 2, '2019-11-25', 55000, NULL, 101, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (5, 'Neha Gaikwad', 'Backend Developer', 2, '2022-04-05', 48000, NULL, 102, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (6, 'Saurabh Nair', 'Project Manager', NULL, '2018-07-06', 90000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (7, 'Priya Mendon', 'Clerk', 6, '2023-06-16', 20000, 500, 103, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (8, 'Karan Thakur', 'Database Administrator', 6, '2020-02-19', 62000, NULL, 101, 'Ahmednagar');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (9, 'Manish Tiwari', 'Software Tester', 2, '2021-09-29', 37000, NULL, 102, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (10, 'Riya Patankar', 'Clerk', 6, '2023-03-15', 25000, 500, 103, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (11, 'Puja Bhosale', 'Software Engineer', 1, '2021-08-15', 59000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (12, 'Kunal Dange', 'Machine Learning Engineer', 6, '2022-05-03', 72000, NULL, 102, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (13, 'Anjali Bhatia', 'Clerk', 7, '2023-06-20', 30000, 500, 103, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (14, 'Shivam Chavan', 'System Analyst', 1, '2019-10-22', 45000, NULL, 102, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (15, 'Sai Ghosh', 'DevOps Engineer', 6, '2018-03-18', 90000, NULL, 101, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (16, 'Varun Kadam', 'Data Scientist', 12, '2022-10-25', 80000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (17, 'Siddharth Yadav', 'Full Stack Developer', 2, '2021-11-11', 70000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (18, 'Rachana Borate', 'Support Engineer', 8, '2023-02-01', 38000, NULL, 103, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (19, 'Ruturaj Joshi', 'Tech Lead', 6, '2016-12-30', 95000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (20, 'Gaurav Madan', 'Software Engineer', 2, '2021-07-21', 52000, NULL, 101, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (21, 'Chaitanya Shinde', 'Clerk', 5, '2023-08-10', 22000, 500, 103, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (22, 'Aarav Pimplapure', 'Business Analyst', 19, '2021-02-13', 64000, NULL, 101, 'Ahmednagar');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (23, 'Sheetal Jadhav', 'Product Manager', 6, '2019-01-05', 80000, NULL, 102, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (24, 'Ashok Tiwari', 'Software Engineer', NULL, '2021-01-15', 53000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (25, 'Viraj Kherdekar', 'Quality Analyst', 5, '2020-12-25', 45000, NULL, 103, 'Thane');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (26, 'Kartik Bhandari', 'System Engineer', 4, '2022-02-22', 49000, NULL, 101, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (27, 'Tanushree Rao', 'Network Engineer', 6, '2019-07-30', 58000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (28, 'Vishal Gawade', 'Data Analyst', 6, '2019-09-15', 45000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (29, 'Anirudh Peshwa', 'Technical Writer', 23, '2022-03-05', 47000, NULL, 103, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (30, 'Sakshi Rane', 'Manager', 12, '2020-04-19', 51000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (31, 'Tushar Deshmukh', 'Manager', 6, '2021-05-12', 73000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (32, 'Nandini Acharya', 'Senior Software Engineer', 6, '2017-09-11', 91000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (33, 'Mukesh Yadav', 'Technical Support', 8, '2020-11-02', 41000, NULL, 103, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (34, 'Pallavi Nikam', 'Support Engineer', 23, '2022-05-14', 36500, NULL, 103, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (35, 'Siddhi Jadhaw', 'Web Developer', 12, '2021-01-10', 52000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (36, 'Akshay Bhalekar', 'Game Developer', 6, '2018-08-25', 58000, NULL, 101, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (37, 'Pratik Shinde', 'Mobile App Developer', 11, '2019-02-12', 73000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (38, 'Rupesh Pawar', 'Cloud Engineer', 2, '2020-10-30', 62000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (39, 'Tejashree Nene', 'Business Development Executive', 1, '2022-07-15', 53000, NULL, 103, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (40, 'Kartik Patil', 'Site Reliability Engineer', 19, '2021-10-01', 75000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (41, 'Sagar Patil', 'UI/UX Designer', 9, '2022-09-22', 47000, NULL, 102, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (42, 'Mayuri Ali', 'Manager', 12, '2018-02-18', 51000, NULL, 101, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (43, 'Ravi Gunjir', 'Software Consultant', 23, '2021-06-05', 80000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (44, 'Chandrashekhar Nikam', 'Hardware Engineer', 12, '2019-07-10', 49000, NULL, 102, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (45, 'Kavita Phadke', 'Business Analyst', 6, '2020-04-30', 64000, NULL, 103, 'Pune');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (46, 'Deepak Joshi', 'Graphic Designer', 2, '2018-11-20', 49000, NULL, 102, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (47, 'Bhuvaneshwar Koul', 'System Administrator', 6, '2017-05-05', 37000, NULL, 101, 'Nashik');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (48, 'Neelam Jadhaw', 'Junior Developer', 22, '2023-01-29', 33000, NULL, 103, 'Nagpur');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (49, 'Vikrant Gehlot', 'Firmware Engineer', 6, '2018-12-30', 54000, NULL, 101, 'Mumbai');
INSERT INTO Emp (empno, ename, job, mgr, hiredate, sal, comm, deptno, city) VALUES (50, 'Aniket Chavan', 'Network Security Engineer', 38, '2020-09-02', 75000, NULL, 102, 'Pune');


-- Step 1
Select * From Emp 
Where city = 'Mumbai' AND sal > 50000;

-- Step 2
Select * From Emp
Where job = 'clerk' OR comm = 500;

-- step 3
Select * From Emp
Where sal between 20000 AND 50000;

-- Step 4
Select * From Emp
Where city in ('Mumbai', 'Pune', 'Nashik', 'Nagpur');

