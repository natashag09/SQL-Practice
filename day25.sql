-- SQL Problem Solving


--Q Find the second highest salary in each department
--Source: Self Practice
select *
from (
    select *,
           dense_rank() over (partition by deptID order by salary DESC) as rnk
    FROM employees
) as t
where rnk = 2;


--Q Find customers who have made more than 3 orders
--Source: Self Practice
select customerID, count(orderID) as total_orders
from orders
group by customerID
having count(orderID) > 3;


--Q Find the total sales per month
--Source: Self practice
select 
    month(order_date) as month,
    sum(amount) as total_sales
from orders
group by MONTH(order_date)
order by month;