--Q Combine two tables 
--Source: Leetcode
select 
      p.firstname,
      p.lastname,
      a.city,
      a.state
from person p 
left join address a 
on p.personID = a.personID ;

--Q Employees earning more than their managers 
--Source: Leetcode
select e1.name as Employee
from employee e1 
inner join employee e2 
on e1.managerID = e2.id
where e1.salary > e2.salary;


--Q Second highest salary
--Source: Leetcode
select  max(salary)  as SecondHighestSalary from employee
where salary < (select max(salary) from employee);