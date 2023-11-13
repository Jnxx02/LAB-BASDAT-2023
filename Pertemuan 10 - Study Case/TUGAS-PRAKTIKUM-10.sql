USE sakila;

-- No 1
SELECT f.title 'Judul Film',
		GROUP_CONCAT(a.first_name, ' ', a.last_name 
		SEPARATOR ';') 'Nama Actor'
FROM film f
JOIN film_category fc
USING (film_id)
JOIN category c
USING (category_id)
JOIN film_actor fa
USING (film_id)
JOIN actor a
USING (actor_id)
WHERE c.name = 'Foreign' 
		AND f.rental_duration > 4
GROUP BY f.title;

-- No 2
SELECT
    CONCAT(a.first_name, ' ', a.last_name) 'Nama Actor',
    GROUP_CONCAT(f.title SEPARATOR ', ') 'Judul Film',
    ROUND(f.length / 60, 2) 'Durasi Film',
    COUNT(*) 'Jumlah Film'
FROM actor a
JOIN film_actor fa 
USING (actor_id)
JOIN film f 
USING (film_id)
WHERE ROUND(f.length / 60, 2) >= 3 AND 
		(a.first_name IN ('Johnny', 'Tom') 
		OR a.last_name IN ('Depp', 'Hanks'))
GROUP BY `Nama Actor`
ORDER BY `Jumlah Film` DESC
LIMIT 1;

-- No 3
SELECT 
		GROUP_CONCAT(f.title) 'Judul Film',
		c.name 'Genre',
		ROUND(SUM(f.rental_duration) / 60, 2) 'Total Durasi Rental',
		CASE
			WHEN
				SUM(f.rental_duration) % 2 = 1 AND 
				SUM(f.rental_duration) > (
					SELECT AVG(`Total`)
					FROM (SELECT SUM(f2.rental_duration) 'Total'
						FROM film f2
						JOIN film_category fc
						USING (film_id)
						JOIN category c
						USING (category_id)
						GROUP BY c.category_id) AS a
				) THEN 'Unggulan 1'
			WHEN
				SUM(f.rental_duration) % 2 = 0 AND 
				SUM(f.rental_duration) > (
					SELECT AVG(`Total`)
					FROM (SELECT SUM(f2.rental_duration) 'Total'
						FROM film f2
						JOIN film_category fc
						USING (film_id)
						JOIN category c
						USING (category_id)
						GROUP BY c.category_id) AS a
				) THEN 'Unggulan 2'
		END 'Kriteria'
FROM film f
JOIN film_category fc
USING (film_id)
JOIN category c
USING (category_id)
GROUP BY c.category_id
HAVING `Kriteria` IS NOT NULL

UNION

SELECT 
		GROUP_CONCAT(f.title) 'Judul Film',
		c.name 'Genre',
		ROUND(SUM(f.rental_duration) / 60, 2) 'Total Durasi Rental',
		CASE
			WHEN
				f.description LIKE '%Epic%' AND 
				f.special_features LIKE '%Deleted scene%'
					THEN 'Spektakuler'
			WHEN
				f.description LIKE '%Touching%' AND 
				f.special_features LIKE '%Deleted scene%' 
					THEN 'Dramatis'
		END 'Kriteria'
FROM film f
JOIN film_category fc
USING (film_id)
JOIN category c
USING (category_id)
GROUP BY c.category_id
HAVING `Kriteria` IS NOT NULL;