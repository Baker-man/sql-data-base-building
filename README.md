# sql-data-base-building

🎯OBJETIVOS

1) Crear un repo nuevo con files src, img, data, Readme.md y gitignore.

2) Issue con el link pegado de nuestro Repo

3) Limpieza de los datasets actor, category, film, inventory, language, old_HDD y rental:  

4) Construir base de datos con su esquema y relaciones entre tablas. 

5) Cargar datos limpios en la nueva base de datos.

6) Hacer 6 queries sobre la base de datos.

------------------------------------------

📋PASOS SEGUIDOS

1) Cargar los dataframe en Jupyter y limpiarlos con Pandas.
   
   Sin entrar a especificar cada columna, se ha procedido al borrado de la columna "last_update" en todos los dataframes en los que estuviera presente por la irrelevancia que presentaban sus valores (un valor único). También se han capitalizado todas las columnas de tipo string y se ha reducido el espacio en memoria mediante un downcast a las columnas tipo integer y float.
  
 a) Tabla actor: se ha creado una nueva columna "full_name" concatenando las columnas "first_name" y "last_name".
 b) Tabla category: 
 c) Tabla film
 d) Tabla inventory
 e) Tabla language
 f) Tabla old_HDD
 g) Tabla rental
