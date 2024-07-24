CREATE DATABASE Employeemanagement

use Employeemanagement

-- Create Table
CREATE TABLE Employee_Details (
    Empno INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Empsal NUMERIC(10, 2) CHECK (Empsal >= 25000),
    Emptype CHAR(1) CHECK (Emptype IN ('F', 'P'))
);

select * from Employee_Details

--Create Procedure
CREATE PROCEDURE dbo.AddEmployee
    @EmpName VARCHAR(50),
    @Empsal NUMERIC(10, 2),
    @Emptype CHAR(1)
AS
BEGIN
    DECLARE @Empno INT;
    
    -- Generate Empno (assuming a simple increment)
    SELECT @Empno = ISNULL(MAX(Empno), 0) + 1 FROM Employee_Details;
    
    -- Insert into Employee_Details
    INSERT INTO Employee_Details (Empno, EmpName, Empsal, Emptype)
    VALUES (@Empno, @EmpName, @Empsal, @Emptype);
    
    -- Return the generated Empno
    SELECT @Empno AS Empno;
END;
GO

SELECT * FROM sys.procedures WHERE name = 'AddEmployee';

SELECT Empno, EmpName, Empsal, Emptype
FROM Employee_Details;