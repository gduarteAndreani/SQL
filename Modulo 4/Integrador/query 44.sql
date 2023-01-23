#INTEGRADOR

#Etapa 4.4

USE laboratorio;

-- 1. En la etapa anterior, se creó una tabla nueva 
-- con el nombre PRODUCTOS_SUSPENDIDOS
-- y se copió en ella, todos los productos que se 
-- encontraban suspendidos de la tabla 
-- PRODUCTOS_NEPTUNO. Sin embargo, estos 
-- registros se copiaron de una tabla a la otra; 
-- es decir, aún se encuentran cargados en la 
-- tabla PRODUCTOS_NEPTUNO. 
-- Etapa 4.4
-- Por lo tanto, llevar a cabo una consulta 
-- de eliminación por la que los productos 
-- suspendidos se eliminen de la tabla 
-- PRODUCTOS_NEPTUNO. Al ejecutar esta 
-- consulta deberían eliminarse de la tabla 
-- PRODUCTOS_NEPTUNO 8 registros.

DELETE FROM productos_neptuno WHERE suspendido = 'SI';