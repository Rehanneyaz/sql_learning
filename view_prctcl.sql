use rehan;
create table student(
studentid int auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
primary key(studentid)
);

insert into student values (1,'krish','naik',31),(2,'krish1','naik1',31),
(3,'sam','joe',31);
select * from student;

create table department1(
studentid int auto_increment,
department_name varchar(25) not null,
foreign key(studentid) references student(studentid)
);
insert into department1 values(1,'cs'),
(2,'eee'),(3,'mech');

select * from department1;
select * from student;

# view required inner join

# crreate view

create view student_info as
select first_name,last_name,age from student inner 
join department1 using(studentid);

select * from student_info;

# drop view
drop view student_info;