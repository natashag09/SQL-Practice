-- SQL Problem Solving 

--Q Cities starting with vowels 
--Source: HackerRank 
select distinct city 
from station
where city like 'a%' 
   or city like 'e%'
   or city like 'i%'
   or city like 'o%'
   or city like 'u%';


--Q Students with high marks
--Source: HackerRank 
select name from students
where marks > 75 
order by right(name,3),ID


--Q African cities
--Source: HackerRank 
select 
        city.name
from city
left join country
on city.countrycode = country.code
where country.continent = 'Africa';


--Q Customers with most orders
--Source: LeetCode 
select customer_number from orders 
group by customer_number
order by count(*) desc
limit 1;


--Q Big countries
--Source: LeetCode 
select name, population, area from world
where area >= 3000000 or population >= 25000000;




