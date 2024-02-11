-- Write query to return the email, first name, last name and genre of all rock music listners. 
-- Return your list ordered alphabetically by email starting with A
SELECT DISTINCT email, first_name, last_name
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id in
(
SELECT track_id FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name LIKE 'Rock'
)
order by email;

-- Let's invite the artists who have written the most rock music in our dataset.
-- Write a query that returns the artist name an total track count of the top 10 rock bands
SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS no_of_song
FROM artist
JOIN album2 ON artist.artist_id = album2.album_id
JOIN track ON album2.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
where genre.name LIKE 'Rock'
GROUP BY artist.artist_id, artist.name
ORDER BY no_of_song DESC
LIMIT 10;

-- Return all the track names that have a song length longer than the average song length.
-- Return the name and miliseconds for each track
-- Order by the song length with the longest songs listed first
SELECT name, milliseconds
FROM music_database.track
WHERE milliseconds > (
select avg(milliseconds) AS avg_track_songs
FROM track)
group by name, milliseconds
order by milliseconds DESC;