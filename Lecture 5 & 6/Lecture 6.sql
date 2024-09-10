-----------------------
--***Lecture 6*****----
--03 september-----
-----------------------

--create new database
CREATE DATABASE test;

--delete existing DATABASE
DROP DATABASE test;

--departments (id, name, location, hod, phone)
--courses(id, title, credit_hours, type)
--students (id, name, roll, phone, address, dob, dept_id )
--teachers(id, name, designation, salary, joining_date, department)

CREATE TABLE departments(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
location VARCHAR(200) NOT NULL,
hod VARCHAR(100), 
phone VARCHAR(50) UNIQUE
);

CREATE TABLE courses(
id INT PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(200) NOT NULL,
 credit_hours DECIMAL(5,2) NOT NULL,
 course_type enum('Theory', 'Lab', 'Viva')
 );

CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT, 
name VARCHAR(100) NOT NULL,
roll VARCHAR(50) NOT NULL UNIQUE, 
phone VARCHAR(15) NOT NULL UNIQUE,
 address VARCHAR(200), 
 dob DATE, 
 dept_id INT,
 FOREIGN KEY(dept_id) REFERENCES departments(id)
 );
 
 --insert to department tables
INSERT INTO departments(id, name, location, hod, phone)
values(NULL, 'Math', '2nd floor', 'ABC', '0987654345678');

--insert into students TABLE
--in this table dept_id is foreign key that will come from departments table. so choose a value that is 
--already in table departments otherwise it will show error

insert into students (id, name, roll, phone, address, dob, dept_id )
values(NULL, 'Rakib', '20CSE001', '+08896', 'Dhaka', '2001-10-10', 1);

