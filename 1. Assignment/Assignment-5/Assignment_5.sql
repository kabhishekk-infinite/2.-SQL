CREATE DATABASE Assignment_5;
GO

USE Assignment_5;

--Q.1>
-- Create the Employee table
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName NVARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data into the Employee table
INSERT INTO Employee (EmpID, EmpName, Salary) VALUES
(1, 'Zoya Khan', 50000),
(2, 'Nisha Singh', 60000),
(3, 'Rahul Yadav', 70000),
(4, 'Ayesha Malhotra', 80000),
(5, 'Krishna', 90000),
(6, 'Abhishek Kumar', 100000);

SELECT * FROM Employee;

-- Check for already exists of stored procedure../
IF OBJECT_ID('dbo.sp_GeneratePayslip', 'P') IS NOT NULL
    DROP PROCEDURE dbo.sp_GeneratePayslip;
GO

-- Creating stored procedure for generate a payslip.../
CREATE PROCEDURE sp_GeneratePayslip
    @EmpID INT
AS
BEGIN
   
    DECLARE @EmpName NVARCHAR(50);
    DECLARE @Salary DECIMAL(10, 2);
    DECLARE @HRA DECIMAL(10, 2);
    DECLARE @DA DECIMAL(10, 2);
    DECLARE @PF DECIMAL(10, 2);
    DECLARE @IT DECIMAL(10, 2);
    DECLARE @Deductions DECIMAL(10, 2);
    DECLARE @GrossSalary DECIMAL(10, 2);
    DECLARE @NetSalary DECIMAL(10, 2);

-- Retrieve employee details
    SELECT @EmpName = EmpName, @Salary = Salary
    FROM Employee
    WHERE EmpID = @EmpID;

-- Calculate payslip components
    SET @HRA = @Salary * 0.10;
    SET @DA = @Salary * 0.20;
    SET @PF = @Salary * 0.08;
    SET @IT = @Salary * 0.05;
    SET @Deductions = @PF + @IT;
    SET @GrossSalary = @Salary + @HRA + @DA;
    SET @NetSalary = @GrossSalary - @Deductions;

-- Now Print the payslip details
    PRINT 'Payslip for Employee ID: ' + CAST(@EmpID AS NVARCHAR(10));
    PRINT 'Employee Name: ' + @EmpName;
    PRINT 'Basic Salary: ' + CAST(@Salary AS NVARCHAR(10));
    PRINT 'HRA (10%): ' + CAST(@HRA AS NVARCHAR(10));
    PRINT 'DA (20%): ' + CAST(@DA AS NVARCHAR(10));
    PRINT 'PF (8%): ' + CAST(@PF AS NVARCHAR(10));
    PRINT 'IT (5%): ' + CAST(@IT AS NVARCHAR(10));
    PRINT 'Deductions (PF + IT): ' + CAST(@Deductions AS NVARCHAR(10));
    PRINT 'Gross Salary (Salary + HRA + DA): ' + CAST(@GrossSalary AS NVARCHAR(10));
    PRINT 'Net Salary (Gross Salary - Deductions): ' + CAST(@NetSalary AS NVARCHAR(10));
END;
GO

-- Generate the payslip for a specific employee
EXEC sp_GeneratePayslip @EmpID = 6;

