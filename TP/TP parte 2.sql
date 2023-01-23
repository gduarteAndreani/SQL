#TP

#Parte 2

use videoclub;

-- 11) 
-- De la tabla PRESTAMOS traer los números de alquiler que estén entre 3 y 6 (utilizar el parámetro BETWEEN) 

SELECT numero_alquiler FROM prestamos WHERE numero_alquiler BETWEEN 3 AND 6;

-- De la tabla AMIGOS traer los códigos de amigo que no estén entre 2 y 5 (utilizar el parámetro NOT BETWEEN).

SELECT codigo_amigo FROM amigos WHERE codigo_amigo NOT BETWEEN 2 AND 5;

-- 12)


-- Mostrar de la tabla PELICULAS los títulos que por lo menos  contenga “to” (ejemplo: relatos salvajes), 
-- utilizando el parámetro LIKE y el operador %.

SELECT titulo FROM peliculas WHERE titulo LIKE "%to%";

-- 13)
-- Cargar (insertar los registros simultáneamente como lo vimos en la última clase) en la tabla AMIGOS los siguientes datos (nombre – apellido – teléfono - dirección):
-- .Marina – Fernandez – 45128956 – Parana 555   
-- .Lujan  – Tucci – 1137589612 – Lavalle 1100
-- .Gabriel – Dominguez – 41109956 – Carlos Calvo 100   
-- .Raul – Vazquez – 45120014 – Peru 1120   
-- .Martina – Perez – 113202044 – Uruguay 220   

INSERT INTO amigos (codigo_amigo, nombre, apellido, telefono, direccion) VALUES 
(11, "Marina", "Fernandez", 45128956 , "Parana 555"),
(12, "Lujan", "Tucci", 1137589612, "Lavalle 1100"),
(13, "Gabriel", "Dominguez", 41109956, "Carlos Calvo 100"),
(14, "Raul", "Vazquez", 45120014, "Peru 1120"),
(15, "Martina", "Perez", 113202044, "Uruguay 220");

-- 14)
-- Actualizar varios registros de la tabla AMIGOS: Realicen un UPDATE del nombre y apellido, ejemplo
-- Lujan por “LORENA”            .Tucci por “MILONE”
-- Recuerden realizar siempre el WHERE, 
-- en este caso deben colocar también el código de amigo (coloquen el código que tiene LUJAN TUCCI).

UPDATE amigos SET nombre = "Lorena" WHERE codigo_amigo = 12;
UPDATE amigos SET apellido = "Tucci" WHERE codigo_amigo = 12;
UPDATE amigos SET nombre = "Pedro" WHERE codigo_amigo = 14;
UPDATE amigos SET nombre = "Vasquez" WHERE codigo_amigo = 14;
UPDATE amigos SET telefono = 118823445 WHERE codigo_amigo = 14;

-- 15)
-- Crear tabla AUXILIAR, insertando datos de otra tabla.
-- En este caso insertar en la tabla AUXILIAR lo que contenga 
-- la tabla AMIGOS (codigo_amigo, nombre,apellido, telefono, direccion).

CREATE TABLE auxiliar SELECT * FROM amigos;

-- 16)
-- Borrar la tabla AUXILIAR
-- (borrar tabla completa, la vuelve crear y reinicia la secuencia automáticamente),
-- borrando toda la tabla simultáneamente no uno por uno como el delete (no utilizar el delete para este ejercicio).

DROP TABLE auxiliar;

-- 17)
-- Una vez realizado el ejercicio 16, borrar la tabla AUXILIAR completamente.
-- 18)
-- Traer la cantidad de nombres que tiene la tabla AMIGOS.

SELECT count(nombre) AS cantidadDeNombres FROM amigos;

-- 19)
-- Traer de la tabla PELICULAS el máximo y el mínimo año que hay en dicha tabla.

SELECT max(anio) AS masNueva, min(anio) as masVieja FROM peliculas;
