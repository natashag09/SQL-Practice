-- Views, Indexes and Case Statements 

-- Views 

--Q Create a view for high salary employees
create view high_salary_emp as
select emp_name, salary, dept_id
from  employees
where salary > 50000;

--Q View data
select * from high_salary_emp;


-- Case Statement (advanced usage)

--Q Categorize employees with more conditions
select  emp_name, salary,
case
    when salary >= 70000 Then 'Very High'
    when salary between 50000 and  69999 then 'High'
    when salary between 30000 and 49999 then 'Medium'
    else 'Low'
end as salary_category
from employees;

--Q Use CASE inside aggregation
select  dept_id,
sum(
    case
        when salary > 50000 then  salary
        else  0
    end
) as  high_salary_total
from employees
group by  dept_id;


-- Indexes

--Q Create index on salary column
create index idx_salary
on  employees(salary);

--Q Create index on dept_id
create index idx_dept
on  employees(dept_id);