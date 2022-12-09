--Q1 List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district
from customer 
full join address
on customer.address_id = address.address_id
where district = 'Texas'
--Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still


--Q2 Get all payments above $6.99 with the Customer's Full name 
select customer.customer_id, first_name, last_name, amount
from customer
inner join payment 
on customer.customer_id = payment.customer_id 
where amount > '6.99'
--Answer: Run query


--Q3 Show all customers names who have made payments over $175(use subqueries)
select customer.customer_id, first_name, customer.last_name 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc 
);
--Answer: Run query


--Q4 List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, city
from customer 
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id 
where city = 'Nepal'
--Answer: No data with city Nepal


--Q5 Which staff member had the most transactions?
select staff.staff_id, first_name, last_name, count(rental_id)
from rental 
inner join staff
on staff.staff_id = rental.staff_id
group by staff.staff_id
--Answer: Staff member 1, Mike Hiilyer, had the most transactions


--Q6 How many movies of each rating are there?
select count(rating), rating
from film
group by rating
--Answer: R with 195, NC-17 with 209, G with 178, PG-13 with 223, 194


--Q7 Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer.customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having count(distinct amount) > 6.99
);
--Answer: Run query


--Q8 How many free rentals did our stores give away?
select rental.rental_id
from rental
where rental_id in (
	select rental_id 
	from payment
	group by rental_id 
	having sum(amount) = 0.00
);
--Answer: 0 free rentals





































