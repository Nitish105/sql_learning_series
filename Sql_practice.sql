-- Ques 1: Create your database for your company(Microsoft) , create table employee and insert the value in the table (id, name, salary).

CREATE DATABASE microsoft;

USE microsoft;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "ADAM", 25000),
(2, "BOB", 30000),
(3, "CASEY", 40000);

SELECT * FROM employee;


-- Ques 2: Write an query to find avg marks in each city in ascending order.

CREATE DATABASE collegeDba;
USE collegeDba;

CREATE TABLE studData ( 
rollno INT PRIMARY KEY, 
name VARCHAR(50),
marks INT NOT NULL, 
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO studData 
(rollno, name, marks, grade, city)
VALUES
(101, "RAM", 85, "B", "DELHI"),
(102, "RAHUL", 95, "A", "MUMBAI"),
(103, "LAXMAN", 75, "C", "JAIPUR"),
(104, "RADHA", 80, "B", "PATNA"),
(105, "SIYA", 100, "A", "DELHI");


-- Answer
SELECT city, AVG(marks)
FROM studData
GROUP BY city
ORDER BY city ASC;

-- Quesn 2: Find the total Payment according to each payment method

CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE customerData ( 
customer_id INT PRIMARY KEY, 
customer_name VARCHAR(50),
transaction_mode VARCHAR(20),
city VARCHAR(20)
);

INSERT INTO customerData 
(customer_id, customer_name, transaction_mode, city)
VALUES
(101, "RAM", "Netbanking", "DELHI"),
(102, "RAHUL", "Credit Card", "MUMBAI"),
(103, "LAXMAN", "Credit Card", "JAIPUR"),
(104, "RADHA", "NetBanking", "PATNA"),
(105, "SIYA", "Debit Card", "DELHI"),
(106, "RADHIMA", "Debit Card", "PATNA");

SELECT * FROM customerData;

-- Answer
SELECT transaction_mode, COUNT(customer_name)
FROM CustomerData
GROUP BY transaction_mode; 


-- Ques3: In a student table: 
-- (A) Change the name of column "name" to "full_name"
ALTER TABLE studData
CHANGE name full_name VARCHAR(50);

-- (B) Delete all the students who scored marks less than 80.
SET SQL_SAFE_UPDATES = 0;

DELETE FROM studData 
WHERE marks < 80;

-- (C) DELETE the column for grades.
ALTER TABLE studData
DROP COLUMN grade;

SELECT * FROM studData;



