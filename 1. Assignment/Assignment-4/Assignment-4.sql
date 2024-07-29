CREATE DATABASE Assignment_4;
GO

USE Assignment_4;

--Q.1>
-- Create Factorial Function
CREATE FUNCTION dbo.fn_Factorial (@Number INT)
RETURNS BIGINT
AS
BEGIN 
    DECLARE @Result BIGINT;
    SET @Result = 1;
    
-- Use a while loop 
    WHILE @Number > 1
    BEGIN
        SET @Result = @Result * @Number;
        SET @Number = @Number - 1;
    END;
    RETURN @Result;
END;
GO

-- Test 
DECLARE @TestNumber INT;
SET @TestNumber = 5;
SELECT dbo.fn_Factorial(@TestNumber) AS FactorialResult;


--Q.2>
---- Create the stored procedure
CREATE PROCEDURE dbo.sp_GenerateMultiplicationTable
    @Number INT,
    @Limit INT
AS
BEGIN 
    SET NOCOUNT ON;
    DECLARE @Counter INT
    SET @Counter = 1;

    CREATE TABLE #MultiplicationTable (
        Multiplier INT,
        Result INT
    );

-- Loop to generate the multiplication table
    WHILE @Counter <= @Limit
    BEGIN
        INSERT INTO #MultiplicationTable (Multiplier, Result)
        VALUES (@Counter, @Counter * @Number);
        SET @Counter = @Counter + 1;
    END;

    SELECT @Number AS Number, Multiplier, Result
    FROM #MultiplicationTable;   DROP TABLE #MultiplicationTable;
END;
GO

-- Test 
EXEC dbo.sp_GenerateMultiplicationTable @Number = 5, @Limit = 10;


--Q.3>
-- Create the EMP table
CREATE TABLE EMP (
    EmpID INT PRIMARY KEY,
    EmpName NVARCHAR(50),
    EmpDept NVARCHAR(50)
);

-- Create the Holiday table
CREATE TABLE Holiday (
    holiday_date DATE PRIMARY KEY,
    holiday_name NVARCHAR(50)
);

INSERT INTO Holiday (holiday_date, holiday_name) VALUES
('2024-01-26', 'Republic Day'),
('2024-08-15', 'Independence Day'),
('2024-10-02', 'Gandhi Jayanti'),
('2024-11-12', 'Diwali');

SELECT * FROM Holiday;

-- Check if the trigger already exists, and if so, drop it
IF OBJECT_ID('dbo.trg_RestrictOnHoliday', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_RestrictOnHoliday;
GO

-- Create the trigger
CREATE TRIGGER trg_RestrictOnHoliday
ON EMP
AFTER INSERT, UPDATE, DELETE
AS
BEGIN

    DECLARE @HolidayName NVARCHAR(50);

    SELECT @HolidayName = holiday_name
    FROM Holiday
    WHERE holiday_date = CAST(GETDATE() AS DATE);

    IF @HolidayName IS NOT NULL
    BEGIN
        RAISERROR ('Due to %s, you cannot manipulate data', 16, 1, @HolidayName);
        ROLLBACK TRANSACTION;
    END;
END;
GO

-- Example of an INSERT operation on a holiday
INSERT INTO EMP (EmpID, EmpName, EmpDept) VALUES (1, 'ABHISHEK', 'HR');

