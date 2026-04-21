-- SQL Problem Solving 

--Q  Find employees who earn more than the average salary of their department
--Source: Self Practice 
select *
from employees e
where salary > (
    select avg(salary)
    from employees
    where deptID = e.deptID
);



--Q Find the total number of orders and total amount for each customer
--Source: Self Practice 
select 
    customerID,
    count(orderID) as total_orders,
    sum(amount) as total_amount
from orders
group by customerID;


--Q Rank employees based on salary within each department
--Source: Self Practice 
select *,
       rank() over (partition by deptID order by salary DESC) as salary_rank
from employees;