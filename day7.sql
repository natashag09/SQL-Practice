--Alter and Update Commands 

--Alter Table 

--Q Adding a column geo_location to bank_inventory table with dataype varchar(20).
alter table bank_inventory 
add column geo_location varchar(20);

--Q Reducing size of the product from 10 to 6 
alter table bank_inventory
modify column product char(6);

--Q Deleting region column from employees table
alter table employees 
drop column region;

--Q Adding state column after city and before salary
alter table employees 
add column state varchar(50) after city;

--Q Renaming column empname to emp_name 
alter table employees 
rename column empname to emp_name;


--Update Table 

--Q Postponing holiday to next day by updating holiday field
update bank_holidays 
set 
start_time = '2026-02-10'
where start_time ='2026-02-09';

--Q Update the end_time with today's datetime 
update bank_holidays 
set 
end_time = now();

--Q Update IT department with purchase department 
update employees 
set 
department ='purchase'
where department = 'IT';

--Q Change the state value to Rajasthan where salary >= 70000
update employees 
set 
state = 'Rajasthan'
where salary >= 70000;