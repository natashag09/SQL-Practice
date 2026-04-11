-- SQL Problem Solving

--Q  List CITY names not starting and not ending with vowels
--Source: HackerRank
select distinct city from station 
where  (city not like 'a%'
        and city not like 'e%'
        and city not like 'i%'
        and city not  like 'o%'
        and city not  like 'u%')
     and(city not like '%a'
        and city not like '%e'
        and city not like '%i'
        and city not like '%o'
        and city not like '%u');


--Q CITY names that either do not start or do not end with vowels
--Source: HackerRank
 select distinct city from station 
 where not((city like 'a%'
          or city like 'e%'
          or city like 'i%'
          or city like 'o%'
          or city like 'u%')
          and (city like '%a'
          or city like '%e'
          or city like '%i'
          or city like '%o'
          or city like '%u'));
          

--Q Continents and average city populations
--Source: HackerRank
select 
        country.continent,
       floor(avg(city.population)) as avg_city_population
from city 
inner join country
on city.countrycode = country.code 
group by country.continent;


--Q Total population of cities in Asia
--Source: HackerRank
select 
      sum(city.population) as total_population
from city 
inner join country
on city.countrycode = country.code
where country.continent = 'Asia';


--Q Find duplicate Emails
--Source: Leetcode
select email as Email
from Person
group by email
having count(email) > 1;