#INTEGRADOR

#Etapa 5.4

USE laboratorio;


-- 1. Generar una tabla con el nombre EQUIPOS, 
-- en la que sólo se cree un campo cuyo nombre 
-- sea EQUIPO. Este campo debe ser de tipo 
-- VARCHAR, almacenar hasta 20 caracteres
-- y debe ser PRIMARY KEY de la tabla.

CREATE TABLE equipos (EQUIPO VARCHAR(20) PRIMARY KEY);

-- 2. Luego, cargar los nombres de las siguientes 
-- selecciones en la tabla EQUIPOS: 
-- ARGENTINA, BRASIL, PARAGUAY, CHILE,
-- URUGUAY, COLOMBIA, ECUADOR, PERÚ,
-- BOLIVIA, VENEZUELA.

INSERT INTO equipos (equipo) values
('Argentina'),
('Brasil'),
('Paraguay'),
('Chile'),
('Uruguay'),
('Colombia'),
('Ecuador'),
('Perú'),
('Bolivia'),
('Venezuela');

-- 3. Generar un producto cartesiano en base 
-- a la misma tabla, para lograr un fixture en 
-- el cual cada selección juegue con las otras 
-- selecciones (un partido como local y otro 
-- como visitante). Ordenar alfabéticamente el 
-- resultado, según el nombre del equipo local.


SELECT * from equipos Loc CROSS JOIN equipos Vis
WHERE Loc.equipo <> Vis.equipo
ORDER BY Loc.equipo;

-- 4. Crear un producto cartesiano restringido
-- por el que se unan las tablas PRODUCTOS 
-- NEPTUNO y EMPLEADOS. Luego, mostrar 
-- en el resultado de la consulta los siguientes 
-- campos IDPRODUCTO, NOMBREPRODUCTO
-- y NOMBRE_EMPLEADO y sólo aquellas filas 
-- en las que el IDPRODUCTO coincida con el
-- IDEMPLEADO.

SELECT IdProducto, nombreProducto, nombre_empleado from productos_neptuno CROSS JOIN empleados
WHERE IdProducto = IdEmpleado

