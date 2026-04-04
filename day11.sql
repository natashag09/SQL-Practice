--Subqueries (Non-Correlated and correlated)

--Q Highest salary 
select * from employees 
where salary = (select max(salary) from employees);

--Q Employees who earn more than average salary 
select * from employees 
where salary > (salary avg(salary) from employees);

--Q Departments where employees earn more than 50,000
select * from departments 
where dept_id in (select dept_id from employees where salary > 50000);

--Q Employees who earn the second highest salary 
select * from employees 
where salary < (select max(salary) from employees)
order by salary desc 
limit 1; 

--Q Employees whose salary is greater than all employees in marketing department
select * from employees 
where salary > (select max(salary) from employees 
                where dept_id = (select dept_id from departments 
                                 where dept_name = 'Marketing')); 

--Q Departments with the highest average salary 
select * from departments 
where dept_id = (select dept_id from employees 
                 group by dept_id 
                 order by avg(salary) desc 
                 limit 1); 

--Q Employees whose salary is between min and max salary of company 
select * from employees 
where salary between (select min(salary) from employees) and 
                     (select max(salary) from employees); 

--Q Employees who earn more than Vikas but less than Arjun
select * from employees 
where salary >= (select salary from employees 
                 where emp_name = 'Vikas') and 
      salary < (select salary from employees
                where emp_name = 'Arjun');

--Q Departments where average salary is higher than HR's average salary 
select dep_id, avg(salary) as avg_salary 
from employees 
group by dept_id 
having avg(salary) > (select avg(salary) from employees 
                      where dept_id = (select dept_id from departments 
                                       where dept_name = 'HR'));

                                       