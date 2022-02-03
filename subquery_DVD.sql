--1. List all customers who live in Texas (use
--JOINs)
-- Answer - Jennifer Davis, Kim Cruz, RIchard Mccrary, Bryan Hardison, Ian Still
SELECT customer.first_name, customer.last_name, customer.customer_id, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

SELECT *
FROM address;
--2. Get all payments above $6.99 with the Customer's Full
--Name
SELECT customer.customer_id, first_name, last_name, payment.amount
FROM customer
RIGHT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
ORDER BY customer_id;

--3. Show all customers names who have made payments over $175(use
--subqueries)
SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)
);

--4. List all customers that live in Nepal (use the country table)
SELECT first_name, last_name, city.city, country.country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';
--5. Which staff member had the most
--transactions?
SELECT first_name, last_name, COUNT(rental.rental_id)
FROM staff
FULL JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id
ORDER BY COUNT(rental.rental_id) DESC;
--6. How many movies of each rating are
--there?
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id);

--7.Show all customers who have made a single payment
--above $6.99 (Use Subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
);


--8. How many free rentals did our stores give away?
SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0;
