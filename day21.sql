-- SQL Problem Solving 


--Q Customers who never order
--Source: LeetCode
select 
       c.name as Customers
from customers as  c 
left join orders as o 
on c.id = o.customerId
where o.id is null;


--Q Rising temperature
--Source: LeetCode
select 
      w1.id
from weather as w1 
join weather as w2
on w1.recordDate = date_add(w2.recordDate, interval 1 day)
where w1.temperature > w2.temperature;


--Q Classes with atleast 5 students
--Source: LeetCode
select class from courses
group by class
having count(student) >= 5;




