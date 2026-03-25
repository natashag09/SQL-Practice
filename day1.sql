--Basic Queries (select , where , order by, limit)

--Q Where employee joins company after 2023
select * from employee
where joining_date > 2024-1-1;

--Q Employee name and salary where employee name is Rahul Sharma
select emp_name, salary from employee
where emp_name = 'Rahul Sharma';

--Q Where we do not know the gender of employee
select * from employee
where gender is null;

--Q where english is more than 80
select * from students
where english > 80;

--Q Display hindi marks in asc order
select * from students
order by hindi acs;

--Q where english marks is more than 70 and arrange acc to the name
select * from students
where english > 70
order by stu_name;

--Q where student ID is less than 110 and arrange data in desc order
select * from students
where stu_id < 110
order by stu_name desc;

--where student ID is less than 110 and print starting two rows
select * from students 
where stu_id < 110
limit 2;

--Q Find the highest value in hindi
select * from students
order by hindi desc
limit 1;
