#Integrador 1.2

use laboratorio;

/*1. Modificar la tabla FACTURAS tomando en 
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ClienteID
por IDCliente, manteniendo su tipo de dato 
y restricciones ya definidas.
b. Cambiar el nombre del campo ArticuloID
por IDArticulo, manteniendo su tipo de 
dato y restricciones ya definidas.
c. Asignar la restricción UNSIGNED al campo 
Monto, manteniendo el tipo de dato ya 
definido para el campo.*/

/*Ejemplo ALTER TABLE con CHANGE y MODIFY*/

ALTER TABLE facturas
CHANGE COLUMN clienteID IDcliente integer,
CHANGE COLUMN articuloID IDarticulo integer,
MODIFY monto double UNSIGNED;

/*2. Modificar la tabla ARTICULOS tomando en 
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ArticuloID
por IDArticulo, manteniendo su tipo de 
dato y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre
para que admita hasta 75 caracteres.
c. Asignar las restricciones UNSIGNED y 
NOT NULL al campo Precio, manteniendo 
el tipo de dato ya definido para el campo
d. Asignar las restricciones UNSIGNED y 
NOT NULL al campo Stock, manteniendo 
el tipo de dato ya definido para el campo.
*/

ALTER TABLE articulos CHANGE COLUMN articuloID IDarticulo integer,
MODIFY nombre varchar(75),
MODIFY precio double UNSIGNED NOT NULL,
MODIFY stock int UNSIGNED NOT NULL;

/*3. Modificar la tabla CLIENTES. Tomar en 
cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ClienteID
por IDCliente, manteniendo su tipo de dato 
y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre
para que admita hasta 30 caracteres y 
asigne la restricción correspondiente para 
que su carga sea obligatoria
c. Cambiar el tipo de dato del campo 
Apellido para que admita hasta 35 
caracteres y asigne la restricción 
correspondiente para que su carga 
sea obligatoria.
d. Cambiar el nombre del campo 
Comentarios por Observaciones y su 
tipo de dato para que admita hasta 
255 caracteres.a*/

ALTER TABLE clientes CHANGE COLUMN clienteID IDcliente integer,
MODIFY nombre varchar(30) NOT NULL,
MODIFY apellido varchar(30) NOT NULL,
CHANGE COLUMN comentarios observaciones varchar(255);