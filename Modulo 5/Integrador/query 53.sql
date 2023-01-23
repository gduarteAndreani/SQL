#Integrador

USE laboratorio;

#Etapa 5.3

-- 1. Obtener una lista de todos aquellos bebés 
-- nacidos con menos de 20 semanas de 
-- gestación. La lista mostrará los bebés de 
-- cualquier sexo, por lo tanto, la consulta se 
-- debe llevar a cabo en las tablas VARONES, 
-- MUJERES e INDETERMINADOS.


SELECT * FROM varones WHERE varones.semanas < 20
UNION
SELECT * FROM mujeres WHERE mujeres.semanas < 20
UNION
SELECT * FROM indeterminados WHERE indeterminados.semanas < 20;

-- 2. Luego, obtener una lista de todos aquellos 
-- bebés nacidos durante el mes de septiembre, 
-- con más de 40 semanas de gestación y 
-- nacidos de madres chilenas casadas. 
-- La lista debe mostrar los bebés de cualquier 
-- sexo, por lo tanto, debe llevar adelante la 
-- consulta en las tablas VARONES, MUJERES
-- e INDETERMINADOS.

SELECT * FROM varones WHERE semanas > 40 AND 
SUBSTRING(fecha, 4, 2) = '09' AND
nacionalidad = 'chilena'
UNION
SELECT * FROM mujeres WHERE semanas > 40 AND 
SUBSTRING(fecha, 4, 2) = '09' AND
nacionalidad = 'chilena'
UNION
SELECT * FROM indeterminados WHERE semanas > 40 AND 
SUBSTRING(fecha, 4, 2) = '09' AND
nacionalidad = 'chilena';

-- 3. Obtener una lista de todos aquellos 
-- productos (a la venta y suspendidos) cuyo 
-- precio supere los 80 dólares. La búsqueda se 
-- debe llevar a cabo en las tablas 
-- PRODUCTOS_NEPTUNO
-- y PRODUCTOS_SUSPENDIDOS. Después, 
-- ordenar el resultado alfabéticamente según 
-- los nombres de los productos.

SELECT * FROM productos_neptuno WHERE PrecioUnidad > 80
UNION
SELECT * FROM PRODUCTOS_SUSPENDIDOS WHERE PrecioUnidad > 80
ORDER BY NombreProducto;

-- 4. Modificar la consulta anterior y agregar una 
-- columna con el nombre CONDICIÓN en la 
-- que se muestre el texto “A LA VENTA” en el 
-- caso de que el registro provenga de la tabla 
-- PRODUCTOS_NEPTUNO; o que se muestre 
-- el texto SUSPENDIDO si el registro proviene 
-- de la tabla PRODUCTOS_SUSPENDIDOS.

SELECT *, "A LA VENTA" AS Condición FROM productos_neptuno WHERE PrecioUnidad > 80
UNION
SELECT *, "SUSPENDIDO" AS Condición FROM PRODUCTOS_SUSPENDIDOS WHERE PrecioUnidad > 80
ORDER BY NombreProducto;


-- 5. Generar una lista de todos los productos 
-- que pertenezcan a la categoría BEBIDAS, 
-- sin importar si los mismos se encuentran a 
-- la venta o suspendidos (la búsqueda se debe 
-- hacer en las tablas PRODUCTOS_NEPTUNO
-- y la tabla PRODUCTOS_SUSPENDIDOS). 
-- Luego, ordenar la lista alfabéticamente
-- según los nombres de los productos.

SELECT *, "A LA VENTA" AS Condición FROM productos_neptuno WHERE NombreCategoria = "BEBIDAS"
UNION
SELECT *, "SUSPENDIDO" AS Condición FROM PRODUCTOS_SUSPENDIDOS WHERE NombreCategoria = "BEBIDAS"
ORDER BY NombreProducto;

-- 6. Duplicar el producto cuyo ID es el número 
-- 43 de la tabla PRODUCTOS_NEPTUNO en 
-- la tabla PRODUCTOS_SUSPENDIDOS a 
-- través de una consulta de datos anexados.

INSERT INTO productos_suspendidos 
(IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD, 
SUSPENDIDO, IDPROVEEDOR)
SELECT  IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, 
PRECIOUNIDAD, SUSPENDIDO, IDPROVEEDOR
FROM productos_neptuno WHERE
IdProducto = 43;

-- 7. Repetir la consulta generada en el paso 5
-- (cinco) para observar que la cantidad de 
-- productos obtenida siga siendo la misma.

SELECT *, "A LA VENTA" AS Condición FROM productos_neptuno WHERE NombreCategoria = "BEBIDAS"
UNION
SELECT *, "SUSPENDIDO" AS Condición FROM PRODUCTOS_SUSPENDIDOS WHERE NombreCategoria = "BEBIDAS"
ORDER BY NombreProducto;

-- 8. Modificar la consulta del paso 5 (cinco) para 
-- mostrar el producto duplicado.

SELECT *, "A LA VENTA" AS Condición FROM productos_neptuno WHERE NombreCategoria = "BEBIDAS"
UNION ALL
SELECT *, "SUSPENDIDO" AS Condición FROM PRODUCTOS_SUSPENDIDOS WHERE NombreCategoria = "BEBIDAS"
ORDER BY NombreProducto;

-- 9. Eliminar el producto cuyo ID es el número 43
-- de la tabla PRODUCTOS_SUSPENDIDOS.

DELETE FROM productos_suspendidos where
IdProducto = 43;
