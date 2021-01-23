drop table if exists physician;
create table physician (
employee_id integer primary key not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
position varchar(30) not null
);

Insert into physician
values(1, 'John', 'Dorian', 'Staff Internist');
Insert into physician
values(2, 'Elliot', 'Reid', 'Attending Physican');
Insert into physician
values(3, 'Christopher', 'Turk', 'Surgical Attending Physican');
Insert into physician
values(4, 'Percival', 'Cox', 'Senior Attending Physican');
Insert into physician
values(5,'Bob', 'Kelso','Head Chief of Medicine');
Insert into physician
values(6,'Todd', 'Quinlan','Surgical Attending Physician');
Insert into physician
values(7,'John', 'Wen','Surgical Attending Physician');
Insert into physician
values(8,'Keith', 'Dudemeister','MD Resident');
Insert into physician
values(9,'Molly', 'Clock','Attending Psychiatrist');


drop table if exists department;
create table department (
department_id integer not null,
name varchar(30) not null,
head integer not null,
primary key (department_id),
foreign key (head) references physician(employee_id)
);

Insert into department
values(1, 'General Medicine', 4);

Insert into department
values(2, 'Surgery', 7);

Insert into department
values(3, 'Psychiatry', 9);


drop table if exists affiliated_with;
create table affiliated_with (
physician integer not null,
department integer not null,
parimary_affiliation boolean not null,
foreign key (physician) references physician(employee_id),
foreign key (department) references department (department_id)
);

insert into affiliated_with 
values(1,1,'1');
insert into affiliated_with 
values(2,1,'1');
insert into affiliated_with 
values(3,1,'0');
insert into affiliated_with 
values(3,2,'1');
insert into affiliated_with 
values(4,1,'1');
insert into affiliated_with 
values(5,1,'1');
insert into affiliated_with 
values(6,2,'1');
insert into affiliated_with 
values(7,1,'0');
insert into affiliated_with 
values(7,2,'1');
insert into affiliated_with 
values(8,1,'1');
insert into affiliated_with 
values(9,3,'1');


drop table if exists procedures;
create table procedures (
code integer primary key not null,
name varchar(30) not null,
cost real not null
);

insert into procedures values(1,'Reverse Rhinopodoplasty',1500.0);
insert into procedures values(2,'Obtuse Pyloric Recombobulation',3750.0);
insert into procedures values(3,'Folded Demiophtalmectomy',4500.0);
insert into procedures values(4,'Complete Walletectomy',10000.0);
insert into procedures values(5,'Obfuscated Dermogastrotomy',4899.0);
insert into procedures values(6,'Reversible Pancreomyoplasty',5600.0);
insert into procedures values(7,'Follicular Demiectomy',25.0);


drop table if exists trained_in;
create table trained_in (
physician integer not null,
treatment integer not null,
certificationDate date not null,
certificationExpires date not null,
foreign key (physician) references physician(employee_id),
foreign key (treatment) references procedures (code)
);

insert into trained_in values(3,1,'2008-01-01','2008-12-31');
insert into trained_in values(3,2,'2008-01-01','2008-12-31');
insert into trained_in values(3,5,'2008-01-01','2008-12-31');
insert into trained_in values(3,6,'2008-01-01','2008-12-31');
insert into trained_in values(3,7,'2008-01-01','2008-12-31');
insert into trained_in values(6,2,'2008-01-01','2008-12-31');
insert into trained_in values(6,5,'2007-01-01','2007-12-31');
insert into trained_in values(6,6,'2008-01-01','2008-12-31');
insert into trained_in values(7,1,'2008-01-01','2008-12-31');
insert into trained_in values(7,2,'2008-01-01','2008-12-31');
insert into trained_in values(7,3,'2008-01-01','2008-12-31');
insert into trained_in values(7,4,'2008-01-01','2008-12-31');
insert into trained_in values(7,5,'2008-01-01','2008-12-31');
insert into trained_in values(7,6,'2008-01-01','2008-12-31');
insert into trained_in values(7,7,'2008-01-01','2008-12-31');

drop table if exists patient;
create table patient (
patient_id integer primary key not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
address varchar(100),
phone text, 
insurance_id integer unique,
pcp integer not null,
foreign key (pcp) references physician(employee_id)
);

