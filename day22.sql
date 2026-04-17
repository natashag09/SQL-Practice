-- SQL Problem Solving 

--Q Find maximum earnings and number of employees having that earning
--Source: HackerRank
select 
      max(salary*months) as max_earning,
      count(*) as employee_count 
from employee
where salary*months = (select max(salary*months )
                       from employee);


--Q Sum of LAT_N and LONG_W rounded to 2 decimal places
--Source: HackerRank 
select 
      round(sum(lat_n), 2) as lat,
      round(sum(long_w), 2) as lon 
from station;


--Q Sum of LAT_N within a given range (truncated to 4 decimals)
--Source: HackerRank
select truncate(sum(lat_n),4) as sum_nor_lat 
from station 
where lat_n  > 38.7880 and lat_n < 137.2345;
