show databases;
use rehan;
# foreign key
create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int,
salary int,
primary key(id)
);
desc person;

create table department(
id int not null,
dep_name varchar(25) not null,
department_id int not null,
primary key(dep_name),
constraint fk_persondepartment foreign key(id)
references person(id)
);
desc department;
drop table person;
drop table department;
# check constraints

create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int,
salary int,
primary key(id),
check (salary<50000)
);
desc person;
insert into person values(1,'krish','naik',31,47000);
select * from person;
drop table person;

create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int,
salary int,
primary key(id)
);
desc person;



create table person(
id int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
city_name varchar(20) default 'gaya'
);
desc person;
alter table person alter city_name drop default;