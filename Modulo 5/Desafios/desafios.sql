#Desafios

#Ejercicio 1

-- 1. Usando la tabla ÚLTIMOS LANZAMIENTOS, 
-- obtener una lista de todos aquellos temas
-- lanzados durante el último año (año más alto 
-- que figure en la tabla). En el resultado de la 
-- consulta, mostrar solo las columnas 
-- ARTISTA y TÍTULO. Ordenar alfabéticamente
-- el resultado por los nombres de los artistas; 
-- en el caso de que un mismo artista haya 
-- tenido más de un lanzamiento, organizar el 
-- resultado por los títulos de esos 
-- lanzamientos.

USE bonus_track;
SELECT artista, titulo FROM ultimos_lanzamientos
WHERE ANO = 
(SELECT MAX(ANO) FROM ultimos_lanzamientos)
ORDER BY artista, titulo;

-- 2. Utilizando la tabla TOP SPOTIFY, obtener una 
-- lista de todos aquellos lanzamientos correspondientes a LADY GAGA con mayor 
-- permanencia en la plataforma digital. En el 
-- resultado de la consulta, sólo mostrar los 
-- títulos de las canciones de la artista. Ordenar 
-- el resultado alfabéticamente por los títulos de 
-- las canciones.

SELECT titulo FROM TOP_SPOTIFY
WHERE artista = "Lady Gaga"
AND permanencia = 
(SELECT MAX(permanencia) FROM top_spotify)
ORDER BY titulo;

-- 3. Utiliza la tabla TOP SPOTIFY y genera una 
-- consulta que muestre los campos ARTISTA y 
-- TÍTULO. Agregar una columna con el nombre 
-- TIPO en la que se muestren los siguientes 
-- valores:
-- ● Pop si la canción pertenece a un género 
-- que contenga la palabra POP.
-- ● Electrónica si la canción pertenece a un 
-- género que contenga las palabras 
-- ELECTRO o HOUSE.
-- ● Otro si no se cumple ninguna de las 
-- condiciones anteriores.
-- Ordena el resultado alfabéticamente por 
-- nombres de los artistas. En el caso de que 
-- haya un artista con más de una canción en el 
-- listado, mostrar ordenados alfabéticamente 
-- los nombres de las canciones

SELECT artista, titulo, 
CASE WHEN genero LIKE "%Pop%" THEN "Pop"
WHEN genero LIKE "%Electro%" OR genero LIKE "%House%" THEN "Electrónica"
ELSE "Otro"
END AS tipo
FROM top_spotify
ORDER BY artista, titulo;

#Ejercicio 2

-- 1. Obtener una lista de todos aquellas canciones 
-- que contengan en su título la palabra BREAK. 
-- La lista resultante debe mostrar las canciones 
-- de las tablas TOP SPOTIFY y ÚLTIMOS 
-- LANZAMIENTOS. En el resultado de la 
-- consulta, mostrar todos los campos de 
-- ambas tablas. Ordenar alfabéticamente el 
-- resultado por los nombres de las canciones. 
-- Por último, agregar a la consulta una columna
-- con el nombre ESTADO en la que figure la 
-- palabra ANTERIOR para todos aquellos 
-- registros que provienen de la tabla TOP 
-- SPOTIFY y la palabra ÚLTIMO para todos 
-- aquellos que provienen de la tabla ÚLTIMOS 
-- LANZAMIENTOS.

SELECT *, "ANTERIOR" AS ESTADO FROM top_spotify
WHERE titulo LIKE "%BREAK%"
UNION
SELECT "ÚLTIMO" AS ESTADO FROM ultimos_lanzamientos
WHERE titulo LIKE "%BREAK%"
ORDER BY titulo;

#Ejercicio 3

USE libreria;

-- 1. Utilizando la tabla LIBROS, obtener una lista 
-- de todos aquellos productos cuyo precio 
-- supere al precio promedio de todos los 
-- libros. La lista debe contener todos los 
-- campos de la tabla. Ordenar el resultado 
-- alfabéticamente por los títulos de los libros.

SELECT * FROM libros 
WHERE precio >
(SELECT AVG(precio) FROM libros)
ORDER BY titulo;

-- 2. Dada la tabla LIBROS, extraer una lista de 
-- todos aquellos libros pertenecientes a la 
-- categoría NOVELAS cuyo precio sea superior 
-- al libro más caro de la categoría ENSAYOS. 
-- La lista debe contener todos los campos de la 
-- tabla. Mostrar el resultado de la consulta 
-- ordenado de mayor a menor por los precios 
-- de los libros obtenidos.

