-- SQL Problem Solving 

--Q Find second highest salary in each department without using window functions
--Source: Self Practice
select deptID, max(salary) as second_highest
from employees e1
where salary < (
    select max(salary)
    from employees e2
    where e1.deptID = e2.deptID
)
group by deptID;


--Q  Find customers who placed orders on consecutive days
--Source: Self Practice
select distinct o1.customerID
from orders o1
join orders o2
on o1.customerID = o2.customerID
and o1.order_date = date_add(o2.order_date, INTERVAL 1 DAY);


--Q Find employees earning more than both department avg and company avg
--Source: Self Practice
select *
from employees e
where salary > (
    select avg(salary)
    from employees
    where deptID = e.deptID
)
and salary > (
    select avg(salary)
    from employees
);