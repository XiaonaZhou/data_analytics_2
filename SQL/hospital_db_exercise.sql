--find general medicine doctors name
select a.first_name, a.last_name, b.department, c.name 
from physician a
join affiliated_with b 
join department c
on c.department_id= b.department
on b.physician = a.employee_id
where c.name='General Medicine';

--find which patient - doctor visit

select a.first_name as patient_first_name, b.last_name as patient_last_name,
b.first_name as physician_first_name, b.last_name as physician_last_name
from patient a
join physician b
on a.pcp = b.employee_id;


--total patient count on block_code=2
select count(*) from room where block_code=2;


--check procedure details
select * from undergoes;


-- find hospital workload such as procedure time and doctors, nurse details
select a.first_name as doctor_first_name, a.last_name as doctor_last_name, 
b.first_name as nurse_first_name, b.last_name as nurse_last_name, 
c.date_time as proceduretime
from physician a 
join nurse b
join undergoes c
on b.employee_id= c.nurse
on a.employee_id = c.physician
where c.physician=3;


--patient mdeication and priscription details
select * from medication;
select a.first_name, a.last_name, b.dose, c.name,c.brand from patient a
join prescribes b
join medication c
on c.code = b.medication
on a.patient_id = b.patient;


--trained in procedures 
select * from procedures;
select * from trained_in;
select treatment, count(*) from trained_in group by treatment;


select * from physician;
select * from affiliated_with;
select * from patient;
select * from nurse; 
select * from appointment;

