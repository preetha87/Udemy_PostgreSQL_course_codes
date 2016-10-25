/*Q1(A). The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year. 
The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, email, and phone.
The constraints are mostly up to you, but your table constraints do have to consider the following:
1. We must have a phone number to contact students in case of an emergency.
2. We must have ids as the primary key of the tables
3.Phone numbers and emails must be unique to the individual.*/

/*CREATE STUDENT TABLE*/
CREATE TABLE Student(
Student_ID INTEGER PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL, 
Homeroom_Number INTEGER UNIQUE NOT NULL,
Phone VARCHAR(100) UNIQUE NOT NULL,
Email VARCHAR(100) UNIQUE NULL);

/*CREATE TEACHER TABLE*/
CREATE TABLE Teacher(
Teacher_ID INTEGER PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL,
Last_Name VARCHAR(50) NOT NULL, 
Homeroom_Number INTEGER UNIQUE NOT NULL,
Department VARCHAR(200) NOT NULL,
Phone VARCHAR(100) UNIQUE NOT NULL,
Email VARCHAR(100) UNIQUE NULL);

/*Q1.(B) ADD THE GRADUATION YEAR COLUMN!*/
ALTER TABLE Student 
ADD COLUMN Graduation_Year INTEGER;

/*Q2. Once you've made the tables, insert a student named Mark Watney (student_id=1) who has a 
phone number of 777-555-1234 and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.

Answer: 

/*INSERT A VALUE INTO THE STUDENT TABLE*/

INSERT INTO Student (Student_ID, First_Name, Last_Name, Homeroom_Number, Phone, Email, Graduation_Year)
VALUES (1, 'Mark', 'Watney', 5, '777-555-1234', NULL, 2035);

/*CHECK TO SEE IF EVERYTHING IS OK*/
SELECT *
FROM Student;

/*Q3. Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. 
His contact info is: jsalk@school.org and a phone number of 777-555-4321.*/

/*INSERT A VALUE INTO THE TEACHER TABLE*/
INSERT INTO Teacher (Teacher_ID, First_Name, Last_Name, Homeroom_Number, Department, Phone, Email)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology', '777-555-4321', 'jsalk@school.org');

/*CHECK TO SEE IF EVERYTHING IS OK*/
SELECT *
FROM Teacher;
