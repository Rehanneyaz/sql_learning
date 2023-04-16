use rehan;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh',  'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasudha', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(116, 'Satya', 'Finance', 6500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500),
(119, 'Cory', 'HR', 8000),
(120, 'Monica', 'Admin', 5000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 8000),
(124, 'Dheeraj', 'IT', 11000);
COMMIT;



select * from employee;
# using aggregate function

select DEPT_NAME,max(SALARY)FROM employee
group by DEPT_NAME;

# its gives only maximum value of each department

# by using max windows function
select e.*,
max(salary) over( partition  by dept_name) as max_salary
from employee e;

# its gives all vlaues of table in a separate column which holds max salary
# row number()
select e.*,
row_number() over(partition by dept_name) as rn
from employee e;

# find first two join emloyee in each department 
select * from(
	select e.*,
	row_number() over( partition by dept_name order by emp_id ) as er
	from employee e) x
where x.er<3;

# rank()
# find top 3 employee based on salary

select * from(
	select e.*,
    rank() over(partition by dept_name order by salary desc) as re
    from employee e) x
where x.re<4;

# rank, dense_rank and row_number

select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over( partition by dept_name order by salary desc) as d_rank,
row_number() over ( partition by dept_name order by salary desc) as r_num
from employee e;

# row number gives unique value to each row
# rank provide rank to each value for duplicates its gives same value
# dense rank skip after duplicate values

# lag()= fetch previous values, no previous value its shows null

select e.*,
lag(salary) over( partition by dept_name order by emp_id) as dp
from employee e;

# lead() =  its looks for next values
select e.*,
lead(salary) over( partition by dept_name order by emp_id) as ld
from employee e;

# check salary of employees higher lower or equal tha previous employee

select e.*,
lag(salary) over( partition by dept_name order by emp_id) as salary_lag,
case when e.salary> lag(salary) over( partition by dept_name order by emp_id) then 'HIGHER'
	when e.salary< lag(salary) over( partition by dept_name order by emp_id) then 'LOWER'
    when e.salary= lag(salary) over( partition by dept_name order by emp_id) then 'EQUAL' END as sal_range
    from employee e;
    
# Similarly using lead function to see how it is different from lag.
select e.*,
lag(salary) over (partition by dept_name order by emp_id),
lead(salary) over( partition by dept_name order by emp_id)
from employee e;

# lets create another table

CREATE TABLE product
( 
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
select * from product;

# first_value(): used to show top values corrosponding to each record

select *,
first_value(product_name) over(partition by product_category order by price desc) as top_price
from product;

# last value: use to fetch least values** use with frame clause

select*,
first_value(product_name)over (partition by product_category order by price desc) 
as first_val,
last_value(product_name) over (partition by product_category order by price desc 
range between unbounded preceding and unbounded following)
as last_val 
from product
where product_category = 'phone';

# Nth_value: use to find values of particular number
# its need two arguments
select *,
first_value(product_name)over (partition by product_category order by price desc) 
as first_val,
last_value(product_name) over (partition by product_category order by price desc 
range between unbounded preceding and unbounded following)
as last_val,
nth_value(product_name,2) over (partition by product_category order
by price desc range between unbounded preceding and unbounded following) as nth_val
from product;
