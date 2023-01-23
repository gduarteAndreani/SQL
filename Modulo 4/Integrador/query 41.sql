#INTEGRADOR

#ETAPA 1

USE laboratorio;


-- 1. Generar, a partir de la tabla NACIMIENTOS, 
-- una nueva tabla con el nombre VARONES
-- con todos los campos de la tabla original y 
-- copia en esta nueva tabla todos los registros 
-- en los que figure el sexo MASCULINO. Al 
-- ejecutar la consulta, debería generarse la 
-- tabla con 98.397 filas. No olvidar actualizar 
-- los esquemas para verificar la creación de 
-- la tabla dentro de la base de datos.
-- Etapa 4.1

CREATE TABLE VARONES SELECT * FROM NACIMIENTOS WHERE SEXO = 'Masculino';

-- 2. Generar, a partir de la tabla NACIMIENTOS, 
-- una nueva tabla con el nombre MUJERES con 
-- todos los campos de la tabla original y copiar 
-- en esta nueva tabla todos los registros en los 
-- que figure el sexo FEMENINO. Al ejecutar la 
-- consulta, debería generarse la tabla con 
-- 94.763 filas. Actualizar los esquemas para 
-- verificar la creación de la tabla dentro de la 
-- base de datos.

CREATE TABLE MUJERES SELECT * FROM NACIMIENTOS WHERE SEXO = 'Femenino';

-- 3. Generar, a partir de la tabla NACIMIENTOS, una nueva 
-- tabla con el nombre INDETERMINADOS con todos los 
-- campos de la tabla original y copiar en esta nueva 
-- tabla todos los registros en los que figure el sexo 
-- INDETERMINADO. Al ejecutar la consulta, debería 
-- generarse la tabla con 24 filas. No olvidar actualizar 
-- los esquemas para verificar la creación de la tabla 
-- dentro de la base de datos.

CREATE TABLE INDETERMINADOS SELECT * FROM NACIMIENTOS WHERE SEXO = 'Indeterminado';

-- 4. Eliminar la tabla NACIMIENTOS

DROP TABLE NACIMIENTOS;
