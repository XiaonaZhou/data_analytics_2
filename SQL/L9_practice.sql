drop table if exists customer_l9;
create table customer_l9(
CustomerID  integer,
CustomerName varchar(30),
Address varchar(50),
City varchar(20),
PostalCode integer,
Country varchar(20),
Email varchar(50)
);

insert into customer_l9
values(1, 'Emma', '123 street', 'Brooklyn', 11211,  'USA', '1234@gmail.com');

insert into customer_l9
values(2, 'John', '12345 street', 'Brooklyn', 11221,  'USA', '1234778@gmail.com');

insert into customer_l9
values(3, 'Jake', '145 street', 'Brooklyn', 11231,  'USA', '123sddff8@gmail.com');


select * from customer_l9;
-- Use an UPDATE to modify any portion of the data
update customer_l9
set CustomerName = 'Lucky'
where CustomerID = 3;
select * from customer_l9;

-- Finally, write a statement to delete one row of data.

delete from customer_l9
where customerid = 3;
select * from customer_l9;