#Desafio 2
#Ejercicio 1

/*2. Luego, debes mostrar todo el contenido de 
la tabla TOP_SPOTIFY importada en el paso anterior*/

use bonus_track;
SELECT * FROM top_spotify;

/*3. En el resultado de la consulta, sólo se deben observar 
las columnas ARTISTA, TÍTULO y GÉNERO.*/

SELECT ARTISTA, TITULO, GENERO FROM top_spotify;

/*4. Ordenar alfabéticamente el resultado de la consulta 
según los géneros musicales.*/

SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY GENERO;

/*
5. En el caso de aquellos géneros que se repiten, ordenar 
alfabéticamente los nombres de los artistas.*/

SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY GENERO, ARTISTA;

/*Ejercicio 2

1. En base al ejercicio anterior, mostrar todos 
los registros de la tabla TOP_SPOTIFY. En 
el resultado, sólo se deben observar las 
columnas ARTISTA, TÍTULO y GÉNERO. 
Ordenar el resultado alfabéticamente según 
los nombres de los artistas y el nombre de 
las canciones. Mostrar únicamente las 10 
primeras canciones.
*/

SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY ARTISTA, TITULO LIMIT 10;

/*2. Modificar la consulta anterior para mostrar 
únicamente las canciones ubicadas desde 
la posición 11 hasta la 15 inclusive.
*/

SELECT ARTISTA, TITULO, GENERO FROM top_spotify ORDER BY ARTISTA, TITULO LIMIT 5 OFFSET 11;

/*3. Dada la tabla TOP_SPOTIFY, obtener una 
lista de todas aquellas canciones pertenecientes a la cantante Madonna. Debes mostrar 
todos los campos de la tabla en el resultado 
de la consulta.
*/

SELECT * FROM top_spotify WHERE ARTISTA = 'Madonna';

/*4. A partir de la tabla TOP_SPOTIFY, obtener 
una lista de todas aquellas canciones pertenecientes al género Pop. Mostrar todos los 
campos de la tabla en el resultado de la 
consulta y ordenar alfabéticamente el 
resultado según el nombre de las canciones.*/


SELECT * FROM top_spotify WHERE GENERO = 'Pop' ORDER BY TITULO;

/*5. De la tabla TOP_SPOTIFY, obtener una lista 
de todas las canciones pertenecientes al 
género Pop lanzadas durante el año 2015. 
Mostrar todos los campos de la tabla en el 
resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de 
los artistas y los nombres de las canciones.*/

SELECT * FROM top_spotify WHERE GENERO = 'Pop' and ANO = 2015 ORDER BY ARTISTA, TITULO;

/*6. A partir de la tabla TOP_SPOTIFY, obtener 
una lista de todas aquellas canciones lanzadas antes del año 2011 y que pertenezcan al 
género Dance Pop. Mostrar todos los campos
de la tabla en el resultado de la consulta y 
ordenar dicho resultado alfabéticamente
según los nombres de las canciones.
*/

SELECT * FROM top_spotify WHERE GENERO = 'Dance Pop' and ANO < 2011 ORDER BY TITULO;

/*Ejercicio 3
2
1. Generar una lista que muestre todos los 
datos de los autores nacidos en la Ciudad 
de Buenos Aires. */

USE libreria;
SELECT * FROM autores WHERE ciudad = 'Buenos Aires';

/*2. Crear una lista que muestre todos los datos
de los libros con precio mayor a 30 dólares. 
Ordenar los precios de mayor a menor.
*/

SELECT * FROM libros WHERE precio > 30 ORDER BY precio DESC;

/*3. Crear una lista que muestre todos los datos
de los autores que no residen en la Provincia 
de Buenos Aires (BA). Ordenar las provincias 
resultantes alfabéticamente.*/

SELECT * FROM autores WHERE provincia <> 'BA' ORDER BY provincia;

/*4. Generar una lista que muestre todos los 
datos de los libros que pertenezcan a la 
categoría cuentos y cuyo precio sea inferior 
a 20 dólares. Ordenar alfabéticamente los 
títulos resultantes. 
*/

SELECT * FROM libros WHERE categoria = 'Cuentos' AND precio < 20 ORDER BY titulo;

/*5. Generar una lista que muestre todos los 
datos de los libros que pertenezcan a las 
categorías novelas o ensayos. Ordenar 
alfabéticamente los títulos de los libros 
obtenidos. */

SELECT * FROM libros WHERE categoria = 'Novelas' OR categoria = 'Ensayos' ORDER BY titulo;

/*6. Generar una lista que muestre todos los 
datos de los libros cuyo precio oscile entre 
20 y 35 dólares inclusive. Ordenar los precios 
resultantes de menor a mayor. 
*/

SELECT * FROM libros WHERE precio BETWEEN 20 AND 35 ORDER BY precio;

/*7. Crear una lista que muestre todos los datos 
de los autores cuyo nombre sea Jorge Luis, 
Victoria, Ernesto o Adolfo. Ordenar los 
resultados en orden alfabético. 
*/

SELECT * FROM autores WHERE nombre IN('Jorge Luis', 'Victoria', 'Ernesto', 'Adolfo') ORDER BY nombre;

/*8. Generar una lista que muestre todos los datos 
de los libros cuyo título contenga la palabra 
mundo. Ordenar los títulos alfabéticamente. 
*/

SELECT * FROM libros WHERE titulo LIKE "%mundo%" ORDER BY titulo;

/*9. Crear una lista que muestre todos los datos 
de los libros cuyo título contenga la 
preposición “de”. Ordenar alfabéticamente
los resultados.*/

SELECT * FROM libros WHERE titulo LIKE "%de %" ORDER BY titulo;

/*10. Generar una lista que muestre todos los datos 
de los libros que no tengan cargado su
precio. Luego, ordenar alfabéticamente los 
resultados. */

SELECT * FROM libros WHERE precio IS NULL ORDER BY titulo;