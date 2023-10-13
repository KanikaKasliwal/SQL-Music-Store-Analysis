Q1 Who is the senior most employee based on job Title

SELECT * FROM employee
ORDER BY levels desc
LIMIT 1

Q2 Which country have the most invoices?

SELECT COUNT(*) as c , billing_country
FROM invoice
GROUP BY billing_country
ORDER BY c desc

Q3 What are top 3 values of total invoice

SELECT total FROM invoice
ORDER BY total desc
LIMIT 3

Q4 Which city has the best customers? We would like to throw a promotional music festival in the city we made the most money. Write a query that
returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals

SELECT sum(total) as invoice_total, billing_city
FROM invoice
GROUP BY billing_city
ORDER BY invoice_total desc

Q5 Who is the best customer? The customer who has spend the most money will be declared the best customer. Write a query that returns the person who
has spend the most money

Select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
From customer
JOIN invoice ON customer.customer_id = invoice.customer_id
Group by customer.customer_id
ORDER BY total desc
LIMIT 1

Q6 Write a query to return the email, first name, last name & Genre of all rock music listners. Return your list ordered alphabatically by e-mail
starting with A.

SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
       SELECT track_id from track
       JOIN genre ON track.genre_id = genre.genre_id
       WHERE genre .name LIKE "ROCK"
)
ORDER BY email;












