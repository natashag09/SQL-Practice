-- Self Join, Advanced Join Queries

-- Self Join 

--Q How many employees are working under managers 
select 
      m.m_id,
      count(e.e_id) as total_emp 
from emp_details m 
left join emp_details e 
on m.e_id = e.e_id 
group by m.m_id;

--Q Employees who do not have a manager 
select 
      e.name
from emp_details e 
left join emp_details m 
on e.e_id = m.e_id
where m.e_id is null;

-- Advanced Join Queries 

--Q The doctor with the least average billing per appointment
select 
      d.firstname,
      d.lastname,
      sum(b.amount)/count(a.appointmentID) as avg_amount_per_appointment 
from doctors d 
left join appointmetns a 
on d.doctorID = a.doctorID
inner join billing b 
on a.patientID = b.patientID 
group by d.firstname, d.lastname 
order by avg_amount_per_appointment asc;

--Q List patients who visited more than 1 department 
select 
      p.patientID,
      p.firstname,
      p.lastname,
      count(distinct d.specialization) as total_specialization 
from patients p 
inner join appointments a 
on p.patientId = a.patientID 
inner join doctors d 
on a.doctorID = d.doctorID 
group by p.patientID, p.firstname, p.lastname 
having count(distinct d.specialization)>1; 

--Q patients who had an appointment but no treatment recorded 
select 
      p.patientID,
      p.firstname,
      p.lastname,
      count(a.appointmentID) as total_appointments 
from patients p 
left join appointments a 
on p.patientID = a.patientID 
left join treatments t 
on a.treatmentID = t.treatmentID 
where t.treatmentID is null 
group by p.patientID, p.firstname, p.lastname;

--Q Find patients who had a treatment but no billing record 
select distinct 
       p.patientID,
       p.firstname,
       p.lastname
from patients p 
inner join appointments a 
on p.patientID = a.patientID 
inner join treatments t 
on a.appointmentID = t.appointmentId 
left join billing b 
on p.patientID = b.patientID 
where b.patientID is null;