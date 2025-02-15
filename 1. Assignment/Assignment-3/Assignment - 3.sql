-- Create DB

CREATE DATABASE Assignment3;

--use db
USE Assignment3;

--Create Tables

-- DEPT table
	CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(20),
    LOC VARCHAR(20)
	);

-- EMP table
	CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR_ID INT,
    HIREDATE DATE,
    SAL DECIMAL(10, 2),
    COMM DECIMAL(10, 2),
    DEPTNO INT,
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
	);

-- CHeck Tables
Select * From DEPT, EMP;

-- Now Insert data 

INSERT INTO DEPT (DEPTNO, DNAME, LOC) VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR_ID, HIREDATE, SAL, COMM, DEPTNO) VALUES
(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800, NULL, 20),
(7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600, 300, 30),
(7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250, 500, 30),
(7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975, NULL, 20),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850, NULL, 30),
(7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450, NULL, 10),
(7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000, NULL, 20),
(7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
(7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500, 0, 30),
(7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100, NULL, 20),
(7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950, NULL, 30),
(7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000, NULL, 20),
(7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300, NULL, 10);


-- CHeck Tables with values
Select * From DEPT;
Select * From EMP;

--1.
SELECT ENAME, JOB, EMPNO
FROM EMP
WHERE JOB = 'MANAGER';

-- OR

SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER';

--2.
SELECT ENAME, SAL
FROM EMP
WHERE SAL > 1000;

--3.
SELECT ENAME, SAL
FROM EMP
WHERE ENAME <> 'JAMES';

--4.
SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

--5.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%';

--6.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__L%';

--7.
SELECT	ENAME, SAL / 30 AS DAILY_SALARY
FROM EMP
WHERE ENAME = 'JONES';

--8.
SELECT SUM(SAL) AS TOTAL_MONTHLY_SALARY
FROM EMP;

--9.
SELECT AVG(SAL*12) AS TOTAL_MONTHLY_SALARY
FROM EMP;

--10.
SELECT ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30 AND JOB <> 'SALESMAN';

--11.
SELECT DISTINCT DEPTNO
FROM EMP;

--12.
SELECT ENAME AS EMPLOYEE, SAL AS SALARY
FROM EMP
WHERE SAL > 1500 AND DEPTNO <> 20;

-- OR

SELECT ENAME AS Employee, SAL AS Monthly_Salary
FROM EMP
WHERE SAL > 1500 AND DEPTNO IN (10, 30);

--13.
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN ('MANAGER','ANALYST')
	AND SAL NOT IN (1000, 3000, 5000);

-- OR

SELECT ENAME, JOB, SAL
FROM EMP
WHERE (JOB = 'MANAGER' OR JOB = 'ANALYST')
  AND SAL NOT IN (1000, 3000, 5000);

--14.
SELECT ENAME, SAL, COMM 
FROM EMP
WHERE COMM > SAL *1.1;

--15.
SELECT ENAME
FROM EMP
WHERE (DEPTNO = 30 OR MGR_ID = 7782) 
	AND ENAME LIKE '%L%L%';

--16.
SELECT ENAME, HIREDATE, DATEDIFF(YEAR, HIREDATE, '2024-07-27') AS EXPERIENCE_YEAR
FROM EMP
WHERE DATEDIFF(YEAR, HIREDATE, '2024-07-27') BETWEEN 30 AND 40 ;

SELECT COUNT(*) AS TOTAL_EMPLOYEE
FROM EMP
WHERE DATEDIFF(YEAR, HIREDATE, '2024-07-27') BETWEEN 30 AND 40 ;

--17.
SELECT DNAME
FROM DEPT
ORDER BY DNAME ASC;

SELECT ENAME
FROM EMP
ORDER BY ENAME DESC;

-- OR

SELECT D.DNAME, E.ENAME
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
ORDER BY D.DNAME ASC, E.ENAME DESC;

--18.
SELECT ENAME, HIREDATE, DATEDIFF(YEAR, HIREDATE, '2024-07-27') AS EXPERIENCE_YEARS
FROM EMP
WHERE ENAME = 'MILLER';

