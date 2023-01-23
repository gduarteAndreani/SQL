#INTEGRADOR

#Etapa 4.2

USE laboratorio;

-- 1. Actualizar la tabla CLIENTES_NEPTUNO. 
-- Cuando figure el valor ESTADOS UNIDOS en 
-- el campo PAIS, cambiar dicho valor por USA. 
-- Para verificar el cambio realizado, mostrar el 
-- contenido de la tabla CLIENTES_NEPTUNO.

UPDATE clientes_neptuno SET pais = "USA" WHERE pais = "Estados Unidos";

-- 2. Actualizar la tabla CLIENTES_NEPTUNO
-- para mostrar todos los valores del campo 
-- NOMBRECOMPANIA en mayúsculas. Para 
-- verificar el cambio realizado, mostrar el 
-- contenido de la tabla CLIENTES_NEPTUNO.
-- Etapa 4.2

UPDATE clientes_neptuno SET NombreCompania = UPPER(NombreCompania);

-- 3. Actualizar la tabla CLIENTES_NEPTUNO
-- para mostrar todos los valores de los campos 
-- CIUDAD y PAIS en mayúsculas. Mostrar el 
-- contenido de la tabla CLIENTES_NEPTUNO
-- para verificar el cambio llevado a cabo.

UPDATE clientes_neptuno SET ciudad = UPPER(ciudad), pais = UPPER(pais);

-- 4. En la tabla EMPLEADOS generar una nueva 
-- columna llamada NOMBRE_EMPLEADO
-- que admita cadenas de texto con un máximo 
-- de 30 caracteres. Ubica esta columna a la 
-- derecha del campo IDEMPLEADO. Completar 
-- esta nueva columna concatenando los 
-- valores cargados en los campos APELLIDOS 
-- y NOMBRE, separando dichos valores por 
-- una coma y un espacio. Eliminar las 
-- columnas APELLIDOS y NOMBRE. Mostrar el 
-- contenido de la tabla EMPLEADOS para 
-- verificar el cambio llevado a cabo.

ALTER TABLE empleados ADD COLUMN NOMBRE_EMPLEADO VARCHAR(30) AFTER IdEmpleado;
UPDATE empleados SET NOMBRE_EMPLEADO = CONCAT(apellidos, ', ', nombre);
ALTER TABLE empleados DROP COLUMN apellidos, DROP COLUMN nombre;

-- 5. En la tabla CLIENTES generar una nueva 
-- columna con el nombre TIPO que admita 
-- cadenas de texto con un máximo de 3 
-- caracteres. Esta columna debe ubicarse 
-- al final de la tabla. Completar esta nueva 
-- columna estableciendo el valor VIP para 
-- todos aquellos clientes que residan en la 
-- ciudad de MADRID. Para verificar el cambio 
-- llevado a cabo, mostrar el contenido de la 
-- tabla CLIENTES

ALTER TABLE clientes ADD COLUMN TIPO VARCHAR(3) AFTER Responsable;
UPDATE clientes SET TIPO = 'VIP' WHERE ciudad = 'MADRID';

-- 6. Dado que todos los clientes que figuran en la 
-- tabla CLIENTES residen en España, agregar 
-- el prefijo +34- a cada uno de los teléfonos
-- que figuran en el campo TELEFONO. En caso 
-- de que un cliente no tuviera el teléfono 
-- cargado, a ese teléfono no se le debería 
-- agregar el prefijo. Mostrar el contenido de la 
-- tabla CLIENTES para verificar el cambio 
-- realizado.

ALTER TABLE clientes MODIFY telefono VARCHAR(30);
UPDATE clientes SET telefono = CONCAT('+34-', telefono)
WHERE telefono IS NOT NULL; 