insert into patient values(1,'John', 'Smith','42 Foobar Lane','555-0256',68476213,1);
insert into patient values(2,'Grace', 'Ritchie','37 Snafu Drive','555-0512',36546321,2);
insert into patient values(3,'Random', 'J. Patient','101 Omgbbq Street','555-1204',65465421,2);
insert into patient values(4,'Dennis', 'Doe','1100 Foobaz Avenue','555-2048',68421879,3);



drop table if exists nurse;
create table nurse (
employee_id integer primary key not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
position varchar(20) not null,
registered boolean not null
);


insert into nurse values(101,'Carla', 'Espinosa','Head Nurse','1');
insert into nurse values(102,'Laverne', 'Roberts','Nurse','1');
insert into nurse values(103,'Paul', 'Flowers','Nurse','0');


drop table if exists appointment;
create table appointment (
appointment_id integer primary key not null,
patient integer not null,
prepnurse integer,
physician integer not null,
start_dt_time timestamp not null,
end_dt_time timestamp not null,
examination_room text not null,
foreign key (patient) references patient(patient_id),
foreign key (prepnurse) references nurse(employee_id),
foreign key (physician) references physician(employee_id)
);


insert into appointment values(13216584,1,101,1,'2008-04-24 10:00','2008-04-24 11:00','A');
insert into appointment values(26548913,2,101,2,'2008-04-24 10:00','2008-04-24 11:00','B');
insert into appointment values(36549879,1,102,1,'2008-04-25 10:00','2008-04-25 11:00','A');
insert into appointment values(46846589,4,103,4,'2008-04-25 10:00','2008-04-25 11:00','B');
insert into appointment values(59871321,4,NULL,4,'2008-04-26 10:00','2008-04-26 11:00','C');
insert into appointment values(69879231,3,103,2,'2008-04-26 11:00','2008-04-26 12:00','C');
insert into appointment values(76983231,1,NULL,3,'2008-04-26 12:00','2008-04-26 13:00','C');
insert into appointment values(86213939,4,102,9,'2008-04-27 10:00','2008-04-21 11:00','A');
insert into appointment values(93216548,2,101,2,'2008-04-27 10:00','2008-04-27 11:00','B');


drop table if exists medication;
create table medication (
code integer primary key not null,
name varchar(30) not null,
brand text not null,
description text not null
);


insert into medication values(1,'Procrastin-X','X','N/A');
insert into medication values(2,'Thesisin','Foo Labs','N/A');
insert into medication values(3,'Awakin','Bar Laboratories','N/A');
insert into medication values(4,'Crescavitin','Baz Industries','N/A');
insert into medication values(5,'Melioraurin','Snafu Pharmaceuticals','N/A');


drop table if exists prescribes;
create table prescribes (
physician integer not null,
patient integer not null,
medication integer not null,
date_time timestamp not null,
appointment integer,
does text not null,
foreign key (physician) references physician(employee_id),
foreign key (patient) references patient(patient_id),
foreign key (medication) references medication(code),
foreign key (appointment) references appointment(appointment_id)
);

INSERT INTO Prescribes VALUES(1,1,1,'2008-04-24 10:47',13216584,'5');
INSERT INTO Prescribes VALUES(9,4,2,'2008-04-27 10:53',86213939,'10');
INSERT INTO Prescribes VALUES(9,4,2,'2008-04-30 16:53',NULL,'5');


drop table if exists block;
create table block (
floor_num integer not null,
code integer not null,
primary key(floor_num, code)
);

INSERT INTO Block VALUES(1,1);
INSERT INTO Block VALUES(1,2);
INSERT INTO Block VALUES(1,3);
INSERT INTO Block VALUES(2,1);
INSERT INTO Block VALUES(2,2);
INSERT INTO Block VALUES(2,3);
INSERT INTO Block VALUES(3,1);
INSERT INTO Block VALUES(3,2);
INSERT INTO Block VALUES(3,3);
INSERT INTO Block VALUES(4,1);
INSERT INTO Block VALUES(4,2);
INSERT INTO Block VALUES(4,3);


