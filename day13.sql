-- CTEs (Common Table Expression)

--Q Employees who earn above the company average salary 
with CTE_avg as 
              (select avg(salary) as avg_salary
               from employees)
select * from employees 
where salary > (select avg_salary from CTE_avg);

--Q The highest salary in the company and employees who earn that salary
with CTE_max as 
              (select max(salary) as max_salary 
               from employees)
select * from employees 
where salary = (select max_salary from CTE_max);

--Q Return all employees of a specific department & then select only thier names
with CTE_dept as 
               (select * from employees 
                where dept_id = 101)
select emp_name from CTE_dept;

--Q Total number of employees in each department 
with CTE_total as 
                (select dept_id, count(emp_id) as total_emp
                 from employees 
                 group by dept_id)
select 
      d.dept_name,
      CTE_total.dept_id,
      CTE_total.total_emp
from departments d 
left join CTE_total 
on d.dept_id = CTE_total.dept_id; 

--Q Department wise maximum salary using CTE 
with CTE_dept as 
               (select dept_id, max(salary) as max_salary
                from employees
                group by dept_id)
select 
      d.dept_name,
      CTE_dept.dept_id,
      CTE_dept.max_salary 
from departments d 
left join CTE_dept 
on d.dept_id = CTE_dept.dept_id; 

--Q Calculate department wise average salary and show all departments where avg salary > 60000
with CTE_dept as 
               (select dept_id, avg(salary) as avg_salary 
                from employees 
                group by dept_id)
select 
      d.dept_name,
      CTE_dept.avg_salary
from departments d 
left join CTE_dept 
on d.dept_id = CTE_dept.dept_id 
where avg_salary > 60000;

--Q Employees whose salary is not the highest salary in thier department 
with CTE_max as 
              (select * from employees
               where salary not in (select max(salary)
                                    from employees 
                                    group by dept_id))
select
      CTE_max.emp_name,
      CTE_max.dept_id,
      CTE_max.salary,
      d.dept_name 
from CTE_max 
inner join departments d 
on CTE_max.dept_id = d.dept_id;

