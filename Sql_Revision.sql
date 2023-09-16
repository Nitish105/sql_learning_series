-- SQL LEARNING ALL COMMANDS

CREATE DATABASE college;

CREATE DATABASE IF NOT EXISTS college;
DROP DATABASE IF EXISTS company;

USE college;

 CREATE TABLE student ( 
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);


INSERT INTO student VALUES(1, "NITISH", 24);
INSERT INTO student VALUES(2, "USHA", 26);
SELECT * FROM student;


CREATE TABLE stud (
	rollno INT PRIMARY KEY,
    name VARCHAR(50)
);
    

 -- for multiple insert values 
INSERT INTO stud
(rollno, name) 
VALUES
(101, "KARAN"),
(102, "ARJUN"),
(103, "RAM");

-- for single value insertion
INSERT INTO stud VALUES (104, "KRISHNA"); 

SELECT * FROM stud;

SHOW DATABASES;
SHOW TABLES;


CREATE TABLE temp1 (
id INT, 
name VARCHAR(50),
age INT, 
city VARCHAR(20),
PRIMARY KEY (id, name)
);


CREATE TABLE emp (
id INT, 
salary INT DEFAULT 25000);

INSERT INTO emp(id) VALUES (101);

SELECT * FROM emp;



 -- sample commands  
 
CREATE DATABASE collegeDB;
USE collegeDB;

