-- Data Analysis 

--Q Calculate total salary per department
-- Insight: Helps understand which department has highest overall cost
select deptID, sum(salary) as total_salary
from employees
group by deptID;



--Q Calculate average salary per department
-- Insight: Shows salary distribution across departments
select deptID, avg(salary) as avg_salary
from employees
group by deptID;


--Q Identify department with highest average salary
-- Insight: Finds top-paying department
select deptID, avg(salary) as avg_salary
from employees
group by deptID
order by avg_salary DESC
limit 1;

