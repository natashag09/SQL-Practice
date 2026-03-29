-- Joins (Inner, Left, Right)

-- Inner Join 

--Q The average number of appointments per doctor per day 
select 
      d.doctorID,
      d.firstname,
      d.lastname,
      count(a.appointmentID/count(distinct a.appointment_date)) as avg_appointments_per_day
from doctors d 
inner join appointments a 
on d.doctorID = a.doctorID 
group by d.doctorID, d.firstname, d.lastname;

--Q Show patients who had more than 3 appointments 
select 
      p.patientID,
      p.firstname,
      p.lastname,
      count(a.appointmentID) as total_appointments
from patients p 
inner join appointments a 
on p. patientID = a.patientID 
group by p.patientID, p.firstname, p.lastname 
having count(a.appointmentID) > 3;

-- Left Join 

--Q Total number of appointments for each doctor . And find the highest value of appointment.
select 
      d.firstname,
      d.lastname,
      count(a.appointmentID) as total_appointments 
from doctors d 
left join appointments a 
on d.doctorID = a.doctorID 
group by d.firstname, d.lastname 
order by total_appointments desc 
limit 1; 

--Q List of doctors who have not had any appointments 
select 
      d.firstname,
      d.lastname,
      count(a.appointmentID) as total_appointments 
from doctors d 
left join appointments a 
on d.doctorID = a.doctorID 
group by d.firstname, d.lastname 
having total_appointments = 0; 

-- Right join 

--Q The patients who had appointments with more than one doctor 
select 
      count(a.doctorID) as Total_doctors,
      p.firstname,
      p.lastname
from appointments a 
right join patients p 
on a.patientId = p.patientId 
group by p.firstname, p.lastname;

--Q The top 5 patients by total billing amount 
select 
      sum(b.amount) as total_billing_amount,
      p.patientID,
      p.firstname,
      p.lastname 
from billing b 
right join patients p 
on b.patientID = p.patientID 
group by p.patientID, p.firstname, p.lastname 
order by total_billing_amount desc 
limit 5; 


