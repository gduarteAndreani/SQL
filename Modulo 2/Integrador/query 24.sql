/*Etapa 2.4
1. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
extranjeras. Mostrar todos los campos de la 
tabla en el resultado de la consulta.*/

use laboratorio;

SELECT * FROM nacimientos WHERE	nacionalidad = 'Extranjera';

/*2. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
menores de edad. Mostrar todos los campos 
de la tabla en el resultado de la consulta y 
ordenar el resultado de menor a mayor por 
la edad de las madres.
*/

SELECT * FROM nacimientos WHERE	EDAD_MADRE < 18 ORDER BY EDAD_MADRE DESC;

/*3. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que tengan la misma edad que el padre. 
Mostrar todos los campos de la tabla en 
el resultado de la consulta.*/

SELECT * FROM nacimientos WHERE	EDAD_MADRE = EDAD_PADRE;

/*4. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que, con respecto al padre, tengan 40 años o 
menos que el padre.
*/

SELECT * FROM nacimientos WHERE	EDAD_MADRE <= EDAD_PADRE-40;

/*5. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residen en Argentina. Mostrar todos los 
campos de la tabla en el resultado de la 
consulta*/

SELECT * FROM clientes_neptuno WHERE Pais = 'Argentina';

/*6. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos los clientes, con excepción 
de los que residen en Argentina. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar alfabéticamente 
dicho resultado por los nombres de los países.*/

SELECT * FROM clientes_neptuno WHERE Pais <> 'Argentina' ORDER BY Pais;

/*7. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que nacieron con 
menos de 20 semanas de gestación. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar dicho resultado de 
mayor a menor, por los valores de la columna 
SEMANAS.*/

SELECT * FROM nacimientos WHERE semanas < 20 ORDER BY semanas;

/*8. De la tabla NACIMIENTOS, obtener una lista 
de todos los bebés de sexo femenino, 
nacidos de madres extranjeras solteras, de 
más de 40 años. Mostrar todos los campos
de la tabla en el resultado de la consulta.*/

SELECT * FROM nacimientos WHERE sexo = 'Femenino' AND ESTADO_CIVIL_MADRE = 'Soltera' AND EDAD_MADRE > 40;

/*9. De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residan en países sudamericanos. 
Mostrar todos los campos de la tabla en el 
resultado de la consulta y ordenar de manera 
alfabética los registros, por los nombres de 
los países y las ciudades.*/

SELECT * FROM clientes_neptuno WHERE pais = 'Argentina' OR pais = 'Brasil' OR pais = 'Venezuela' ORDER BY Pais, Ciudad;

/*10. De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que hayan nacido 
con una cantidad de semanas de gestación 
de entre 20 y 25 semanas, inclusive. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar el resultado según 
las semanas de gestación de los recién 
nacidos, de menor a mayor.
*/

SELECT * FROM nacimientos WHERE semanas >= 20 AND semanas <= 25 ORDER BY semanas;

/*De la tabla NACIMIENTOS, utilizar el operador 
IN y obtener una lista de todos los bebés 
que nacieron en las comunas 1101, 3201, 
5605, 8108, 9204, 13120 y 15202. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar de menor a mayor
los registros, por los números de comuna.*/

SELECT * FROM nacimientos WHERE comuna IN (1101, 3021, 5605, 8108, 9204, 13120, 15202) ORDER BY comuna;

/*12. De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes cuyo ID comience con la letra 
C. Mostrar todos los campos de la tabla, en el 
resultado de la consulta.*/

SELECT * FROM clientes_neptuno where IDCliente LIKE "C%";

/*13. De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes que residan en una ciudad que 
comience con la letra B y en total posea 5 caracteres. 
Mostrar todos los campos de la tabla en el resultado 
de la consulta.*/

SELECT * FROM clientes_neptuno where ciudad LIKE "B____";

/*14. De la tabla NACIMIENTOS, obtener una lista de todos 
aquellos padres que tengan más de 10 hijos.*/

SELECT * FROM nacimientos where HIJOS_VIVOS > 10;