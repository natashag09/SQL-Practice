--Day 2 : Conditions and Filtering


-- 'and' operator

--Q Data where hindi is greater than 70 and student ID is less than 105
select * from students 
where hindi > 70 and stu_id < 105;

--Q customer name where account type is saving and open date is more than august 2023
select customer_name from accounts 
where account_type = 'Savings' and open_date > '2023-08-01';


-- 'or' operator

--Q Account type is savings or branch is Delhi
select * from accounts 
where account_type = 'Savings' or branch = 'Delhi';

--Q where english is greater than 70 or student id is less than 105
select * from students 
where english > 70 or stu_id < 105;


-- 'not' operator

--Q where branch is not Delhi
select * from accounts
where not branch = 'Delhi';

--Q where account type is savings and brnach is not Delhi
select * from accounts 
where account_type = 'Savings' and not branch = 'Delhi';


-- 'null/not null' conditions

--Q find the data where we dont know amount
select * from accounts 
where balance is null;

--Q where we dont know the date 
select * from accounts 
where open_date is null;

--Q where the date is provided
select * from accounts 
where open_date is not null;