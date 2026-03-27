--Like(wildcards),Between,In filtering patterns

--'Like' operator

--Q Employee whose name starts with 'A'
select * from employees
where emp_name like 'A%';

--Q Employee whose name ends with 'n'
select * from employees
where emp_name like '%n';

--Q Employee whose name contains 'ya'
select * from employees
where emp_name like '%ya%';

--Q Employee whose name starts with 'A' and ends with 't'
select * from employees 
where emp_name like 'A%t';

--Q Employee whose second alphabet in the name is 'i'
select * from employees 
where emp_name like '_i%';


--'Between' operator

--Q Data where the balance is between 1 lakh and 2 lakh
select * from accounts 
where balance between 100000 and 200000;

--Q Employees hired between '2025-01-01' and '2026-01-01'
select * from employees
where hire_date between '2025-01-01' and '2026-01-01';


--'IN' operator

--Q Employees in departments 101, 102, 104
select * from employees 
where dept_id in (101, 102, 104);

--Q Employees not in department 102 and 105
select * from employees
where dept_id not in (102, 105);

--Q Employees who are in the HR and Finance department
select * from employees
where dept_name in ('HR', 'Finance');
