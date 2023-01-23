# Etapa 3.4

USE laboratorio;

-- 1. Utilizar la tabla PEDIDOS_NEPTUNO y 
-- obtener una lista de todos los registros
-- cargados en la tabla. Generar una nueva 
-- columna con el nombre IVA que calcule el 
-- 21% del cargo de cada pedido, obteniendo 
-- un valor numérico que, como máximo, 
-- contenga 2 decimales.

SELECT *, ROUND(CARGO * 0.21, 2) AS IVA FROM pedidos_neptuno;

-- 2. Modificar la consulta anterior, agregando una 
-- nueva columna con el nombre NETO, que 
-- calcule el total a pagar por cada cliente por 
-- las compras realizadas (es decir, sumándole 
-- el IVA al cargo original, manteniendo como 
-- máximo 2 decimales).

SELECT *, 
ROUND(CARGO * 0.21, 2) AS IVA,
ROUND(CARGO * 0.21 + CARGO, 2) AS NETO
FROM pedidos_neptuno;

-- 3. Modificar la consulta anterior, agregando una 
-- nueva columna con el nombre REDONDEO A 
-- FAVOR CLIENTE que devuelva el valor entero 
-- inferior del neto calculado anteriormente.

SELECT *, 
ROUND(CARGO * 0.21, 2) AS IVA,
ROUND(CARGO * 0.21 + CARGO, 2) AS NETO,
FLOOR(CARGO * 0.21 + CARGO) AS REDONDEOAFAVORCLIENTE
FROM pedidos_neptuno;

-- 4. Modificar la consulta anterior, agregando una 
-- nueva columna con el nombre REDONDEO 
-- A FAVOR EMPRESA que devuelva el valor 
-- entero superior del neto antes calculado


SELECT *, 
ROUND(CARGO * 0.21, 2) AS IVA,
ROUND(CARGO * 0.21 + CARGO, 2) AS NETO,
FLOOR(CARGO * 0.21 + CARGO) AS REDONDEOAFAVORCLIENTE,
CEIL(CARGO * 0.21 + CARGO) AS REDONDEOAFAVOREMPRESA
FROM pedidos_neptuno;