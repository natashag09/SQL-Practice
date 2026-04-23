-- SQL Problem Solving

--Q Categorize employees based on salary
--Source: Self Practice
select 
    name,
    salary,
    case
        when salary < 30000 then 'Low'
        when salary between 30000 and 70000 then 'Medium'
        else 'High'
    end as salary_category
from employees;


--Q Find orders placed in the current month
--Source: Self Practice 
select *
from orders
where month(order_date) = month(CURDATE())
  and year(order_date) = year(CURDATE());


--Q Find customers who have never placed an order
--Source: Self Practice
select *
from customers c
where not exists (
    select 1
    from orders o
    where o.customerID = c.customerID
);