#Integrador

USE laboratorio;

#Etapa 5.2

-- 1. Utilizando la tabla CLIENTES_NEPTUNO, 
-- generar una consulta que muestre los campos 
-- IDCLIENTE, NOMBRECOMPANÍA, CIUDAD
-- y PAÍS. Agregar una columna cuyo nombre 
-- sea CONTINENTE, en la que se muestren los 
-- siguientes valores:
-- a. América del Norte si el cliente está 
-- radicado en México, Canadá o USA.
-- b. América del Sur si el cliente está radicado 
-- en Argentina, Brasil o Venezuela.
-- c. Europa en el caso de que no se cumplan 
-- ninguna de las condiciones anteriores.
-- Ordenar el resultado alfabéticamente por los 
-- campos CONTINENTE y PAÍS

SELECT IdCliente, NombreCompania, Ciudad, Pais FROM clientes_neptuno;
ALTER TABLE clientes_neptuno ADD COLUMN CONTINENTE VARCHAR(30);
UPDATE clientes_neptuno SET CONTINENTE =
CASE WHEN Pais in ('México', 'Canadá', 'USA') THEN 'América del Norte'
WHEN Pais in ('Argentina', 'Brasil', 'Venezuela') THEN 'América del Sur'
ELSE 'Europa'
END;
SELECT Continente, Pais FROM clientes_neptuno ORDER BY Continente, Pais;

-- 2. Utilizar la tabla PEDIDOS_NEPTUNO, 
-- generar una consulta que muestre los 
-- campos IDPEDIDO, NOMBRECOMPAÑÍA, 
-- FECHAPEDIDO y CARGO. Luego, agregar 
-- una columna llamada EVALUACIÓN en la 
-- que se muestren los siguientes valores:
-- a. EXCELENTE si el cargo supera los 700 
-- dólares.
-- b. MUY BUENO si el cargo oscila entre 500 y 
-- 700 dólares.
-- c. BUENO si el cargo oscila entre 250 y 500 
-- dólares.
-- d. REGULAR si el cargo oscila entre 50 y 250 
-- dólares.
-- e. MALO si el cargo es inferior a 50 dólares.
-- Por último, ordenar el resultado de mayor a 
-- menor según los cargos de cada pedido

SELECT IdPedido, NombreCompania, FechaPedido, Cargo FROM pedidos_neptuno;
ALTER TABLE pedidos_neptuno ADD COLUMN EVALUACION VARCHAR(15);
UPDATE pedidos_neptuno SET EVALUACION =
CASE WHEN cargo > 700 THEN 'Excelente'
WHEN cargo BETWEEN 500 AND 700 THEN 'Muy Bueno'
WHEN cargo BETWEEN 250 AND 500 THEN 'Bueno'
WHEN cargo BETWEEN 50 AND 250 THEN 'Regular'
WHEN cargo < 50 THEN 'Malo'
END;
SELECT IdPedido, NombreCompania, FechaPedido, Cargo, evaluacion FROM pedidos_neptuno
ORDER BY cargo DESC;

-- 3. Utilizando la tabla PRODUCTOS_NEPTUNO, 
-- generar una consulta que muestre los campos 
-- IDPRODUCTO, NOMBREPRODUCTO, 
-- NOMBRECATEGORÍA y PRECIOUNIDAD. 
-- Agregar una columna con el nombre TIPO en 
-- la que se muestren los siguientes valores:
-- a. DELUXE si el precio del producto supera 
-- los 100 dólares.
-- b. REGULAR si el precio del producto oscila 
-- entre 10 y 100 dólares.
-- c. ECONÓMICO si el precio del producto es 
-- inferior a los 10 dólares.
-- Por último, ordenar los productos de mayor a 
-- menor según sus precios

SELECT IdProducto, NombreProducto, NombreCategoria, PrecioUnidad FROM PRODUCTOS_NEPTUNO;
ALTER TABLE PRODUCTOS_NEPTUNO ADD COLUMN TIPO VARCHAR(15);
UPDATE PRODUCTOS_NEPTUNO SET TIPO =
CASE WHEN PrecioUnidad > 100 THEN 'Deluxe'
WHEN PrecioUnidad BETWEEN 10 AND 100 THEN 'Regular'
WHEN PrecioUnidad < 10 THEN 'Económico'
END;
SELECT IdProducto, NombreProducto, NombreCategoria, PrecioUnidad, TIPO FROM PRODUCTOS_NEPTUNO
ORDER BY PrecioUnidad DESC;