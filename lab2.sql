Use sakila;

-- Select all the actors with the first name ‘Scarlett’.

select * from sakila.actor
where (first_name = 'Scarlett');

-- How many films (movies) are available for rent and how many films have been rented?

select * from inventory;
SELECT COUNT(DISTINCT film_id) FROM inventory;

select * from rental;
SELECT COUNT(DISTINCT inventory_id) FROM rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select max(length),min(length) from film;

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT * FROM film;
SELECT avg(length) FROM film;

SELECT time_format(CONVERT(left(avg(length),3),TIME), '%H %i %s') FROM film;

-- How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name) FROM actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT (datediff('2023-01-18',left(min(rental_date),10))/365) from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT *, date_format(CONVERT(left(rental_date,9),date), '%M') AS 'rental_month' FROM rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, WEEKDAY(rental_date) as 'rental_wdorwe' from rental;

-- Get release years.

select release_year from film;

-- Get all films with ARMAGEDDON in the title.

SELECT title FROM film 
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.

SELECT title FROM film WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.

SELECT * from film order by length desc
limit 10;

-- How many films include Behind the Scenes content?

select * from film;

SELECT COUNT(*) FROM film WHERE special_features LIKE '%Behind the Scenes%';

SELECT special_features FROM film 
WHERE special_features LIKE '%Behind the Scenes%';