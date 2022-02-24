#List the number of films per category.

USE 
	sakila;
SELECT 
	c.name, count(f.film_id) as number_of_films
FROM 
	film_category f 
JOIN 
	category c 
ON 
	f.category_id = c.category_id
GROUP BY 
	c.name
ORDER BY 
	c.name;

#Display the first and the last names, as well as the address, of each staff member.

SELECT 
	s.first_name, s.last_name, a.address
FROM 
	staff s
LEFT JOIN 
	address a
ON 
	s.address_id = a.address_id
ORDER BY 
	last_name;

#Display the total amount rung up by each staff member in August 2005.

SELECT * from payment;

SELECT 
	s.first_name, s.last_name, sum(p.amount) as amount_rung_August_2005, p.payment_date
FROM 
	staff s
LEFT JOIN
	payment p
ON 
	s.staff_id = p.staff_id
WHERE
	p.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY
	s.staff_id;

#List all films and the number of actors who are listed for each film.

SELECT 
	f.title, count(a.actor_id) as number_of_actors
FROM 
	film f
LEFT JOIN
	film_actor a
ON 
	f.film_id = a.film_id
GROUP BY
	f.film_id;

# Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
#List the customers alphabetically by their last names.

SELECT 
	c.first_name, c.last_name, sum(p.amount) as total_amount_paid
FROM 
	customer c
LEFT JOIN
	payment p
ON 
	c.customer_id = p.customer_id
GROUP BY
	c.customer_id
ORDER BY
	c.last_name;