drop table if exists room;
create table room (
room_num integer primary key not null,
room_type text not null,
block_floor integer not null,
block_code integer not null,
unavailable boolean not null,
foreign key (block_floor, block_code) references block
);


insert into room values(101,'Single',1,1,'0');
insert into room values(102,'Single',1,1,'0');
insert into room values(103,'Single',1,1,'0');
insert into room values(111,'Single',1,2,'0');
insert into room values(112,'Single',1,2,'1');
insert into room values(113,'Single',1,2,'0');
insert into room values(121,'Single',1,3,'0');
insert into room values(122,'Single',1,3,'0');
insert into room values(123,'Single',1,3,'0');
insert into room values(201,'Single',2,1,'1');
insert into room values(202,'Single',2,1,'0');
insert into room values(203,'Single',2,1,'0');
insert into room values(211,'Single',2,2,'0');
insert into room values(212,'Single',2,2,'0');
insert into room values(213,'Single',2,2,'1');
insert into room values(221,'Single',2,3,'0');
insert into room values(222,'Single',2,3,'0');
insert into room values(223,'Single',2,3,'0');
insert into room values(301,'Single',3,1,'0');
insert into room values(302,'Single',3,1,'1');
insert into room values(303,'Single',3,1,'0');
insert into room values(311,'Single',3,2,'0');
insert into room values(312,'Single',3,2,'0');
insert into room values(313,'Single',3,2,'0');
insert into room values(321,'Single',3,3,'1');
insert into room values(322,'Single',3,3,'0');
insert into room values(323,'Single',3,3,'0');
insert into room values(401,'Single',4,1,'0');
insert into room values(402,'Single',4,1,'1');
insert into room values(403,'Single',4,1,'0');
insert into room values(411,'Single',4,2,'0');
insert into room values(412,'Single',4,2,'0');
insert into room values(413,'Single',4,2,'0');
insert into room values(421,'Single',4,3,'1');
insert into room values(422,'Single',4,3,'0');
insert into room values(423,'Single',4,3,'0');


drop table if exists on_call;
create table on_call (
nurse integer not null,
block_floor integer not null,
block_code integer not null,
on_call_start timestamp not null,
on_call_end timestamp not null,
foreign key (nurse) references nurse(employee_id),
foreign key (block_floor, block_code) references block
);


insert into on_call values(101,1,1,'2008-11-04 11:00','2008-11-04 19:00');
insert into on_call values(101,1,2,'2008-11-04 11:00','2008-11-04 19:00');
insert into on_call values(102,1,3,'2008-11-04 11:00','2008-11-04 19:00');
insert into on_call values(103,1,1,'2008-11-04 19:00','2008-11-05 03:00');
insert into on_call values(103,1,2,'2008-11-04 19:00','2008-11-05 03:00');
insert into on_call values(103,1,3,'2008-11-04 19:00','2008-11-05 03:00');


drop table if exists stay;
create table stay (
stay_id integer primary key not null,
patient integer not null,
room integer not null,
on_call_start timestamp not null,
on_call_end timestamp not null,
foreign key (patient) references patient(patient_id),
foreign key (room) references room(room_num)
);

INSERT INTO Stay VALUES(3215,1,111,'2008-05-01','2008-05-04');
INSERT INTO Stay VALUES(3216,3,123,'2008-05-03','2008-05-14');
INSERT INTO Stay VALUES(3217,4,112,'2008-05-02','2008-05-03');



drop table if exists undergoes;
create table undergoes (
patient integer not null,
procedure_code integer not null,
stay integer not null,
date_time timestamp not null,
physician integer not null,
nurse integer,
foreign key (patient) references patient(patient_id),
foreign key (procedure_code) references procedures(code),
foreign key (stay) references stay(stay_id),
foreign key (physician) references physician(employee_id),
foreign key (nurse) references nurse(employee_id)
);


insert into undergoes values(1,6,3215,'2008-05-02',3,101);
insert into undergoes values(1,2,3215,'2008-05-03',7,101);
insert into undergoes values(4,1,3217,'2008-05-07',3,102);
insert into undergoes values(4,5,3217,'2008-05-09',6,NULL);
insert into undergoes values(1,7,3217,'2008-05-10',7,101);
insert into undergoes values(4,4,3217,'2008-05-13',3,103);


