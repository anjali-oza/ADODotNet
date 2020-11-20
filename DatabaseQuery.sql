create database MyAdoDotNetDb
Go
use MyAdoDotNetDb
Go
create table employee
( empno int primary key,
empname varchar(50) not null,
empsal numeric(10,2) check(empsal >= 25000) ,
emptype varchar(1) check(emptype in('C','P'))
)
go
create proc GetEmployeeById
(
@eno int
)
as
select * from employee where empno = @eno
go
select * from employee
go
create sequence seq_eno minvalue 1 start with 1 increment by 1 cache 10
go
alter table employee drop constraint PK__employee__AF4C318AC06BB6AC
alter table employee drop column empno
alter table employee add  empno int identity(1,1) not null primary key

create proc AddEmployee
(
@ename varchar(50),
@esal numeric(10,2),
@etpye varchar(1),
@eno int out
)
As
begin
	insert into employee(empname,empsal,emptype) values (@ename,@esal,@etpye)
	set @eno= SCOPE_IDENTITY()
	return @eno
end
Go
-----------------------------------------------------------------------------------
create table applicationusers
(
userid varchar(10) primary key,
username varchar(30) not null,
city varchar(30) not null,
password varchar(30) check(len(password) >5)
)
select * from applicationusers;
-----------------------------------------------------------------------------------
create table customer
(
customerid int identity primary key,
customername varchar(50),
city varchar(30),
creditlimit numeric(10,2)
)
create table supplier
(
supplierId int primary key ,
supplierName varchar(50),
city varchar(50),
contactno int
)
--------------------------------------------------
CREATE table categories(cid int primary key,cname varchar(30))
go
Create table Products(pid int primary key,pname varchar(30),cid int foreign key references categories(cid) )
Insert Into categories values (1,'Devices');
Insert Into categories values (2,'Mobile');
Insert Into categories values (3,'Hardware');
Insert Into categories values (4,'Laptop');
Insert Into Products values(1,'moto',2);
Insert Into Products values(2,'Comp',1);
Insert Into Products values(3,'chords',2);
Insert Into Products values(4,'Ram',3);

--------------------------------------------------------
create table accmaster(accno int primary key, accname varchar(30),
accbal numeric(10,2) check(accbal >= 5000))
go
create table acctran(tranno int identity primary key,accno int references accmaster,trtype varchar(1),
tramt numeric(10,2) check(tramt >= 500))
go
insert into accmaster values(1,'anand',50000)
insert into accmaster values(2,'milind',50000)
---------------------------------------------------------