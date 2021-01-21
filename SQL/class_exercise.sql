select count(amount)from payment;
select * from payment;
select count(distinct(amount)) from payment;

-- select the top 15 highst payment
select customer_id, amount 
from payment
order by amount desc
limit 15;

-- select customer who's id is 7 or 13
select customer_id, rental_id, return_date
from rental
where customer_id =7 
or customer_id = 13;

-- practice using like
select first_name from customer
limit 40;

select first_name, last_name
from customer 
where first_name like 'Jen%';

-- How many payment transactions were greater than $5.00?  3618
select count(amount)
from payment
where amount > 5;

-- How many unique districts are our customers from? 378
select count(distinct(district))
from address; 

-- Retrieve the list of names from those distinct districts
select distinct(district)
from address;

-- How many films have the word Truman somewhere in the title? 5
select count(title)
from film
where title like '%Truman%';

