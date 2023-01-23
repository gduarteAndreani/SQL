#DESAFIOS 

-- Ejercicio 1

USE bonus_track;

-- 1. Generar una lista en la que se muestren todos 
-- los artistas y las canciones de la tabla TOP 
-- SPOTIFY. El nombre de cada artista y el título 
-- de la canción deben mostrarse separados con 
-- un guión, en una columna llamada CANCIÓN. 
-- Utilizar la función CONCAT para llevar a cabo 
-- este ejercicio. Ordenar la lista resultante de
-- forma alfabética, por la columna CANCIÓN. 
-- Esta consulta, además, debe mostrar el 
-- campo GENERO.

SELECT CONCAT(artista, ' - ', titulo) AS CANCIÓN, GENERO FROM top_spotify ORDER BY CANCIÓN;

-- 2. Modificar la consulta anterior para obtener el 
-- mismo resultado con la función
-- CONCAT_WS.

SELECT CONCAT_WS(' - ', artista, titulo) AS CANCIÓN, GENERO FROM top_spotify ORDER BY CANCIÓN;

-- 3. Modificar la consulta anterior para mostrar 
-- los géneros en mayúsculas.

SELECT CONCAT_WS(' - ', artista, titulo) AS CANCIÓN, UPPER(GENERO) FROM top_spotify ORDER BY CANCIÓN;

-- 4. Agregar a la consulta anterior una columna
-- con el nombre AÑOS en la que se calcule la 
-- cantidad de años transcurridos desde que 
-- se lanzó cada una de las canciones al
-- año actual.

SELECT CONCAT_WS(' - ', artista, titulo) AS CANCIÓN, 
UPPER(GENERO) AS GENERO,
YEAR(CURDATE()) - ANO AS AÑOS
FROM top_spotify ORDER BY CANCIÓN;

-- 5. Generar una consulta que calcule la cantidad 
-- de registros que figuran en la tabla TOP 
-- SPOTIFY. El resultado debe mostrarse en 
-- una columna con el nombre CANCIONES.

SELECT COUNT(*) AS CANCIONES FROM top_spotify;

-- 6. Generar una consulta que muestre la cantidad de 
-- canciones lanzadas al mercado por año.

SELECT ANO, COUNT(*) AS CANCIONES FROM top_spotify GROUP BY ANO;

-- 7. Modificar la consulta anterior para no mostrar 
-- aquellos años en los que se hayan lanzado menos 
-- de 50 canciones

SELECT ANO, COUNT(*) AS CANCIONES FROM top_spotify GROUP BY ANO HAVING CANCIONES >= 50;

-- Ejercicio 2

-- 1. Utilizar la base de datos LIBRERIA y generar 
-- una lista en la que se muestren todos los 
-- autores y la provincia en la que nacieron. 
-- El apellido y el nombre de cada autor deben 
-- mostrarse separados con una coma y un 
-- espacio en una columna llamada AUTOR. 
-- Utilizar la función CONCAT para llevar a cabo 
-- este ejercicio. Ordenar alfabéticamente los 
-- apellidos resultantes. 

use libreria;
SELECT CONCAT(apellido, ", ", nombre) AS AUTOR FROM autores ORDER BY apellido;



-- 2. Modificar la consulta anterior para obtener el 
-- mismo resultado con la función 
-- CONCAT_WS.

SELECT CONCAT_WS( ", ", apellido, nombre) AS AUTOR FROM autores ORDER BY apellido;

-- 3. Modificar la consulta anterior para mostrar 
-- los nombres de los autores en mayúsculas.

SELECT CONCAT_WS( ", ", UPPER(apellido), nombre) AS AUTOR FROM autores ORDER BY apellido;

-- 4. Modificar la consulta anterior para mostrar 
-- únicamente la inicial del nombre del autor 
-- y su apellido.

SELECT CONCAT_WS( ", ", UPPER(apellido), LEFT(nombre, 1)) AS AUTOR FROM autores ORDER BY apellido;

-- 5. Generar una columna con el nombre INGRESO en la 
-- que se muestren todos los empleados y el año en el 
-- que ingresaron a trabajar a la empresa. El apellido y el 
-- nombre de cada empleado deben mostrarse separados 
-- con una coma y un espacio en una columna con el 
-- nombre EMPLEADO. Utilizar la función CONCAT para 
-- llevar a cabo este ejercicio. Ordenar el resultado de la 
-- consulta de mayor a menor según los años de ingreso 
-- de cada empleado

SELECT CONCAT(apellido, ", ", nombre) AS EMPLEADO, 
YEAR(fecha_ingreso) AS INGRESO
FROM empleados ORDER BY INGRESO DESC;

-- Ejercicio 3

-- 1. Modificar la consulta anterior para agregar 
-- una columna con el nombre ANTIGÜEDAD. 
-- Esta deberá calcular la cantidad de años de 
-- antigüedad de cada empleado dentro de la 
-- empresa al día de hoy.

SELECT CONCAT(apellido, ", ", nombre) AS EMPLEADO, 
YEAR(fecha_ingreso) AS INGRESO
FROM empleados ORDER BY INGRESO DESC;

-- 2. Generar una consulta que permita obtener 
-- el precio más bajo de la tabla LIBROS. El 
-- resultado se debe mostrar en una columna 
-- con el nombre MENOR PRECIO.

SELECT MIN(precio) AS MENORPRECIO FROM libros;

-- 3. Modificar la consulta anterior para agregar 
-- una columna que calcule el precio más alto
-- de la tabla LIBROS. Mostrar el resultado en 
-- una columna con el nombre MAYOR PRECIO.

SELECT MIN(precio) AS MENORPRECIO, MAX(precio) AS MAYORPRECIO FROM libros;

-- 4. Modificar la consulta anterior para agregar 
-- una columna que calcule el precio promedio
-- de todos los libros. Mostrar el resultado en 
-- una columna con el nombre PRECIO 
-- PROMEDIO. El promedio resultante debe 
-- mostrar 2 decimales como máximo.

SELECT MIN(precio) AS MENORPRECIO, 
MAX(precio) AS MAYORPRECIO,
ROUND(AVG(precio), 2) AS PRECIOPROMEDIO
FROM libros;

-- 5. Generar una consulta que permita obtener el precio 
-- más bajo, el más alto y el promedio de los libros 
-- pertenecientes a cada categoría.

SELECT 
categoria,
MIN(precio) AS MENORPRECIO, 
MAX(precio) AS MAYORPRECIO,
ROUND(AVG(precio), 2) AS PRECIOPROMEDIO
FROM libros
GROUP BY categoria;

-- 6. Modificar la consulta anterior para no mostrar la 
-- categoría “SIN ASIGNAR”

SELECT 
categoria,
MIN(precio) AS MENORPRECIO, 
MAX(precio) AS MAYORPRECIO,
ROUND(AVG(precio), 2) AS PRECIOPROMEDIO
FROM libros
WHERE categoria <> "Sin asignar"
GROUP BY categoria;
