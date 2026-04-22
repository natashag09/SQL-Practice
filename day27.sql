-- SQL Problem Solving

--Q Find customers who have placed more than 2 orders
--Source: Self Practice
select
    c.customerID,
    c.customer_name,
    count(o.orderID) as total_orders
from customers c
inner join orders o
on c.customerID = o.customerID
group by c.customerID, c.customer_name
having count(o.orderID) > 2;


--Q Find employees who earn the highest salary in each department
--Source: Self Practice
select *
from (
    select *,
           dense_rank() over (partition by deptID order by salary DESC) as rnk
           from employees) as dept_salary
where rnk = 1;


--Q Find total sales for each product category
--Source: Self Practice
select 
    category,
    sum(amount) as total_sales
from sales
group by category
order by total_sales DESC;