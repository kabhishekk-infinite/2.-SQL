-- Create DB
CREATE DATABASE CCA1;

--Use DB
USE CCA1;
GO

-- Creating General employees Table.

CREATE TABLE employees(
	EmpID INT PRIMARY KEY,
	FName VARCHAR(50),
	Lname VARCHAR(50),
	Mail VARCHAR(100),
	Age  INT,
	DOB  DATE,
	DOJ_Month VARCHAR(20),
	DOJ_Year  INT,
	);

INSERT INTO employees (EmpID, FName, Lname, Mail, Age, DOB, DOJ_Month, DOJ_Year)
VALUES  (1, 'Abhishek', 'Kumar', 'abhishek@gmail.com', 24, '1999-07-27', 'May', 2024 ),
		(2, 'Ankit', 'Kumar', 'ankit@gmail.com', 23, '2001-04-24', 'June', 2023),
		(3, 'OM', 'Verma', 'om@gmail.com', 24, '2000-05-13', 'August', 2022),
		(4, 'Kritika', 'Raj', 'kritika@gmail.com', 30, '1994-02-05', 'July', 2019),
		(5, 'Raj', 'Verma', 'raj@gmail.com', 31, '1993-07-27', 'July', 2019),
		(6, 'Ankita', 'Kumari', 'ankita@gmail.com', 34, '1990-07-27', 'July', 2012),
		(7, 'Zoya', 'Khan', 'zoya@gmail.com', 30, '1994-07-27', 'July', 2019),
		(8, 'Lipsa', 'Bharti', 'lipsa@gmail.com', 28, '1996-07-27', 'May', 2017);

-- Check Table
SELECT * FROM employees;


--Q.1.> Write a query to display your birthday( day of week)

SELECT FName, Lname, DOB, 
		DATENAME(WEEKDAY, DOB) AS DayOfWeek
FROM employees
WHERE EmpID = 1;

--Q.2.> Write a query to display your age in days

SELECT FName, Lname, Age, Age * 365 AS AgeInDay
FROM employees
WHERE EmpID = 1;

--Q.3.> Write a query to display all employees information those who joined before 5 years in the current month

SELECT FName, Lname, DOJ_Month, DOJ_Year
FROM employees
WHERE DOJ_Month = 'July'
	AND (DOJ_Year < 2020);

--Q.4.> Create table Employee with empno, ename, sal, doj columns and perform the following operations in a single transaction

	CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    sal DECIMAL(10, 2),
    doj DATE
	);

--a.>
INSERT INTO Employee (empno, ename, sal, doj)
VALUES 
    (1, 'Abhi', 50000.00, '2020-01-15'),
    (2, 'Ankita', 60000.00, '2018-05-20'),
    (3, 'Om', 55000.00, '2019-09-10');

	SELECT * FROM Employee;

--b.>
UPDATE Employee
SET sal = sal * 1.15
WHERE empno = 2;

--c.>
DELETE FROM Employee
WHERE empno = 1;

-- Recall the deleted row without losing increment of second row.
SELECT *
FROM Employee
WHERE empno = 1;


--Q.5.> Create a user defined function calculate Bonus for all employees of a  given job


