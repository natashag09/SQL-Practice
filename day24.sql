-- SQl Problem Solving 

--Q List all employees from Finance and IT only, ordered by Department then Name.
--Source : Self Practice 
select * from Employees
where Department in ('Finance','IT')
order by Department, EmpName;


--Q Find the department name where Amit works
--Source : Self Practice 
select * from departments
where dept_ID = (select dept_Id from employees
                 where emp_name = 'Amit');


--Q Enter the rank in accounts table according to the account type
--Source : Self Practice 
select *,
         dense_rank() over(partition by account_type order by balance desc) as rank_2
from accounts;


--Q Get the previous value of balance column according to the account type
--Source : Self Practice 
select *,
        lag(balance) over(partition by account_type order by balance) as lag_1
from accounts;