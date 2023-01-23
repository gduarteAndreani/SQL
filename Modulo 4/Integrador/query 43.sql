#INTEGRADOR

#Etapa 4.3

USE laboratorio;

-- 1. Desde ahora, todos los productos provistos 
-- por el proveedor 1 pasan a estar suspendidos
-- por tiempo indeterminado. Por lo tanto:


-- a. Ejecutar una consulta de actualización por 
-- la que, todos los productos de la tabla 
-- PRODUCTOS_NEPTUNO que pertenecen 
-- al proveedor cuyo IDPROVEEDOR sea el 
-- número 1 pasen a mostrar el valor SI en 
-- el campo SUSPENDIDO

UPDATE productos_neptuno SET suspendido = 'SI'
WHERE IdProveedor = 1;

-- b. Ejecutar una consulta de datos anexados
-- por la que, todos los productos que ahora 
-- se encuentran suspendidos en la tabla 
-- PRODUCTOS_NEPTUNO se copien en 
-- la tabla PRODUCTOS_SUSPENDIDOS.

INSERT INTO productos_suspendidos
SELECT * FROM productos_neptuno WHERE suspendido = 'SI';

-- c. Ejecutar una consulta de eliminación
-- por la que, todos los productos de la tabla 
-- PRODUCTOS_NEPTUNO que fueron 
-- copiados, se eliminen de la tabla 
-- PRODUCTOS_SUSPENDIDOS.

DELETE FROM productos_neptuno WHERE suspendido = 'SI' AND IdProveedor = 1;