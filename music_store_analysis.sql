-- Who is the senior most employee based on the job tite? --
SELECT * FROM music_database.employee order by levels DESC LIMIT 1;
# Adams Andrew

-- Which country has the most invoices? --
SELECT count(*) AS no_of_invoices, billing_country 
FROM music_database.invoice 
group by billing_country 
order by no_of_invoices DESC;
#USA

-- Which is the top 3 values of total invoice? --
SELECT *
FROM music_database.invoice
order by total DESC
LIMIT 3;

-- Which city has the best customers? 
-- We would like to throw a promotion musicFestival in the city we made the most money. Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoices totals. 
SELECT billing_city, SUM(total) AS invoice_total
FROM music_database.invoice
group by billing_city
order by invoice_total desc
LIMIT 1;
#Prague

-- Who is the best customer? 
-- The customer who has spent the most money will be declared the best customer. 
-- Write a querythet return the person who has spent the most money
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total 
FROM customer JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC
LIMIT 1;