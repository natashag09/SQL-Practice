-- Text and Date Functions 

-- Text Functions 

--Q Display name of customer from left 
select customer_name, left(customer_name, 4) as first_name
from accounts;

--Q Display name from the right 
select customer_name, right(customer_name, 6) as last_name 
from accounts;

--Q Remove spaces from the text ('  Rahul    Kumar   ')
select trim('   Rahul   Kumar    ') as name 
from accounts;

--Q Count alphabets of customer name 
select customer_name, length(customer_name) as len 
from accounts;

--Q Combine First name and Last name of doctors 
select doctorID, concat(first_name, ' ', last_name) as full_name 
from doctors;

--Q Display last name from customer name 
select Right(customer_name, length(customer_name)- locate(' ', customer_name, 1)) as last_name 
from accounts;

--Q Display middle name of Rahul Kumar Sharma
select substring_index('Rahul Kumar Sharma',' ',-2)
from accounts;

--Q Change Deepak Kumar to to Deepak Sharma
select replace ('Deepak Kumar', 'Kumar', 'Sharma') as new_name 
from accounts;

--Q Creating symbol on repeat acc to given number of repetition 
select *, repeat('*',rate) as rating 
from rating;

--Q Convert names to uppercase
select upper(name) as upper_name 
from employees;

--Q convert names to lowercase
select lower(name) as lower_name 
from employees; 


-- Date & Time Functions 

--Q Get current date 
select curdate();

--Q Get current date and time 
select now();

--Q Find total no. of appointments acc to the month 
select 
      monthname(appointmentdate) as month_name
      count(appointmentID) as total_appointments 
from appointments 
group by monthname 
order by count(appointmentID) asc; 

--Q Find the higehst bill amount of patient in february 
select 
      p.firstname,
      p.lastname,
      monthname(b.billingdate) as months,
      max(b.amount) as high_amount 
from patients 
left join billing b 
on p.patientID = b.patientID 
where b.billingdate = 'February'
group by p.firstname, p.lastname, months 
order by high_amount desc 
limit 1;

--Q Find the last 30 days billing amount 
select * from billing 
where billingdate >= curdate() - Interval 30 day;