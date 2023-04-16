use rehan;
drop table student;
create table student(
student_id int auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int,
primary key(student_id)
);
insert into student values
(1,'krsish','naik',31),
(2,'ahmed','rehan',26),
(3,'sam','joe',27);
select * from student;
create table department(
student_id int auto_increment,
department_name varchar(25) not null,
foreign key(student_id) references student(student_id)
);

desc department;

insert into department values 
(1,'electronics'),
(2,'mechasnical'),
(3,'civil');
select * from department;
select * from student;
# creating view

create view student_info as
select first_name, last_name,age from student inner join department
using(studentid);

select * from student_info;