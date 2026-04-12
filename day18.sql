-- SQL Problem Solving 

-- Q Query the average population for all cities in CITY, rounded down to the nearest integer.
--Source: HackerRank 
select floor(avg(population)) as avg_population from city ;


--Q Query the difference between the maximum and minimum populations in CITY.
--Source: HackerRank 
select max(population) - min(population) as population_difference 
from city;


--Q Type of triangle 
--Source: HackerRank 
select 
case
    when A+B <= C or B+C <= A or A+C <= B 
    then 'Not A Triangle'
    when A = B and B = C 
    then 'Equilateral'
    when A = B or B = C or C = A 
    then 'Isosceles'
    else 'Scalene'
end as triangle_type 
from triangles;


--Q Department highest salary 
--Source: LeetCode 
select 
      d.name as department,
      e.name as employee,
      e.salary as salary
from department d 
join employee e 
on d.ID = e.departmentID
where(e.departmentId, e.salary) in (
    select departmentId, max(salary)
    from Employee
    group by departmentId
);

