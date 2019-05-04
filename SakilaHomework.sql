
use sakila;

select first_name, last_name from actor;

select concat(first_name, ' ', last_name) as full_name from actor;

select actor_id, first_name, last_name from actor 
	where first_name = 'Joe';

select first_name, last_name from actor 
	where first_name like '%gen%';

select last_name, first_name from actor 
	where first_name like '%gen%';

select country, country_id from country 
	where country in ('Afghanistan', 'Bangladesh', 'China');
    
# 3a Add a middle_name column to the table actor. Position it between first_name and last_name. Hint: you will need to specify the data type.
alter table actor add description blob(200);

alter table actor
DROP COLUMN description;


select last_name, count(last_name) from actor 
	group by last_name;

select last_name, count(last_name) from actor 
	group by last_name having count(last_name) >= 2;

set sql_safe_updates = 0;
update actor set first_name = replace(first_name, 'GROUCHO', 'HARPO');

select actor_id, first_name, last_name from actor where last_name = 'WILLIAMS';

describe address;

select staff.first_name, staff.last_name, address.address from staff
	inner join address on staff.address_id = address.address_id;

select staff.first_name, staff.last_name, sum(payment.amount) from staff
	inner join payment on staff.staff_id = payment.staff_id
    group by staff.staff_id;    

select film.title, count(film_actor.actor_id) from film
	inner join film_actor on film.film_id = film_actor.film_id
    group by film.film_id; 

select film.title, count(inventory.film_id) from film
	inner join inventory on film.film_id = inventory.film_id
    group by film.film_id
    having film.title = 'Hunchback Impossible';

select customer.first_name, customer.last_name, sum(payment.amount) from customer
	inner join payment on customer.customer_id = payment.customer_id
    group by customer.customer_id
    order by customer.last_name;

  select title from film
	where language_id in
		(select language_id from language
        where name = 'English')
	and title like 'Q%' or 'K%';

select first_name, last_name from actor
	where actor_id in
		(select actor_id from film_actor
		where film_id in
			(select film_id from film
            where title = 'Alone Trip'));

select customer.first_name, customer.last_name, customer.email from customer
	inner join address on customer.address_id = address.address_id
	inner join country on address.address_id = country.country_id
    where country.country = 'Canada'
    group by customer.first_name, customer.last_name, customer.email;

select title from film
	where film_id in
	(select film_id from film_category
		where category_id in
			(select category_id from category 
				where name = 'Family'));

select title, count(rental.rental_id) from film
	inner join inventory on film.film_id = inventory.film_id
    inner join rental on inventory.inventory_id = rental.inventory_id
    group by title
    order by count(rental.rental_id) desc;

select store.store_id, sum(payment.amount) from store
	inner join customer on store.store_id = customer.store_id
	inner join payment on customer.customer_id = payment.payment_id
    group by store.store_id;

select store.store_id, city.city, country.country from store
	inner join address on store.address_id = address.address_id
	inner join city on address.city_id = city.city_id
	inner join country on city.country_id = country.country_id
    group by store.store_id, city.city, country.country;

select category.name, sum(payment.amount) from category
	inner join film_category on category.category_id = film_category.category_id
	inner join inventory on film_category.film_id = inventory.film_id
	inner join rental on inventory.inventory_id = rental.inventory_id
    inner join payment on rental.rental_id = payment.rental_id
    group by category.name
    order by sum(payment.amount) desc 
    limit 5;

create view Top5 as
	select category.name as 'Genre', sum(payment.amount) as 'Gross Revenue' from category
		inner join film_category on category.category_id = film_category.category_id
		inner join inventory on film_category.film_id = inventory.film_id
		inner join rental on inventory.inventory_id = rental.inventory_id
		inner join payment on rental.rental_id = payment.rental_id
		group by category.name
		order by sum(payment.amount) desc 
		limit 5;

select * from Top5;

drop view Top5;