SELECT * FROM libros
WHERE precio > 
(SELECT MAX(precio) FROM libros
WHERE categoria = "ENSAYOS")
AND categoria = "NOVELAS"
ORDER BY precio DESC;

-- 3. Utilizando la tabla EMPLEADOS, obtener una 
-- lista de todos aquellos empleados con mayor 
-- permanencia dentro de la empresa.

SELECT * FROM EMPLEADOS 
WHERE permanencia =
(SELECT MAX(permanencia) FROM EMPLEADOS);

-- 4. A partir de la tabla EMPLEADOS, extraer 
-- una lista de todos aquellos empleados con 
-- el puesto más alto.

SELECT * FROM EMPLEADOS 
WHERE puesto_id =
(SELECT MAX(puesto_id) FROM EMPLEADOS);

-- 5. Utilizando la tabla LIBROS, generar una 
-- consulta que muestre los campos LIBRO_ID, 
-- TÍTULO, CATEGORÍA y PRECIO_PÚBLICO. 
-- Agregar una columna con el nombre TIPO
-- en la que se muestren los siguientes valores:
-- ● Económico si el precio del libro es inferior 
-- a 15 dólares.
-- ● Regular si el precio del libro oscila entre 
-- 15 y 30 dólares.
-- ● Deluxe en el caso de que no se cumplan 
-- ninguna de las condiciones anteriores.
-- Ordenar alfabéticamente el resultado, por 
-- el título de los libros. No muestres en el 
-- resultado de la consulta aquellos libros que 
-- no tienen precio (falta de stock).

SELECT CASE
WHEN precio < 15 THEN "Económico"
WHEN precio BETWEEN 15 AND 30 THEN "Regular"
ELSE "Deluxe" END
AS TIPO,
libro_id, titulo, categoria, precio_publico
FROM libros
WHERE precio IS NOT NULL
ORDER BY titulo;

-- 6. Obtener una lista de todos los empleados
-- que ocupen o hayan ocupado el puesto 9. 
-- La lista debe mostrar los empleados que 
-- actualmente estén trabajando en la empresa 
-- y los que se hayan desvinculado; por lo tanto, 
-- la consulta se debe llevar a cabo en las tablas 
-- EMPLEADOS y EMPLEADOS ANTERIORES.
-- En el resultado de la consulta, sólo debes 
-- mostrar una columna (con el nombre 
-- EMPLEADO) en la que figuren el nombre 
-- y el apellido de los empleados, separando 
-- ambos datos por una coma y un espacio
-- (por ejemplo, GARCIA, MONICA). Por último, 
-- ordenar el resultado alfabéticamente.

SELECT CONCAT(nombre, ", ", apellido)
AS empleado FROM empleados
WHERE puesto_id = 9
UNION
SELECT CONCAT(nombre, ", ", apellido)
AS empleado FROM empleados_anteriores
WHERE puesto_id = 9 
ORDER BY empleado;

-- 7. Generar una consulta que muestre las 
-- siguientes columnas: LIBRO_ID, TÍTULO, 
-- PRECIO_PÚBLICO, LOCAL_ID, 
-- FACTURA_NRO y CANTIDAD. Estos 
-- campos se hallan en las tablas LIBROS
-- y VENTAS. Ordenar alfabéticamente el 
-- resultado, por los títulos de los libros.

SELECT libros.libro_id, titulo, precio_publico,
local_id, factura_nro, cantidad
FROM libros LEFT JOIN ventas
ON libros.libro_ID = ventas.libro_id
ORDER BY titulo;

-- 8. Modificar la consulta anterior para agregar 
-- una columna con el nombre TOTAL en la que 
-- se multipliquen los valores de las columnas 
-- PRECIO_PÚBLICO y CANTIDAD. Esta nueva 
-- columna debe mostrar como máximo sólo 2 
-- decimales.

SELECT libros.libro_id, titulo, precio_publico,
local_id, factura_nro, cantidad,
ROUND(precio_publico * cantidad,2) AS TOTAL
FROM libros LEFT JOIN ventas
ON libros.libro_ID = ventas.libro_id
ORDER BY titulo;

-- 9. Crear una consulta en la que se muestren sólo 
-- los títulos de aquellos libros que nunca 
-- hayan sido vendidos. Ordenar el resultado 
-- alfabéticamente.


SELECT * FROM libros LEFT JOIN ventas
ON libros.libro_id = ventas.libro_id
WHERE ventas.cantidad IS NULL
ORDER BY libros.titulo;