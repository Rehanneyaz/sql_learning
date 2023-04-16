create database rehan;
use rehan;
create table customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(20),
salary integer,
primary key(id)
);
select * from customer_info;

insert into customer_info(first_name,last_name,salary)
values
('john','daniel',50000),
('krish','naik',60000),
('darius','bengali',70000),
('chandan','kuamr',40000),
('ankit','sharma',null);

# handling null values

select * from customer_info where salary is null;
select * from customer_info where salary is not null;
# sql update;

update customer_info set salary = 50000 where id =5;

# delete
delete from customer_info where id=5;
select * from customer_info where salary is null;
select * from customer_info;

# alter

# add column

alter table customer_info add email varchar(25);
alter table customer_info add dob date;
# modify column
alter table customer_info modify dob year;
desc customer_info;
# alter table to drop column
alter table customer_info drop column email;

/*constraints:
 not null
 unique
 primary key
 foreign key
 dafault
index 
*/;

# not null:

create table student(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);

desc student;

# modify and add no null for age;
alter table student modify age int not null;

# unique constraints gives uniq value save from duplicate;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
unique(id)
);

insert into person values(1,'krsih2','naik2',32);# it will give error
select * from person;
# add unique after table creation
alter table person add unique(first_name);

# drop uniq
alter table person 
drop unique(id);

# primary key
create table person1(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) ,
age int,
constraint pk_person1 primary key(id,last_name)
);
desc person1;

# drop pk
alter table person1 drop primary key;
# add pk
alter table person1 add primary key(id);
# foreign key

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
salary int,
unique(id)
);
desc person;

create table department(
id int not null,
department_id int not null,
department_name varchar(25) not null,
primary key(department_id),
constraint fk_department foreign key(id) references person(id)
);

desc department;

# check

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int not null,
salary int,
unique(id),
check( salary<5000)
);

insert into person values (1,'krish','naik',31,4990),(2,'rehan','ahmed',25,4000);
select * from person;
# default

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_name varchar(25) default'gaya'
);

alter table person alter city_name drop default;
desc person;