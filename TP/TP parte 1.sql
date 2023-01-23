#TP

-- 1)	Crear una conexión nueva (ejemplo VIDEOCLUB).
-- 2)	Crear un esquema (base de datos) con el nombre “videoclub”

CREATE SCHEMA videoclub;
USE videoclub;

-- 3)Crear la tabla PELICULA (para tener una información de las películas), la cual va a contener los campos:
-- .codigo_pelicula (es numérico, no puede ser nulo y tiene que ser auto incremental).
-- .titulo (es un campo texto y no puede ser nulo) .
-- .año (es un campo numérico y no puede ser nulo).
-- .duración (en te caso vamos a colocar que es un campo numérico y si puede nulo).

CREATE TABLE pelicula (
codigo_pelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(50) NOT NULL,
anio INT NOT NULL,
duracion DOUBLE
);

-- Para prestar las películas debemos crear otra tabla que tenga todos 
-- los datos de los contactos, en este caso le vamos a colocar AMIGO, la misma va a contener los siguientes campos:
-- .codigo_amigo(es numérico, no puede ser nulo y tiene que ser auto incremental). 
-- .nombre(es un campo texto y no puede ser nulo) .
-- .apellido(es un campo texto y no puede ser nulo) .
-- .teléfono(es un campo numérico y no puede ser nulo) .
-- .direccion(es un campo texto y no puede ser nulo) .

CREATE TABLE amigo(
codigo_amigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
apellido VARCHAR(30) NOT NULL,
telefono INT NOT NULL,
direccion VARCHAR(100) NOT NULL
);

--      4) Agregar a la tabla “pelicula” 10 registros (utilizar la sentencia INSERT).
-- Agregar a la tabla “amigo” 10 registros (utilizar la sentencia INSERT).

INSERT INTO pelicula (codigo_pelicula, titulo, anio, duracion) values
(1, "Avatar", 2009, 2.82),
(2, "Titanic", 2001, 2.52),
(3, "The Fight Club", 2000, 2.10),
(4, "2012", 2010, 2.30),
(5, "9 Reinas", 2005, 2.05),
(6, "La Historia Oficial", 1980, 2.15),
(7, "Esperando La Carroza", 1978, 2.66),
(8, "Mamma Mia", 2002, 2.17),
(9, "Spirited Away", 2002, 2.30),
(10, "Un Cuento Chino", 2008, 1.89);

INSERT INTO amigo (codigo_amigo, nombre, apellido, telefono, direccion) values
(1, "Juan", "Perez García", 1133225544, "Carlos G. 1982"),
(2, "Carla", "Sanchez", 1199223344, "Junin 2933"),
(3, "Luisa", "Estebanez", 1198787766, "Callao 198"),
(4, "Carlota", "Hainzman", 1177665588, "Calle 65 2333"),
(5, "Juliana", "Debrois", 1193847588, "Borges 1922"),
(6, "Julian", "Miguelazo", 1177564588, "Luis Miguel 8744"),
(7, "Maximiliano", "Rodriguez", 1199348832, "San Martin 3555"),
(8, "Estanislao", "Lopez", 1187776323, "Martinez 6555"),
(9, "Julian", "Alvarez", 1192293344, "Pintor 1933"),
(10, "Sam", "Richards", 1184992234, "Union Street 193");


--      5) Modificar en la tabla película, 
-- el título que agregaron por el título “duro de matar” cuando el código de película sea 3 
-- utilizar la sentencia UPDATE).

UPDATE pelicula SET titulo = "Duro De Matar" WHERE codigo_pelicula = 3;


--  6) Eliminar en la tabla pelicula los registros
-- 6, 7 y 8 (eliminar de a uno, utilizando la sentencia DELETE).

DELETE FROM PELICULA WHERE codigo_pelicula = 6;
DELETE FROM PELICULA WHERE codigo_pelicula = 7;
DELETE FROM PELICULA WHERE codigo_pelicula = 8;

--      7) Crear visualmente la tabla PRESTAMO, con los siguientes campos:
-- numero_alquiler(es numérico, no puede ser nulo y tiene que ser auto incremental).
-- 	fecha_fin(es fecha (date)).
-- 	fecha_inicio(es fecha (date), no puede ser nulo).
-- 	codigo_pelicula(numerico, no puede ser nulo ).
-- 	codigo_amigo(numerico, no puede ser nulo).
-- En el código de película deben colocar un código existente (cargado) en la tabla que crearon.
-- En el código de amigo deben colocar un código existente (cargado) en la tabla que crearon.


CREATE TABLE prestamo (
numero_alquiler INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha_fin DATE,
fecha_inicio DATE NOT NULL,
codigo_pelicula INT NOT NULL,
codigo_amigo INT NOT NULL
);

--       8) Cargar visualmente  10 registros en la tabla PRESTAMO.

INSERT INTO prestamo (numero_alquiler, fecha_inicio, fecha_fin, codigo_pelicula, codigo_amigo) values
(1, '1999-02-01' , '1999-02-04', 10, 1),
(2, '1999-03-04', '1999-05-04', 9, 2),
(3, '1999-07-04', '1999-12-04', 8, 3),
(4, '1999-12-05', '1999-12-25', 7, 4),
(5, '2000-02-05', '2000-02-25', 6, 5),
(6, '2000-06-25', '2000-06-30', 5, 6),
(7, '1999-06-07', '1999-12-07', 4, 7),
(8, '1999-02-07', '1999-02-19', 3, 8),
(9, '1999-03-08', '1999-03-18', 2, 9),
(10, '1999-10-12', '2000-01-01', 1, 10);

--      9) Modificar el nombre de las tres tablas: 
-- 	PELICULA por PELICULAS
-- 	AMIGO por AMIGOS
-- 	PRESTAMO por PRESTAMOS
--  

RENAME TABLE pelicula TO peliculas;
RENAME TABLE amigo TO amigos;
RENAME TABLE prestamo TO prestamos;

--   10) Por código, realizar una consulta que traiga todos los datos de la tabla PRESTAMOS 
-- utilizando la sentencia SELECT.

SELECT * FROM prestamos;

-- Realizar una consulta que nos muestre los nombres distintos de la tabla AMIGOS 
-- (además de SELECT se debe utilizar la sentencia DISTINCT).

SELECT DISTINCT nombre FROM amigos;

       
-- Realizar una consulta de la tabla PELICULAS, la cual nos traiga nada más que el campo titulo y duración.


SELECT titulo, duracion FROM peliculas; 


