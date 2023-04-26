SHOW DATABASES;
USE REHAN;

CREATE TABLE jobs(
id INTEGER,
work_year INTEGER,
experience_level VARCHAR(20),
employment_type VARCHAR(20),
job_title VARCHAR(20),
salary INTEGER,
salary_currency VARCHAR(20),
salary_in_usd INTEGER,
employee_residence VARCHAR(20),
remote_ratio INTEGER,
campany_location VARCHAR(20),
company_size VARCHAR(20)
);
 
 CREATE TABLE companies(
 id INT,
 company_name VARCHAR(20));
 
 # imported data from files
 
 SELECT * FROM Jobs;
  SELECT * FROM companies;
  
  # lets start queries
  
  # q1. what is the average saalary for all jobs in dataset.alter
  
  SELECT AVG( salary) AS avg_sal from jobs; 
  
# q2. what is the highest salary and for which job in data set.

select MAX(salary) as max_sal, job_title from jobs;

# q3. what is the average salary of data scientists in us?

  select avg(salary) as usa_sal from jobs
  where job_title = 'Data Scientist' and 
  campany_location = 'us';
  
  #q4. what is the number of jobs for each job_title
  
  select job_title, count(*) as num_jobs from jobs
  group by job_title;
  #q5. what is total salary for all data analyt in de?
  
  select sum(salary) as sal_sum from jobs
  where campany_location = 'DE' and 
  job_title = 'Data Analyst';

  
  #q6. top 5 highest paying job and corrosponding salary
  select job_title, avg(salary) as avg_salr from jobs
  group by job_title 
  order by avg_salr desc
  limit 5;
  
  #q7. num of jobs in each location.
  
  select campany_location, count(*) as num_jobs from jobs
  group by campany_location;
  
  #q8. top 3 job titles that have most jobs
  
  select job_title, count(*) as num_jobs from jobs
  group by job_title
  order by num_jobs desc
  limit 3;
  
  #q9.  average salary of data engineer in boston
  
  select avg(salary) as avg_sal from jobs
  where job_title = 'Data Engineer' and 
  campany_location = 'boston';
  
  #q10. top 5 city with highest average salaries
  
  select campany_location,avg(salary) as avg_salary from jobs
  group by campany_location
  order by avg_salary desc
  limit 5;
  
  #q11.  average salary for each job and what is 
  # -total number of jobs available for each job title.
  select job_title,avg(salary),count(*) as num_jobs from jobs
  group by job_title;
  
  # q12. top 5 job titles with highest salaries,
  # total number of jobs avialable for each title
  
select job_title,sum(salary) as highest_salary, 
count(*) as num_jobs from jobs
group by job_title
order by highest_salary desc
limit 5;

# q13. top 5 location with highest 
# salary and total num of job for each loaction

select campany_location,sum(salary) as total_sal,
count(*) as num_jobs from jobs
group by campany_location
order by total_sal desc
limit 5;

# 14. average salary for each job title in aech loaction
# total number of jobs for each title in each location

select job_title, campany_location, avg(salary) as avg_sal,
count(*) as num_jobs from jobs
group by job_title,campany_location
order by num_jobs desc;

#q15. average salary for each job title in ech location
# percentage of jobs for each job title in each location

select job_title,campany_location, AVG(salary) as avg_salary, 
(count(*) *100 / (select count(*) from jobs)) as percentage from jobs
GROUP BY job_title, campany_location;

#16. top 5 job titles with highest average salary and total
# num of jobs for each job title

select job_title, avg(salary) as avg_sal, 
count(*) as num_job from jobs
group by job_title
order by avg_sal desc
limit 5;

# q17. average salary for each job title 
# and percentage of jobs for each job title

select job_title, avg(salary) as avg_sal, 
(count(*) *100 / (select count(*) from jobs)) as perc_job from jobs
group by job_title;

# 18. totla num of jobs for each year 
# of experience and average salay for each year of experience

select experience_level, count(*) as num_job,
avg(salary) as avg_sal from jobs
group by experience_level;

# 19. top 5 job titles with highest average salary 
# in in each location

select job_title,campany_location,
avg(salary) as avg_salary from jobs
group by job_title,campany_location
order by avg_salary desc
limit 5;


# q20. top 5 job titles with highest salary and their name of companies

Select job_title, max(salary) as high_sal,company_name
from jobs
inner join companies on jobs.id = companies.id
group by job_title
order by high_sal desc
limit 5;

# q21.  total num of jobs available for each job title and 
# what is company name that offershighest salary for each title

select job_title,company_name,max(salary) as highest_salary,
count(*) as num_job from jobs
inner join companies on jobs.id = companies.id
group by job_title,company_name
order by highest_salary desc;

# q22. top 5 city with higest average salary and the name 
# of company that offers highest salary for each city

select company_name,campany_location,
avg(salary) as avg_sal from jobs
inner join companies on jobs.id=companies.id
group by company_name,campany_location
order by avg_sal desc
limit 5;

#23. average salry for each job title in each company, rank of each
# job title within each company based on avg salary-window 

select job_title,company_name,avg(salary) as avg_sal, 
rank() over(partition by company_name order by 
avg(salary) desc) as salary_rank
from jobs
inner join companies on jobs.id= companies.id
group by job_title,company_name;

#q24. total num of jobs in each job title in each location,
# rank of each job title within each loaction based on 
# total num of jobs

select job_title,campany_location,count(*) as num_jobs,
rank() over(partition by campany_location order by count(*) desc) as 
rank_value from jobs
group by job_title,campany_location;

#q25. top 5 companies wth highest average salary for data scientist,
# rank for each company based on average salary

select company_name,avg(salary) as avg_sal,
rank () over(order by avg(salary) desc) as rank_com
from jobs
inner join companies on jobs.id= companies.id
where job_title = 'Data Scientist'
group by company_name
order by avg_sal desc
limit 5;

#q26. total num of job for each year of experience in each
# location and rank of each year of experience within each location based on total num of jobs


select experience_level,campany_location,count(*) as num_jobs,
rank() over (partition by campany_location order by count(*)
desc) as rank_val from jobs
group by experience_level,campany_location;
 
 