-- Aggregation , Group by and Having

-- Aggregate Functions 

--Q Find total balance 
select sum(balance) as total_balance from accounts;

--Q Average of balance 
select avg(balance) as avg_balance from accounts;

--Q Maximum balance of the customer
select max(balance) as max_balance from accounts;

--Q Minimum balance of the customer 
select min(balance) as min_balance from accounts;

--Q Count the number of customers
select count(customer_name) as total_customers from accounts;


-- Group by 

--Q Total balance of each account type
select account_type, sum(balance) as total_balance 
from accounts
group by account_type;

--Q Total balance according to the branch where account type is current 
select branch, sum(balance) as total_balance 
from accounts 
where account_type = 'current'
group by branch 
order by total_balance asc;

--Q Total balance according to branch where open_date is more than 2023-05-12
select branch, sum(balance) as total_balance 
from accounts
where open_date > '2023-05-12'
group by branch;


-- Having clause 

--Q Which account type has the total balance greater than 400000
select account_type, sum(balance) as total_balance 
from accounts
group by account_type 
having sum(balance) > 400000;

--Q Where number of accounts is more than 3 , according to branch
select branch, count(account_id) as num_account
from accounts 
group by branch 
having count(account_id) > 3;

--Q Departments where average salary is between 40000 and 60000
select dept_id, avg(salary) as avg_salary
from employees 
group by dept_id 
having avg(salary) between 40000 and 60000;