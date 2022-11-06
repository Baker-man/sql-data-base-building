-- 1. Títulos de películas con su id de categoría y actores
create temporary table title_actor
select f.film_id, f.title, hdd.category_id, full_name, actor_id
from film as f
left join old_hdd as hdd
on f.film_id=hdd.film_id
group by f.title, full_name
order by count(full_name) desc;


-- 2. Actores que más películas han hecho
create temporary table hard_working_actors
select a.full_name, count(title)
from actor as a
left join title_actor as ta
on a.actor_id=ta.actor_id
group by a.full_name
order by count(title) desc
limit 5;


-- 3. Películas con más actores
create temporary table crowded_films
select f.title, count(full_name)
from film as f
left join title_actor as ta
on f.film_id=ta.film_id
group by f.title
order by count(full_name) desc
limit 5;


-- 4. Actores que actúan en las películas con más actores:
create temporary table actors_in_crowded_films
select f.title, count(full_name), group_concat(full_name) as cast
from film as f
left join title_actor as ta
on f.film_id=ta.film_id
group by f.title
order by count(full_name) desc
limit 5;


-- 5. Las categorías más populares
select name, count(title)
from category as c
left join title_actor as ta
on c.category_id=ta.category_id
group by name
order by count(title) desc
limit 5;


-- 6. Actores más populares por categoría
select actors_full_name, titles_number, group_concat(c.name) as catgry
from (select a.full_name as actors_full_name, count(title) as titles_number, a.actor_id, category_id
		from actor as a
		left join title_actor as ta
		on a.actor_id=ta.actor_id
		group by a.full_name
		order by count(title) desc
		limit 10) as afac
left join category as c
on afac.category_id=c.category_id
group by actors_full_name
order by titles_number desc
limit 10;

-- 7. Ranking de los mejores musicales (según las tarifas de alquiler)
select f.title as film, c.name as category, f.rental_rate
from film as f
inner join old_HDD as hdd
on f.film_id = hdd.film_id
inner join category as c
on hdd.category_id = c.category_id
where c.name = 'music'
group by f.title
order by rental_rate desc;

-- 8. Películas con behind the scenes
select f.title, f.special_features as sf
from film as f
inner join old_HDD as hdd
on f.film_id = hdd.film_id
where f.special_features like 'behind the scenes'
group by f.title

-- 9. Clasificación de películas según su tarifa de alquiler
select f.title, f.rental_rate,
case 
 when f.rental_rate >= 3 then 'expensive'
 when f.rental_rate < 3 then 'affordable'
end as film_score
from film as f;

-- 10. Películas de Grace Mostel que duran más de 2 horas.
select f.title, f.length
from film as f
inner join old_HDD as hdd
on f.film_id = hdd.film_id
inner join actor as a
on hdd.actor_id = a.actor_id
where a.full_name = 'Grace Mostel' and f.length > 120;
