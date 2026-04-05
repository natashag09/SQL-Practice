 -- Advanced Subqueries 

 --Q Employees whose salary is not the max or min in thier department 
 select * from employees 
 where salary not in (select min (salary) from employees)
 and salary not in (select max(salary) from employees); 

 --Q Departments where every employee earns above company average 
 select * from departments 
 where dept-id in (select dept_id from employees 
                   where salary > (select avg(salary) from employees));

--Q Employees in departments where the average salary > finance max salary. 
select * from departments 
where dept_id in (select dept_id from employees 
                  group by dept_id > (select max(salary) from employees
                                      where dept_id = (select dept_id from departments 
                                                       where dept_name = 'Finance'))); 

--Q Employees in departments where max - min salary > 12000
select * from departments 
where dept_id in (select dept_id from employees 
                  group by dept_id 
                  having max(salary) - min(salary) > 12000);

--Q Employees who earn more than department avg but are not max in department 
select * from employees 
where salary > (select avg(salary) from employees 
                group by dept_id 
                order by avg(salary) desc 
                limit 1)
and salary != (select max(salary) from employees 
               group by dept_id 
               order by max(salary) desc 
               limit 1);

--Q Departments where total salary is greater than avg total salary across departments 
select * from departments 
where dept_id in (select dept_id from employees 
                  group by dept_id 
                  having sum(salary) > (select avg(total_salary) from 
                                        (select sum(salary) as total_salary 
                                         from employees 
                                         group by dept_id) as ABC)); 

-- Subquery and Window Funtions 

--Q The employee who earns more than average salary of thier department 
select * from (select *,
               avg(salary) over (partition by dept_id) as avg_salary 
                from employees) as ABC 
where salary > avg_salary; 

--Q Employee who earn the maximum salary in thier department 
select * from 
             (select *, 
              max(salary) over (partition by dept_id) as max_salary 
              from employees) as ABC 
where salary = max_salary ; 

--Q Employee whose salary is greator than the previous employee in same department 
select * from 
             (select *, lag(salary) over (partition by dept_id) as previous_salary
              from employees) as ABC 
where salary > previous_salary; 

--Q Second highest salary with help of window function 
select * from 
            ( select *, 
              dense_rank() over (order by salary desc) as rank_1 
              from employees) as Emp_rank 
where rank_1 = 2; 
