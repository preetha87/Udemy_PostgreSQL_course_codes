/*DVD RENTAL CASE STUDY - QUESTIONS AND CODES*/

/* QUESTION 1 - RETURN ALL THE COLUMNS FROM TABLE ACTOR*/
SELECT * 
FROM actor;

/*QUESTION 2 - RETURN ONLY THE COLUMNS first_name AND last_name FROM TABLE ACTOR*/
SELECT first_name, last_name 
FROM actor;

/*QUESTION 3 - RETURN ONLY THE COLUMN actor_id FROM TABLE ACTOR*/
SELECT actor_id 
FROM actor;

/*QUESTION 4 - SEND A PROMOTIONAL EMAIL TO CUSTOMERS - RETRIEVE THE FIRST NAME, LAST NAME AND EMAIL OF CUSTOMERS*/
SELECT first_name, last_name, email
FROM customer;

/*QUESTION 5 - WHAT ARE THE DISTINCT DVD RENTAL RATES?*/
SELECT DISTINCT rental_rate
FROM film;

/*QUESTION 6 - WHAT ARE THE DISTINCT RATINGS THAT A MOVIE CAN HAVE?*/
SELECT DISTINCT ratings
FROM film;

/*QUESTION 7 - GET THE DETAILS OF CUSTOMERS WHOSE LAST NAME IS RICE*/
SELECT first_name, last_name, email
FROM customer
WHERE last_name = 'Rice';

/*QUESTION 8 - GET THE CUSTOMER DETAILS OF RENTAL TRANSACTIONS BETWEEN 1 AND 8 DOLLARS*/
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount BETWEEN 1 AND 8;

/*QUESTION 9 - GET THE CUSTOMER DETAILS OF RENTAL TRANSACTIONS WHICH WERE NOT EQUAL TO 5 DOLLARS*/
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount =! 5;

/*QUESTION 10 - A CUSTOMER LEFT HER WALLET AT THE STORE - HER NAME IS NANCY THOMAS - NEED TO SEND HER AN EMAIL - RETRIEVE HER DETAILS*/
SELECT email
FROM customer
WHERE first_name = 'Nancy' and last_name = 'Thomas';

/*QUESTION 11 - A CUSTOMER WANTS TO KNOW THE DESCRIPTION OF THE FILM OUTLAW HANKY - RERIEVE IT*/
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

/*QUESTION 12 - A CUSTOMER LIVING IN 259 IPOH DRIVE, IS LATE WITH THEIR RENTAL PAYMENT - 
I WANT TO CALL THIS CUSTOMER TO LET THEM KNOW - RETRIEVE THIS CUSTOMER'S
PHONE NUMBER*/

SELECT phone
FROM address
WHERE address = '259 Ipoh Drive';

/*QUESTION 13 - GET A COUNT FOR THE NUMBER OF DISTINCT RENTAL AMOUNTS IN TRANSACTIONS*/
SELECT COUNT(DISTINCT amount)
FROM payment;

/*QUESTION 14 - GET THE FIRST AND LAST NAMES OF CUSTOMERS AND ARANGE THESE IN ASCENDING ORDER BY FIRST NAME*/
/*ALSO ARRANGE IN DESCENDING ORDER BY LAST NAME*/
SELECT first_name, last_name
FROM payment
ORDER BY first_name ASC, last_name DESC;

/*QUESTION 15 - GET THE CUSTOMER ID OF THE TOP 10 CUSTOMERS WITH THE HIGHEST RENTAL AMOUNTS*/
SELECT customer_id
FROM payment
ORDER BY amount DESC
LIMIT 10;

/*QUESTION 16 - GET THE TITLES OF MOVIES WITH FILM IDS FROM 1 TO 5*/
SELECT title
FROM films
ORDER BY film_id ASC
LIMIT 5;

/*QUESTION 17 - GET THE RENTAL INFORMATION OF CUSTOMER ID 1 AND 2 AND ORDER BY RETURN DATE IN DESCENDING ORDER*/
SELECT customer_id, rental_id, payment
FROM payment
WHERE customer_id IN(1,2)
ORDER BY return_date DESC;

/*QUESTION 18 - GET THE RENTAL INFORMATION OF ALL CUSTOMER IDS OTHER THAN 1 AND 2 AND ORDER BY RETURN DATE IN DESCENDING ORDER*/
SELECT customer_id, rental_id, payment
FROM payment
WHERE customer_id NOT IN (1,2)
ORDER BY return_date DESC;

