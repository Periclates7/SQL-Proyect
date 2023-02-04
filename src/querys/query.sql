{\rtf1\ansi\ansicpg1252\cocoartf2580
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 1 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobaci\'f3n de que la base de datos est\'e1 correctamente relacionada:\
\
\
USE videoclub;\
\
SELECT *\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id;\
\
\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 2 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobamos la relaci\'f3n de actores:\
\
SELECT  a.actor_id as 'ACTOR ID',\
		a.first_name AS 'FIRST NAME',\
		a.last_name AS 'LAST NAME'\
       \
FROM actor as a;\
\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 3 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobamos la relaci\'f3n de actores ordenados alfab\'e9ticamente por el apellido:\
\
SELECT  a.actor_id as 'ACTOR ID',\
		a.first_name AS 'FIRST NAME',\
		a.last_name AS 'LAST NAME'\
       \
FROM actor as a\
ORDER BY a.last_name ASC;\
\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 4 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobamos la filmograf\'eda de la actriz Penelope Guiness:\
\
SELECT  a.nombre_completo as 'Name',\
		f.title as 'Title',\
		f.description as 'Sinopsis',\
        l.idiom as 'Language'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN `language` as l\
ON f.language_id = l.language_id\
\
WHERE a.nombre_completo = 'PENELOPE GUINESS';\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 5 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobamos cuantas veces ha hecho cada pel\'edcula:\
\
SELECT  a.nombre_completo as 'Name',\
		f.title as 'Title',\
		f.description as 'Sinopsis',\
       		l.idiom as 'Language',\
        		COUNT(f.title)\
\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN `language` as l\
ON f.language_id = l.language_id\
\
WHERE a.nombre_completo = 'PENELOPE GUINESS'\
\
GROUP BY a.nombre_completo, f.title, f.description, l.idiom\
;\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 6 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Comprobamos el n\'famero de pel\'edculas que ha realizado la actriz:\
\
SELECT  a.nombre_completo as 'Name',\
        COUNT(f.title) as 'Number of works'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN `language` as l\
ON f.language_id = l.language_id\
\
WHERE a.nombre_completo = 'PENELOPE GUINESS'\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 7 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Relaci\'f3n de categor\'edas m\'e1s asociadas a pel\'edculas ordenadas de mayor a menor:\
\
SELECT  f.categoria as 'Category',\
        COUNT(f.categoria) as 'Number of titles'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN language as l\
ON f.language_id = l.language_id\
\
WHERE f.categoria IS NOT NULL\
GROUP BY f.categoria\
ORDER BY COUNT(f.categoria) DESC\
;\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 8 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Relaci\'f3n de actores que m\'e1s pel\'edculas han hecho ordenadas de mayor a menor:\
\
SELECT  a.nombre_completo as 'Name',\
        COUNT(f.title) as 'Number of titles'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN language as l\
ON f.language_id = l.language_id\
\
WHERE a.nombre_completo IS NOT NULL\
GROUP BY a.nombre_completo\
ORDER BY COUNT(f.title) DESC\
;\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 9 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Relaci\'f3n de las tres pel\'edculas m\'e1s alquiladas:\
\
SELECT  f.title as 'Title',\
        COUNT(i.inventory_id) as 'Number of rents'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN language as l\
ON f.language_id = l.language_id\
LEFT JOIN inventory as i\
ON f.film_id = i.film_id\
LEFT JOIN rental as r\
ON i.inventory_id = r.inventory_id\
\
\
GROUP BY f.title\
ORDER BY COUNT(i.inventory_id) DESC\
LIMIT 3\
;\
\
\
\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97 QUERY 10 \'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\'97\
Similar a la anterior pero con relaci\'f3n a los actores/actrices:\
\
SELECT  f.title as 'Title',\
        a.nombre_completo as 'Name',\
        COUNT(i.inventory_id) as 'Number of rents'\
FROM film as f\
\
LEFT JOIN actor_film as af\
ON f.film_id = af.film_id\
LEFT JOIN actor as a\
ON a.actor_id = af.actor_id\
LEFT JOIN language as l\
ON f.language_id = l.language_id\
LEFT JOIN inventory as i\
ON f.film_id = i.film_id\
LEFT JOIN rental as r\
ON i.inventory_id = r.inventory_id\
\
\
GROUP BY f.title, a.nombre_completo\
ORDER BY COUNT(i.inventory_id) DESC\
LIMIT 3\
;}