CREATE TABLE studentData ( 
rollno INT PRIMARY KEY, 
name VARCHAR(50),
marks INT NOT NULL, 
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO studentData 
(rollno, name, marks, grade, city)
VALUES
(101, "RAM", 85, "B", "DELHI"),
(102, "RAHUL", 95, "A", "MUMBAI"),
(103, "LAXMAN", 75, "C", "JAIPUR"),
(104, "RADHA", 80, "B", "PATNA"),
(105, "SIYA", 100, "A", "DELHI");

-- SELECT Commands 
SELECT name, marks FROM studentData;
SELECT * FROM studentData;
SELECT city FROM studentData;
SELECT DISTINCT city FROM studentData;

-- WHERE Commands
SELECT * FROM studentData WHERE marks > 80;
SELECT * FROM studentData WHERE city = "MUMBAI";

-- WHERE Clause operators
SELECT * FROM studentData WHERE  marks = 85 AND City = "DELHI";
SELECT * FROM studentData WHERE  marks = 90 OR City = "DELHI";
SELECT * FROM studentData WHERE  marks BETWEEN  80  AND 90;
SELECT * FROM studentData WHERE  city IN ("DELHI", "MUMBAI");
SELECT * FROM studentData WHERE  city IN ("DELHI", "MUMBAI");
SELECT * FROM studentData WHERE  city NOT IN ("DELHI", "MUMBAI");

-- LIMIT Clause Command
SELECT * FROM studentData LIMIT 3;
SELECT * FROM studentData WHERE  marks > 80 LIMIT 2;

-- ORDER BY Clause Command
SELECT * FROM studentData 
ORDER BY marks ASC;  -- ASCENDING ORDER 

SELECT * FROM studentData 
ORDER BY marks DESC;  -- DESCENDING ORDER 

SELECT * FROM studentData 
ORDER BY marks DESC
LIMIT 3;  -- DESCENDING ORDER with only 3 data required 


-- Aggregate Functions 
SELECT MAX(marks) FROM studentData;
SELECT AVG(marks)FROM studentData; 
SELECT COUNT(marks)FROM studentData; 

-- GROUP BY Clause 
-- count number of student in each city
SELECT city, Count(name)
FROM studentData
GROUP BY city;

SELECT grade, count(rollno)
FROM studentData
GROUP BY grade
ORDER BY grade;


-- HAVING Clause
SELECT city, count(name)
FROM studentData
GROUP BY city
HAVING max(marks) > 90;

SELECT city
FROM studentData
WHERE grade = "B"
GROUP BY city
HAVING MAX(marks) >= 80
ORDER BY city DESC;


-- UPDATE Command
SET SQL_SAFE_UPDATES = 0;

UPDATE studentData
SET grade = "O"
WHERE grade = "A";

SELECT * FROM studentData;


-- DELETE COMMAND 
DELETE FROM studentData
WHERE marks = 75;

SELECT * FROM studentData;

-- FOREIGN KEY 

CREATE TABLE department ( 
id INT PRIMARY KEY, 
name VARCHAR(50)
);

INSERT INTO department
VALUES
(101, "english"),
(102, "IT");



UPDATE department
SET id = 111
WHERE id = 101;

SELECT * FROM department;

-- CASCADING FOREIGN KEY for delete cascade and update cascade

CREATE TABLE teacher ( 
id INT PRIMARY KEY, 
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- DROP TABLE teacher;

INSERT INTO teacher
VALUES
(101, "adam", 101),
(102, "Ishika", 102);

SELECT * FROM teacher;


-- ALTER Command
ALTER TABLE studentData
-- ADD COLUMN age INT NOT NULL DEFAULT 19;
-- MODIFY COLUMN age VARCHAR(2);
-- CHANGE age  stud_age INT;
-- RENAME TO stu;

DROP COLUMN stud_age;

INSERT INTO studentData 
(rollno, name, marks, grade, city)
VALUES
(101, "RAM", 85, "B", "DELHI"),
(102, "RAHUL", 95, "A", "MUMBAI"),
(103, "LAXMAN", 75, "C", "JAIPUR"),
(104, "RADHA", 80, "B", "PATNA"),
(105, "SIYA", 100, "A", "DELHI");


-- TRUNCATE COMMAND

TRUNCATE TABLE studentData; 

SELECT * FROM studentData;


-- JOINS Commands
CREATE TABLE student_table_A ( 
id INT PRIMARY KEY, 
name VARCHAR(50)
);

INSERT INTO student_table_A
(id, name)
VALUES
(101, "RAM"),
(102, "SITA"),
(103, "LAXMAN");


CREATE TABLE course_table_B( 
id INT PRIMARY KEY, 
course VARCHAR(50)
);

INSERT INTO course_table_B
(id, course)
VALUES
(102, "JAVA"),
(104, "PYTHON"),
(103, "DEVOPS"),
(105, "DATA SCIENCE");

SELECT * FROM student_table_A;
SELECT * FROM course_table_B;

-- INNER JOIN
SELECT * 
FROM student_table_A as student
INNER JOIN course_table_B as course
ON student.id = course.id;

-- OUTER JOINS
-- LEFT JOIN 
SELECT * 
FROM student_table_A as student
LEFT JOIN course_table_B as course
ON student.id = course.id;

-- RIGHT JOIN
SELECT * 
FROM student_table_a AS student
RIGHT JOIN course_table_B AS course
ON student.id = course.id;

-- FULL JOIN 
-- syntax
-- LEFT JOIN 
-- UNION 
-- RIGHT JOIN 

SELECT * FROM student_table_A as student
LEFT JOIN course_table_B as course
ON student.id = course.id
UNION
SELECT * FROM student_table_a AS student
RIGHT JOIN course_table_B AS course
ON student.id = course.id;

-- LEFT EXCLUSIVE JOIN
SELECT * 
FROM student_table_A as student
LEFT JOIN course_table_B as course
ON student.id = course.id
WHERE course.id IS NULL;

-- RIGHT EXCLUSIVE JOIN
SELECT * 
FROM student_table_A as student
RIGHT JOIN course_table_B as course
ON student.id = course.id
WHERE student.id IS NULL;

-- FULL EXCLUSIVE JOIN 
-- syntax
-- LEFT EXCLUSIVE JOIN 
-- UNION 
-- RIGHT EXCLUSIVE JOIN

SELECT * 
FROM student_table_A as student
LEFT JOIN course_table_B as course
ON student.id = course.id
WHERE course.id IS NULL
UNION
SELECT * 
FROM student_table_A as student
RIGHT JOIN course_table_B as course
ON student.id = course.id
WHERE student.id IS NULL;


-- SELF Join
CREATE TABLE employee (
id INT PRIMARY KEY, 
name VARCHAR(50), 
manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "RAM", 103),
(102, "SITA", 104),
(103, "LAXMAN", NULL),
(104, "HANUMAN", 103);

SELECT * FROM employee;

-- Using Self Join command
SELECT a.name as manager_names, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


-- UNION Command
SELECT name FROM employee 
UNION 
SELECT name FROM employee ;

-- UNION ALL command
SELECT name FROM employee 
UNION ALL
SELECT name FROM employee ;



-- SUB QUERIES SQL Commands
CREATE TABLE studentRecord ( 
rollno INT PRIMARY KEY, 
name VARCHAR(50),
marks INT NOT NULL, 
city VARCHAR(50)
);

INSERT INTO studentRecord
(rollno, name, marks, city)
VALUES
(101, "RAM", 85, "DELHI"),
(102, "RAHUL", 95, "PUNE"),
(103, "LAXMAN", 75, "MUMBAI"),
(104, "RADHA", 80, "MUMBAI"),
(105, "SIYA", 100, "PATNA"), 
(106, "Ridhi", 90, "DELHI");

DROP TABLE studentRecord;
SELECT * FROM studentRecord;

-- find the average of of class
SELECT AVG(marks) as avg FROM studentRecord;

-- find the names of students with marks > average
SELECT name, marks
FROM studentRecord
WHERE marks > 87.6667;

-- use sub query
SELECT name, marks
FROM studentRecord
WHERE marks > (SELECT AVG(marks) as avg FROM studentRecord);

-- find even roll numbers
SELECT rollno 
FROM studentRecord
WHERE rollno % 2 = 0;

-- find all the name of students with even roll no. from the table
SELECT name, rollno
FROM studentRecord
WHERE rollno IN (SELECT rollno FROM studentRecord WHERE rollno % 2 = 0);

-- Using FROM With Sub-query

-- find the student of delhi
SELECT * FROM studentRecord
WHERE city = "DELHI";

-- find their max marks using sublist in step1;
SELECT MAX(marks) 
FROM (SELECT * FROM studentRecord WHERE city = "DELHI") AS temp;

-- Using SELECT With Sub-query
SELECT (SELECT MAX(marks) FROM studentRecord), name
FROM studentRecord;



-- VIEW Command
-- it is temparay table

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM studentRecord;

SELECT * FROM view1;

SELECT * FROM view1
WHERE marks > 90;

DROP VIEW view1;

SELECT * FROM view1;