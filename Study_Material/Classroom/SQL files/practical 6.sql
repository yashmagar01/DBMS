use pr5;
Start transaction;

Update emp
Set salary = salary + 5000
Where empno = 1;

-- step 1
COMMIT ;

-- Data for table EMP
INSERT INTO EMP (empno, empname, salary, phno) VALUES (1, 'Rahul Joshi', 30000, 9876543210);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (2, 'Sneha Patil', 25000, 8765432109);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (3, 'Amit Deshmukh', 45000, 7654321098);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (4, 'Priya Kulkarni', 32000, 6543210987);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (5, 'Vijay Chavan', 28000, 5432109876);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (6, 'Anjali Bhosale', 37000, 4321098765);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (7, 'Suresh Patil', 41000, 3210987654);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (8, 'Neha Suryawanshi', 22000, 2109876543);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (9, 'Kiran Shinde', 34000, 1098765432);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (10, 'Ajay Mehta', 36000, 9876543211);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (11, 'Vaishali Desai', NULL, 8765432108);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (12, 'Ravi Sane', 50000, 7654321097);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (13, 'Sheetal Rane', 33000, 6543210986);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (14, 'Prashant Naik', NULL, 5432109875);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (15, 'Deepali Jadhav', 29000, 4321098764);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (16, 'Milind Bhagat', 45000, 3210987653);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (17, 'Komal Tiwari', 31000, 2109876542);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (18, 'Shivam Phadtare', 38000, 1098765431);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (19, 'Nisha Gite', 23000, 9876543212);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (20, 'Omkar Dhumal', 47000, 8765432107);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (21, 'Tanvi Yadav', 26000, 7654321096);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (22, 'Nikhil Gawande', 34000, 6543210985);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (23, 'Sonali Khedkar', 30000, 5432109874);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (24, 'Siddharth Kadam', 42000, 4321098763);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (25, 'Ankita Korde', NULL, 3210987652);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (26, 'Manish Waghmare', 36000, 2109876541);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (27, 'Deepak Ambedkar', 47000, 1098765430);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (28, 'Vinita Adkar', 28000, 9876543213);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (29, 'Sanjay Wagh', 39000, 8765432106);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (30, 'Poonam Mhatre', 35000, 7654321095);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (31, 'Ajinkya Bhagat', 42000, 6543210984);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (32, 'Gauri Kharat', NULL, 5432109873);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (33, 'Ramesh Khatta', 31000, 4321098762);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (34, 'Rita Pawar', 50000, 3210987651);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (35, 'Bhushan Sakhare', 33000, 2109876540);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (36, 'Devika Mali', 42000, 1098765439);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (37, 'Nirmal Kshirsagar', 29000, 9876543214);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (38, 'Rajesh Suryawanshi', 36000, 8765432105);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (39, 'Shraddha Rane', 24000, 7654321094);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (40, 'Pravin Koli', 47000, 6543210983);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (41, 'Aparna Jagdale', NULL, 5432109872);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (42, 'Hitesh Bhayde', 38000, 4321098761);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (43, 'Aniket Sawant', 31000, 3210987650);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (44, 'Manjiri Joshi', 49000, 2109876539);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (45, 'Siddharth Joshi', 30000, 1098765438);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (46, 'Bhavna Goud', 42000, 9876543215);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (47, 'Pratibha Ghare', NULL, 8765432104);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (48, 'Arvind Khade', 36000, 7654321093);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (49, 'Vasudha Kothawade', 29000, 6543210982);
INSERT INTO EMP (empno, empname, salary, phno) VALUES (50, 'Abhay Bandekar', 52000, 5432109871);

-- step 2
UPDATE emp
SET salary = 40000
WHERE empno = 1;
ROLLBACK;

-- step 3
SAVEPOINT BeforeSalaryUpdate;
UPDATE emp
SET salary = 300000
WHERE empno = 1;
ROLLBACK TO BeforeSalaryUpdate;
COMMIT;

select * from emp;
