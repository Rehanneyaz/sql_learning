use rehan;
# inner join
select * from student;
insert into student values
(5,'ramesh','singh',27);

select * from department1;

select * from student inner join department1 on 
student.studentid =department1.studentid;

# if need only specific column

select student.first_name,student.last_name,student.age,
department1.department_name from student inner join 
department1 on student.studentid=department1.studentid;

# left join

select student.first_name,student.last_name,student.age,
department1.department_name from student left join 
department1 on student.studentid=department1.studentid;

# right join

select student.first_name,student.last_name,student.age,
department1.department_name from student right join 
department1 on student.studentid=department1.studentid;

# full join its have to join with left and right join by union


select student.first_name,student.last_name,student.age,
department1.department_name from student left join 
department1 on student.studentid=department1.studentid

union

select student.first_name,student.last_name,student.age,
department1.department_name from student right join 
department1 on student.studentid=department1.studentid;

# cross join its gives all possible combination
select student.first_name,student.last_name,student.age,
department1.department_name from student cross join 
department1;

# natural join gives those values which are linked by common column

select student.first_name,student.last_name,student.age,
department1.department_name from student natural join 
department1;

