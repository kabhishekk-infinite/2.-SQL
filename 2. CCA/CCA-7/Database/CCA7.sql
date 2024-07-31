CREATE DATABASE CCA4;
--IT's CCA7


USE CCA4
GO

CREATE TABLE book
		(
			id INT PRIMARY KEY,
			title VARCHAR(40),
			author VARCHAR(350),
			isbn VARCHAR(20) UNIQUE,
			reviewerName VARCHAR(30),
			publish_date DATETIME,
			ratings INT
		);
 

INSERT INTO Book (id, title, author, isbn, reviewerName, publish_Date, ratings)
VALUES 
    (1, 'My First SQL book' , 'Mary Parker', '981483029127' , 'John Smith'  , '2012-02-22 12:08:17', 4),
    (2, 'My SECOND SQL book', 'John Mayer' , '857300923713', 'John Smith'  , '1972-07-03 09:22:45', 5),
    (3, 'My THIRD SQL book' , 'Cary Flint' , '523120967812', 'Alice Walker', '2017-10-22 23:47:10', 1)

SELECT * FROM Book

--Questions
--Q1. 
SELECT *
FROM book
WHERE author LIKE '%er';
 
--Q2.
SELECT title, author, reviewerName 
FROM Book;
 
--Q3.
SELECT reviewerName
FROM Book
GROUP BY reviewerName
HAVING COUNT(*) > 1;
 
 -------------------------------------------------------------------------------------


CREATE TABLE Customer 
	(
		id INT PRIMARY KEY,
		name VARCHAR(50),
		address VARCHAR(100),
		age INT,
		salary FLOAT
	);
 
INSERT INTO Customer (id, name, address, age, salary)
VALUES 
    (1, 'RAMESH'  , 'AHMEDABAD', 32, 2000.00),
    (2, 'KHILAN'  , 'DELHI'    , 25, 1500.00),
    (3, 'KAUSHIK' , 'KOTA'     , 23, 2000.00),
	(4, 'CHAITALI', 'MUMBAI'   , 25, 6500.00),
	(5, 'HARDIK'  , 'BHOPAL'   , 27, 8500.00),
	(6, 'KOMAL'   , 'MP'       , 22, 4500),
	(7, 'MUFFY'   , 'INDORE'   , 24, 10000)
 
SELECT * FROM Customer

--Questions
--Q1.
SELECT name
FROM Customer
WHERE address LIKE '%o%';
 

CREATE TABLE ORDERS 
	(
		ORDERID INT PRIMARY KEY,
		ORDER_DATE DATETIME,
		CUSTOMER_ID INT,
		AMOUNT FLOAT,
   );
 
INSERT INTO ORDERS (ORDERID, ORDER_DATE, CUSTOMER_ID, AMOUNT) 
VALUES (102, '2009-10-08 00:00:00', 3, 3000),
       (100, '2009-10-08 00:00:00', 3, 1500),
       (101, '2008-05-20 00:00:00', 2, 1560),
	   (103, '2008-05-20 00:00:00', 4, 2060)
 
 SELECT * FROM ORDERS;

 --Q2.
SELECT order_date, COUNT(DISTINCT customer_id) AS TotalCustomers
FROM ORDERS
GROUP BY order_date;
 
 
CREATE TABLE EMPLOYEE 
	(
		id INT PRIMARY KEY,
		name VARCHAR(50),
		address VARCHAR(100),
		age INT,
		salary FLOAT
	);
 
 
INSERT INTO EMPLOYEE(id, name, address, age, salary)
VALUES 
    (1, 'RAMESH'  , 'AHMEDABAD', 32, 2000.00),
    (2, 'KHILAN'  , 'DELHI'    , 25, 1500.00),
    (3, 'KAUSHIK' , 'KOTA'     , 23, 2000.00),
	(4, 'CHAITALI', 'MUMBAI'   , 25, 6500.00),
	(5, 'HARDIK'  , 'BHOPAL'   , 27, 8500.00),
	(6, 'KOMAL'   , 'MP'       , 22, NULL),
	(7, 'MUFFY'   , 'INDORE'   , 24, NULL)
 
 SELECT * FROM EMPLOYEE;
 
 --Q3.
SELECT LOWER(name) AS LowercaseName
FROM Employee
WHERE salary IS NULL;
 
 
 ---------------------------------------------------------------------------------------
 

CREATE TABLE Students 
	(
		reg INT PRIMARY KEY,
		name VARCHAR(100),
		age INT,
		qualification VARCHAR(100),
		mobile_no VARCHAR(15),
		mail_id VARCHAR(100),
		location VARCHAR(255),
		gender CHAR(1)
	);
 
 
INSERT INTO Students (reg, name,  age, qualification, mobile_no, mail_id, location, gender)
VALUES 
    (2, 'SAI'  , 22, 'BE', '9952836777', 'SAI@GMAIL.COM', 'CHENNAI', 'M'),
    (3, 'KUMAR', 20, 'BSC', '7890125648', 'KUMAR@GMAIL.COM', 'MADURAI', 'M'),
    (4, 'SELVI', 22, 'BTECH', '8904567342', 'SELVI@GMAIL.COM', 'SELAM', 'F'),
	(5, 'NISHA', 25, 'ME', '7834672310', 'NISHA@GMAIL.COM', 'THENI', 'F'),
	(6, 'SAISARAN', 21, 'BA', '7890345678', 'SARAN@GMAIL.COM', 'MADURAI', 'F'),
	(7, 'TOM',   23, 'BCA', '8901234675', 'TOM@GMAIL.COM', 'PUNE', 'M')

SELECT * FROM Students;
 
 --Questions
 --Q.1
SELECT gender, COUNT(*) AS TotalEmployees
FROM Students
GROUP BY gender;
 