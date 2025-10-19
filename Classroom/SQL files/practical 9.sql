Create database pr9;
Use pr9;

Create table Student(
	stu_id INT,
	stu_name Varchar(50),
    course_id INT NOT NULL,
    Roll_no INT Primary Key,
    percentage Decimal(5,2)
);

-- Data for table Student
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (1, 'Aditi Joshi', 101, 1, 85.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (2, 'Rahul Patil', 102, 2, 90);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (3, 'Sneha Deshmukh', 103, 3, 72);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (4, 'Aakash Nair', 104, 4, 68.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (5, 'Priya Kulkarni', 105, 5, 78);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (6, 'Mohan Yadav', 106, 6, 65);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (7, 'Samir Shinde', 107, 7, 88);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (8, 'Neha Pawar', 108, 8, 92.75);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (9, 'Vikram More', 109, 9, 54.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (10, 'Rina Bhosale', 110, 10, 49);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (11, 'Kiran Gaikwad', 111, 11, 77.25);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (12, 'Anita Jadhav', 112, 12, 70.33);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (13, 'Sandeep Patankar', 113, 13, 60.6);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (14, 'Vishal Thakur', 114, 14, 58.7);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (15, 'Geeta Tiwari', 115, 15, 85);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (16, 'Nitin Suryavanshi', 116, 16, 40);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (17, 'Sunil Chavan', 117, 17, 45);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (18, 'Meera Sane', 118, 18, 92);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (19, 'Akshay Waghmare', 119, 19, 62);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (20, 'Sonali Sardesai', 120, 20, 66);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (21, 'Ramesh Ghosh', 121, 21, 37.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (22, 'Amit Pawar', 122, 22, 40);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (23, 'Bhavna Jadhav', 123, 23, 89);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (24, 'Tushar Khedkar', 124, 24, 95);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (25, 'Kashish Wankhede', 125, 25, 94.55);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (26, 'Ankur Bhandari', 101, 26, 82.1);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (27, 'Nidhi Gharpure', 102, 27, 75.9);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (28, 'Yogesh Jadhav', 103, 28, 81);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (29, 'Neelam Tiwari', 104, 29, 62);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (30, 'Sujit Kumar', 105, 30, 80);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (31, 'Himanshu Chhapparia', 106, 31, 97);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (32, 'Shruti Kamat', 107, 32, 67.75);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (33, 'Lata Shinde', 108, 33, 69.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (34, 'Sakshi Bhagat', 109, 34, 72.4);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (35, 'Akanksha Bansal', 110, 35, 86.2);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (36, 'Darshan Vandane', 111, 36, 61);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (37, 'Tanmay Deva', 112, 37, 74);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (38, 'Kavita Rane', 113, 38, 90.8);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (39, 'Deepak Kamble', 114, 39, 50);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (40, 'Rekha Karade', 115, 40, 56.4);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (41, 'Tanvi Suryawanshi', 116, 41, 93);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (42, 'Ajay Sathe', 117, 42, 61.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (43, 'Kiran Mane', 118, 43, 79);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (44, 'Simran Shevale', 119, 44, 55.7);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (45, 'Rujula Dhanvij', 120, 45, 80);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (46, 'Chitra Joshi', 121, 46, 30);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (47, 'Bhushan Choudhary', 122, 47, 52);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (48, 'Karan Joshi', 123, 48, 70);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (49, 'Sheetal Patil', 124, 49, 66.5);
INSERT INTO Student (stu_id, stu_name, course_id, Roll_no, percentage) VALUES (50, 'Neeraj Bhat', 125, 50, 45);

-- step 1
Select * From Student
Where percentage >=60 AND percentage <=100;

-- Step 2
Select * From Student
Where Roll_no > 15;

-- Step 3
Select stu_id, Roll_no From Student
Where course_id != 121;