/*QUESTION 19 - THE STORE MANAGER REMEMBERS THAT THE NAME OF THE CUSTOMER BEGINS WITH THE WORDS JEN - RETRIEVE INFORMATION ON ALL SUCH CUSTOMERS*/
SELECT customer_id, last_name, first_name
FROM customers
WHERE first_name LIKE 'Jen%';

/*QUESTION 20 - GET ALL CUSTOMERS WHOSE FIRST NAMES END IN A Y*/
SELECT customer_id, last_name, first_name
FROM customers
WHERE first_name LIKE '%y';

/*QUESTION 21 - GET THE FIRST NAME OF CUSTOMERS THAT CONTAINS LETTERS FOLLOWED BY 'her'*/
SELECT customer_id, first_name, last_name
FROM customers
WHERE first_name LIKE '_her%';

/*QUESTION 22 - How many payment transactions were greater than $5.00?*/
SELECT count(amount)
FROM payment
WHERE amount > 5;
/*3618 transactions were greater than $5*/

/*QUESTION 23 - How many actors have a first name that starts with the letter P?*/
SELECT first_name
FROM actor
WHERE first_name LIKE 'P%';
/*5 actors have a first name that starts with the letter P.*/

/*QUESTION 24 - How many unique districts are our customers from?*/
SELECT COUNT(DISTINCT district)
FROM address;
/*There are 378 unique districts where our customers are from*/

/*QUESTION 25 - Retrieve the list of names for those distinct districts from the previous question*/
SELECT DISTINCT district
FROM address;

/*QUESTION 26 - How many film titles have a rating of R and a replacement cost between $5 and $15?*/
SELECT COUNT(title)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;
/*52 films have a rating R and a replacement cost between 5 and 15 dollars*/

/*QUESTION 27 - How many films have the word Truman somewhere in the title?*/
SELECT COUNT(title)
FROM film
WHERE title ILIKE '%Truman%';
/*There are 5 films that have the word Truman somewhere in the title*/

/*QUESTION 27 - Return the average amount paid as rental*/
SELECT AVG(amount)
FROM payment;

/*QUESTION 28 - Return the average amount paid and reduce it to 2 decimal places*/
SELECT ROUND(AVG(amount),2.)
FROM payment;

/*QUESTION 29 - GET THE TOTAL RENTAL AMOUNT PAID BY EACH CUSTOMER*/
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id;

/*QUESTION 30 - WHICH CUSTOMERS HAVE SPENT THE MOST MONEY IN RENTAL AMOUNTS*/
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

/*QUESTION 31 - WE HAVE TWO STAFF MEMBERS WITH STAFF IDS 1 AND 2.
WE WANT TO GIVE A BONUS TO THE STAFF MEMBER THAT HANDLED THE MOST PAYMENTS. 
HOW MANY PAYMENTS DID EACH STAFF MEMBER HANDLE? WHAT WAS THE TOTAL AMOUNT?*/
SELECT staff_id, SUM(amount), COUNT(amount)
FROM payment
GROUP BY staff_id;
/*The staff member with staff ID 2 should be given the bonus!*/

/*QUESTION 32 - WE WANT TO SEND PROMOTIONAL DISCOUNT COUPONS TO THE TOP FIVE CUSTOMERS WHO SPEND THE MOST ON RENTAL
GET ME THEIR IDS AND TOTAL RENTAL AMOUNT*/
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

/*QUESTION 33 - RETURN THE CUSTOMER_ID AND AMOUNT OF ONLY THOSE CUSTOMERS WHO HAVE BEEN SPENDING MORE THAN $ 200*/
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount)>200;

/*QUESTION 34 - GET THE COUNT OF THE CUSTOMERS IN THE STORES AND FIND OUT WHICH STORE HAS MORE THAN 300 CUSTOMERS*/
SELECT store_id, COUNT(customer_id)
FROM customer
GROUP store_id
HAVING COUNT(customer_id)>300;

/*QUESTION 35 - WE ARE INTERESTED IN 3 FILM RATINGS IN THE DATA BASE – R, G AND PG
WE WOULD LIKE TO FIND THE AVERAGE RENTAL RATE FOR MOVIES WITH THESE RATINGS – SUCH THAT THE AVERAGE RENTAL RATE IS LESS THAN $3*/
SELECT rating, AVG(ROUND(rental_rate,2.))
FROM film
GROUP BY rating
ORDER BY AVG(ROUND(rental_rate, 2.))<3;

