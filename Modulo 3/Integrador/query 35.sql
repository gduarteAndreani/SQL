#Etapa 3.5

USE laboratorio;

-- 1. Calcular la cantidad de registros cargados en 
-- la tabla PEDIDOS_NEPTUNO.

SELECT COUNT(*) FROM pedidos_neptuno;

-- 2. Calcular la cantidad de pedidos cargados en 
-- la tabla PEDIDOS_NEPTUNO que hayan sido 
-- entregados por el transportista con el nombre 
-- SPEEDY EXPRESS. La columna en la que se 
-- obtiene el resultado debe mostrarse con el 
-- nombre ENTREGAS SPEEDY EXPRESS

SELECT COUNT(*) AS ENTREGSSPEEDYEXPRESS FROM pedidos_neptuno WHERE Transportista = "Speedy Express"; 

-- 3. Calcular la cantidad de pedidos cargados en 
-- la tabla PEDIDOS_NEPTUNO que hayan sido 
-- atendidos por empleados cuyo apellido 
-- comience con la letra C. La columna en la 
-- que se obtiene el resultado debe mostrarse 
-- con el nombre VENTAS.

SELECT COUNT(*) AS VENTAS FROM pedidos_neptuno WHERE Empleado LIKE "C%";

-- 4. Calcular el precio promedio de todos los 
-- productos cargados en la tabla llamada 
-- PRODUCTOS_NEPTUNO. La columna del 
-- resultado, debe mostrarse con el nombre 
-- PRECIO PROMEDIO. El resultado debe 
-- mostrar, como máximo, sólo 2 decimales.

SELECT ROUND(AVG(precioUnidad),2) AS PRECIOPROMEDIO FROM productos_neptuno;

-- 5. Modificar la consulta anterior para obtener el 
-- precio más bajo de la tabla. La columna en 
-- la que se obtiene el resultado debe mostrarse 
-- con el nombre PRECIO INFERIOR.

SELECT MIN(precioUnidad) AS PRECIOINFERIOR FROM productos_neptuno;

-- 6. Modificar la consulta anterior para obtener 
-- el precio más alto de la tabla. La nueva 
-- columna debe mostrarse con el nombre 
-- PRECIO MAXIMO.

SELECT MAX(precioUnidad) AS PRECIOMAXIMO FROM productos_neptuno;

-- 7. Generar una consulta en base a la tabla 
-- PRODUCTOS_NEPTUNO que muestre el 
-- precio más alto correspondiente a cada 
-- categoría. La columna en la que se obtiene 
-- dicho precio debe mostrarse con el nombre 
-- PRECIO MAXIMO. La columna que muestra 
-- las categorías debe mostrarse con el nombre 
-- CATEGORIA.

SELECT NombreCategoria AS CATEGORIA, MAX(precioUnidad) AS PRECIOMAXIMO FROM productos_neptuno GROUP BY CATEGORIA;

-- 8. Calcular la cantidad de entregas efectuadas 
-- por cada transportista, utilizando la tabla 
-- PEDIDOS_NEPTUNO. La columna en la que 
-- se obtienen los resultados debe mostrarse con 
-- el nombre ENTREGAS

SELECT empleado, COUNT(*) AS ENTREGAS FROM pedidos_neptuno GROUP BY Empleado;

-- 9. Utilizar la tabla NACIMIENTOS y calcular la 
-- cantidad de nacimientos según el sexo de 
-- los bebés. La columna en la que se obtienen 
-- los resultados debe mostrarse con el nombre 
-- NACIMIENTOS.

SELECT SEXO, COUNT(*) AS NACIMIENTOS FROM nacimientos GROUP BY SEXO;

-- 10. Utilizando la tabla PEDIDOS_NEPTUNO, 
-- calcular el total de gastos por cliente. La 
-- columna en la que se obtienen los resultados 
-- debe mostrarse con el nombre TOTAL 
-- GASTOS y debe mostrar como máximo 2 
-- decimales. La columna en la que figuran los 
-- nombres de los clientes debe tener el título 
-- CLIENTE.

SELECT NombreCompania AS CLIENTE, ROUND(SUM(Cargo), 2) AS GASTOS FROM pedidos_neptuno GROUP BY NombreCompania;

-- 11. Utilizando la tabla PRODUCTOS, calcular la 
-- cantidad de productos pertenecientes a cada 
-- sección. La columna en la que se obtienen los 
-- resultados debe mostrarse con el nombre 
-- CANTIDAD. Ordenar la consulta de mayor 
-- a menor según los valores de la columna 
-- CANTIDAD.

SELECT seccion, COUNT(*) AS CANTIDAD FROM productos GROUP BY Seccion ORDER BY CANTIDAD;

-- 12. Utilizar la tabla PEDIDOS_NEPTUNO y 
-- calcular la cantidad de ventas efectuadas 
-- por mes y año. Las columnas deben 
-- mostrarse con los nombres AÑO, MES
-- y VENTAS respectivamente. Ordenar el 
-- resultado por año y mes, para obtener 
-- un listado cronológico de las ventas

SELECT MONTH(FechaPedido) AS MES, YEAR(FechaPedido) AS AÑO, SUM(Cargo) AS VENTAS 
FROM pedidos_neptuno GROUP BY MES ORDER BY AÑO, MES; 

-- 13. Utilizar la tabla PEDIDOS_NEPTUNO y 
-- calcular las siguientes estadísticas:
-- a. El total facturado por empleado.
-- b. El promedio de facturación por empleado.
-- c. La mejor venta efectuada por cada 
-- empleado.
-- d. La peor venta efectuada por cada 
-- empleado.
-- e. La cantidad de ventas efectuadas por 
-- cada empleado.
-- f. Tener en cuenta las siguientes especificaciones: las columnas deben recibir los 
-- nombres FACTURACION, PROMEDIO, 
-- MEJOR VENTA, PEOR VENTA y VENTAS. 
-- Las columnas llamadas FACTURACION y 
-- PROMEDIO deben mostrar, como máximo, 
-- 2 decimales.

SELECT 
empleado,
ROUND(SUM(Cargo), 2) AS FACTURACION,
ROUND(AVG(CARGO), 2) AS PROMEDIO,
MAX(CARGO) AS MEJORVENTA,
MIN(CARGO) AS PEORVENTA,
COUNT(*) AS VENTAS
FROM pedidos_neptuno GROUP BY Empleado;