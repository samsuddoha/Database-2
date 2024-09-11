create table students(
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(100) NOT NULL,
 phone VARCHAR(20) NOT NULL, 
 roll VARCHAR(20) NOT NULL, 
 email VARCHAR(100) NOT NULL,
 address VARCHAR NOT NULL, 
 dept_id INT 
 );
CREATE TABLE eachers (
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(100) NOT NULL,
 designation VARCHAR(100) NOT NULL, 
 city VARCHAR(20) NOT NULL, 
 salary DECIMAL(10,2)
 );

-- Find the name, designation and salary of all teachers.
SELECT name, designatiom, salary from teachers;

--Find the name, roll of all students.
SELECT name, roll from students;

--DISTINCT

--Q1: Find the distinct city of students. 
SELECT DISTINCT city from students;
--Q2: find the number of distinct city
SELECT COUNT(DISTINCT city) from students;
--Q3: Write a SQL query to Find the total number of unique designations in teachers table.
SELECT COUNT(DISTINCT designation) from teachers;

--WHERE clause

--Q1: Find the information of student having id 101
	SELECT * FROM students WHERE id=101;
--Q2: find the list of teachers who are professor [return name and salary only]
	SELECT name, salary FROM teachers 
	WHERE designation=‘Professor’;
	
-- Q3: Find the students who are from dhaka

--Q4: find the student list whose department id is 2.

--Exercises
--Q1: Find the name and designation of teachers whose salary is greater than 50,000.
	SELECT name, designation from teachers WHERE salary>50000;
--Q2: Find the number of students.
	SELECT	COUNT(*) from students;
	
--Q3: How many students are from Dhaka.
	SELECT	COUNT(*) from students WHERE city='Dhaka';
--Q4: Find the list of students from Barishal.
	SELECT * FROM students WHERE city='Barishal';
	
