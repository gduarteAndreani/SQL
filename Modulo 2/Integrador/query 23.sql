/*Etapa 2.3

1. Mostrar todo el contenido de la tabla 
CLIENTES_NEPTUNO importada en el 
laboratorio anterior.
*/

use laboratorio;
DESCRIBE clientes_neptuno;

/*2. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS.
*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno;

/*3. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar
 las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS Luego, ordenar alfabéticamente el resultado 
de la consulta por los nombres de los países.*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno ORDER BY Pais;

/*4. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar el resultado de la consulta 
alfabéticamente por los nombres de los 
países. Para aquellos países que se repiten, 
ordenar las ciudades alfabéticamente*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno ORDER BY Pais, Ciudad;

/*5. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar de manera alfabética el resultado de 
la consulta, por los nombres de los países. 
Mostrar únicamente los 10 primeros clientes.*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno ORDER BY Pais LIMIT 10;


/*6. Mostrar todos los registros de la tabla 
CLIENTES_NEPTUNO. En el resultado de la 
consulta sólo se deben observar las columnas 
NOMBRECOMPANIA, CIUDAD y PAIS. 
Ordenar de manera alfabética el resultado de 
la consulta, por los nombres de los países. 
Mostrar únicamente los clientes ubicados 
desde la posición 11 hasta la 15.*/

SELECT NombreCompania, Ciudad, Pais FROM clientes_neptuno ORDER BY Pais LIMIT 5 OFFSET 11;