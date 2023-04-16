# index 
create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);

create index index_age on student(age);
desc student;

# for multi column

create index index_multi on student(age,first_name);

# drop index

alter table student drop index index_age;
desc student;