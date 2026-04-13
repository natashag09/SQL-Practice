-- Light-Medium Practice

--Q Get top 5 highest salaries
--Source: Self Practice
select * from employees
order by salary desc
limit 5;


--Q Get employees with salary greater than 30000
--Source: Self Practice
select * from employees
where salary > 30000;


--Q Get employees sorted by department and salary
--Source: Self Practice
select * from employees
order by dept_id, salary desc;