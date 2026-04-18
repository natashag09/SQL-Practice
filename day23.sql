-- SQL Problem Solving 


--Q Second highest salary with the help of window function 
--Source : Self Practice
select * 
from (select *,
            dense_rank() over (order by salary desc)
            as rank_1
            from employees) as emp_rank
where rank_1 = 2;


--Q Find the last 30 days billing amount 
--Source : Self Practice 
select * from billing 
where billingdate >= Curdate() - Interval 30 day; 


--Q Find the employee who earn the maximum salary on thier department 
--Source : Self Practice 
select *
 from (select *, 
       max(salary) over (partition by deptID)
       as max_salary
       from employees) as ABC 
where salary = max_salary;