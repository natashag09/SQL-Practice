-- Window Functions 

-- Basic Over()

--Q Show salary with overall average salary
select name, salary,
       avg(salary) over () as avg_salary
from employees;


-- Partition by 

--Q Average salary per department (without GROUP BY)
select name, dept_id, salary,
       avg(salary) over (partition by dept_id) AS dept_avg
from employees;

-- Rank()

--Q Rank acc to balance 
select *, 
        rank() over(order by balance) as rank_1
from accounts; 

--Dense Rank()

--Q Rank acc to account type 
select*, 
       dense_rank() over(partition by account_type order by balance desc) as rank_2 
from accounts;

--Q  Find top 2 highest paid employees
select *
from (
      select name, salary,
           dense_rank() over (order by salary desc) as rnk
    from employees
) as sub
where rnk <= 2;

-- Row Number()

--Q Row number acc to the balance 
select *, 
        row_number() over(order by balance) as row_1 
from accounts; 

--Q Find highest salary in each department
select *
from (
    select name, dept_id, salary,
           row_number() over (partition by dept_id order by salary desc) as rn
    from employees
) as sub
where rn = 1;


-- Percent Rank()

-- Calculate percentage rank acc to balance 
select *,
        percent_rank() over (order by balance) as p_rank 
from accounts;