/*QUESTION 36 - RETRIEVE THOSE CUSTOMERS WHO HAVE MADE AT LEAST 40 RENTAL TRANSACTIONS - THESE ARE THE CUSTOMERS WHO WILL
QUALIFY FOR THE PLATINUM CARD*/
SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id)>=40;

/*QUESTION 37 - WHAT MOVIES HAVE AN AVERAGE RENTAL DURATION OF AT LEAST 5 DAYS OR MORE? GROUP BY RATING*/
SELECT rating, ROUND(AVG(rental_duration,2.))
FROM film
GROUP BY rating
HAVING ROUND(AVG(rental_duration,2.))>=5;

/*QUESTION 38 - RETURN THE CUSTOMER IDS OF CUSTOMERS WHO HAVE SPENT MORE THAN $110 AS THE TOTAL RENTAL 
FOR A STAFF MEMBER WITH THE ID 2*/
SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount)>110;

/*QUESTION 39 - HOW MANY FILMS BEGIN WITH THE LETTER J?*/
SELECT COUNT(film_id)
FROM film
WHERE title LIKE 'J%';

/*QUESTION 40 - WHICH CUSTOMER HAS THE GREATEST CUSTOMER ID WHOSE NAME STARTS WITH AN E AND WHOSE ADDRESS ID IS LESS THAN 500?*/
SELECT customer_id
FROM customer
WHERE first_name ILIKE 'E%' AND address_id<500
ORDER BY customer_id DESC
LIMIT 1;

/*QUESTION 41 - We want the payment details and customer information for customers
whose first name starts with an A*/
/* ANSWER: NEED TO PERFORM INNER JOIN - JOIN THE PAYMENT AND CUSTOMER TABLES TOGETHER*/
SELECT customer.customer_id, first_name, email, amount, payment_date
FROM customer 
INNER JOIN payment ON payment.customer_id = customer.customer_id
WHERE first_name LIKE 'A%';

/*QUESTION 42(A) - We want all the instances of a specific film title being at a particular store.
INNER JOIN THE INVENTORY WITH THE FILM TABLE*/
SELECT title, store_id
FROM inventory
INNER JOIN film ON inventory.film_id = film.film_id;

/*QUESTION 42(B) - How many copies of each movie are at the store with store id 1?*/
SELECT title, COUNT(title) AS total_number_copies
FROM inventory
INNER JOIN film ON inventory.film_id = film.film_id
WHERE store_id = 1
GROUP BY title;

/*QUESTION 43 - It will be nice to see the title of the movie and the language it is in.*/
SELECT title, name AS movie_language
FROM film
JOIN language AS lan ON lan.language_id = film.language_id;

/*QUESTION 44 - Get a count of the number of films by language*/
SELECT COUNT(title), name AS language
FROM film
JOIN language AS lan ON lan.language_id = film.language_id;

/*QUESTION 45 - How many DISTINCT cities from each country are represented in the data base?*/
SELECT country, COUNT(DISTINCT(city))
FROM country
JOIN city ON country.country_id = city.country_id
GROUP BY country;

/*QUESTION 46 - What if we have a film in our film data base, where no stores have it in inventory (out of stock movie titles!!)?*/
SELECT title, film.film_id, inventory_id
FROM film
LEFT OUTER JOIN inventory ON film.film_id = inventory.film_id
WHERE inventory.inventory_id IS NULL
ORDER BY title;

/*QUESTION 47 - Etract the day from the field payment_date. Figure out the total expenditure amount by month*/
SELECT SUM(amount), extract(month from payment_date) AS Month
FROM payment
GROUP BY Month
HAVING SUM(amount)>0
ORDER BY SUM(amount);

/*QUESTION 48 - Figure out which month grossed the highest revenue.*/
SELECT SUM(amount) AS Total, extract(month from payment_date) AS Month
FROM payment
GROUP BY Month
ORDER BY Total DESC 
LIMIT 1;

/*QUESTION 49 - Get the first and last name of customers into a single field called customer_name*/
SELECT first_name ||' '|| last_name AS full_name
FROM customer;

/*QUESTION 50 - FIND THE FILMS WHOSE RENTAL RATES ARE HIGHER THAN THE AVERAGE RENTAL RATES*/
SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) AS average_rental_rate FROM film);

/*QUESTION 51 - Get the films returned between two specific dates – May 29th, 2005 and May 30th, 2005*/
SELECT film_id
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30';

/*QUESTION 52 - Now, we not only want the film Ids but also the movie titles!*/
SELECT title, film_id
FROM film
WHERE film_id IN (SELECT film_id
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');









