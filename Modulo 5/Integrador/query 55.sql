#Integrador

#Etapa 5.5

USE laboratorio;


-- 1. Generar un listado en el que se muestre el 
-- campo NOMBRECONTACTO de la tabla 
-- PROVEEDORES y los campos IDPRODUCTO, 
-- NOMBREPRODUCTO y PRECIOUNIDAD de 
-- la tabla PRODUCTOS NEPTUNO. Generar el 
-- JOIN a través de la cláusula FROM. Después, 
-- ordenar el resultado alfabéticamente por los 
-- nombres de los contactos y cuando el nombre 
-- del contacto (nombre del proveedor) se repita, 
-- ordena los productos, también de manera 
-- alfabética, provistos por el proveedor.

SELECT prov.NOMBRECONTACTO, prod.IDPRODUCTO, prod.NOMBREPRODUCTO, prod.PRECIOUNIDAD
FROM proveedores prov JOIN productos_neptuno prod
ON prov.IdProveedor = prod.IdProveedor
ORDER BY nombrecontacto, NombreProducto;

-- 2. Modificar la consulta anterior para generar 
-- el JOIN a través de la cláusula WHERE.

SELECT prov.NOMBRECONTACTO, prod.IDPRODUCTO, prod.NOMBREPRODUCTO, prod.PRECIOUNIDAD
FROM proveedores prov, productos_neptuno prod
WHERE prod.IdProveedor = prov.IdProveedor
ORDER BY nombrecontacto, NombreProducto;

-- 3. Crear un listado en la que se muestre el 
-- campo EMPRESA de la tabla CLIENTES y los 
-- campos NUMERO_PEDIDO, FECHA_PEDIDO 
-- y FORMA_PAGO de la tabla PEDIDOS. 
-- Generar el JOIN a través de la cláusula FROM. 
-- Luego, ordenar el listado alfabéticamente por 
-- los nombres de las empresas.

SELECT cli.empresa, ped.numero_pedido, ped.fecha_pedido, ped.forma_pago
FROM clientes cli JOIN pedidos ped
ON ped.Codigo_Cliente = cli.Cod_Cliente
ORDER BY empresa;

-- 4. Modificar la consulta anterior para mostrar 
-- únicamente aquellos clientes que no hayan 
-- efectuado ningún pedido.

SELECT cli.empresa, ped.numero_pedido, ped.fecha_pedido, ped.forma_pago
FROM clientes cli LEFT JOIN pedidos ped
ON ped.Codigo_Cliente = cli.Cod_Cliente
WHERE ped.Numero_Pedido IS NULL
ORDER BY empresa;

-- 5. Por último, modificar la consulta anterior para 
-- mostrar únicamente el campo EMPRESA.

SELECT cli.empresa
FROM clientes cli LEFT JOIN pedidos ped
ON ped.Codigo_Cliente = cli.Cod_Cliente
WHERE ped.Numero_Pedido IS NULL
ORDER BY empresa;

-- 6. ¿Existe algún proveedor que en este momento 
-- no le esté vendiendo ningún producto a 
-- nuestra empresa? Responder esta pregunta 
-- a través de una consulta en la que utilices las 
-- tablas PROVEEDORES y PRODUCTOS 
-- NEPTUNO. Mostrar todos los campos de 
-- ambas tablas en el resultado de la consulta. 

SELECT * FROM proveedores prov LEFT JOIN productos_neptuno prod
ON prov.IdProveedor = prod.IdProveedor
WHERE prod.IdProducto IS NULL
ORDER BY prov.nombrecontacto, prod.NombreProducto;

-- 7. ¿Existe algún producto que no se sepa quién 
-- es el proveedor que lo provee a nuestra 
-- empresa? Responder esta pregunta a través 
-- de una consulta en la que utilices las tablas 
-- PROVEEDORES y PRODUCTOS NEPTUNO. 
-- Puedes mostrar todos los campos de ambas 
-- tablas en el resultado de la consulta

SELECT * FROM proveedores prov RIGHT JOIN productos_neptuno prod
ON prov.IdProveedor = prod.IdProveedor
WHERE prov.IdProveedor IS NULL
ORDER BY prov.nombrecontacto, prod.NombreProducto;