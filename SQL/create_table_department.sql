drop table department;
create table department(
department_id serial primary key,
name varchar(20),
head  integer);

Insert into department
values(1, 'General Medicine', 4);

Insert into department
values(2, 'Surgery', 7);

Insert into department
values(3, 'Psychiatry', 9);
