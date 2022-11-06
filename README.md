# sql-data-base-building

![cinema](https://user-images.githubusercontent.com/112175733/200187492-bac1155f-ab85-4e2f-aeb9-dda7f223aaeb.jpg)


🎯 OBJETIVOS

1) Crear un repo nuevo con files src, img, data, Readme.md y gitignore.

2) Issue con el link pegado de nuestro Repo

3) Limpieza de los datasets actor, category, film, inventory, language, old_HDD y rental:  

4) Construir base de datos con su esquema y relaciones entre tablas. 

5) Cargar datos limpios en la nueva base de datos.

6) Hacer 6 queries sobre la base de datos.

------------------------------------------

📋 PASOS SEGUIDOS

1) Cargar los dataframe en Jupyter y limpiarlos con Pandas.
   
   Sin entrar a especificar cada columna, se ha procedido al borrado de la columna "last_update" en todos los dataframes en los que estuviera presente por la irrelevancia que presentaban sus valores (un valor único). También se han capitalizado todas las columnas de tipo string y se ha reducido el espacio en memoria mediante un downcast a las columnas tipo integer y float.
   A continuación, algunas acciones adicionales llevadas a cabo en alguna de las tablas:
  
 a) Tabla actor: se ha creado una nueva columna "full_name" concatenando las columnas "first_name" y "last_name".
 
 b) Tabla category  
 
 c) Tabla film: se ha borrado la columnas release_year porque sólo había un valor único (2006) y se ha considerado irrelevante para el motivo de análisis, así como la columna original_language_id por ser todo valores nulos.
 
 d) Tabla inventory
 
 e) Tabla language
 
 f) Tabla old_HDD: se han creado tres nuevas columnas:
 
      - "full_name" concatenando nombres y apellidos
      - "film_id" en base al film_id del dataframe film
      - "actor_id" en base al actor_id del dataframe actor
 
 g) Tabla rental: se han convertido a tipo fecha las columnas rental_date y return_date
 
 
 Tras el limpiado de los dataframes, se ha exportado cada uno a un csv nuevo para contar con ellos en caso necesario.
 
2) Creación de la base de datos "cinema".
 
 a) Mediante mysql.connector se ha creado una conexión al servidor de MySQL y se ha creado la bbdd "cinema".
 
 b) Desde Workbench se ha diseñado el esquema y las relaciones entre tablas:
  
 ![db_schema](https://user-images.githubusercontent.com/112175733/200187214-eb550106-8360-4746-9739-79d9131127ab.png)
 
 

3) Carga de datos sobre "cinema"
 
 Dado que se ha diseñado primero el esquema antes de cargar los datos, se ha tenido que llevar un orden específico a la hora de cargarlos para que no hubiera fallos. Primero se han cargado las tablas que alimenten a otras tablas con alguna foreign key, pero que no son alimentadas por otras.
 
 El orden de carga ha sido el siguiente (mediante sqlalchemy y pandas):
 
 a) Actor
 
 b) Category
 
 c) Language
 
 d) Film
 
 e) Inventory
 
 f) Rental
 
 g) Old_HDD
 
 Durante la carga de datos se descubrieron algunos pequeños conflictos, como que el nombre de alguna columna se había generado distinto o la pérdida de la foreign key inventory de rental. Ambos contratiempos se solucionaron mediante AlterTable para cambiar el nombre de la columna y synchronize model para recuperar la fk.
 
 
-----------------------------------------------------

💹 QUERIES

1) Títulos de películas con su id de categoría y actores
2) Actores que más películas han hecho
3) Películas con más actores
4) Actores que actúan en las películas con más actores:
5) Las categorías más populares
6) Actores más populares por categoría
7) Ranking de los mejores musicales (según las tarifas de alquiler)
8) Películas con behind the scenes
9) Clasificación de películas según su tarifa de alquiler
10) Películas de Grace Mostel que duran más de 2 horas.


