drop table patient;
create table patient(
patient_id serial primary key,
first_name varchar(20),
last_name varchar(50) not null,
email varchar(50) unique,
sign_up_date date not null,
time_in_hostipal numeric not null,
city varchar(20) not null,
state varchar(2) not null);