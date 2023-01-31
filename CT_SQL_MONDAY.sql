--1. How many actors are there with the last name ‘Wahlberg’?  ANSWER:  2
select * from actor
where last_name = 'Wahlberg';


--2. How many payments were made between $3.99 and $5.99? ANSWER:  4801
select * from payment;
select count(amount)
from payment
where amount between 3.99 and 5.99
order by count(amount);


--3. What film does the store have the most of? (search in inventory)  ANSWER:  There are multiple films with a inventory count of 8 but not greater than
select count(film_id), film_id
from inventory
where film_id > 8
group by film_id
order by count(film_id) desc;

select count(*), film_id
from inventory
group by film_id
having count(*) >= 8;

--4. How many customers have the last name ‘William’? ANSWER:  0
select count(last_name)
from customer 
where last_name ='William';

select * from customer;



--5. What store employee (get the id) sold the most rentals? ANSWER:  staff_id 2 sold the most
select * from payment;


select staff_id, SUM(amount)
from payment
group by staff_id
order by MAX(amount), staff_id desc;



--6. How many different district names are there?  ANSWER:  378
select * from address;
select count(distinct district)
from address;


--7. What film has the most actors in it? (use film_actor table and get film_id)  Answer:  film_id 508 - 15 actors
select * from film_actor;
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;



--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) Answer:  13
select * from customer;

select store_id, count(last_name)
from customer
where last_name like '%es'
and store_id = 1
group by store_id;



--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)  ANSWER:  3
select * from payment;

select count(*), amount
from payment
where customer_id > 380 and customer_id < 430
group by amount
having count(*) > 250;



--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?  ANSWER:  5 ratings  PG-13 with 223


select * from film;

select count(distinct rating)
from film;

select  rating, count(rating)
from film
group by rating
order by count(rating);

