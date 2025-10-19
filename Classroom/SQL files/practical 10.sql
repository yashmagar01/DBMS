Create database pr10;
Use pr10;

Create table emp1 (
	empno INT,
    ename Varchar(50),
    deptno INT
);

Create table emp2 (
	empno INT,
    ename Varchar(50),
    deptno INT
);
-- Data for table emp1
INSERT INTO emp1 (empno, ename, deptno) VALUES (1, 'Rahul Deshmukh', 101);
INSERT INTO emp1 (empno, ename, deptno) VALUES (2, 'Sanjay Kulkarni', 102);
INSERT INTO emp1 (empno, ename, deptno) VALUES (3, 'Priya Patil', 103);
INSERT INTO emp1 (empno, ename, deptno) VALUES (4, 'Neha Joshi', 102);
INSERT INTO emp1 (empno, ename, deptno) VALUES (5, 'Aniket Gore', 101);
INSERT INTO emp1 (empno, ename, deptno) VALUES (6, 'Snehal Ghosh', 104);
INSERT INTO emp1 (empno, ename, deptno) VALUES (7, 'Ravi Nair', 105);
INSERT INTO emp1 (empno, ename, deptno) VALUES (8, 'Vijay Patil', 106);
INSERT INTO emp1 (empno, ename, deptno) VALUES (9, 'Pooja Sutar', 107);
INSERT INTO emp1 (empno, ename, deptno) VALUES (10, 'Akash Chavan', 108);
INSERT INTO emp1 (empno, ename, deptno) VALUES (11, 'Rahul Deshmukh', 101);
INSERT INTO emp1 (empno, ename, deptno) VALUES (12, 'Riya Deshmukh', 109);
INSERT INTO emp1 (empno, ename, deptno) VALUES (13, 'Nitin Bhosale', 102);
INSERT INTO emp1 (empno, ename, deptno) VALUES (14, 'Shivani Kale', 103);
INSERT INTO emp1 (empno, ename, deptno) VALUES (15, 'Sumit Jadhav', 104);
INSERT INTO emp1 (empno, ename, deptno) VALUES (16, 'Reshma Mane', 105);
INSERT INTO emp1 (empno, ename, deptno) VALUES (17, 'Kunal Yadav', 106);
INSERT INTO emp1 (empno, ename, deptno) VALUES (18, 'Neerav Naik', 107);
INSERT INTO emp1 (empno, ename, deptno) VALUES (19, 'Deepali Sane', 108);
INSERT INTO emp1 (empno, ename, deptno) VALUES (20, 'Tejas Suryawanshi', 109);
INSERT INTO emp1 (empno, ename, deptno) VALUES (21, 'Pavan Waghmare', 110);
INSERT INTO emp1 (empno, ename, deptno) VALUES (22, 'Rahul Deshmukh', 101);
INSERT INTO emp1 (empno, ename, deptno) VALUES (23, 'Swapnil Powale', 111);
INSERT INTO emp1 (empno, ename, deptno) VALUES (24, 'Snehal Ghosh', 104);
INSERT INTO emp1 (empno, ename, deptno) VALUES (25, 'Mohit Kadam', 112);

-- Data for table emp2
INSERT INTO emp2 (empno, ename, deptno) VALUES (1, 'Kiran Jadhav', 113);
INSERT INTO emp2 (empno, ename, deptno) VALUES (2, 'Rahul Deshmukh', 101);
INSERT INTO emp2 (empno, ename, deptno) VALUES (3, 'Gaurav More', 104);
INSERT INTO emp2 (empno, ename, deptno) VALUES (4, 'Anjali Sawant', 114);
INSERT INTO emp2 (empno, ename, deptno) VALUES (5, 'Nikhil Bhosale', 115);
INSERT INTO emp2 (empno, ename, deptno) VALUES (6, 'Siddharth Lokhande', 116);
INSERT INTO emp2 (empno, ename, deptno) VALUES (7, 'Neha Patil', 117);
INSERT INTO emp2 (empno, ename, deptno) VALUES (8, 'Rahul Deshmukh', 101);
INSERT INTO emp2 (empno, ename, deptno) VALUES (9, 'Ritika Dhumal', 118);
INSERT INTO emp2 (empno, ename, deptno) VALUES (10, 'Minal Nikam', 119);
INSERT INTO emp2 (empno, ename, deptno) VALUES (11, 'Vaibhav Nirmal', 120);
INSERT INTO emp2 (empno, ename, deptno) VALUES (12, 'Harshada More', 113);
INSERT INTO emp2 (empno, ename, deptno) VALUES (13, 'Praveen Wagh', 122);
INSERT INTO emp2 (empno, ename, deptno) VALUES (14, 'Shivani Malhotra', 123);
INSERT INTO emp2 (empno, ename, deptno) VALUES (15, 'Nidhi Joshi', 114);
INSERT INTO emp2 (empno, ename, deptno) VALUES (16, 'Saurabh Patil', 124);
INSERT INTO emp2 (empno, ename, deptno) VALUES (17, 'Kavita Bansode', 125);
INSERT INTO emp2 (empno, ename, deptno) VALUES (18, 'Amit Kulkarni', 126);
INSERT INTO emp2 (empno, ename, deptno) VALUES (19, 'Poonam Nale', 127);
INSERT INTO emp2 (empno, ename, deptno) VALUES (20, 'Rohit Jadhav', 128);
INSERT INTO emp2 (empno, ename, deptno) VALUES (21, 'Manish Khapre', 129);
INSERT INTO emp2 (empno, ename, deptno) VALUES (22, 'Shivaji Patil', 130);
INSERT INTO emp2 (empno, ename, deptno) VALUES (23, 'Rahul Deshmukh', 101);
INSERT INTO emp2 (empno, ename, deptno) VALUES (24, 'Sumit Patil', 131);
INSERT INTO emp2 (empno, ename, deptno) VALUES (25, 'Manisha Godbole', 132);

-- step 1
Select ename From emp1
UNION ALL
Select ename From emp2;

-- step 2
Select ename From emp1
UNION 
Select ename from emp2;

-- step 3
SELECT ename FROM emp1  
INTERSECT  
SELECT ename FROM emp2;

-- step 4
Select ename FROM emp1
MINUS 
Select ename FROM emp2;