-- 7. En la tabla PRODUCTOS generar una nueva 
-- columna con el nombre FECHA que admita la 
-- carga de fechas. Completar la nueva columna 
-- con fechas coherentes, concatenando los 
-- campos DIA, MES y ANO. Cargados los datos 
-- en la nueva columna, eliminar las columnas 
-- originales (DIA, MES y ANO). Además, 
-- actualizar el campo ORIGEN de manera que, 
-- donde figure el valor ESPANA, sea reemplazado por ESPAÑA. Mostrar el contenido de la 
-- tabla PRODUCTOS para verificar el cambio 
-- llevado a cabo.

ALTER TABLE productos ADD COLUMN fecha DATE;
UPDATE productos SET fecha = CONCAT_ws("/", dia, mes, ano);
ALTER TABLE productos DROP COLUMN dia, DROP COLUMN mes, DROP COLUMN ano;
UPDATE productos SET origen = "ESPAÑA" WHERE origen = "ESPANA";

-- 8. Actualizar el campo SUSPENDIDO de la tabla 
-- PRODUCTOS_NEPTUNO de manera que:
-- a. Donde figure el valor 0, éste se reemplace por la 
-- palabra NO.
-- b. Donde figure el valor 1, éste se reemplace por la 
-- palabra SI.
-- c. Tener en cuenta que el campo SUSPENDIDO es de 
-- tipo INT actualmente. Cambiar el tipo de dato para 
-- que admita el reemplazo.
-- d. Para verificar el cambio llevado a cabo, mostrar el 
-- contenido de la tabla PRODUCTOS_NEPTUNO

ALTER TABLE productos_neptuno MODIFY suspendido VARCHAR(2);
UPDATE productos_neptuno SET suspendido =
CASE WHEN suspendido = 0 THEN 'NO'
WHEN suspendido = 1 THEN 'SI'
END;

-- 9. Actualizar los precios de todos los productos
-- de la tabla PRODUCTOS_NEPTUNO, 
-- recargándolos un 10% y manteniendo un 
-- total de 2 decimales para cada uno de los 
-- precios. Mostrar el contenido de la tabla 
-- PRODUCTOS_NEPTUNO para verificar el 
-- cambio llevado a cabo.

UPDATE productos_neptuno SET PrecioUnidad = ROUND(PrecioUnidad + PrecioUnidad * 0.1, 2);

-- 10. Observar la tabla PROVEEDORES y su 
-- contenido. Para todos aquellos proveedores 
-- que no tengan cargado un valor en el campo 
-- REGION, mostrar el valor NULL en dicho 
-- campo. Mostrar el contenido de la tabla 
-- PROVEEDORES para verificar el cambio 
-- llevado a cabo.

DESCRIBE proveedores;
SELECT * FROM proveedores;
UPDATE proveedores SET region = NULL WHERE region = "";

-- 11. Observar el contenido de la tabla CLIENTES. 
-- Actualizar el campo CIUDAD de manera que 
-- todos los valores cargados en esta columna 
-- muestren la primera letra en mayúsculas y el 
-- resto en minúsculas. Mostrar el contenido de 
-- la tabla PROVEEDORES para verificar el 
-- cambio llevado a cabo

SELECT * FROM clientes;
UPDATE clientes SET ciudad = CONCAT(UPPER(LEFT(ciudad, 1)), LOWER(SUBSTRING(ciudad, 2, CHAR_LENGTH(ciudad))));

-- 12. Generar una nueva tabla con el nombre 
-- PRODUCTOS_SUSPENDIDOS a partir de la tabla 
-- PRODUCTOS_NEPTUNO. Volcar en esta nueva tabla 
-- todos los campos de la tabla PRODUCTOS_NEPTUNO, 
-- pero sólo aquellos registros en los que en el campo 
-- SUSPENDIDO figure la palabra SI. Mostrar el 
-- contenido de la tabla PRODUCTOS_SUSPENDIDOS
-- una vez generada. La nueva tabla debería contener 8 
-- productos (registros)

CREATE TABLE productos_suspendidos
SELECT * FROM productos_neptuno
WHERE suspendido = 'SI';