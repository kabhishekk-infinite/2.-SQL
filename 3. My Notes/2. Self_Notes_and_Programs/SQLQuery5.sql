create database InfiniteDB

use infinitedb
--creating tables
drop table tblDepartment
 
 
create table tblDepartment
(
  DepNo int primary key,    --column level constraint
  DeptName varchar(15) not null,
  Budget float
 
 
)

--add another table


create table tblEmployees
(
Empid int primary key,
Empname varchar(40) not null,
Gender char(7),
Salary float,
DeptNo int references tbldepartment(DeptNo)

)