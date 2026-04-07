-- CASE Statements (Light Practice)

--Q Categorize employees based on salary 
select emp_name, salary,
case 
    when salary > 50000 then 'High'
    when salary between 30000 and 50000 then 'Medium'
    else 'Low'
end as salary_category
from employees; 

--Q Assign department names based on dept_id 
select emp_name, dept_id,
case 
    when dept_id = 1 then 'HR'
    when dept_id = 2 then 'IT'
    else 'other'
end as department 
from employees;

--Q Classify departments as large or small teams
select dept_id,
count(*) as total_employees,
case 
    when count(*) > 5 then 'Large Team'
    else 'Small Team'
end as team_size 
from employees 
group by dept_id; 