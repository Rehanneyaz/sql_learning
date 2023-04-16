create database company;
use company;
create table employee(
empid int not null primary key auto_increment,
first_name varchar(25),
last_name varchar(25),
salary int,
joining_date datetime,
department_name varchar(25)
);

# schema of employee
desc employee;


create table bonus(
empid_ref_id int,
bonus_amount int,
bonus_date datetime,
foreign key(empid_ref_id) references employee(empid)
on delete cascade
);
create table employee_designation(
empid_ref_id int,
designation varchar(25),
designation_date datetime,
foreign key(empid_ref_id) references employee(empid)
on delete cascade
);

insert into employee values
(0001,'krish','naik',50000,'14-12-11 09.00.00','development'),
(0002,'sudhanshu','kumar',60000,'14-12-11 09.00.00','development'),
(003,'sanket','kumar',70000,'15-12-11 09.00.00','hr'),
(004,'darius','bengali',70000,'15-12-13 09.00.00','hr'),
(005,'satish','bhansal',30000,'17-10-15 09.00.00','accountant'),
(006,'shaktiman','hero',50000,'17-10-15 09.00.00','accountant');

select * from employee;

insert into bonus values(
0001,5000,'16-03-12'),
(0001,5000,'16-03-14'),
(0002,5000,'16-03-13'),
(0003,5000,'16-03-15'),
(0001,5000,'18-03-17'),
(0004,3500,'16-03-19'),
(0005,7000,'16-03-20'),
(0001,8000,'20-03-21'),
(0002,8500,'20-03-20');

select * from bonus;

insert into employee_designation values
(0001,'manager','2016-02-5 00:00:00'),
(0002,'executive','2016-06-11 00:00:00'),
(0003,'executive','2016-06-11 00:00:00');

select * from employee_designation;

# day 2 

# data from employee first_name which start with d

select * from employee where first_name like 'd%';
select * from employee where first_name like 'k%';
select * from employee where first_name like 'd%';

# data from employee first_name which end with h

select * from employee where first_name like '%s';

# in between the word present then it can give

select * from employee where first_name like '%s%';

# find the values between range(10000-35000)
select * from employee where salary > 10000 and salary<35000;
# or
select * from employee where salary between 10000 and 35000;

# to get combined first and last name and show salary.

select concat(first_name,'   ',last_name) as employee_name,salary 
from employee where empid in (select empid from employee where salary between 10000 and 55000);

# data from joinng date

select * from employee where year(joining_date)=2014 and month(joining_date)=12 and day(joining_date)=11;

# num of employee in each department

select count(*) from employee group by department_name;
select * from employee where department_name = 'hr';

# intermediate level

# call data those who employee as well as executive.
select employee.first_name from employee inner join
employee_designation on employee.empid=employee_designation.empid_ref_id and 
employee_designation.designation="manager";

# or

select employee.first_name from employee inner join
employee_designation on employee.empid=employee_designation.empid_ref_id and 
employee_designation.designation in ("manager");

# clone a table = no values is there

create table clone_employee like employee;
select * from clone_employee;
desc clone_employee;

#to show top values
 select * from employee order by salary desc limit 4 ;
 #to nth highest salary

select salary from employee order by salary desc limit 3,1;

# not using limit assignment


