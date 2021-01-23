drop table Physician;
create table Physician(
physician_id serial primary key,
first_name varchar(20),
last_name varchar(50) not null,
position  varchar(40));

Insert into physician
values(1, 'John', 'Dorian', 'Staff Internist');

Insert into physician
values(2, 'Elliot', 'Reid', 'Attending Physican');

Insert into physician
values(3, 'Christopher', 'Turk', 'Surgical Attending Physican');

Insert into physician
values(4, 'Percival', 'Cox', 'Senior Attending Physican');