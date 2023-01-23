use laboratorio;

/*Ejemplos de CREATE*/

CREATE TABLE IF NOT EXISTS facturas(letra char, numero integer, PRIMARY KEY(letra, numero), clienteID integer, articuloID integer, fecha date, monto double);

CREATE TABLE IF NOT EXISTS articulos(articuloID integer, PRIMARY KEY(articuloID), nombre varchar(50), precio double, stock integer);

CREATE TABLE IF NOT EXISTS clientes(clienteID integer, PRIMARY KEY(clienteID), nombre varchar(25), apellido varchar(25), cuit char(16), direccion varchar(50), comentarios varchar(50));

/*Ejemplo de SHOW*/

SHOW DATABASES;

SHOW TABLES;

/*La instruccion SHOW TABLES muestra todas las tablas de la DB laboratorio porque
usamos al principio de la query la clausula use laboratorio*/

/*Ejemplo DESCRIBE*/

DESCRIBE clientes;