#Integrador 2

use laboratorio;

/*Introducción a Bases de Datos y SQL
2. Llevar a cabo los siguientes cambios en la 
tabla CLIENTES_NEPTUNO importada anteriormente. Respetar las consignas detalladas 
a continuación y utilizar el comando ALTER 
TABLE:
a. Campo IDCliente: debe ser de tipo 
VARCHAR, debe admitir hasta 5 caracteres como máximo y debe ser el campo 
PRIMARY KEY de la tabla.*/

ALTER TABLE CLIENTES_NEPTUNO 
MODIFY IDCliente VARCHAR(5) PRIMARY KEY,

/*b. Campo NombreCompania: debe ser de 
tipo VARCHAR, debe admitir hasta 100 
caracteres como máximo y no puede 
quedar vacío.*/

MODIFY NombreCompania VARCHAR(100) NOT NULL,

/*c. Campo Pais: debe ser de tipo VARCHAR, 
debe admitir hasta 15 caracteres como 
máximo y no puede quedar vacío.*/

MODIFY Pais VARCHAR(15) NOT NULL;

/*3. Cambiar el nombre de la tabla CLIENTES por 
CONTACTOS.*/

ALTER TABLE clientes RENAME contactos;

/*5. Llevar a cabo los siguientes cambios en la 
tabla CLIENTES importada anteriormente. 
Respetar las consignas detalladas a continuación y utiliza el comando ALTER TABLE:
a. Campo Cod_Cliente: debe ser de tipo 
VARCHAR, debe admitir hasta 7 caracteres como máximo y debe ser el campo 
PRIMARY KEY de la tabla.*/

ALTER TABLE clientes 
MODIFY Cod_Cliente VARCHAR(7) PRIMARY KEY,

/*b. Campo Empresa: debe ser de tipo 
VARCHAR, debe admitir hasta 100 
caracteres como máximo y no puede 
quedar vacío.*/

MODIFY Empresa VARCHAR(100) NOT NULL,

/*c. Campo Ciudad: debe ser de tipo 
VARCHAR, debe admitir hasta 25 caracteres 
como máximo y no puede quedar vacío.*/

MODIFY Ciudad VARCHAR(25) NOT NULL,

/*d. Campo Telefono: debe ser de tipo INT y no 
debe admitir valores numéricos negativos.*/

MODIFY telefono INT UNSIGNED,

/*e. Campo Responsable: debe ser de tipo 
VARCHAR y debe admitir como máximo 
hasta 30 caracteres.*/

MODIFY Responsable VARCHAR(30);

/*7. Llevar a cabo los siguientes cambios en la 
tabla PEDIDOS importada anteriormente. 
Respetar las consignas detalladas a 
continuación y utilizar el comando ALTER TABLE:

a. Campo Numero_Pedido: debe ser de tipo 
INT, sólo debe aceptar valores numéricos 
enteros y debe ser el campo PRIMARY KEY
de la tabla.*/

ALTER TABLE pedidos
MODIFY Numero_Pedido INT PRIMARY KEY,

/*b. Campo Codigo_Cliente: debe ser de tipo 
VARCHAR, debe admitir hasta 7 caracteres
como máximo y no puede quedar vacío.
*/

MODIFY Codigo_Cliente VARCHAR(7) NOT NULL,

/*c. Campo Fecha_Pedido: debe ser de tipo 
DATE y su carga es obligatoria.*/

MODIFY Fecha_Pedido DATE NOT NULL,

/*d. Campo Forma_Pago: sólo debe admitir la 
carga de los valores APLAZADO, 
CONTADO o TARJETA.*/

MODIFY Forma_Pago ENUM('APLAZADO', 'CONTADO', 'TARJETA'),

/*e. Campo Enviado: sólo debe admitir la carga 
de los valores SI o NO.*/

MODIFY Enviado ENUM('SI', 'NO');

/*9. Llevar a cabo los siguientes cambios en la 
tabla PRODUCTOS importada en el paso 
anterior. Respetar las consignas detalladas a 
continuación, utilizando el comando ALTER 
TABLE:
a. Campo Cod_Producto: debe ser de tipo 
INT, sólo debe aceptar valores numéricos 
enteros y debe ser el campo PRIMARY KEY
de la tabla.*/

ALTER TABLE productos
MODIFY Cod_Producto INT PRIMARY KEY,

/*b. Campo Seccion: debe ser de tipo 
VARCHAR, debe admitir hasta 20 
caracteres como máximo y no puede 
quedar vacío.*/

MODIFY Seccion VARCHAR(20) NOT NULL,

/*c. Campo Nombre: debe ser de tipo VARCHAR, debe 
admitir hasta 40 caracteres como máximo y no 
puede quedar vacío.*/

MODIFY Nombre VARCHAR(40) NOT NULL,

/* 
d. Campo Importado: sólo debe admitir la carga de los 
valores VERDADERO o FALSO.
*/

MODIFY Importado ENUM('VERDADERO', 'FALSO'),

/*e. Campo Origen: debe ser de tipo VARCHAR, admitir 
hasta 25 caracteres y ser de carga obligatoria.*/

MODIFY Origen VARCHAR(25) NOT NULL,

/*f. Campos Dia, Mes y Ano: deben ser de tipo INT, 
positivos y de carga obligatoria*/

MODIFY Dia INT UNSIGNED NOT NULL,
MODIFY Mes INT UNSIGNED NOT NULL,
MODIFY Ano INT UNSIGNED NOT NULL;