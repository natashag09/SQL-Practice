-- SQL Problem Solving

--Q Find employees who do not have a manager
--Source: Self Practice
select *
from employees
where managerID is null;



--Q Find duplicate emails
--Source: Self Practice
select email
from person
group by email
having count(*) > 1;


--Q Find second highest salary (without window function)
--Source: Self Practice
select max(salary) as second_highest
from employees
where salary < (select max(salary) from employees);