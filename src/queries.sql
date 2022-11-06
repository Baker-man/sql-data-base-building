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

-- 7.


-- 8.


-- 9.


-- 10.