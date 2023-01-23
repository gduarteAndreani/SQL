#Etapa 3.3

USE LABORATORIO;

-- 1. Utilizando la tabla PEDIDOS_NEPTUNO, 
-- obtener una lista de todos aquellos pedidos 
-- efectuados a lo largo del año 1998.

SELECT * FROM pedidos_neptuno WHERE YEAR(FechaPedido) = 1998;

-- 2. Utilizando la tabla PEDIDOS_NEPTUNO, 
-- obtener una lista de todos aquellos pedidos 
-- efectuados durante los meses de agosto 
-- y septiembre del año 1997.

SELECT * FROM pedidos_neptuno WHERE YEAR(FechaPedido) = 1997 AND
(MONTH(FechaPedido) = 08 OR MONTH(FechaPedido) = 09); 

-- 3. Utilizando la tabla PEDIDOS_NEPTUNO, 
-- obtener una lista de todos aquellos pedidos 
-- efectuados el primer día de cada mes de 
-- cualquier año.

SELECT * FROM pedidos_neptuno WHERE DAY(FechaPedido) = 01;

-- 4. Utilizar la tabla PEDIDOS_NEPTUNO y 
-- obtener una lista de todos los registros
-- contenidos en la tabla. En una nueva 
-- columna llamada DIAS TRANSCURRIDOS, 
-- mostrar la cantidad de días transcurridos 
-- desde la fecha en que fue realizado cada 
-- pedido, al día de hoy.

SELECT *, DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS FROM pedidos_neptuno;


-- 5. Modifica la consulta anterior y agregar otra 
-- columna con el nombre DIA, que refleje el 
-- nombre del día en el que se efectuó cada 
-- uno de los pedidos.

SELECT *, DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS, DAYNAME(FechaPedido) AS DIA FROM pedidos_neptuno;

-- 6. Modificar la consulta anterior, agregando otra 
-- columna con el nombre DIA DEL AÑO, que 
-- refleje el número del día del año en el que se 
-- efectuó cada uno de los pedidos.

SELECT *, 
DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS, 
DAYNAME(FechaPedido) AS DIA,
DAYOFYEAR(FECHAPEDIDO) AS DIADELANO
FROM pedidos_neptuno;

-- 7. Modificar la consulta anterior y agregar otra 
-- columna con el nombre MES, que refleje el 
-- nombre del mes del año en el que se efectuó 
-- cada uno de los pedidos.

SELECT *, 
DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS, 
DAYNAME(FechaPedido) AS DIA,
DAYOFYEAR(FechaPedido) AS DIADELANO,
MONTHNAME(FechaPedido) MES
FROM pedidos_neptuno;

-- 8. Modificar la consulta anterior y agregar otra 
-- columna llamada PRIMER VENCIMIENTO
-- que calcule el primer vencimiento de cada 
-- factura, suponiendo que dicho vencimiento 
-- es a los 30 días de haber sido emitida.

SELECT *, 
DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS, 
DAYNAME(FechaPedido) AS DIA,
DAYOFYEAR(FechaPedido) AS DIADELANO,
MONTHNAME(FechaPedido) AS MES,
ADDDATE(FechaPedido, INTERVAL 30 DAY) AS PRIMERVENCIMIENTO
FROM pedidos_neptuno;

-- 9. Modificar la consulta anterior y agregar otra 
-- columna llamada SEGUNDO VENCIMIENTO 
-- que calcule el segundo vencimiento de cada 
-- factura, suponiendo que dicho vencimiento 
-- es a los 2 meses de haber sido emitida.

SELECT *, 
DATEDIFF(CURDATE(), FechaPedido) AS DIASTRANSCURRIDOS, 
DAYNAME(FechaPedido) AS DIA,
DAYOFYEAR(FechaPedido) AS DIADELANO,
MONTHNAME(FechaPedido) AS MES,
ADDDATE(FechaPedido, INTERVAL 30 DAY) AS PRIMERVENCIMIENTO,
ADDDATE(FechaPedido, INTERVAL 2 MONTH) AS SEGUNDOVENCIMIENTO
FROM pedidos_neptuno;