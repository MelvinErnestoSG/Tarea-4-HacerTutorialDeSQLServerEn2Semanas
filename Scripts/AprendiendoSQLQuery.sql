--1) Objetivos y Alcances del Tutorial de Microsoft Sql Server.

 Create DATABASE BaseDeDatos

 USE BaseDeDatos

 GO

 /*********************************************************************************************************************************************/

 --2) Crear Una Tabla (Create Table - sp_Tables - sp_columns - Drop Table).

 --Ejercicios Propuestos.

 --Ejercicio 1:
 
 --Necesita almacenar los datos de sus amigos en una tabla. 
 --Los datos que guardará serán: Apellido, Nombre, Domicilio y teléfono.
 
 --1- Elimine la tabla "Agenda" si existe:
 if object_id('Agenda') is not null
   Drop Table Agenda
   
 --2- intente crear una tabla llamada "/Agenda":
 /*Create Table /Agenda(
   Apellido varchar(30),
   Nombre varchar(20),
   Domicilio varchar(30),
   Telefono varchar(11)
 )*/
 
 --Aparece un mensaje de error porque usamos un caracter inválido ("/") para el nombre.
 
 --3- Cree una tabla llamada "Agenda", 
   /*debe tener los siguientes campos: 
   Apellido, varchar(30); 
   Nombre, varchar(20); 
   Domicilio, varchar (30); 
   y Telefono, varchar(11):*/
 
 Create Table Agenda(
   Apellido varchar(30),
   Nombre varchar(20),
   Domicilio varchar(30),
   Telefono varchar(11)
 )
 
 --4- intente crearla nuevamente. Aparece mensaje de error.
 /*Create Table Agenda(
   Apellido varchar(30),
   Nombre varchar(20),
   Domicilio varchar(30),
   Telefono varchar(11)
 )
 
 Create Table Agenda(
   Apellido varchar(30),
   Nombre varchar(20),
   Domicilio varchar(30),
   Telefono varchar(11)
 )*/

 GO

 --5- Visualice las tablas existentes (Exec sp_Tables @Table_owner = 'dbo').
 Exec sp_Tables @Table_owner = 'dbo'

 --6- Visualice la estructura de la tabla "Agenda"(sp_columns).
 Exec sp_columns Agenda

 --7- Elimine la tabla.
 Drop Table Agenda

 --8- intente eliminar la tabla, sin controlar si existe. debe aparecer un mensaje de error.
 --Drop Table Agenda

 --Ejercicio 2:

 --1- Elimine la tabla "libros", si existe:
  if object_id('Libros') is not null
   Drop Table Libros

 --2- Verifique que la tabla "libros" no existe en la base de datos activa (Exec sp_Tables @Table_owner='dbo').
 Exec sp_Tables @Table_owner = 'dbo'

 --3- Cree una tabla llamada "libros". 
 /*debe definirse con los siguientes campos: 
 Titulo, varchar(20); 
 Autor, varchar(30) 
 y Editorial, varchar(15).*/

 Create Table Libros(
   Titulo varchar(20),
   Autor varchar(30),
   Editorial varchar(15)
 )

 GO

 --4- intente crearla nuevamente. Aparece mensaje de error.
 /*Create Table Libros(
   Titulo varchar(20),
   Autor varchar(30),
   Editorial varchar(15)
 )*/

 --5- Visualice las tablas existentes.
 Exec sp_Tables @Table_owner = 'dbo'

 --6- Visualice la estructura de la tabla "libros".
 Exec sp_columns Libros

 --7- Elimine la tabla.
 Drop Table Libros

 --8- intente eliminar la tabla nuevamente.
 --Drop Table Libros

 --Problema Resuelto:

 --Vamos a crear una tabla llamada "usuarios". 
 --En primer lugar vamos a eliminar la tabla "usuarios" 
 --averiguando si existe(a esto vamos a repetirlo siempre porque puede haber otro usuario que haya creado una tabla con el mismo Nombre):

 if object_id('Usuarios') is not null 
  Drop Table Usuarios 

 --La tabla "usuarios" contendrá los siguientes campos:

 --Ahora si creamos la tabla:
 Create Table Usuarios( 
  Nombre varchar(30), 
  Clave varchar(10) 
 ) --aparece un mensaje indicando que el comando se completó exitosamente.

 GO

 --Veamos las tablas existentes:
 Exec sp_Tables @Table_owner = 'dbo' 
 
 --Veamos la estructura de la tabla "usuarios":
 Exec sp_columns Usuarios

 /*intentemos crear una tabla con el mismo Nombre, 
 mostrará un mensaje indicando que ya hay un objeto llamado 'usuarios' 
 en la base de datos y la sentencia no se ejecutará:*/

 /*Create Table Usuarios (
 Nombre varchar(30),
 clave varchar(10)
 );*/

 --Eliminemos la tabla:
 Drop Table Usuarios

 --Verifiquemos si se ha eliminado:
 Exec sp_Tables @Table_owner = 'dbo' --no debe aparecer la tabla "usuarios".

 /*********************************************************************************************************************************************/

 --3) Insertar y Recuperar Registros De Una Tabla (Insert Into - Select).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla "Agenda" que almacena información de sus amigos.

 --1- Elimine la tabla "Agenda", si existe:
 if object_id('Agenda') is not null
   Drop Table Agenda

 --2- Cree una tabla llamada "Agenda". debe tener los siguientes campos: 
   /*Apellido (cadena de 30), 
   Nombre (cadena de 20), 
   Domicilio (cadena de 30) 
   y Telefono (cadena de 11):*/

 Create Table Agenda(
  Apellido varchar(30),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 GO

 --3- Visualice las tablas existentes para verificar la creación de "Agenda"(Exec sp_Tables @Table_owner = 'dbo').
 Exec sp_Tables @Table_owner = 'dbo'

 --4- Visualice la estructura de la tabla "Agenda" (sp_columns).
 Exec sp_columns Agenda

 --5- Ingrese los siguientes registros:
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Moreno','Alberto','Colon 123','4234567')

 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Torres','Juan','Avellaneda 135','4458787')

 --6- Seleccione todos los registros de la tabla:
 Select * From Agenda

 --7- Elimine la tabla "Agenda":
 Drop Table Agenda

 --8- intente eliminar la tabla nuevamente(aparece un mensaje de error):
 --Drop Table Agenda

 --Ejercicio 2:

 --Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.

 --1- Elimine la tabla "libros", si existe:
 if object_id('Libros') is not null
   Drop Table Libros

 --2- Cree una tabla llamada "libros". 
   /*debe definirse con los siguientes campos: 
   Titulo(cadena de 20), 
   Autor(cadena de 30) 
   y Editorial (cadena de 15).*/

 Create Table Libros (
   Titulo varchar(20),
   Autor varchar(30),
   Editorial varchar(15)
 )

 GO

 --3- Visualice las tablas existentes (Exec sp_Tables @Table_owner = 'dbo').
 Exec sp_Tables @Table_owner = 'dbo'

 --4- Visualice la estructura de la tabla "libros"(sp_columns).
 Exec sp_columns Libros

 --5- Ingrese los siguientes registros:
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values ('El aleph','Borges','Planeta')
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('Martin Fierro','Jose Hernandez','Emece')
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('Aprenda PHP','Mario Molina','Emece')

 --6- Muestre todos los registros(Select).
 Select * From Libros

 --Ejercicio Resulto:

 --Vamos a crear una tabla llamada "usuarios". 

 /*En primer lugar vamos a eliminar la tabla "usuarios" 
 averiguando si existe 
 (recuerde que debemos repetir siempre esto 
 porque puede haber otro usuario que haya creado 
 una tabla con el mismo Nombre en el servidor www.tutorialesprogramacionya.com):*/

 if object_id('Usuarios') is not null
  Drop Table Usuarios 
 
 --Creamos la tabla:
 Create Table Usuarios(
  Nombre varchar(30),
  Clave varchar(10)
 )

 GO

 --Agregamos un registro a la tabla:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Mariano','123abc') 
 
 --Veamos si el registro se guardó:
 Select * From Usuarios 

 --Ingresemos otro registro Alterando el orden de los campos:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Ana','hola123')

 --Veamos cómo SQL Server almacenó los datos:
 Select * From Usuarios

 --Ingresemos otro registro colocando los valores en distinto orden en que se nombran los campos:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Boca','Luis')

 --Veamos cómo se guardaron los datos:
 Select * From Usuarios --Note que la cadena "Boca" se almacenó en el campo "nombre" y la cadena "Luis" en el campo "clave".

 /*********************************************************************************************************************************************/
 
 --4) Tipos De Datos Básicos.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un video club que alquila películas en video almacena la información de sus películas en una tabla 
 llamada "Peliculas"; para cada película necesita los siguientes datos:
 -Nombre, cadena de caracteres de 20 de longitud,
 -Actor, cadena de caracteres de 20 de longitud,
 -Duración, valor numérico entero.
 -Cantidad de copias: valor entero.*/

  --1- Elimine la tabla, si existe:
  if object_id('Peliculas') is not null
   Drop Table Peliculas

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Peliculas(
  Nombre varchar(50),
  Actor varchar(50),
  Duracion integer,
  Cantidad integer
 )

 GO

 --3- Vea la estructura de la tabla:
 Exec sp_columns Peliculas

 --4- Ingrese los siguientes registros:
 Insert Into Peliculas(Nombre, Actor, Duracion, Cantidad)
  Values('Mision imposible','Tom Cruise',128,3)
 Insert Into Peliculas(Nombre, Actor, Duracion, Cantidad)
  Values('Mision imposible 2','Tom Cruise',130,2)
 Insert Into Peliculas(Nombre, Actor, Duracion, Cantidad)
  Values('Mujer bonita','Julia Roberts',118,3)
 Insert Into Peliculas(Nombre, Actor, Duracion, Cantidad)
  Values('Elsa y Fred','China Zorrilla',110,2)

 --5- Muestre todos los registros.
 Select * From Peliculas
  
 --Ejercicio 2:

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Empleados(
  Nombre varchar(50),
  Documentos varchar(8),
  Sexo varchar(1),
  Domicilio varchar(40),
  SueldoBasico float
 )

 GO

 --3- Vea la estructura de la tabla:
 Exec sp_columns Empleados

 --4- Ingrese algunos registros:
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico)
  Values('Juan Perez','22333444','m','Sarmiento 123',500)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico)
  Values('Ana Acosta','24555666','f','Colon 134',650)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico)
  Values('Bartolome Barrios','27888999','m','Urquiza 479',800)

 --5- Seleccione todos los registros.
 Select * From Empleados

 --Ejercicio Resulto:

 --Vamos a crear una tabla llamada "libros". En primer lugar vamos a eliminar la tabla "libros" averiguando si existe:

 /*Para almacenar información de los libros de una librería necesitamos los siguientes campos:
  Titulo, cadena de caracteres de 20 de longitud,
  Autor, cadena de caracteres de 15 de longitud,
  Editorial, caracteres de 10 de longitud,
  Precio, valor numérico con decimales y
  Cantidad, valor numérico entero.*/

 if object_id('Libros') is not null
   Drop Table Libros 

 --Al crear la tabla, entonces, elegimos el tipo de dato más adecuado para cada campo:
 Create Table Libros( 
   Titulo varchar(80),
   Autor varchar(40),
   Editorial varchar(30),
   Precio float,
   Cantidad integer
  )--Note que al especificar el tipo de dato de los campos numéricos, no colocamos entre paréntesis la longitud.

 GO

 --Vemos la estructura de la tabla:
 Exec sp_columns Libros

 --Ingresamos algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('El aleph','Borges','Emece', 25.50,100)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Matematica estas ahi','Paenza','Siglo XXI',18.8,200)

 --note que al ingresar valores numéricos(float e integer) 
 --no se utilizan comillas y para el separador de decimales se usa el caracter punto(.).

 --Veamos los registros cargados:
 Select * From Libros

 --Veamos lo que sucede si Intentamos ingresar para el campo "titulo" una cadena de más de 20 caracteres:
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad)
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Atlantida',10,200)
 
 --Aparece un mensaje de error y la sentencia no se ejecuta.
 --Vamos a cortar la cadena para que SQL Server acepte el ingreso del registro:
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais','Lewis Carroll','Atlantida',10,200)

 --Veamos los registros cargados:
 Select * From Libros

 /*********************************************************************************************************************************************/

 --5) Recuperar algunos Campos (Select).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un video club que alquila películas en video almacena la información de sus películas en alquiler en una tabla llamada "Películas".

 --1- Elimine la tabla, si existe:
 if object_id('Peliculas') is not null
   Drop Table Peliculas

 --2- Cree la tabla:
 Create Table Peliculas(
  Titulo varchar(20),
  Actor varchar(20),
  Duracion integer,
  Cantidad integer
 )

 --3- Vea la estructura de la tabla(sp_columns).
 Exec sp_columns Peliculas

 GO

 --4- Ingrese a los siguientes registros:
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad)
  Values('Mision imposible','Tom Cruise',180,3)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Mision imposible 2','Tom Cruise',190,2)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Mujer bonita','Julia Roberts',118,3)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Elsa y Fred','China Zorrilla',110,2)

 --5- Realice un "Select" mostrando solamente el título y Actor de todas las películas.
 Select Titulo, Actor 
  From Peliculas

 --6- Muestre el título y duración de todas las Peliculas.
 Select Titulo, Duracion 
  From Peliculas

 --7- Muestre el título y la cantidad de copias.
 Select Titulo, Cantidad 
  From Peliculas

 --Ejercicio 2:

 --Una empresa almacena los datos de sus empleados en una tabla llamada "Empleados".

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
   Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
   Nombre varchar(20),
   Documentos varchar(8), 
   Sexo varchar(1),
   Domicilio varchar(30),
   SueldoBasico float
 )

 GO

 --3- Vea la estructura de la tabla:
 Exec sp_columns Empleados

 --4- Ingrese algunos registros:
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico) 
  Values('Juan Juarez','22333444','m','Sarmiento 123',500)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico) 
  Values('Ana Acosta','27888999','f','Colon 134',700)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico) 
  Values('Carlos Caseres','31222333','m','Urquiza 479',850)

 --5- Muestre todos los datos de los empleados.
 Select * From Empleados

 --6- Muestre el nombre, Documentos y Domicilio de los empleados.
 Select Nombre, Documentos, Domicilio 
  From Empleados

 --7- Realice un "Select" mostrando el Documentos, Sexo y Sueldo básico de todos los empleados
 Select Documentos, Sexo, SueldoBasico 
  From Empleados

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla Libros:
 Create Table Libros(
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio float,
  Cantidad integer
 )

 GO

 --Veamos la estructura de la tabla:
 Exec sp_columns Libros --Llamamos al almacenamiento almacenado sp_columns para conocer los campos de la tabla Libros.

 --Ingresamos varias filas en la tabla o algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('El aleph','Borges','Emece',25.50,200)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Atlentida',10.15,200)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais','Lewis Carroll','Atlentida',18.8,200)

 --Recuperamos todos los datos de la tabla libros.
 --Veamos todos los campos la tabla:
 Select * From Libros

 --Veamos y recuperamos 
 --solamente el título, el Autor y el Editorial 
 --de todos los libros especificando los Nombres de los campos separados por comas:
 Select Titulo, Autor, Editorial 
  From Libros

 --Veamos y Recuperamos el títulos y el precios De todos los libros:
 Select Titulo, Precio 
  From Libros 

 --Veamos y Recuperampos el Editorial y la cantidad de libros la tipeamos:
 Select Editorial, Cantidad 
  From Libros

 /*********************************************************************************************************************************************/

 --6) Recuperar algunos Registros (Where).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla "Agenda" en la que registra los datos de sus amigos.

 --1- Elimine "Agenda", si existe:
 if object_id('Agenda') is not null
   Drop Table Agenda

 --2- Cree la tabla, con los siguientes campos: 

 /*Apellido(cadena de 30), Nombre(cadena de 20), 
   Domicilio(cadena de 30) y Telefono(cadena de 11).*/

 Create Table Agenda(
  Apellido varchar(30),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 GO

 --3- Visualice la estructura de la tabla "Agenda".
  Exec sp_columns Agenda

 --4- Ingrese los siguientes registros:
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Acosta', 'Ana', 'Colon 123', '4234567')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Bustamante', 'Betina', 'Avellaneda 135', '4458787')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez', 'Hector', 'Salta 545', '4887788')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez', 'Luis', 'Urquiza 333', '4545454')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez', 'Marisa', 'Urquiza 333', '4545454')

 --5- Seleccione todos los registros de la tabla.
 Select * From Agenda

 --6- Seleccione el registro cuyo Nombre sea "Marisa" (1 registro).
 Select * From Agenda 
  Where Nombre = 'Marisa'

 --7- Seleccione los Nombres y Domicilios de quienes tengan Apellido igual a "Lopez" (3 registros).
 Select Nombre, Domicilio 
  From Agenda 
  Where Apellido = 'Lopez'

 --8- Muestre el nombre de quienes tengan el teléfono "4545454" (2 registros).
 Select Nombre 
  From Agenda 
  Where Telefono = '4545454'

 --Ejercicio 2:

 --Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros disponible para la venta.

 --1- Elimine la tabla si existe.
 if object_id('Libros') is not null
  Drop Table Libros

 --2- Cree la tabla "libros". debe tener la siguiente estructura:
 Create Table Libros (
  Titulo varchar(20),
  Autor varchar(30),
  Editorial varchar(15)
 )

 GO

 --3- Visualice la estructura de la tabla "libros".
 Exec sp_columns Libros
 
 --4- Ingrese los siguientes registros:
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('El aleph','Borges','Emece')
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('Martin Fierro','Jose Hernandez','Emece')
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('Martin Fierro','Jose Hernandez','Planeta')
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('Aprenda PHP','Mario Molina','Siglo XXI')

 --5- Seleccione los registros cuyo Autor sea "Borges"(1 registro).
 Select * From Libros 
  Where Autor = 'Borges'

 --6- Seleccione los títulos de los libros cuyo editorial sea "Emece"(2 registros).
 Select Titulo From Libros 
  Where Editorial = 'Emece'

 --7- Seleccione los Nombres de los editoriales de los libros cuyo Titulo sea "Martin Fierro" (2 registros).
 Select Editorial From Libros 
  Where Titulo = 'Martin Fierro'

 --Ejercicio Resulto:

 --Trabajamos con la tabla "usuarios" que consta de 2 campos: Nombre de usuario y clave.

 --Eliminamos la tabla, si existe:
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 --Creamos la tabla:
 Create Table Usuarios(
  Nombre varchar(30),
  Clave varchar(10)
 )

 GO

 --Vemos la estructura de la tabla:
 Exec sp_columns Usuarios

 --Ingresamos algunos registros:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Marcelo','Boca') 
 Insert Into Usuarios(Nombre, Clave) 
  Values('JuanPerez','Juancito')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Susana','River')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Luis','River')

 --Recuparamos el usuario cuyo Nombre es "Leonardo".
 --Realizamos una consulta especificando una condición, queremos ver el usuario cuyo Nombre es "Leonardo":  
 Select * From Usuarios 
  Where Nombre = 'Leonardo' 

 --Recuparamos el usuario cuya clave es "River".
 --Queremos ver el nombre de los usuarios cuya clave es "River":
 Select Nombre From Usuarios 
  Where Clave = 'River' 

 --Recuparamos el usuario cuya clave es "Santi".
 --Realizamos un "Select" de los Nombres de los usuarios cuya clave es "Santi":
 Select Nombre From Usuarios 
  Where Clave = 'Santi'
  --no se muestra ningún registro ya que ninguno cumple la condición.

 /*********************************************************************************************************************************************/

 --7) Operadores Relacionales.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese Nombre.

 --1- Elimine "Articulos", si existe:
 if object_id('Articulos') is not null
  Drop Table Articulos

 --2- Cree la tabla, con la siguiente estructura:
 Create Table Articulos(
  Codigo integer,
  Nombre varchar(20),
  Descripcion varchar(30),
  Precio float,
  Cantidad integer
 )

 GO

 --3- Vea la estructura de la tabla(sp_columns).
 Exec sp_columns Articulos

 --4- Ingrese algunos registros:
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values (1,'Impresora','Epson Stylus C45',400.80, 20)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values (2,'Impresora','Epson Stylus C85',500,30)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values (3,'Monitor','Samsung 14',800,10)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values (4,'Teclado','Ingles Biswal',100,50)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values (5,'Teclado','Español Biswal',90,50)

 --5- Seleccione los datos de las Impresoras(2 registros).
 Select * From Articulos 
 Where Nombre = 'Impresora'

 --6- Seleccione los artículos cuyo precio sea mayor o igual a 400(3 registros).
 Select * From Articulos 
 Where Precio >= 400

 --7- Seleccione el código y Nombre de los artículos cuya Cantidad sea menor a 30(2 registros).
 Select Codigo, Nombre
  From Articulos
 Where Cantidad < 30

 --8- Selecciones el nombre y descripción de los artículos que no cuesten $100(4 registros).
 Select Nombre, Descripcion
  From Articulos
 Where Precio <> 100

 --Ejercicio 2:

 --Un video club que alquila películas en video almacena la información de sus películas en alquiler en una tabla denominada "Peliculas".

 --1- Elimine la tabla, si existe.
 if object_id('Peliculas') is not null
  Drop Table Peliculas

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Peliculas(
  Titulo varchar(20),
  Actor varchar(20),
  Duracion integer,
  Cantidad integer
 )

 GO

 --3- Ingrese los siguientes registros:
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Mision imposible', 'Tom Cruise', 120, 3)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Mision imposible 2', 'Tom Cruise',180, 4)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Mujer bonita', 'Julia R.', 90, 1)
 Insert Into Peliculas(Titulo, Actor, Duracion, Cantidad) 
  Values('Elsa y Fred', 'China Zorrilla', 80, 2)

 --4- Seleccione las películas cuya duración no supere los 90 minutos(2 registros).
 Select * From Peliculas
  Where Duracion <= 90

 --5- Seleccione el título de todas las películas en las que el actor no sea "Tom Cruise"(2 registros).
 Select * From Peliculas
  Where Actor <> 'Tom Cruise' 

 --6- Muestre todos los campos, excepto "duración", de todas las películas de las que haya más de 2 copias(2 registros).
 Select Titulo, Actor, Cantidad
  From Peliculas
 Where Cantidad > 2

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla "libros", si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --La creamos con la siguiente estructura:
 Create Table Libros(
  Titulo varchar(30),
  Autor varchar(30),
  Editorial varchar(15),
  Precio float
 )

 GO

 --Agregamos registros a la tabla:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph', 'Borges','Emece',24.50) 
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Martin Fierro', 'Jose Hernandez','Emece',16.00)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Aprenda PHP', 'Mario Molina', 'Emece' ,35.40)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Cervantes y el Quijote', 'Borges', 'Paidos', 50.90)

 --Seleccionamos los registros cuyo Autor sea diferente de 'Borges'.
 Select * From Libros 
  Where Autor <> 'Borges'

 --Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y el precio.
 Select Titulo, Precio 
  From Libros 
  Where Precio > 20

  /*note que el valor con el cual comparamos el campo "precio", 
  como es numérico (float), no se coloca entre comillas. 
  los libros cuyo precio es menor o igual a 20 pesos no aparece en la selección.*/

 --Recuperamos aquellos libros cuyo precio es menor o igual a 30.
 Select * From Libros 
  Where Precio <= 30

 /*********************************************************************************************************************************************/

 --8) Borrar Registros (Delete).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla "Agenda" que registra la información referente a sus amigos.

 --1- Elimine la tabla si existe:
 if object_id('Agenda') is not null
  Drop Table Agenda

  --2- Cree la tabla con los siguientes campos: 
  /*Apellido (cadena de 30), 
  Nombre (cadena de 20), 
  Domicilio (cadena de 30) 
  y Telefono (cadena de 11):*/

 Create Table Agenda(
  Apellido varchar(30),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 GO

 --3- Ingrese los siguientes registros(insert into):
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Alvarez','Alberto','Colon 123','4234567')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Juarez','Juan','Avellaneda 135','4458787') 
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez','Maria','Urquiza 333','4545454')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez','Jose','Urquiza 333','4545454')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Salas','Susana','Gral. Paz 1234','4123456')

 --4- Elimine el registro cuyo Nombre sea "Juan"(1 registro afectado).
 Delete From Agenda 
  Where Nombre = 'Juan'

 --5- Elimine los registros cuyo número telefónico sea igual a "4545454"(2 registros afectados):
 Delete From Agenda 
  Where Telefono = '4545454'

 --6- Muestre la tabla.
 Select * From Agenda

 --7- Elimine todos los registros(2 registros afectados):
 Delete From Agenda

 --8- Muestre la tabla.
 Select * From Agenda

 --Ejercicio 2:

 --Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese Nombre.

 --1- Elimine "Articulos", si existe:
 if object_id('Articulos') is not null
  Drop Table Articulos

 --2- Cree la tabla, con la siguiente estructura:
 Create Table Articulos(
  Codigo integer,
  Nombre varchar(20),
  Descripcion varchar(30),
  Precio float,
  Cantidad integer
 )

 GO

 --3- Vea la estructura de la tabla.
 Exec sp_columns Articulos

 --4- Ingrese algunos registros:
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values(1,'Impresora','Epson Stylus C45',400.80,20)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values(2,'Impresora','Epson Stylus C85',500,30)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values(3,'Monitor','Samsung 14',800,10)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values(4,'Teclado','Ingles Biswal',100,50)
 Insert Into Articulos(Codigo, Nombre, Descripcion, Precio, Cantidad) 
  Values(5,'Teclado','Español Biswal',90,50)

 --5- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros).
 Delete From Articulos 
  Where Precio >= 500

 ----6- Muestre la tabla.
 Select * From Articulos

 --7- Elimine todas las Impresoras (1 registro).
 Delete From Articulos 
  Where Nombre = 'Impresora'

 Select * From Articulos

 --8- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro).
 Delete From Articulos 
 Where Codigo <> 4

 --9- Mostrar la tabla después que borra cada registro.
 Select * From Articulos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "usuarios".

 --Eliminamos la tabla "usuarios", si existe:
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 --La creamos con la siguiente estructura:
 Create Table Usuarios(
  Nombre varchar(30),
  Clave varchar(10)
 )

 GO

 --Agregamos registros a la tabla:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Marcelo','River')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Susana','Chapita')
 Insert Into Usuarios(Nombre, Clave) 
  Values('CarlosFuentes','Boca')
 Insert Into Usuarios(Nombre, Clave) 
  Values('FedericoLopez','Boca')
 
 --Seleccionamos todos los registros:
 Select * From Usuarios

 --Vamos a eliminar el registro cuyo Nombre de usuario es "Marcelo":
 Delete From Usuarios 
  Where Nombre = 'Marcelo'

 --Veamos el contenido de la tabla:
 Select * From Usuarios

 --intentamos eliminarlo nuevamente:
 Delete From Usuarios 
  Where Nombre = 'Marcelo' 

 --Veamos el contenido de la tabla:
 Select * From Usuarios

 --Eliminamos todos los registros cuya clave es 'Boca':
 Delete From Usuarios 
 Where Clave = 'Boca' 

 --Veamos el contenido de la tabla:
 Select * From Usuarios 

 --Eliminemos todos los registros:
 Delete From Usuarios 

 Select * From Usuarios

 /*********************************************************************************************************************************************/

 --9) Actualizar Registros (Update).

 --Ejercicio 1:

 --Trabaje con la tabla "Agenda" que almacena los datos de sus amigos.

 --1- Elimine la tabla si existe:
 if object_id('Agenda') is not null
  Drop Table Agenda

 --2- Cree la tabla:
 Create Table Agenda(
  Apellido varchar(30),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 GO

 --3- Ingrese los siguientes registros (1 registro actualizado):
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Acosta','Alberto','Colon 123','4234567')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Juarez','Juan','Avellaneda 135','4458787')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez','Maria','Urquiza 333','4545454')
 Insert Into Agenda(Apellido, Nombre, Domicilio, Telefono) 
  Values('Lopez','Jose','Urquiza 333','4545454')
 Insert Into Agenda (Apellido, Nombre, Domicilio, Telefono) 
  Values('Suarez','Susana','Gral. Paz 1234','4123456')

 Select * From Agenda

 --4- Modifique el registro cuyo Nombre sea "Juan" por "Juan Jose" (1 registro afectado).
 Update Agenda set Nombre = 'Juan Jose' 
  Where Nombre = 'Juan'
 
 Select * From Agenda

 --5- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" (2 registros afectados).
 Update Agenda set Telefono = '4445566' 
  Where Telefono = '4545454'

 Select * From Agenda

 --6- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" 
 --(ningún registro afectado porque ninguno cumple con la condición del "Where").
 Update Agenda set Nombre = 'Juan Jose' 
  Where Nombre = 'Juan'

 --7 - Luego de cada actualización ejecute un Select que muestre todos los registros de la tabla.
 Select * From Agenda

 --Ejercicio 2:

 --Trabaje con la tabla "libros" de una librería.

 --1- Elimine la tabla si existe:
 if object_id('Libros') is not null
  Drop Table Libros

  --2- Créela con los siguientes campos: 
   /*Titulo (cadena de 30 caracteres de longitud), 
   Autor (cadena de 20), 
   Editorial (cadena de 15) 
   y precio (float):*/

 Create Table Libros (
  Titulo varchar(30),
  Autor varchar(20),
  Editorial varchar(15),
  Precio float
 )

 GO

 --3- Ingrese los siguientes registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25.00)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Martin Fierro','Jose Hernandez','Planeta',35.50)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Aprenda PHP','Mario Molina','Emece',45.50)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Cervantes y el quijote','Borges','Emece',25)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Matematica estas ahi','Paenza','Siglo XXI',15)

 --4- Muestre todos los registros (5 registros):
 Select * From Libros

 --5- Modifique los registros cuyo Autor sea igual  a "Paenza", por "Adrian Paenza" (1 registro afectado).
 Update Libros set Autor = 'Adrian Paenza' 
 Where Autor = 'Paenza'

 Select * From Libros

 --6- Nuevamente, modifique los registros 
 --cuyo Autor sea igual a "Paenza", por "Adrian Paenza" (ningún registro afectado porque ninguno cumple la condición).
 Update Libros set Autor = 'Adrian Paenza' 
 Where Autor = 'Paenza'

 Select * From Libros

 --7- Actualice el precio del libro de "Mario Molina" a 27 pesos (1 registro afectado):
 Update Libros set Precio = 27
 Where Autor = 'Mario Molina'

 Select * From Libros

 --8- Actualice el valor del campo "editorial" por "Emece S.A.", 
 --para todos los registros cuyo editorial sea igual a "Emece" (3 registros afectados):

 Update Libros set Editorial = 'Emece S.A.'
 Where Editorial = 'Emece'

 --9 - Luego de cada actualización ejecute un Select que mustre todos los registros de la tabla.
 Select * From Libros

 --Ejercicio Resulto:

 --Trabajamos con la tabla "usuarios".

 --Eliminamos la tabla si existe:
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 --Creamos la tabla:
 Create Table Usuarios(
  Nombre varchar(20),
  Clave varchar(10)
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Usuarios(Nombre, Clave) 
  Values('Marcelo','River')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Susana','chapita')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Carlosfuentes','Boca')
 Insert Into Usuarios(Nombre, Clave) 
  Values('Federicolopez','Boca')

 Select * From Usuarios

 --Cambiaremos los valores de todas las claves, por la cadena "RealMadrid":
 Update Usuarios set Clave = 'RealMadrid'

 --El cambio afectó a todos los registros, veámoslo:
 Select * From Usuarios

 --Necesitamos cambiar el valor de la clave del usuario llamado "Federico Lopez" por "Boca":
 Update Usuarios set Clave = 'Boca' 
  Where Nombre = 'FedericoLopez'

 --Verifiquemos que la actualización se realizó:
 Select * From Usuarios 

 --Vimos que si Microsoft SQL Server no encuentra registros que cumplan con la condición no se modifican registros:
 Update Usuarios set Clave = 'payaso' 
  Where Nombre = 'JuanaJuarez'
 
 --Si vemos la tabla veremos que no a cambiado:
 Select * From Usuarios 

 --Para actualizar varios campos en una sola instrucción empleamos:
 Update Usuarios set Nombre = 'MarceloDuarte', Clave = 'Marce' 
  Where Nombre = 'Marcelo' 

 --Si vemos la tabla:
 Select * From Usuarios

 /*********************************************************************************************************************************************/

 --10) Comentarios.

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería. 

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Titulo varchar(30), --Titulo del libro.
  Autor varchar(20), --Autor de libro.
  Editorial varchar(15)
 )

 GO

 --Agregamos un registro:
 Insert Into Libros(Titulo, Autor, Editorial) 
  Values('El aleph','Borges','Emece')

 --Mostramos los registros de libros:
 Select * From Libros

 Select Titulo, Autor /*mostramos títulos y Nombres de los Autores*/
 From Libros --note que lo que está entre los símbolos asi /**/ se ejecuta el Select inorando los caracteres.

 /*********************************************************************************************************************************************/

 --11) Valores Null (IS NULL).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

 --1- Elimine la tabla, si existe:
 if object_id('Medicamentos') is not null
  Drop Table Medicamentos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Medicamentos(
  Codigo integer not null,
  Nombre varchar(20) not null,
  Laboratorio varchar(20),
  Precio float,
  Cantidad integer not null
 )

 GO

 --3- Visualice la estructura de la tabla "medicamentos":
 Exec sp_columns Medicamentos --Note que los campos "codigo", "nombre" y "cantidad", 
                              --en la columna "IS_NULLABLE" aparece "no" y en las otras "yes". 

 --4- Ingrese algunos registros con valores "null" para los campos que lo admitan:
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(1,'Sertal gotas',null,null,100)
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(2,'Sertal compuesto',null,8.90,150)
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(3,'Buscapina','Roche',null,200)

 --5- Vea todos los registros:
 Select * From Medicamentos

 --6- Ingrese un registro con valor "0" 
 --para el precio y cadena vacía para el Laboratorio: Insert Into Medicamentos (Codigo, Nombre, Laboratorio, Precio, Cantidad).
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(4,'Bayaspirina','',0,150)

 --7- Ingrese un registro con valor "0" para el código y Cantidad y cadena vacía para el nombre:
 --Insert Into Medicamentos (Codigo, Nombre, Laboratorio, Precio, Cantidad).
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(0,'','Bayer',15.60,0)

 --8- Muestre todos los registros:
 Select * From Medicamentos

 --9- intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error):
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(null,'Amoxidal jarabe','Bayer',25,120)

 --10- Recupere los registros que contengan valor "null" en el campo "Laboratorio", luego los que 
 --tengan una cadena vacía en el mismo campo. note que el resultado es diferente.
 Select * From Medicamentos 
 Where Laboratorio is null

 --11- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el 
 --valor 0 en el mismo campo. note que el resultado es distinto.
 Select * From Medicamentos 
 Where Laboratorio = ''

 --12- Recupere los registros cuyo Laboratorio no contenga una cadena vacía, luego los que sean distintos de "null".
 Select * From Medicamentos 
 Where Precio is null

 /*note que la salida de la primera sentencia no muestra los registros con cadenas vacías y tampoco los 
 que tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
 campo Laboratorio (incluso cadena vacía).*/

 --13- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null":
 Select * From Medicamentos 
 Where Precio = 0

 /*note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que 
 tienen valor nulo; el resultado de la segunda sentencia muestra los registros con valor para el 
 campo Precio (incluso el valor 0).*/

 Select * From Medicamentos 
 Where Laboratorio <>''
 --------------------------

 Select * From Medicamentos 
  Where Laboratorio is not null
 ------------------------------

 Select * From Medicamentos 
  Where Precio <> 0
 --------------------------

 Select * From Medicamentos 
  Where Precio is not null
 --------------------------

 --Ejercicio 2:

 --Trabaje con la tabla que almacena los datos sobre películas, llamada "Peliculas".

 --1- Elimine la tabla si existe:
 if object_id('Peliculas') is not null
  Drop Table Peliculas

 --2- Cree la tabla con la siguiente estructura:
 Create Table Peliculas(
  Codigo int not null,
  Titulo varchar(40) not null,
  Actor varchar(20),
  Duracion int
 )

 GO

 --3- Visualice la estructura de la tabla.
 Exec sp_columns Peliculas
 --note que el campo "codigo" y "titulo", en la columna "IS_NULLABLE" muestra "no" y los otros campos "yes".

 --4- Ingrese los siguientes registros:
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(1,'Mision imposible', 'Tom Cruise', 120)
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(2,'Harry Potter y la piedra filosofal', null, 180)
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(3,'Harry Potter y la camara secreta','Daniel R.',null)
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(0,'Mision imposible 2','',150)
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(4,'','L. Di Caprio',220)
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(5,'Mujer bonita', 'R. Gere-J. Roberts', 0)

 --5- Recupere todos los registros para ver cómo SQL Server los almacenó:
 Select * From Peliculas

 --6- intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error):
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(null,'Mujer bonita', 'R. Gere-J. Roberts', 190)

 --7- Muestre los registros con valor nulo en el campo "Actor" y luego los que guardan una cadena vacía 
 --(note que la salida es distinta) (1 registro).
 Select * From Peliculas 
  Where Actor is null

 --8- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro actualizado).
 Update Peliculas set Duracion = 120 
  Where Duracion is null

 --9- Coloque 'Desconocido' en el campo "Actor" en los registros que tengan una cadena vacía en dicho campo (1 registro afectado).
 Update Peliculas set Actor = 'Desconocido'
  Where Actor = ''

 --10- Muestre todos los registros. note que el cambio anterior no afectó a los registros con valor nulo en el campo "Actor".
 Select * From Peliculas

 --11- Elimine los registros cuyo título sea una cadena vacía (1 registro).
 Delete From Peliculas 
  Where Titulo =''

 Select * From Peliculas

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla "libros", si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla especificando que los campos "titulo" y "autor" no admitan valores nulos:
 Create Table Libros(
  Titulo varchar(30) not null,
  Autor varchar(30) not null,
  Editorial varchar(15) null,
  Precio float
 )

 GO

 --Los campos "editorial" y "precio" si permiten valores nulos; 
 --el primero, porque lo especificamos colocando "null" en la definición del campo, el segundo lo asume por defecto.

 --Agregamos un registro a la tabla con valor nulo para el campo "precio":
 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('El aleph','Borges','Emece',null)

 --Recuerde que el valor "null" no es una cadena de caracteres, por lo tanto no se coloca entre comillas.
 --Ingresamos otro registro, con valor nulo para el campo "editorial", campo que admite valores "null":

 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('Alicia en el pais','Lewis Carroll',null,0)

 --Veamos lo que sucede si Intentamos ingresar el valor "null" en campos que no lo admiten, como "titulo":
 --Insert Into Libros(Titulo, Autor, Editorial, Precio)
  --Values(null,'Borges','Siglo XXI',25)
 --aparece un mensaje y la sentencia no se ejecuta.

 --Para ver cuáles campos admiten valores nulos y cuáles no, empleamos el procedimiento almacenado "sp_columns":

  Exec sp_columns Libros
 --nos muestra muchas columnas, una de ellas tiene el encabezado "IS_NULLABLE", 
 --vemos que aparece "no" en los campos que no permiten valores nulos y "yes" en los campos que si los permiten.

 --Dijimos que el valor "null" no es lo mismo que una cadena vacía. 
 --Vamos a ingresar un registro con cadena vacía para el campo "editorial":

 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('Uno','Richard Bach','',18.50)
--Ingresamos otro registro, ahora cargamos una cadena vacía en el campo "titulo":

 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('','Richard Bach','Planeta',22)
 --Veamos todos los registros ingresados:

 Select * From Libros
 --Recuperemos los registros que contengan el valor "null" en el campo "precio":

 Select * From Libros
  Where Precio is null
 --La sentencia anterior tEndrá una salida diferente a la siguiente:

 Select * From Libros
  Where Precio = 0

 --con la primera sentencia veremos los libros cuyo precio es igual a "null"(desconocido); con la segunda, los libros cuyo precio es 0.

 --Recuperemos los libros cuyo Nombre de editoriales "null":

 Select * From Libros
  Where Editorial is null
 --Ahora veamos los libros cuyo editorial almacena una cadena vacía:

 Select * From Libros
  Where Editorial = ''
 --Para recuperar los libros cuyo precio no sea nulo tipeamos:

 Select * From Libros
  Where Precio is not null

 /*********************************************************************************************************************************************/

 --12) Clave Primaria.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla "libros" de una librería.

 --1- Elimine la tabla si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --2- Créela con los siguientes campos, estableciendo como clave primaria el campo "codigo":
 Create Table Libros(
  Codigo int not null,
  Titulo varchar(40) not null,
  Autor varchar(20),
  Editorial varchar(15),Primary Key(Codigo)
 )

 GO

 --3- Ingrese los siguientes registros:
 Insert Into Libros(Codigo, Titulo, Autor, Editorial)
  Values(1,'El aleph','Borges','Emece')
 Insert Into Libros(Codigo, Titulo, Autor, Editorial)
  Values(2,'Martin Fierro','Jose Hernandez','Planeta')
 Insert Into Libros(Codigo, Titulo, Autor, Editorial)
  Values(3,'Aprenda PHP','Mario Molina','Nuevo Siglo')

 --4- Ingrese un registro con código repetido (aparece un mensaje de error).
 --Insert Into Libros(Codigo, Titulo, Autor, Editorial)
   --Values(2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')

 --5- intente ingresar el valor "null" en el campo "codigo".
 --Insert Into Libros(Codigo, Titulo, Autor, Editorial)
   --Values(null,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta')

 --6- intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error).
 --Update Libros set Codigo = 1
   --Where Titulo = 'Martin Fierro'

 Select * From Libros

 --Ejercicio 2:

 --Un instituto de enseñanza almacena los datos de sus estuDiantes en una tabla llamada "Alumnos".

 --1- Elimine la tabla "Alumnos" si existe:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 --2- Cree la tabla con la siguiente estructura intentando esTablecer 2 campos como clave primaria, 
 --el campo "Documentos" y "Legajo" (no lo permite):
 /*Create Table Alumnos(
  Legajo varchar(4) not null,
  Documentos varchar(8),
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Documentos),
  Primary Key(Legajo)
 )*/

 --3- Cree la tabla estableciendo como clave primaria el campo "Documentos":
 Create Table Alumnos(
  Legajo varchar(4) not null,
  Documentos varchar(8),
  Nombre varchar(30),
  Domicilio varchar(30),Primary Key(Documentos)
 )

 GO

 --4- Verifique que el campo "Documentos" no admite valores nulos:
  Exec sp_columns Alumnos

 --5- Ingrese los siguientes registros:
 Insert Into Alumnos(Legajo, Documentos, Nombre, Domicilio)
  Values('A233','22345345','Perez Mariana','Colon 234')
 Insert Into Alumnos(Legajo, Documentos, Nombre, Domicilio)
  Values('A567','23545345','Morales Marcos','Avellaneda 348')

 --6- intente ingresar un alumno con número de Documentos existente (no lo permite).
 --Insert Into Alumnos(Legajo, Documentos, Nombre, Domicilio)
  --Values('A642','23545345','Gonzalez Analia','Caseros 444')

 --7- intente ingresar un alumno con Documentos nulo (no lo permite).
 --Insert Into Alumnos(Legajo, Documentos, Nombre, Domicilio)
  --Values('A685',null,'Miranda Carmen','Uspallata 999')

  Select * From Alumnos

 --Problema Resuelto:

 --Trabajamos con la tabla "usuarios".

 --Eliminamos la tabla, si existe:
 if object_id('Usuarios') is not null
  Drop Table Usuarios

 --Creamos la tabla definiendo el campo "nombre" como clave primaria:
 Create Table Usuarios(
  Nombre varchar(20),
  Clave varchar(10),Primary Key(Nombre)
 )

 GO

 --Al campo "nombre" no lo definimos "not null", 
 --pero al establecerse como clave primaria, SQL Server lo convierte en "not null", 
 --veamos que en la columna "IS_NULLABLE" aparece "no":
 Exec sp_columns Usuarios

 --Ingresamos algunos registros:
 Insert Into Usuarios(Nombre, Clave) 
  Values('JuanPerez','Boca')

 Insert Into Usuarios(Nombre, Clave) 
  Values('RaulGarcia','River')

 --Intentamos ingresar un valor de clave primaria existente (genera error).

 --Insert Into Usuarios(Nombre, Clave) 
  --Values('JuanPerez','payaso') --Aparece un mensaje de error y la sentencia no se ejecuta.

 --Intentamos ingresar el valor "null" en el campo clave primaria (genera error).

 --Insert Into Usuarios(Nombre, Clave) 
  --Values(null,'payaso') --Aparece un mensaje de error y la sentencia no se ejecuta.


 --intentemos actualizar el nombre de un usuario colocando un nombre existente (genera error).

 --Update Usuarios set Nombre = 'JuanPerez' 
  --Where Nombre = 'RaulGarcia'  --Aparece un mensaje indicando que se viola la clave primaria y la actualización no se realiza.

 Select * From Usuarios

 /*********************************************************************************************************************************************/
  
 --13) Campo Con Atributo (IDENTITY).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

 --1- Elimine la tabla,si existe:
 if object_id('Medicamentos') is not null
  Drop Table Medicamentos

 --2- Cree la tabla con un campo "codigo" que genere valores secuenciales automanticamente:
 Create Table Medicamentos(
  Codigo int identity,
  Nombre varchar(20) not null,
  Laboratorio varchar(20),
  Precio float,
  Cantidad integer
 )

 GO

 --3- Visualice la estructura de la tabla "medicamentos":
 Exec sp_columns Medicamentos

 --4- Ingrese los siguientes registros:
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Sertal','Roche',5.2,100)
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Buscapina','Roche',4.10,200)
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Amoxidal 500','Bayer',15.60,100)

 --5- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 Select * From Medicamentos

 --6- Intente ingresar un registro con un valor para el campo "codigo".
 --Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  --Values(4,'Amoxilina 500','Bayer',15.60,100)

 --7- Intente actualizar un valor de código (aparece un mensaje de error).
 --Update Medicamentos set Codigo = 5 
  --Where Nombre = 'Bayaspirina'

 --8- Elimine el registro con Codigo "3" (1 registro eliminado).
 Delete From Medicamentos 
  Where Codigo = 3

 --9- Ingrese un nuevo registro:
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Amoxilina 500','Bayer',15.60,100)

 --10- Seleccione todos los registros para ver qué valor guardó SQL Server en el campo código:
 Select * From Medicamentos

 --Ejercicio 2:

 --Un video club almacena información sobre sus películas en una tabla llamada "Peliculas".

  --1- Elimine la tabla si existe:
  if object_id('Peliculas') is not null
   Drop Table Peliculas

  --2- Créela definiendo un campo "codigo" autoincrementable y como clave primaria:
  Create Table Peliculas(
   Codigo int identity,
   Titulo varchar(40),
   Actor varchar(20),
   Duracion int,
   Primary Key(Codigo)
  )

  GO

 --3- Ejecute el procedimiento almacenado para visualizar la estructura de la tabla:
 Exec sp_columns Peliculas

 --4- Ingrese los siguientes registros:
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Mision imposible','Tom Cruise',120)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Harry Potter y la piedra filosofal','Daniel R.',180)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Harry Potter y la camara secreta','Daniel R.',190)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Mision imposible 2','Tom Cruise',120)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('La vida es bella','zzz',220)

 --5- Seleccione todos los registros y verifique la carga automática de los códigos:
 Select * From Peliculas

 --6- intente actualizar el Codigo de una película (aparece un mensaje de error).
 --Update Peliculas set Codigo = 7 
  --Where Codigo = 4

 --7- Elimine la película "La vida es bella".
 Delete From Peliculas 
  Where Titulo = 'La vida es bella'

 --8- Ingrese un nuevo registro.
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Elsa y Fred','China Zorrilla',90)

 --9- Visualice los registros para ver el valor almacenado en Codigo (valor 6):
 Select * From Peliculas

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla "libros", si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 /*Creamos la tabla especificando que el campos "codigo" 
 genere valores secuenciales comenzando en 1 e incrementándose en 1 automanticamente:*/

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15),
  Precio float
 )

 GO

 --Ingresamos algunos registros, recordando que si un campo tiene el atributo "identity" debemos omitirlo en la inserción:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',23)

 --Veamos cómo se almacenó:
 Select * From Libros
 --Este primer registro ingresado guarda el valor 1 en el campo correspOndiente al código.

 --continuemos ingresando registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Uno','Richard Bach','Planeta',18)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Aprenda PHP', 'Mario Molina','Siglo XXI',45.60)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Alicia en el Pais de maravillas','Lewis Carroll','Paidos',15.50)

 --Veamos cómo se almacenaron:
 Select * From Libros

 --Intentamos ingresar un valor para el campo codigo (genera un error).
 --Insert Into Libros(Codigo, Titulo, Autor, Editorial, Precio) 
  --Values(5,'Martin Fierro','Jose Hernandez','Paidos',25) 

 --Intentamos cambiar el valor del codigo de un registro (genera un error).
 --Update Libros set Codigo = 9 
  --Where Titulo = 'Uno' --generará un mensaje de error.

 --Vamos a ver la estructura de la tabla ejecutando el siguiente procedimiento almacenado:
 Exec sp_columns Libros

 --Eliminemos el último registro:
 Delete From Libros 
  Where Autor = 'Lewis Carroll'
 
 --Ingresamos un quinto registro.
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Martin Fierro','Jose Hernandez','Paidos',25)

 --El campo codigo se guardo el valor secuencial que el valor "4" ya no existe.
 Select * From Libros
 
 /*********************************************************************************************************************************************/

 --14) Otras Caracterésticas Del Atributo Identity.

 --Ejercicios Propuestos.

 --Ejercicio 1: 

 --Una farmacia guarda información referente a sus medicamentos en una tabla llamada "medicamentos".

 --1- Elimine la tabla,si existe:
 if object_id('Medicamentos') is not null
  Drop Table Medicamentos

 --2- Cree la tabla con un campo "codigo" que genere valores secuenciales automanticamente comenzando en 10 e incrementándose en 1:
 Create Table Medicamentos(
  Codigo integer identity(10,1),
  Nombre varchar(20) not null,
  Laboratorio varchar(20),
  Precio float,
  Cantidad integer
 )

 GO

 --3- Ingrese los siguientes registros: 
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Sertal','Roche',5.2,100)
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Buscapina','Roche',4.10,200)
 Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  Values('Amoxidal 500','Bayer',15.60,100)

 --4- Verifique que SQL Server generó valores para el campo "código" de modo automático:
 Select * From Medicamentos

 --5- intente ingresar un registro con un valor para el campo "codigo".
 --Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  --Values(4,'Amoxilina 500','Bayer',15.60,100)

 --6- setee la opción "identity_Insert" en "On".
 set identity_insert Medicamentos on

 --7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):
 --Insert Into Medicamentos(Nombre, Laboratorio, Precio, Cantidad) 
  --Values('Amoxilina 500','Bayer',15.60,100)

 --8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.
 Insert Into Medicamentos(Codigo, Nombre, Laboratorio, Precio, Cantidad) 
  Values(10,'Amoxilina 500','Bayer',15.60,100)

 --9- Use la función "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla "medicamentos".
 Select ident_seed('Medicamentos')

 --10- Emplee la función "ident_incr()" para saber cuál es el valor de incremento del campo "identity" de "medicamentos".
 Select ident_incr('Medicamentos')

 --11- setee la opción "identity_Insert" en "off".
 set identity_insert Medicamentos off

 Select * From Medicamentos

 --Ejercicio 2:

 --Un video club almacena información sobre sus películas en una tabla llamada "Peliculas".

 --1- Elimine la tabla si existe:
 if object_id('Peliculas') is not null
  Drop Table Peliculas

 --2- Créela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:
 Create Table Peliculas(
  Codigo int identity(50,3),
  Titulo varchar(40),
  Actor varchar(20),
  Duracion int
 )

 GO

 --3- Ingrese los siguientes registros:
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Mision imposible','Tom Cruise',120)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Harry Potter y la piedra filosofal','Daniel R.',180)
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Harry Potter y la camara secreta','Daniel R.',190)

 --4- Seleccione todos los registros y verifique la carga automática de los códigos:
 Select * From Peliculas

 --5- setee la opción "identity_Insert" en "On".
 set identity_insert Peliculas on

 --6- Ingrese un registro con valor de código menor a 50.
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion)  
  Values(20,'Mision imposible 2','Tom Cruise',120)

 --7- Ingrese un registro con valor de código mayor al último generado.
 Insert Into Peliculas(Codigo, Titulo, Actor, Duracion) 
  Values(80,'La vida es bella','zzz',220)

 --8- Averigue el valor de inicio del campo "identity" de la tabla "Peliculas".
 Select ident_seed('Peliculas')

 --9- Averigue el valor de incremento del campo "identity" de "Peliculas".
 Select ident_incr('Peliculas')

 --10- Intente ingresar un registro sin valor para el campo código.
 --Insert Into Peliculas(Titulo, Actor, Duracion) 
  --Values('Elsa y Fred','China Zorrilla',90)

 --11- Desactive la opción se inserción para el campo de identidad.
 set Identity_Insert Peliculas off

 --12- Ingrese un nuevo registro y muestre todos los registros 
 --para ver cómo SQL Server siguió la secuencia tomando el último valor del campo como referencia.
 Insert Into Peliculas(Titulo, Actor, Duracion) 
  Values('Elsa y Fred','China Zorrilla',90)

 Select * From Peliculas

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla "libros", si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla especificando que el campos "codigo" genere valores secuenciales comenzando en 100 e incrementándose en 2 automanticamente:
 Create Table Libros(
  Codigo int identity(100,2),
  Titulo varchar(20),
  Autor varchar(30),
  Precio float
 )

 GO

 --Ingresamos algunos registros, recordando que si un campo tiene el atributo "identity" debemos omitirlo en la inserción:
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('El aleph','Borges',23)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Uno','Richard Bach',18)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Aprenda PHP','Mario Molina',45.60)

 --Veamos cómo se almacenaron:
 Select * From Libros
 
 --Para saber cuál es el valor de inicio del campo "identity" de la tabla "libros" tipeamos.
 Select ident_seed('Libros') --retorna "2".

 --Para permitir ingresar un valor en un campo de identidad activamos la opción "identity_Insert":
 set identity_insert Libros on

 --Recordamos que si "identity_insert" esta en on, la instrucción "insert" debe explicar un valor:
 Insert Into Libros(Codigo, Titulo, Autor) 
  Values(100,'Matematica esta ahi','Paenza')

 --Ingresamos otro registro:
 Insert Into Libros(Codigo, Titulo, Autor) 
  Values(1,'Ilusiones','Richard Bach')
 --note que ingresamos un valor de código menor al valor de inicio de la secuencia, está permitido.

 --Para desactivar la opción "identity_Insert" tipeamos:
 set identity_insert Libros off

 Select * From Libros

 /*********************************************************************************************************************************************/

 --15) Truncate Table.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un instituto de enseñanza almacena los datos de sus estuDiantes en una tabla llamada "Alumnos".

 --1- Elimine la tabla "Alumnos" si existe:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Alumnos(
  Legajo int identity,
  Documentos varchar(8),
  Nombre varchar(30),
  Domicilio varchar(30)
 )

 GO

 --3- Ingrese los siguientes registros y muéstrelos para ver la secuencia de códigos:
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('22345345','Perez Mariana','Colon 234')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('23545345','Morales Marcos','Avellaneda 348')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('24356345','Gonzalez Analia','Caseros 444')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('25666777','Torres Ramiro','DinaMarca 209')

 --4- Elimine todos los registros con "Delete".
 Delete From Alumnos

 --5- Ingrese los siguientes registros y selecciónelos para ver cómo SQL Server generó los códigos:
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('22345345','Perez Mariana','Colon 234')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('23545345','Morales Marcos','Avellaneda 348')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('24356345','Gonzalez Analia','Caseros 444')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('25666777','Torres Ramiro','DinaMarca 209')
 
 Select * From Alumnos

 --6- Elimine todos los registros con "truncate Table".
 truncate Table Alumnos

 --7- Ingrese los siguientes registros y muestre todos los registros para ver que SQL Server reinició la secuencia del campo "identity":
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('22345345','Perez Mariana','Colon 234')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('23545345','Morales Marcos','Avellaneda 348')
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('24356345','Gonzalez Analia','Caseros 444');
 Insert Into Alumnos(Documentos, Nombre, Domicilio) 
  Values('25666777','Torres Ramiro','DinaMarca 209')

 Select * From Alumnos

 --Ejercicio 2:

 --Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese Nombre.

 --1- Elimine "Articulos", si existe:
 if object_id('Articulos') is not null
   Drop Table Articulos

 --2- Cree la tabla, con la siguiente estructura:
 Create Table Articulos(
  Codigo integer identity,
  Nombre varchar(20),
  Descripcion varchar(30),
  Precio float
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Impresora','Epson Stylus C45',400.80)
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Impresora','Epson Stylus C85',500)

 --4- Elimine todos los registros con "truncate Table".
 truncate Table Articulos

 --5- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos se reinicia:
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Monitor','Samsung 14',800)
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Teclado','Ingles Biswal',100)
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Teclado','Español Biswal',90)
 
 Select * From Articulos

 --6- Elimine todos los registros con "Delete".
 Delete From Articulos

 --7- Ingrese algunos registros y muéstrelos para ver que la secuencia de códigos continua:
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Monitor','Samsung 14',800)
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Teclado','Ingles Biswal',100)
 Insert Into Articulos(Nombre, Descripcion, Precio) 
  Values('Teclado','Español Biswal',90)

 Select * From Articulos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería. 

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(30),
  Autor varchar(20),
  Editorial varchar(15),
  Precio float
 )

 GO

 --Agregamos algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25.60)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Uno','Richard Bach','Planeta',18)
 
 --Seleccionamos todos los registros:
 Select * From Libros

 --Truncamos la tabla:
 Truncate Table Libros

 --Ingresamos nuevamente algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25.60)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Uno','Richard Bach','Planeta',18)

 --Si Seleccionamos todos los registros vemos que la secuencia se reinició en 1:
 Select * From Libros

 --Eliminemos todos los registros con "Delete":
 Delete From Libros

 --Ingresamos nuevamente algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25.60)
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('Uno','Richard Bach','Planeta',18)

 --Seleccionamos todos los registros y vemos que la secuencia continuó:
 Select * From Libros

 /*********************************************************************************************************************************************/

 --17) Tipo De Dato (Texto).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla llamada "autos".

 --1- Elimine la tabla "autos" si existe:
 if object_id('Autos') is not null
  Drop Table Autos

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo.
 Create Table Autos(
  Patente char(6),
  Marca varchar(20),
  Modelo char(4),
  Precio float, Primary Key(Patente)
 )

 GO

 /*Hemos definido el campo "Patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
 siempre tEndrá la misma longitud (6 caracteres). Lo mismo sucede con el campo "Modelo", en el cual 
 almacenaremos el año, necesitamos 4 caracteres fijos.*/

 --3- Ingrese los siguientes registros:
 Insert Into Autos 
  Values('ACD123','Fiat 128','1970',15000)
 Insert Into Autos 
  Values('ACG234','Renault 11','1990',40000)
 Insert Into Autos 
  Values('BCD333','Peugeot 505','1990',80000)
 Insert Into Autos 
  Values('GCD123','Renault Clio','1990',70000)
 Insert Into Autos 
  Values('BCC333','Renault Megane','1998',95000)
 Insert Into Autos 
  Values('BVF543','Fiat 128','1975',20000)

 --4- Seleccione todos los Autos del año 1990:
 Select * From Autos 
  Where Modelo = '1990'

 --Ejercicio 2:

 --Una empresa almacena los datos de sus clientes en una tabla llamada "Clientes".

 --1- Elimine la tabla "clientes" si existe:
 if object_id('Clientes') is not null
  Drop Table Clientes

 --2- Créela eligiendo el tipo de dato más adecuado para cada campo:
 Create Table Clientes(
  Documentos char(8),
  Apellido varchar(20),
  Nombre varchar(20),
  Domicilio varchar(30),
  Telefono varchar (11)
 )

 GO

 --3- Analice la definición de los campos. 
 
 /*Se utiliza char(8) para el Documentos porque siempre constará 
 de 8 caracteres. Para el número telefónico se usar "varchar" y no un tipo numérico porque si bien es 
 un número, con él no se realizarán operaciones matemáticas.*/

 --4- Ingrese algunos registros:
 Insert Into Clientes 
  Values('2233344','Perez','Juan','Sarmiento 980','4342345')
 Insert Into Clientes(Documentos, Apellido, Nombre, Domicilio) 
  Values('2333344','Perez','Ana','Colon 234')
 Insert Into Clientes 
  Values('2433344','Garcia','Luis','Avellaneda 1454','4558877')
 Insert Into Clientes 
  Values('2533344','Juarez','Ana','Urquiza 444','4789900')

 --5- Seleccione todos los clientes de Apellido "Perez" (2 registros):
 Select * From Clientes 
  Where Apellido = 'Perez'

 --Ejercicio Resulto:

 /*Un comercio que tiene un stand en una feria registra en una tabla llamada 
 "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.*/

 --Eliminamos la tabla, si existe:
 if object_id('Visitantes') is not null
  Drop Table Visitantes

 Create Table Visitantes(
  Nombre varchar(30),
  Edad integer,
  Sexo char(1), --no se pude Insertar más de un caracter dentro del Insert.
  Domicilio varchar(30),
  Ciudad varchar(20),
  Telefono varchar(11)
 )

 GO

 /*Los campos "nombre", "domicilio" y "ciudad" almacenarán valores cuya longitud varía, 
 por ello elegimos el tipo "varchar" y le damos a cada uno una longitud máxima estimando su tamaño. 
 El campo "sexo" se define de tipo "char", porque necesitamos solamente 1 caracter "f" o "m", que siempre será fijo. 
 El campo "telefono" también se define como varchar porque no todos los números telefónicos tienen la misma longitud.*/

 GO

 --Intentamos ingresar una cadena de mayor longitud que la definida: en el campo sexo no se pude usar masc (se genera error).
 --Porque es más de un caracter.
 Insert Into Visitantes(Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono)  
  Values('Juan Juarez',32,'m','Avellaneda 789','Cordoba','4234567')

 --Ingresamos un número telefónico olvidando las comillas, es decir, como un valor numérico:
 Insert Into Visitantes(Nombre, Edad, Sexo, Domicilio, Ciudad, Telefono) 
  Values('Marcela Morales',43,'f','Colon 456','Cordoba',4567890)

 Select * From Visitantes

 /*********************************************************************************************************************************************/

 --18) Tipo De Dato (Numérico).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".

 --La tabla contiene estos datos:

 --Número de Cuenta    Documentos       Nombre            Saldo
 /*_______________________________________________________________
        1234           25666777        Pedro Perez       500000.60
        2234           27888999        Juan Lopez        -250000
        3344           27888999        Juan Lopez        4000.50
        3346           32111222        Susana Molina     1000*/

 --1- Elimine la tabla "cuentas" si existe:
 if object_id('Cuentas') is not null
  Drop Table Cuentas

 --2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:
 Create Table Cuentas(
  Numero int not null,
  Documentos char(8),
  Nombre varchar(30),
  Saldo money, Primary Key(Numero)
 )

 GO
 -- Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
 -- Documentos del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 -- Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 -- Saldo de la cuenta: valores altos con decimales.

 --3- Ingrese los siguientes registros:
 Insert Into Cuentas(Numero, Documentos, Nombre, Saldo) 
  Values('1234','25666777','Pedro Perez',500000.60)
 Insert Into Cuentas(Numero, Documentos, Nombre, Saldo) 
  Values('2234','27888999','Juan Lopez',-250000)
 Insert Into Cuentas(Numero, Documentos, Nombre, Saldo) 
  Values('3344','27888999','Juan Lopez',4000.50)
 Insert Into Cuentas(Numero, Documentos, Nombre, Saldo) 
  Values('3346','32111222','Susana Molina',1000)

 --4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros).
 Select * From Cuentas 
  Where Saldo < 4000

 --5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 registros).
 Select Numero, Saldo 
  From Cuentas 
  Where Nombre = 'Juan Lopez'

 --6- Muestre las cuentas con saldo negativo (1 registro).
 Select * From Cuentas 
  Where Saldo < 0

 --7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
 Select * From Cuentas 
  Where Numero >= 3000

 --Ejercicio 2:

  /*Una empresa almacena los datos de sus empleados en una tabla "Empleados" 
  que guarda los siguientes datos: Nombre, Documentos, Sexo, Domicilio, SueldoBasico.*/

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Empleados(
  Nombre varchar(30),
  Documentos char(8),
  Sexo char(1),
  Domicilio varchar(30),
  SueldoBasico decimal(7,2), --máximo estimado 99999.99.
  CantidadHijos tinyint --no superará los 255.
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico, CantidadHijos) 
  Values('Juan Perez','22333444','m','Sarmiento 123',500,2)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico, CantidadHijos) 
  Values('Ana Acosta','24555666','f','Colon 134',850,0)
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico, CantidadHijos) 
  Values('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4)

 --4- Ingrese un valor de "SueldoBasico" con más decimales que los definidos (redondea los decimales al valor más cercano 800.89):
 Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico, CantidadHijos) 
  Values('Susana Molina','29000555','f','Salta 876',800.888,3)

 --5- intente ingresar un Sueldo que supere los 7 dígitos (no lo permite).
 --Insert Into Empleados(Nombre, Documentos, Sexo, Domicilio, SueldoBasico, CantidadHijos) 
  --Values('Marta Juarez','32444555','f','Sucre 1086',5000000,2)

 --6- Muestre todos los empleados cuyo Sueldo no supere los 900 pesos (1 registro):
 Select * From Empleados 
  Where SueldoBasico >= 900

 --7- Seleccione los Nombres de los empleados que tengan hijos (3 registros):
 Select * From Empleados 
  Where CantidadHijos > 0

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla con la siguiente estructura:
 Create Table Libros(
  Codigo smallint identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15),
  Precio smallmoney,
  Cantidad tinyint
 )

 GO

 /* note que definimos el campo "codigo" de tipo "smallint", esto es porque estimamos que no tEndremos más de 30000 Libros. 
  Si necesitáramos un rango mayor podemos emplear "int". 
  Como en el campo "precio" no almacenaremos valores mayores a 200000, definimos el campo de tipo "smallmoney".
  También podemos definirlo de tipo "decimal(5,2)" porque el máximo Precio no superará los 999.99.
  El tipo "float" no es el más adecuado para representar Precios porque no es exacto y muestra muchos decimales innecesarios.
  Como los valores para el campo "Cantidad" no superarán los 255, definimos el campo de tipo "tinyint". 
  Si estimamos que tEndremos más Cantidad de libros podemos emplear "smallint" que tiene un rango mayor;
  no es adecuado usar int (cuyo rango llega hasta 4000 millOnes aprox.), porque ocuparíamos más espacio(4 bytes).

  Analicemos la inserción de datos numéricos.*/

 --Intentemos ingresar un valor fuera del rango definido, una cantidad 
 --que supera el rango del tipo "tinyint", el valor 260 (genera error):
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('El aleph','Borges','Emece',25.60,200) --aparece un mensaje de error y la inserción no se ejecuta.

 --Intentamos ingresar un precio que supera el rango del tipo "smallmoney", 
 --el valor 250000 (genera error):
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad)
  Values('El aleph','Borges','Emece',25000,100) --aparece un mensaje de error y la instrucción no se ejecuta.

 --Intentamos ingresar una cadena que SQL Server no pueda convertir a valor 
 --numérico en el campo "precio" (genera error):
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Uno','Richard Bach','Planeta','50.30',100) 

 --Ingresamos una cadena en el campo "Cantidad"(lo convierte a valor numérico):
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Uno','Richard Bach','Planeta',50.30,'100') 

  --lo convierte a valor numérico.
  Select * From Libros

 /*********************************************************************************************************************************************/

 --19) tipo De Dato (Fecha y Hora).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una facultad almacena los datos de sus alumnos en una tabla denominada "alumnos".

 --1- Elimine la tabla, si existe:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 --2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Alumnos(
  Apellido varchar(30),
  Nombre varchar(30),
  Documentos char(8),
  Domicilio varchar(30),
  FechaIngreso DateTime,
  FechaNacimiento DateTime
 )

 GO

 --3- Setee el formato para entrada de datos de tipo Fecha para que acepte valores "día-mes-año": 
 set DateFormat 'dmy'

 --4- Ingrese un alumno empleando distintos separadores para las Fechas:
 Insert Into Alumnos 
  Values('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972')

 --5- Ingrese otro alumno empleando solamente un dígito para día y mes y 2 para el año:
 Insert Into Alumnos 
  Values('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972')

 --6- Ingrese un Alumnos empleando 2 dígitos para el año de la Fecha de ingreso y "null" en "FechaNacimiento":
 Insert Into Alumnos 
  Values('Perez','Laura','26666666','Bulnes 345','03-03-91',null)

 --7- intente ingresar un alumno con Fecha de ingreso correspOndiente a "15 de marzo de 1990" pero en orden incorrecto "03-15-90":
 --Insert Into Alumnos 
  --Values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)
 --aparece un mensaje de error porque lo lee con el formato día, mes y año y no reconoce el mes 15.

 --8- Muestre todos los Alumnos que ingresaron antes del '1-1-91'. (1 registro).
 Select * From Alumnos 
  Where FechaIngreso < '1-1-91'

 --9- Muestre todos los Alumnos que tienen "null" en "FechaNacimiento":
 Select * From Alumnos 
  Where FechaNacimiento is null --1 registro.

 --10- intente ingresar una Fecha de ingreso omitiendo los separadores:
 --Insert Into Alumnos 
  --Values('Rosas','Romina','28888888','Avellaneda 487','03151990',null) --no lo acepta.

 --11- setee el formato de entrada de Fechas para que acepte valores "mes-Dia-año".
 set DateFormat 'mdy'

 --12- Ingrese el registro del punto 7.
 Insert Into Alumnos 
  Values('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',null)

 --Ejercicio Resulto:

 --Una empresa almacena los datos de sus empleados en una tabla "Empleados".

 --Eliminamos la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --Creamos la tabla eligiendo el tipo de dato adecuado para cada campo:
 Create Table Empleados(
  Nombre varchar(20),
  Documentos char(8),
  FechaIngreso DateTime
 )

 GO

 --Seteamos el formato de la Fecha para que guarde día, mes y año:
 set DateFormat dmy

 Insert Into Empleados 
  Values('Ana Gomez','22222222','12-01-1980')
 Insert Into Empleados 
  Values('Bernardo Huerta','23333333','15-03-81')
 Insert Into Empleados 
  Values('Carla Juarez','24444444','20/05/1983')
 Insert Into Empleados 
  Values('Daniel Lopez','25555555','2.5.1990')

 --El segundo registro ingresado tiene 2 dígitos correspondientes al año; 
 --en el tercero empleamos la barra ('/') como separador 
 --y en el cuarto empleamos como separador el punto ('.') 
 --y colocamos un sólo dígito en la part del día y el mes.

 --Recuperamos los registros:
 Select * From Empleados

 --Note que el formato de visualización es "y-m-d".
 Select ForMAT(GetDate(), 'dd/mm/yyyy') 
  as FechaIngreso

 --Mostramos los datos de los empleados cuya Fecha de ingreso es anterior a '01-01-1985':
 Select * From Empleados 
  Where FechaIngreso < '01-01-1985'

 --Actualizamos el nombre a "Maria Carla Juarez' 
 --del empleado cuya fecha de ingreso es igual a '20/05/1983':
 Update Empleados set Nombre = 'Maria Carla Juarez' 
  Where FechaIngreso = '20.5.83'

 --Veamos si se actualizó:
 Select * From Empleados

 --Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':
 Delete From Empleados 
  Where FechaIngreso <> '20/05/1983'

 --Veamos si se eliminaron:
 Select * From Empleados

 /*********************************************************************************************************************************************/

 --20) Ingresar Algunos Campos (Insert Into).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".

 --1- Elimine la tabla "cuentas" si existe:
 if object_id('Cuentas') is not null
  Drop Table Cuentas

 --2- Cree la tabla:
 Create Table Cuentas(
  Numero int identity,
  Documentos char(8) not null,
  Nombre varchar(30),
  Saldo money
 )

 GO

 --3- Ingrese un registro con valores para todos sus campos, inclusive el campo identity, omitiendo 
 --la lista de campos (error, no se debe ingresar para el campo identity):
 --Insert Into Cuentas 
  --Values(1,'25666777','Juan Perez',2500.50)

 --4- Ingrese un registro con valores para todos sus campos omitiendo la lista de campos (excepto el campo "identity"):
 Insert Into Cuentas 
  Values('25666777','Juan Perez',2500.50)

 --5- Ingrese un registro omitiendo algún campo que admitan valores nulos.
 Insert Into Cuentas(Documentos, Saldo) 
  Values('28999777',-5500)

 --6- intente ingresar un registro con valor para el campo "Numero" (genera error):
 --Insert Into Cuentas(Numero, Documentos, Nombre, Saldo) 
  --Values(5,'28999777','Luis Lopez',34000)

 --7- intente ingresar un registro listando 3 campos y colocando 4 valores (genera error).
 --Insert Into Cuentas(Numero, Documentos, Nombre) 
  --Values(3344,'28999777','Luis Lopez',34000)

 --8- intente ingresar un registro sin valor para el campo "Documentos" (genera error).
 --Insert Into Cuentas(Nombre, Saldo) 
  --Values('Luis Lopez',34000)

 --9- Vea los registros ingresados:
 Select * From Libros

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
 Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(15)
 )

 GO

 --Si ingresamos valores para todos los campos, podemos omitir la lista de campos:
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta')
 Select * From Libros

 --Podemos ingresar valores para algunos de los campos:
 Insert Into Libros(Titulo, Autor) 
  Values('El aleph','Borges') 

 --No podemos omitir el valor para un campo declarado "not null", como el campo "titulo":
 --Insert Into Libros(Autor, Editorial) 
  --Values('Lewis Carroll','Planeta') 

 --aparece un mensaje y la inserción no se realiza.
 --Veamos cómo SQL Server almacenó los registros:

 Select * From Libros

 /*********************************************************************************************************************************************/

 --21) Valores Por Defecto (Default).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" 

 --algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

 --1- Elimine la tabla "visitantes", si existe:
 if object_id('Visitantes') is not null
  Drop Table Visitantes

 --2- Cree la tabla con la siguiente estructura:
 Create Table Visitantes(
  Nombre varchar(30),
  Edad tinyint,
  Sexo char(1) default 'f',
  Domicilio varchar(30),
  Ciudad varchar(20) default 'Cordoba',
  Telefono varchar(11),
  Mail varchar(30) default 'no tiene',
  MontoCompra decimal(6,2)
 )

 GO

 --3- Vea la información de las columnas "COLUMN_DEF" y "IS_NULLABLE":
 Exec sp_columns Visitantes

 --4- Ingrese algunos registros sin especificar valores para algunos campos para ver cómo opera la cláusula "default":
 Insert Into Visitantes(Nombre, Domicilio, MontoCompra) 
  Values('Susana Molina','Colon 123',59.80)
 Insert Into Visitantes(Nombre, Edad, Ciudad, Mail) 
  Values('Marcos Torres',29,'Carlos Paz','marcostorres@hotMail.com')

 --6- Use la palabra "default" para ingresar valores en un Insert.
 Select * From Visitantes

 --7- Ingrese un registro con "default Values".
 Insert Into Visitantes 
  Values('Marcelo Morales', 38, default, default, default,'4255232','marcelomorales@hotMail.com',default)

 Insert Into Visitantes default Values
 Select * From Visitantes

 --Ejercicio 2:

 /*Una pequeña biblioteca de Barrio registra los préstamos de sus libros en una tabla llamada 
  "prestamos". En ella almacena la siguiente información: título del libro, Documentos de identidad del 
   socio a quien se le presta el libro, Fecha de préstamo, Fecha en que tiene que devolver el libro y 
   si el libro ha sido o no devuelto.*/

 --1- Elimine la tabla "prestamos" si existe:
 if object_id('Prestamos') is not null
  Drop Table Prestamos

 --2- Cree la tabla:
 Create Table Prestamos(
  Titulo varchar(40) not null,
  Documentos char(8) not null,
  FechaPrestamo DateTime not null,
  FechaDevolucion DateTime,
  Devuelto char(1) default 'n'
 )

 GO

 --3- Ingrese algunos registros omitiendo el valor para los campos que lo admiten:
 Insert Into Prestamos(Titulo, Documentos, FechaPrestamo, FechaDevolucion) 
  Values('Manual de 1 grado','23456789','2006-12-15','2006-12-18')
 Insert Into Prestamos(Titulo, Documentos, FechaPrestamo) 
  Values('Alicia en el Pais de las maravillas','23456789','2006-12-16')
 Insert Into Prestamos(Titulo, Documentos, FechaPrestamo, FechaDevolucion) 
  Values('El aleph','22543987','2006-12-16','2006-08-19')
 Insert Into Prestamos(Titulo, Documentos, FechaPrestamo, Devuelto) 
  Values('Manual de geografia 5 grado','25555666','2006-12-18','s')

 --4- Seleccione todos los registros:
 Select * From Prestamos

 --5- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.
 Insert Into Prestamos Values('Manual de historia','32555666','2006-10-25', default, default)
 Select * From Prestamos

 --6- intente ingresar un registro con "default Values" y analice el mensaje de error (no se puede).
 Insert Into Prestamos default Values

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla definiendo un valor por defecto para el campo "autor" y otro para el campo "Cantidad":
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) not null default 'Desconocido', 
  Editorial varchar(20),
  Precio decimal(5,2),
  Cantidad tinyint default 0
 )

 GO

 --Ingresamos un registro omitiendo los valores para el campo "autor" y "Cantidad":
 Insert Into Libros(Titulo, Editorial, Precio) 
  Values('Java en 10 minutos','Paidos',50.40)

 --SQL Server ingresará el registro con el siguiente valor de la secuencia en "codigo", 
 --con el título, Editorial y precio ingresados, en "autor" colocará "Desconocido" y en Cantidad "0": 
 Select * From Libros

 --Si ingresamos un registro sin valor para el campo "precio", que admite valores nulos, se ingresará "null" en ese campo:
 Insert Into Libros(Titulo, Editorial) 
  Values('Aprenda PHP','Siglo XXI')
 Select * From Libros

 --Visualicemos la estructura de la tabla:
 Exec sp_columns Libros

 --La columna "COLUMN_DEF", muestra el valor por defecto de cada campo.

 --Podemos emplear "default" para dar el valor por defecto a algunos campos:
 
 Insert Into Libros(Titulo, Autor, Precio, Cantidad) 
  Values('El Gato con botas', default, default, 100)
 Select * From Libros

 --Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:
 Insert Into Libros default Values
 Select * From Libros

 --La sentencia anterior almacenará un registro con los valores predetermiandos para cada uno de sus campos.

 --Que un campo tenga valor por defecto no significa que no admita valores nulos, puede o no admitirlos. 
 --Podemos ingresar el valor "null" en el campo "Cantidad":
 Insert Into Libros(Titulo, Autor, Cantidad) 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',null)

  Select * From Libros

 /*********************************************************************************************************************************************/
  
 --22) Columnas Calculadas (Operadores Aritméticos Y De Concatenación).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con ese Nombre.

 --1- Elimine la tabla si existe:
 if object_id ('Articulos') is not null
  Drop Table Articulos

 --2- Cree la tabla:
 Create Table Articulos(
  Codigo int identity,
  Nombre varchar(20),
  Descripcion varchar(30),
  Precio smallmoney,
  Cantidad tinyint default 0, Primary Key(Codigo)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Articulos(Nombre, Descripcion, Precio, Cantidad) 
  Values('Impresora','Epson Stylus C45',400.80,20)
 Insert Into Articulos (Nombre, Descripcion, Precio) 
  Values('Impresora','Epson Stylus C85',500)
 Insert Into Articulos (Nombre, Descripcion, Precio) 
  Values('Monitor','Samsung 14',800)
 Insert Into Articulos(Nombre, Descripcion, Precio, Cantidad) 
  Values('Teclado','Ingles Biswal',100,50)

 --4- El comercio quiere aumentar los Precios de todos sus artículos en un 15%. Actualice todos los Precios empleando operadores aritméticos.
 Update Articulos set Precio = Precio + (Precio*0.15)

 --5- Vea el resultado:
 Select * From Articulos

 --6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos separados por coma.
 Select Nombre +','+ Descripcion as Nombres, Descripcion
  From Articulos

 --7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritmético menos ("-").
 Update Articulos set Cantidad = Cantidad-5 
  Where Nombre = 'Teclado'
 
 Select * From Articulos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:

 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint default 0, Primary Key(Codigo)
 ) 

 GO

 --Ingresamos algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,50)

 --Queremos saber el Monto Total en dinero de cada libro:
 Select Titulo, Precio, Cantidad, 
  Precio * Cantidad as "Monto Total"
  From Libros
 
 --Queremos saber el precio de cada libro con un 10% de descuento:
 Select Titulo, Precio, 
  Precio - (Precio * 0.1) as '10% De Descuento'
  From Libros

 --Actualizamos los Precios con un 10% de descuento y vemos el resultado:
 Update Libros set Precio = Precio - (Precio * 0.1)
 Select * From Libros

 --Queremos una columna con el título, el Autor y la editorial de cada libro:
 Select Titulo +'-'+ Autor+ '-'+ Editorial as Titulo, Autor, Editorial
  From Libros

 /*********************************************************************************************************************************************/

 --23) Alias.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla "libros" de una librería.

 --1- Elimine la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --2- Cree la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint default 0, Primary Key(Codigo)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais de las maravillas','Lewis Carroll','Emece',15,50)

 --4- Muestre todos los campos de los libros y un campo extra, con el encabezado 
 --"Monto Total" en la que calcule el Monto Total en dinero de cada libro (Precio por cantidad).
 Select Titulo, Autor, Editorial, Precio, Cantidad, Precio * Cantidad as 'Monto Total' 
  From Libros

 --5- Muestre el título, Autor y precio de todos los libros de editorial"Emece" y agregue dos columnas 
 --extra en las cuales muestre el descuento de cada libro, con el encabezado "descuento" y el precio 
 --con un 10% de descuento con el encabezado "Precio Final".
 Select Titulo, Autor, Precio, Precio*0.1 as Descuento, Precio-(Precio*0.1) as 'Precio Final' 
  From Libros 
  Where Editorial = 'Emece'

 --6- Muestre una columna con el título y el Autor concatenados con el encabezado "Título y Autor".
 Select Titulo +'-'+ Autor as "Título y Autor" 
  From Libros

 --Ejercicio Resulto:

 --Trabajamos con nuestra tabla "Agenda".

 --Eliminamos la tabla si existe:
 if object_id('Agenda') is not null
  Drop Table Agenda

 --Creamos la tabla:
 Create Table Agenda(
  Nombre varchar(30),
  Domicilio varchar(30),
  Telefono varchar(11)
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Agenda(Nombre, Domicilio, Telefono) 
  Values('Juan Perez','Avellaneda 908','4252525')
 Insert Into Agenda(Nombre, Domicilio, Telefono) 
  Values('Marta Lopez','Sucre 34','4556688')
 Insert Into Agenda(Nombre, Domicilio, Telefono) 
  Values('Carlos Garcia','Sarmiento 1258',null)

 --Mostramos la información con el encabezado "Nombre Y Apellido" para el campo "nombre":
 Select Nombre as NombreYApellido, Domicilio, Telefono 
 From Agenda
 
 --Mostramos la información con el encabezado "Nombre y Apellido" para el campo "nombre", necesitamos emplear comillas:
 Select Nombre as 'Nombre y Apellido', Domicilio, Telefono 
 From Agenda

 --La palabra clave "as" es opcional, podemos obviarla:
 Select Nombre 'Nombre y Apellido', Domicilio, Telefono 
 From Agenda

 /*********************************************************************************************************************************************/

 --25) Funciones Para El Manejo De Cadenas.

 --Ejercicio Propuesto.

 --Ejercicio Resulto: 

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint default 0, Primary Key(Codigo)
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio) 
  Values('El aleph','Borges','Emece',25)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100)
 Insert Into Libros(Titulo, Autor, Editorial, Precio, Cantidad) 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,50)

 --Mostramos sólo los 12 primeros caracteres de los títulos de los libros y 
 --sus Autores, empleando la función "substring()":
 Select substring(Titulo, 1, 12) as Titulo 
  From Libros

 --Mostramos sólo los 12 primeros caracteres de los títulos de los libros y 
 --sus Autores, ahora empleando la función "left()":
 Select LEFT(Titulo, 12) as Titulo 
  From Libros

 --Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena 
 --de caracteres con un solo decimal, empleando la función "str":
 Select Titulo, 
  str(Precio, 6, 1) as Precios
  From Libros

 --Mostramos los títulos de los libros y sus precios convirtiendo este último a cadena 
 --de caracteres especificando un solo argumento:
 Select Titulo, 
  str(Precio) as Precios
  From Libros

 --Se redondea a entero. Mostramos los títulos, Autores y Editoriales de todos Libros, al último campo lo queremos en mayúsculas:
 Select Titulo, Autor, upper(Editorial) as Editoriales
  From Libros

 /*********************************************************************************************************************************************/

 --27) Funciones Para El Uso De Fechas Y Horas

 --Ejercicios Propuestos.

 --Ejercicio 1:
 
 --Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".

 --1- Elimine la tabla si existe:
 if object_id ('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
  Nombre varchar(30) not null,
  Apellido varchar(20) not null,
  Documentos char(8),
  FechaNacimiento DateTime,
  FechaIngreso DateTime,
  Sueldo decimal(6,2), Primary Key(Documentos)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50)
 Insert Into Empleados 
  Values('Carlos','Caseres','25555555','1978/02/06','1998/05/05',309)
 Insert Into Empleados 
  Values('Francisco','Garcia','26666666','1978/10/15','1998/10/02',250.68)
 Insert Into Empleados 
 Values('Gabriela','Garcia','30000000','1985/10/25','2000/12/22',300.25)
 Insert Into Empleados Values('Luis','Lopez','31111111','1987/02/10','2000/08/21',350.98)

 --4- Muestre Nombre y Apellido concatenados, con el Apellido en letras mayúsculas, 
 --el Documentos precedido por "DNI Nº " y el Sueldo precedido por "$ ".
 Select Nombre + space(1) + upper(Apellido) as Nombre, 
  stuff (Documentos,1,0,'DNI Nº ') as Documentos, 
  stuff (Sueldo,1,0,'$ ') as Sueldo 
  From Empleados

 --5- Muestre el Documentos y el Sueldo redondeado hacia arriba y precedido por "$ ".
 Select Documentos, stuff(ceiling(Sueldo),1,0,'$ ') as Sueldo
  From Empleados

 --6- Muestre los Nombres y Apellidos de los empleados que cumplen años en el mes "october" (3 registros).
 Select Nombre, Apellido 
  From Empleados 
  Where DateName(month, FechaNacimiento) = 'october'

 --7- Muestre los Nombres y Apellidos de los empleados que ingresaron en un determinado año (2 registros).
 Select Nombre,Apellido 
  From Empleados 
  Where DatePart(Year, FechaIngreso) = 2000

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Edicion DateTime,
  Precio decimal(6,2)
 )

 GO

 set dateformat ymd

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Emece','1980/10/10',25.33)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65)
 Insert Into Libros 
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45)

 Select * From Libros

 --Mostramos el título del libro y el año de edición:
 Select Titulo, DatePart (Year, Edicion) as Edición
  From Libros

 --Mostramos el título del libro y el nombre del mes de edición:
 Select Titulo, DateName (month, Edicion) as 'Mes de Edición'
  From Libros

 --Mostramos el título del libro y los años que tienen de editados:
 Select Titulo, datediff(Year, Edicion, GetDate()) as 'Años Editados'
  From Libros

 --Muestre los títulos de los libros que se editaron el día 9, de cualquier mes de cualquier año:
 Select Titulo 
  From Libros
  Where DatePart(day, Edicion) = 9

 /*********************************************************************************************************************************************/

 --28) Ordenar Registros (Order by).

 --Ejercicios Propuestos.

 --Ejercicio 1: 

 --En una página web se guardan los siguientes datos de las Visitas: número de visita, Nombre, mail, pais, Fecha.

 --1- Elimine la tabla "Visitas", si existe:
 if object_id('Visitas') is not null
   Drop Table Visitas

 --2- Créela con la siguiente estructura:
 Create Table Visitas(
   Numero int identity,
   Nombre varchar(30) default 'Anonimo',
   Mail varchar(50),
   Pais varchar(20),
   Fecha DateTime, Primary Key(Numero)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Ana Maria Lopez','AnaMaria@hotMail.com','Argentina','2006-10-10 10:10')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Gustavo Gonzalez','GustavoGGonzalez@hotMail.com','Chile','2006-10-10 21:30')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Juancito','JuanJosePerez@hotMail.com','Argentina','2006-10-11 15:45')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Fabiola Martinez','MartinezFabiola@hotMail.com','Mexico','2006-10-12 08:15')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Fabiola Martinez','MartinezFabiola@hotMail.com','Mexico','2006-09-12 20:45')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Juancito','JuanJosePerez@hotMail.com','Argentina','2006-09-12 16:20')
 Insert Into Visitas(Nombre, Mail, Pais, Fecha) 
  Values('Juancito','JuanJosePerez@hotMail.com','Argentina','2006-09-15 16:25')

 --4- ordene los registros por Fecha, en orden descendente.
 Select * From Visitas 
  Order by Fecha desc

 --5- Muestre el nombre del usuario, pais y el nombre del mes, ordenado por pais (ascendente) y Nombre del mes (descendente).
 Select Nombre, Pais, 
  DateName (month, Fecha) as Mes
  From Visitas Order by Pais,
  DateName (month, Fecha) desc

 --6- Muestre el pais, el mes, el día y la hora y ordene las Visitas por Nombre del mes, del día y la hora.
 Select Nombre,Mail,
  DateName(month, Fecha) mes,
  DateName(day, Fecha) Dia,
  DateName(hour, Fecha) hora
  From Visitas Order by 3,4,5

 --7- Muestre los mail, país, ordenado por país, de todos los que visitarOn la página en octubre (4 registros).
 Select Mail, Pais
  From Visitas
  Where DateName(month, Fecha) = 'October' Order by 2

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2), Primary Key(Codigo)
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('El aleph','Borges','Emece',25.33) 
 Insert Into Libros
  Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65)
 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95)
 Insert Into Libros(Titulo, Autor, Editorial, Precio)
  Values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15)
  
 --Recuperamos los registros ordenados por el título:
 Select * From Libros 
 Order by Titulo

 --Ordenamos los registros por el campo "precio", referenciando el campo por 
 --su posición en la lista de selección:
 Select Titulo, Autor, Precio
  From Libros Order by 3

 --Los ordenamos por "editorial", de mayor a menor empleando "desc":
 Select * From Libros 
  Order by Editorial desc

 --Ordenamos por dos campos:
 Select * From Libros 
  Order by Titulo, Editorial

 --Ordenamos en distintos sentidos:
 Select * From Libros 
  Order by Titulo asc, Editorial desc

 --Podemos ordenar por un campo que no se lista en la selección:
 Select Titulo, Autor
  From Libros
  Order by precio

 --Está permitido ordenar por valores calculados:
 Select Titulo, Autor, Editorial,
 Precio + (Precio*0.1) as 'Precio Con Descuento'
 From Libros
 Order by 4

 /*********************************************************************************************************************************************/

 --29) Operadores Lógicos (AND - OR - NOT).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla llamada "medicamentos" de una farmacia.

 --1- Elimine la tabla, si existe:
 if object_id('Medicamentos') is not null
   Drop Table Medicamentos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Medicamentos(
  Codigo int identity,
  Nombre varchar(20),
  Laboratorio varchar(20),
  Precio decimal(5,2),
  Cantidad tinyint, Primary Key(Codigo)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Medicamentos 
  Values('Sertal','Roche',5.2,100)
 Insert Into Medicamentos 
  Values('Buscapina','Roche',4.10,200)
 Insert Into Medicamentos 
  Values('Amoxidal 500','Bayer',15.60,100)
 Insert Into Medicamentos 
  Values('Paracetamol 500','Bago',1.90,200)
 Insert Into Medicamentos 
  Values('Bayaspirina','Bayer',2.10,150)
 Insert Into Medicamentos 
  Values('Amoxidal jarabe','Bayer',5.10,250)

 --4- Recupere los códigos y Nombres de los Medicamentos cuyo Laboratorio
 --sea 'Roche' y cuyo precio sea menor a 5 (1 registro cumple con ambas condiciones)
 Select Codigo,Nombre From Medicamentos 
  Where Laboratorio = 'Roche' and Precio < 5

 --5- Recupere los Medicamentos cuyo Laboratorio sea 'Roche' o cuyo precio sea menor a 5 (4 registros):
 Select * From Medicamentos 
  Where Laboratorio = 'Roche' or Precio < 5
 --note que el resultado es diferente al del punto 4, hemos cambiado el operador de la sentencia anterior.

 --6- Muestre todos los Medicamentos cuyo Laboratorio no sea "Bayer" y cuya Cantidad sea = 100 (1 registro).
 Select * From Medicamentos 
  Where not Laboratorio = 'Bayer' and Cantidad = 100

 --7- Muestre todos los Medicamentos cuyo Laboratorio sea "Bayer" y cuya Cantidad no sea = 100 (2 registros):
 Select * From Medicamentos 
  Where Laboratorio = 'Bayer' and not Cantidad = 100
 /*Analice estas 2 últimas sentencias. El operador 
 --"not" afecta a la condición a la cual antecede, 
 --no a las siguientes. Los resultados de los puntos 6 y 7 son diferentes.*/

 --8- Elimine todos los registros cuyo Laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 registro eliminado).
 Delete From Medicamentos 
  Where Laboratorio = 'Bayer' and Precio > 10

 --9- Cambie la cantidad por 200, a todos los Medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado).
 Update Medicamentos set Cantidad = 200 
  Where Laboratorio = 'Roche' and Precio > 5

 --10- Borre los Medicamentos cuyo Laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados).
 Delete From Medicamentos 
  Where Laboratorio = 'Bayer' or Precio < 3

 --Ejercicio 2:

 --Trabajamos con la tabla "Peliculas" de un video club que alquila películas en video. 

 --1- Elimine la tabla, si existe
 if object_id('Peliculas') is not null
  Drop Table Peliculas

 --2- Créela con la siguiente estructura:
 Create Table Peliculas(
  Codigo int identity,
  Titulo varchar(40) not null,
  Actor varchar(20),
  Duracion tinyint, Primary Key(Codigo)
 )

 GO

--3- Ingrese algunos registros:
 Insert Into Peliculas
  Values('Mision imposible','Tom Cruise',120)
 Insert Into Peliculas
  Values('Harry Potter y la Piedra Filosofal','Daniel R.',180)
 Insert Into Peliculas
  Values('Harry Potter y la Camara Secreta','Daniel R.',190)
 Insert Into Peliculas
  Values('Mision imposible 2','Tom Cruise',120)
 Insert Into Peliculas
  Values('Mujer bonita','Richard Gere',120)
 Insert Into Peliculas
  Values('Tootsie','D. Hoffman',90)
 Insert Into Peliculas
  Values('Un oso rojo','Julio Chavez',100)
 Insert Into Peliculas
  Values('Elsa y Fred','China Zorrilla',110)

 --4- Recupere los registros cuyo Actor sea "Tom Cruise" or "Richard Gere" (3 registros).
 Select * From Peliculas
  Where Actor = 'Tom Cruise' or Actor = 'Richard Gere'

 --5- Recupere los registros cuyo Actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas condiciones).
 Select * From Peliculas
  Where Actor = 'Tom Cruise' and Duracion < 100

 --6- Cambie la duración a 200, de las películas cuyo Actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado).
 Update Peliculas set Duracion = 200
  Where Actor = 'Daniel R.' and Duracion = 180

 --7- Borre todas las películas donde el Actor no sea "Tom Cruise" y cuya duración sea mayor o igual a 100 (2 registros eliminados).
 Delete From Peliculas
  Where not Actor = 'Tom Cruise' and Duracion <= 100

  Select * From Peliculas

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:

 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros Values('El aleph','Borges','Emece',15.90) 
 Insert Into Libros Values('Antología poética','Borges','Planeta',39.50)
 Insert Into Libros Values('Java en 10 minutos','Mario Molina','Planeta',50.50)
 Insert Into Libros Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',19.90)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez','Emece',25.90)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez','Paidos',16.80)
 Insert Into Libros Values('Aprenda PHP','Mario Molina','Emece',19.50)
 Insert Into Libros Values('Cervantes y el Quijote','Borges','Paidos',18.40)

 --Recuperamos los libros cuyo Autor sea igual a "Borges" y 
 --cuyo precio no supere los 20 pesos:
 Select * From Libros 
  Where (Autor = 'Borges') and (Precio <= 20)

 --Seleccionamos los libros cuyo Autor es "Borges" y/o cuyo editorial es "Planeta":
 Select * From Libros 
  Where Autor = 'Borges' or Editorial = 'Planeta'

 --Recuperamos los libros cuyo editorial no es "Planeta":
 Select * From Libros 
  Where not Editorial = 'Planeta'

 --Veamos cómo el uso de paréntesis hace que SQL Server evalúe en forma diferente 
 --ciertas Consultas aparentemente iguales:
 Select * From Libros 
  Where(Autor = 'Borges') or (Editorial = 'Paidos' and Precio < 20) -- Forma 1.

 Select * From Libros 
  Where(Autor = 'Borges' or Editorial = 'Paidos') and (Precio < 20) -- Forma 2.

 /*********************************************************************************************************************************************/

 --30) Otros Operadores Relacionales (IS NULL).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabajamos con la tabla "Peliculas" de un video club que alquila películas en video.

 --1- Elimine la tabla, si existe
 if object_id('Peliculas') is not null
   Drop Table Peliculas

 --2- Créela con la siguiente estructura:
 Create Table Peliculas(
   Codigo int identity,
   Titulo varchar(40) not null,
   Actor varchar(20),
   Duracion tinyint, Primary Key(Codigo)
  )

  GO

 --3- Ingrese algunos registros:
 Insert Into Peliculas 
  Values('Mision imposible','Tom Cruise',120)
 Insert Into Peliculas 
  Values('Harry Potter y la piedra filosofal','Daniel R.',null) 
 Insert Into Peliculas 
  Values('Harry Potter y la camara secreta','Daniel R.',190)
 Insert Into Peliculas 
  Values('Mision imposible 2','Tom Cruise',120)
 Insert Into Peliculas 
  Values('Mujer bonita',null,120)
 Insert Into Peliculas 
  Values('Tootsie','D. Hoffman',90)
 Insert Into Peliculas(Titulo) 
  Values('Un oso rojo')

 --4- Recupere las películas cuyo Actor sea nulo (2 registros).
 Select * From Peliculas 
  Where Actor is null

 --5- Cambie la duración a 0, de las películas que tengan duración igual a "null" (2 registros).
 Update Peliculas set Duracion = 0 
  Where Duracion is null

 --6- Borre todas las películas donde el actor sea "null" y cuya duración sea 0 (1 registro).
 Delete From Peliculas 
  Where Actor is null and Duracion = 0

 Select * From Peliculas

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería. 

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

  --Creamos la tabla
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Emece',15.90)
 Insert Into Libros 
  Values('Cervantes y el Quijote','Borges','Paidos',null)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',null,19.90)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Emece',25.90)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Antología poética','Borges',25.50)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Java en 10 minutos','Mario Molina',45.80)
 Insert Into Libros(Titulo, Autor) 
  Values('Martin Fierro','Jose Hernandez')
 Insert Into Libros(Titulo, Autor) 
  Values('Aprenda PHP','Mario Molina')

  Select * From Libros

 --Recuperamos los registros en los cuales esté almacenado el valor "null" en el campo "editorial":
 Select * From Libros 
  Where Editorial is null

 --Seleccionamos los libros que no contiene "null" en "editorial":
 Select * From Libros 
  Where Editorial is not null

 /*********************************************************************************************************************************************/
  
 --31) Otros Operadores Relacionales (Between).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --En una página web se guardan los siguientes datos de las Visitas: 
 --número de visita, Nombre, mail, pais, FechayHora de la visita.

 --1- Elimine la tabla "Visitas", si existe:
 if object_id('Visitas') is not null
  Drop Table Visitas

 --2- Créela con la siguiente estructura:
 Create Table Visitas(
  Numero int identity,
  Nombre varchar(30) default 'Anonimo',
  Mail varchar(50),
  Pais varchar (20),
  FechayHora DateTime, Primary Key(Numero)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Ana Maria Lopez','AnaMaria@hotMail.com','Argentina','2006-10-10 10:10')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Gustavo Gonzalez','GustavoGGonzalez@gotMail.com','Chile','2006-10-10 21:30')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Juancito','JuanJosePerez@hotMail.com','Argentina','2006-10-11 15:45')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Fabiola Martinez','MartinezFabiola@hotMail.com','Mexico','2006-10-12 08:15')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Fabiola Martinez','MartinezFabiola@hotMail.com','Mexico','2006-09-12 20:45')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Juancito','JuanJosePerez@gMail.com','Argentina','2006-09-12 16:20')
 Insert Into Visitas(Nombre, Mail, Pais, FechayHora) 
  Values('Juancito','JuanJosePerez@hotMail.com','Argentina','2006-09-15 16:25')
 Insert Into Visitas(Nombre, Mail, Pais) 
  Values('Federico1','federicogarcia@xaxaMail.com','Argentina')

 --4- Seleccione los usuarios que visitarOn la página entre el '2006-09-12' y '2006-10-11' (5 registros).
 Select * From Visitas 
  Where FechayHora between '2006-09-12' and '2006-10-11' 
  --Note que incluye los de Fecha mayor o igual al valor mínimo y menores al valor máximo, y que los valores null no se incluyen.

 --5- Recupere las Visitas cuyo número se encuentra entre 2 y 5 (4 registros) note que incluye los valores límites. 
 Select * From Visitas 
  Where Numero between 2 and 5

 --Ejercicio 2:

 --Una concesionaria de Autos vende Autos usados y almacena la información en una tabla llamada "autos".

 --1- Elimine la tabla "autos" si existe:
 if object_id('Autos') is not null
  Drop Table Autos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Autos(
  Patente char(6),
  Marca varchar(20),
  Modelo char(4),
  Precio decimal(8,2), 
  Primary Key(Patente)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Autos 
  Values('ACD123','Fiat 128','1970',15000)
 Insert Into Autos 
  Values('ACG234','Renault 11','1980',40000)
 Insert Into Autos 
  Values('BCD333','Peugeot 505','1990',80000)
 Insert Into Autos 
  Values('GCD123','Renault Clio','1995',70000)
 Insert Into Autos 
  Values('BCC333','Renault Megane','1998',95000)
 Insert Into Autos 
  Values('BVF543','Fiat 128','1975',20000)

 --4- Seleccione todos los Autos cuyo Modelo se encuentre entre '1970' y '1990' 
 --usando el operador "between" y ordénelos por dicho campo(4 registros).
 Select * From Autos 
  Where Modelo between '1970' and '1990' 
  Order by Modelo

 --5- Seleccione todos los autos cuyo precio esté entre 50,000 y 100,000.
 Select * From Autos 
  Where Precio between 50000 and 100000 

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:

 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros
  Values('El aleph','Borges','Emece',15.90)
 Insert Into Libros
  Values('Cervantes y el quijote','Borges','Paidos',null)
 Insert Into Libros
  Values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90)
 Insert Into Libros
  Values('Martin Fierro','Jose Hernandez','Emece',25.90)
 Insert Into Libros(Titulo, Autor, Precio)
  Values('Antología poética','Borges',32);
 Insert Into Libros(Titulo, Autor, Precio)
  Values('Java en 10 minutos','Mario Molina',45.80)
 Insert Into Libros(Titulo, Autor, Precio)
  Values('Martin Fierro','Jose Hernandez',40)
 Insert Into Libros(Titulo, Autor, Precio)
  Values('Aprenda PHP','Mario Molina',56.50)

  Select * From Libros

 --Recuperamos los registros cuyo precio esté entre 20 y 40 empleando "between":
 Select * From Libros
  Where Precio between 20 and 40 --Note que si el campo tiene el valor "null", no aparece en la selección.

 --Para Seleccionar los libros cuyo precio no esté entre un intervalo de valores 
 --antecedemos "not" al "between":
 Select * From Libros
  Where Precio not between 20 and 35

 /*********************************************************************************************************************************************/

 --32) Otros Operadores Relacionales (IN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla llamada "medicamentos" de una farmacia.

 --1- Elimine la tabla, si existe:
 if object_id('Medicamentos') is not null
  Drop Table Medicamentos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Medicamentos(
  Codigo int identity,
  Nombre varchar(20),
  Laboratorio varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint,
  FechaVencimiento DateTime not null, Primary Key(Codigo)
 )

 GO

 --3- Ingrese algunos registros:
 Insert Into Medicamentos 
  Values('Sertal','Roche',5.2,1,'2015-02-01')
 Insert Into Medicamentos 
  Values('Buscapina','Roche',4.10,3,'2016-03-01')
 Insert Into Medicamentos 
  Values('Amoxidal 500','Bayer',15.60,100,'2017-05-01')
 Insert Into Medicamentos 
  Values('Paracetamol 500','Bago',1.90,20,'2018-02-01')
 Insert Into Medicamentos 
  Values('Bayaspirina','Bayer',2.10,150,'2019-12-01')
 Insert Into Medicamentos 
  Values('Amoxidal jarabe','Bayer',5.10,250,'2020-10-01')
 
 --4- Recupere los Nombres y precios de los Medicamentos cuyo Laboratorio sea "Bayer" o "Bago" empleando el operador "in" (4 registros).
 Select Nombre,Precio 
  From Medicamentos 
  Where Laboratorio in ('Bayer','Bago')

 --5- Seleccione los remedios cuya Cantidad se encuentre entre 1 y 5 empleando el operador "between" y luego el operador "in" (2 registros):
 Select * From Medicamentos 
  Where Cantidad between 1 and 5

 Select * From Medicamentos 
  Where Cantidad in (1, 2, 3, 4, 5)--Note que es más conveniente emplear, en este caso, el operador "between".

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20),
  Editorial varchar(20),
  Precio decimal(6,2),
 )

 GO

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Emece',15.90)
 Insert Into Libros 
  Values('Cervantes y el Quijote','Borges','Paidos',null)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',null,19.90)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert Into Libros(Titulo, Precio) 
  Values('Antología poética',32)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Martin Fierro','Jose Hernandez',40)
 Insert Into Libros(Titulo, Autor, Precio) 
  Values('Aprenda PHP','Mario Molina',56.50)

  Select * From Libros

 --Recuperamos los libros cuyo Autor es "Paenza" o "Borges":
 Select * From Libros 
  Where Autor IN ('Borges','Paenza')

 --Recuperamos los libros cuyo Autor no es "Paenza" ni "Borges":
 Select * From Libros 
  Where Autor not in ('Borges','Paenza') --Note que los valores "null" no se consideran.

 /*********************************************************************************************************************************************/

 --33) Búsqueda De Patrones (LIKE - NOT LIKE)

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa almacena los datos de sus empleados en una tabla "Empleados".

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
  Nombre varchar(30),
  Documentos char(8),
  Domicilio varchar(30),
  FechaIngreso DateTime,
  Seccion varchar(20),
  Sueldo decimal(6,2), Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50)
 Insert Into Empleados 
  Values('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30)
 Insert Into Empleados 
  Values('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790)
 Insert Into Empleados 
  Values('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550)
 Insert Into Empleados 
  Values('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70)
 Insert Into Empleados 
  Values('Yolanda Perez','35111222','Colon 180','1990-10-08','Administracion',400)
 Insert Into Empleados 
  Values('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800)

 --4- Muestre todos los empleados con Apellido "Perez" empleando el operador "like" (3 registros).
 Select * From Empleados 
  Where Nombre like '%Perez%'

 --5- Muestre todos los empleados cuyo Domicilio comience con "Co" y tengan un "8" (2 registros).
 Select * From Empleados 
  Where Domicilio like 'Co%8%'

 --6- Seleccione todos los empleados cuyo Documentos finalice en 0,2,4,6 u 8 (4 registros).
 Select * From Empleados 
  Where Documentos like '%[02468]'

 --7- Seleccione todos los empleados cuyo documentos no comience con 1 ni 3 y cuyo Nombre finalice en "ez" (2 registros).
 Select * From Empleados 
  Where Documentos like '[^13]%' and Nombre like '%ez'

 --8- Recupere todos los Nombres que tengan una "y" o una "j" en su Nombre o Apellido (3 registros).
 Select Nombre From Empleados 
  Where Nombre like '%[yj]%'

 --9- Muestre los Nombres y sección de los empleados que pertenecen a Secciones 
 --que comiencen con "S" o "G" y tengan 8 caracteres (3 registros).
 Select Nombre,Seccion From Empleados 
  Where Seccion like '[SG]_______'

 --10- Muestre los Nombres y sección de los empleados que pertenecen a Secciones que no comiencen con "S" o "G" (2 registros).
 Select Nombre,Seccion From Empleados
  Where Seccion not like '[SG]%'

 --11- Muestre todos los Nombres y sueldos de los empleados cuyos sueldos incluyen centavos (3 registros).
 Select Nombre,Sueldo From Empleados
  Where Sueldo not like '%.00'

 --12- Muestre los empleados que hayan ingresado en "1990" (3 registros).
 Select * From Empleados
  Where FechaIngreso like '%1990%'

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2), Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Emece',15.90)
 Insert Into Libros 
  Values('Antología poética','J. L. Borges','Planeta',null)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',null,19.90)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez',default,40)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50)

 -- Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":
 Select * From Libros 
  Where Autor like '%Borges%'

 --Seleccionamos los libros cuyos títulos comienzan con la letra "M":
 Select * From Libros 
  Where Titulo like 'M%'

 --Seleccionamos todos los títulos que no comienzan con "M":
 Select * From Libros 
  Where Titulo not like 'M%'

 --Si queremos ver los libros de "Lewis Carroll" 
 --pero no recordamos si se escribe "Carroll" o "Carrolt", 
 --podemos emplear el comodín "_" (guión bajo) y esTablecer la siguiente condición:
 Select * From Libros 
  Where Autor like '%Carrol_'

 --Buscamos los libros cuyo editorial comienza con las letras entre la "P" y la "S":
 Select Titulo, Autor, Editorial 
  From Libros 
 Where Editorial like '[P-S]%'

 --Seleccionamos los libros cuyo editorial no comienza con las letras "P" ni "N":
 Select Titulo, Autor, Editorial 
  From Libros 
 Where Editorial like '[^PN]%'

 --Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:
 Select Titulo,Precio 
  From Libros
 Where Precio like '1_.%'

 --Recuperamos los libros que no incluyen centavos en sus precios:
 Select Titulo, Precio 
  From Libros 
 Where Precio like '%.00'

 /*********************************************************************************************************************************************/

 --34) Contar Registros (COUNT).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con la tabla llamada "medicamentos" de una farmacia.

 --1- Elimine la tabla, si existe:
 if object_id('Medicamentos') is not null
  Drop Table Medicamentos

 --2- Cree la tabla con la siguiente estructura:
 Create Table Medicamentos(
  Codigo int identity,
  Nombre varchar(20),
  Laboratorio varchar(20),
  Precio decimal(6,2),
  Cantidad tinyint,
  FechaVencimiento DateTime not null,
  NumeroLote int default null, Primary Key(Codigo)
 )

 --3- Ingrese algunos registros:
 Insert Into Medicamentos
  Values('Sertal','Roche',5.2,1,'2015-02-01',null)
 Insert Into Medicamentos 
  Values('Buscapina','Roche',4.10,3,'2016-03-01',null)
 Insert Into Medicamentos 
  Values('Amoxidal 500','Bayer',15.60,100,'2017-05-01',null)
 Insert Into Medicamentos
  Values('Paracetamol 500','Bago',1.90,20,'2018-02-01',null)
 Insert Into Medicamentos 
  Values('Bayaspirina',null,2.10,null,'2019-12-01',null)
  Insert Into Medicamentos 
  Values('Amoxidal jarabe','Bayer',null,250,'2019-12-15',null)

 --4- Muestre la cantidad de registros empleando la función "count(*)" (6 registros).
 Select count(*)
  From Medicamentos

 --5- Cuente la cantidad de medicamentos que tienen Laboratorio conocido (5 registros).
 Select count(Laboratorio) 
  From Medicamentos

 --6- Cuente la cantidad de medicamentos que tienen precio distinto a "null" y que tienen Cantidad distinto a "null", 
 --disponer alias para las columnas.
 Select count(Precio) as 'con precio',
  count(Cantidad) as 'con Cantidad' 
  From Medicamentos

 --7- Cuente la cantidad de remedios con precio conocido, cuyo Laboratorio comience con "B" (2 registros).
 Select count(Precio)
  From Medicamentos
 Where Laboratorio like 'B%'

 --8- Cuente la cantidad de medicamentos con número de lote distitno de "null" (0 registros).
 Select count(NumeroLote) 
  From Medicamentos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe:
 if object_id ('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(20) default 'Desconocido',
  Editorial varchar(20),
  Precio decimal(6,2), Primary Key(Codigo)
 )
  
 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Emece',15.90)
 Insert Into Libros 
  Values('Antología poética','J. L. Borges','Planeta',null)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',null,19.90)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Siglo XXI',15)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez',default,40)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',null)
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',20)

 --Averiguemos la cantidad de libros usando la función "count()":
 Select count(*) 
  From Libros
 --Averiguemos la cantidad de libros usando la función "count()":

 --note que incluye todos los libros aunque tengan valor nulo en algún campo.Contamos los libros de editorial ("Planeta"):
 Select count(*) 
  From Libros 
 Where Editorial = 'Planeta'

 --Contamos los registros que tienen precio (sin tener en cuenta los que tienen valor nulo), usando la función "count (precio)":
 Select count(Precio) 
  From Libros

 /*********************************************************************************************************************************************/
 
 --36) Funciones De Agrupamiento (COUNT - SUM - MIN - MAX - AVG).

 --Ejercicios Propuestos.
 
 --Ejercicio 1:

 --Una empresa almacena los datos de sus empleados en una tabla "Empleados".

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados
  
 --2- Cree la tabla:
 Create Table Empleados(
  Nombre varchar(30),
  Documentos char(8),
  Domicilio varchar(30),
  Seccion varchar(20),
  Sueldo decimal(6,2),
  CantidadHijos tinyint, Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('Juan Perez','22333444','Colon 123','Gerencia',5000,2)
 Insert Into Empleados 
  Values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0)
 Insert Into Empleados 
  Values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1)
 Insert Into Empleados 
  Values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3)
 Insert Into Empleados 
  Values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0)
 Insert Into Empleados 
  Values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1)
 Insert Into Empleados 
  Values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3)
 Insert Into Empleados 
  Values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4)
 Insert Into Empleados 
  Values('andres Costa','28444555',default,'Secretaria',null,null)

 --4- Muestre la cantidad de Empleados usando "count"(9 Empleados).
 Select count(*) From Empleados

 --5- Muestre la cantidad de Empleados con Sueldo no nulo de la sección "Secretaria" (2 Empleados).
 Select count(Sueldo)
  From Empleados
 Where Seccion = 'Secretaria'

 --6- Muestre el Sueldo más alto y el más bajo colocando un alias (5000 y 2000).
 Select max(Sueldo) as 'Mayor Sueldo',
  min(Sueldo) as 'Menor Sueldo'
  From Empleados

 --7- Muestre el valor mayor de "CantidadHijos" de los empleados "Perez" (3 hijos).
 Select max(CantidadHijos)
  From Empleados
 Where Nombre like '%Perez%'

 --8- Muestre el promedio de sueldo de todo los empleados (3400. note que hay un Sueldo nulo y no es tenido en cuenta).
 Select avg(Sueldo)
  From Empleados

 --9- Muestre el promedio de sueldo de los empleados de la sección "Secretaría"(2100).
 Select avg(Sueldo)
  From Empleados
 Where Seccion = 'Secretaria'

 --10- Muestre el promedio de hijos de todos los empleados de "Sistemas"(2).
 Select avg(CantidadHijos)
  From Empleados
 Where Seccion = 'Sistemas'

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null, 
  Autor varchar(30) default 'Desconocido',
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint, Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Planeta',15,null)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert Into Libros 
  Values('Antologia Poetica','J.L. Borges','Planeta',null,150)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Emece',18.20,null)
 Insert Into Libros 
  Values('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert Into Libros 
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
 Insert Into Libros 
  Values('Harry Potter y la Piedra Filosofal','J.K. Rowling',default,45.00,90)
 Insert Into Libros 
  Values('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',46.00,100)
 Insert Into Libros(Titulo, Autor, Cantidad) 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll',220)
 Insert Into Libros(Titulo, Autor, Cantidad) 
  Values('PHP de la A a la Z',default,0)

 --Para conocer la cantidad total de libros, sumamos las cantidades de cada uno:
 Select sum(Cantidad) 
  From Libros --Retorna 980

 --Verifique la suma, sumando los valores de todos los registros del campo "Cantidad".

 --Queremos saber cuántos Libros tenemos de la editorial "Emece":
 Select sum(Cantidad)
  From Libros
 Where Editorial = 'Emece' --retorna 300.

 --Queremos saber cuál es el libro más costoso; usamos la función "max()":
 Select max(Precio)
  From Libros --retorna 46.00.

 --Para conocer el precio mínimo de los libros de "Rowling" tipeamos:
 Select min(Precio)
  From Libros
 Where Autor like '%Rowling%' --retorna 45.00.

 --Queremos saber el promedio del precio de los libros referentes a "PHP":
 Select AVG(Precio)
  From Libros
 Where Titulo like '%PHP%'

 --Devuelve 25.00. 

 /*note que hay 3 Libros sobre "PHP", 
 pero uno de ellos tiene Precio nulo entonces SQL Server no lo incluye 
 para calcular el promedio.*/

 /*********************************************************************************************************************************************/

 --37) Agrupar Registros (Group by).

 --Ejercicios Propuestos.
 
 --Ejercicio 1:

 --Un comercio que tiene un stand en una feria registra en una tabla llamada"visitantes" 
 --algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

 --1- Elimine la tabla "visitantes", si existe:
 if object_id('Visitantes') is not null
   Drop Table Visitantes

 --2- Cree la tabla con la siguiente estructura:
 Create Table Visitantes(
  Nombre varchar(30),
  Edad tinyint,
  Sexo char(1) default 'f',
  Domicilio varchar(30),
  Ciudad varchar(20) default 'Cordoba',
  Telefono varchar(11),
  Mail varchar(30) default 'no tiene',
  MontoCompra decimal (6,2)
 )

 --3- Ingrese algunos registros:
 Insert Into Visitantes 
  Values('Susana Molina',35,default,'Colon 123',default,null,null,59.80)
 Insert Into Visitantes 
  Values('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotMail.com',150.50)
 Insert Into Visitantes 
  Values('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90)
 Insert Into Visitantes(Nombre, Edad, Sexo, Telefono, Mail) 
  Values ('Fabian Perez',36,'m','4556677','fabianperez@xaxaMail.com')
 Insert Into Visitantes(Nombre, Ciudad, MontoCompra) 
  Values ('Alejandra Gonzalez','La Falda',280.50)
 Insert Into Visitantes(Nombre, Edad, Sexo, Ciudad, Mail, MontoCompra) 
  Values ('Gaston Perez',29,'m','Carlos Paz','Gastonperez1@gMail.com',95.40)
 Insert Into Visitantes 
  Values('Liliana Torres',40,default,'Sarmiento 876',default, default, default,85)
 Insert Into Visitantes 
  Values('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotMail.com',321.50)

--4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "Group by" (4 filas devueltas).
 Select Ciudad, count(*)
  From Visitantes
  Group by Ciudad

 --5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas).
 Select Ciudad, count(Telefono)
  From Visitantes
  Group by Ciudad

 --6- Necesitamos el total del monto de las compras agrupadas por Sexo (3 filas).
 Select Sexo, sum(MontoCompra)
  From Visitantes
  Group by Sexo

 --7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas).
 Select Sexo,Ciudad,
  max(MontoCompra) as mayor,
  min(MontoCompra) as menor
  From Visitantes
  Group by Sexo,Ciudad

 --8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas).
 Select Ciudad,
  avg(MontoCompra) as 'promedio de compras'
  From Visitantes
  Group by Ciudad

 --9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas):
 Select Ciudad,
  count(*) as 'Cantidad con Mail'
  From Visitantes
  Where Mail is not null and Mail <> 'no tiene'
  Group by Ciudad

 --10- Realice la misma consulta anterior, pero use la palabra clave "all" para mostrar todos los 
 --valores de ciudad, incluyendo las que devuelven cero o "null" en la columna de agregado (4 filas).
 Select Ciudad,
  count(*) as 'Cantidad con Mail'
  From Visitantes
  Where Mail is not null and Mail <> 'no tiene'
  Group by all Ciudad

 --Ejercicio 2:

 --Una empresa almacena los datos de sus empleados en una tabla "Empleados".

 --1- Elimine la tabla, si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
  Nombre varchar(30),
  Documentos char(8),
  Domicilio varchar(30),
  Seccion varchar(20),
  Sueldo decimal(6,2),
  CantidadHijos tinyint,
  FechaIngreso DateTime, Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10')
 Insert Into Empleados 
  Values('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12')
 Insert Into Empleados 
  Values('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25')
 Insert Into Empleados 
  Values('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25')
 Insert Into Empleados 
  Values('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01')
 Insert Into Empleados 
  Values('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'1996-05-01')
 Insert Into Empleados 
  Values('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01')
 Insert Into Empleados 
  Values('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'2000-09-01')
 Insert Into Empleados 
  Values('andres Costa','28444555',default,'Secretaria',null,null,null)

 --4- Cuente la cantidad de Empleados agrupados por sección (5 filas).
 Select Seccion, count(*)
  From Empleados
  Group by Seccion

 --5- Calcule el promedio de hijos por sección (5 filas):
 Select Seccion, avg(CantidadHijos) as 'promedio de hijos'
  From Empleados
  Group by Seccion

 --6- Cuente la cantidad de Empleados agrupados por año de ingreso (6 filas).
 Select DatePart(Year,FechaIngreso), count(*)
  From Empleados
  Group by DatePart(Year,FechaIngreso)

 --7- Calcule el promedio De Sueldo por sección de los empleados con hijos (4 filas).
 Select Seccion, avg(Sueldo) as 'Promedio De Sueldo'
  From Empleados
  Where CantidadHijos > 0 and CantidadHijos is not null
  Group by Seccion

 --8- Realice la misma consulta anterior pero esta vez incluya las secciones que devuelven cero o "null" en la columna de agregado (5 filas).
 Select Seccion, avg(Sueldo) as 'Promedio De Sueldo'
  From Empleados
  Where CantidadHijos > 0 and CantidadHijos is not null
  Group by all Seccion

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint, Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Planeta',15,null)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert Into Libros 
  Values('Antologia Poetica','J.L. Borges','Planeta',null,150)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Emece',18.20,null)
 Insert Into Libros 
  Values('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert Into Libros 
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120)
 Insert Into Libros 
  Values('Harry Potter y la Piedra Filosofal','J.K. Rowling',default,45.00,90)
 Insert Into Libros 
  Values('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',null,100)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos',22.50,200)
 Insert Into Libros 
  Values('PHP de la A a la Z', null, null, null,0)

 --Queremos saber la cantidad de libros de cada editorial, utilizando la cláusula "Group by":
 Select Editorial, count(*)
  From Libros
  Group by Editorial

 --El resultado muestra los Nombres de los editoriales y la cantidad de registros para cada valor del campo. 
 --note que los valores nulos se procesan como otro grupo.

 --Obtenemos la cantidad Libros con precio no nulo de cada editorial:
 Select Editorial, count(Precio)
  From Libros
  Group by Editorial

 --La salida muestra los Nombres de los editoriales y la cantidad de registros de cada una, sin contar los que tienen precio nulo.

 --Para conocer el total en dinero de los libros agrupados por editorial, tipeamos:
 Select Editorial, sum(Precio)
  From Libros
  Group by Editorial

 --Obtenemos el máximo y mínimo valor de los libros agrupados por editorial, en una sola sentencia:
 Select Editorial,
  max(Precio) as Mayor,
  min(Precio) as Menor
  From Libros
  Group by Editorial

 --Calculamos el promedio del valor de los libros agrupados por editorial:
 Select Editorial, AVG(Precio)
  From Libros
  Group by Editorial

 --Es posible limitar la consulta con "Where". 
 --Vamos a contar y agrupar por editorial considerando solamente los libros cuyo precio es menor a 30 pesos:
 Select Editorial, count(*)
  From Libros
  Where Precio < 30
  Group by Editorial

 --note que los editoriales que no tienen Libros que cumplan la condición, no aparecen en la salida. 
 --Para que aparezcan todos los valores de Editorial, incluso los que devuelven cero o "null" 
 --en la columna de agregado, debemos emplear la palabra clave "all" al lado de "Group by":
 Select Editorial, count(*)
  From Libros
  Where Precio < 30
  Group by ALL Editorial

 /*********************************************************************************************************************************************/

 --38) Seleccionar Grupos (Having).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "clientes".

 --1- Elimine la tabla "Clientes", si existe:
 if object_id('Clientes') is not null
   Drop Table Clientes

 --2- Créela con la siguiente estructura:
 Create Table Clientes (
  Codigo int identity,
  Nombre varchar(30) not null,
  Domicilio varchar(30),
  Ciudad varchar(20),
  Provincia varchar (20),
  Telefono varchar(11), Primary Key(Codigo)
 )

 --3- Ingrese algunos registros:
 Insert Into Clientes 
  Values('Lopez Marcos','Colon 111','Cordoba','Cordoba','null')
 Insert Into Clientes 
  Values('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585')
 Insert Into Clientes 
  Values('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445')
 Insert Into Clientes 
  Values('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null)
 Insert Into Clientes 
  Values('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685')
 Insert Into Clientes 
  Values('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525')
 Insert Into Clientes 
  Values('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455')
 Insert Into Clientes 
  Values('Lopez Carlos',null,'Cruz del Eje','Cordoba',null)
 Insert Into Clientes 
  Values('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366')
 Insert Into Clientes 
  Values('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745')

 --4- Obtenga el total de los registros agrupados por ciudad y provincia(6 filas).
 Select Ciudad, Provincia,
  count(*) as Cantidad
  From Clientes
  Group by Ciudad, Provincia

 --5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 Clientes(3 filas).
 Select Ciudad, Provincia,
  count(*) as Cantidad
  From Clientes
  Group by Ciudad, Provincia
  Having count(*) > 1

  --6- Obtenga el total de los clientes que viven en calle "San Martin"(Where), agrupados por provincia 
  --(Group by), teniEndo en cuenta todos los valores (all), de aquellas ciudades que tengan menos de 2 
  --Clientes (Having) y omitiendo la fila correspOndiente a la ciudad de "Cordoba"(Having) (4 filas devueltas).
 Select Ciudad, count(*)
  From Clientes
  Where Domicilio like '%San Martin%'
  Group by all Ciudad
  Having count(*) < 2 and Ciudad <> 'Cordoba'

 --Ejercicio 2:

 /*Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
 de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.*/

 --1- Elimine la tabla "visitantes", si existe:
 if object_id('Visitantes') is not null
   Drop Table Visitantes

 --2- Créela con la siguiente estructura:
 Create Table Visitantes(
  Nombre varchar(30),
  Edad tinyint,
  Sexo char(1),
  Domicilio varchar(30),
  Ciudad varchar(20),
  Telefono varchar(11),
  MontoCompra decimal(6,2) not null
 )

 --3- Ingrese algunos registros:
 Insert Into Visitantes 
  Values('Susana Molina',28,'f',null,'Cordoba',null,45.50)
 Insert Into Visitantes 
  Values('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40)
 Insert Into Visitantes  
  Values('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25)
 Insert Into Visitantes 
  Values('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120)
 Insert Into Visitantes 
  Values('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20)
 Insert Into Visitantes 
  Values('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95)
 Insert Into Visitantes 
  Values('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50)
 Insert Into Visitantes 
  Values('Roxana Lopez',20,'f','null','Alta Gracia',null,240)
 Insert Into Visitantes 
  Values('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48)
 Insert Into Visitantes 
  Values('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30)

 --4- Obtenga el total de las compras agrupados por ciudad y Sexo de aquellas filas que devuelvan un valor superior a 50 (3 filas).
 Select Ciudad, Sexo,
  sum(MontoCompra) as Total
  From Visitantes
  Group by Ciudad, Sexo
  Having sum(MontoCompra) > 50

 --5- Obtenga el total de las compras agrupados por ciudad y Sexo (Group by), teniEndo en cuenta todos los valores (all), 
 --considerando sólo los montos de compra superiores a 50 (Where), los visitantes con teléfono (Where), 
 --sin considerar la ciudad de "Cordoba" (Having), ordenados por ciudad (Order by) (3 filas).
 Select Ciudad, Sexo,
  sum(MontoCompra) as 'total'
  From Visitantes
  Where MontoCompra > 50 and Telefono is not null
  Group by all Ciudad, Sexo
  Having Ciudad <> 'Cordoba'
  Order by Ciudad

 --6- Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos 
 --(Having), considerando sólo los visitantes de Sexo femenino y Domicilio conocido (Where) (2 filas).
 Select Ciudad,max(MontoCompra) as maximo
  From Visitantes
  Where Domicilio is not null and Sexo = 'f'
  Group by all Ciudad
  Having max(MontoCompra) > 50

 --7- Agrupe por ciudad y Sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
 --y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior a 30 (3 filas).
 Select Ciudad,Sexo, count(*) as Cantidad,
  sum(MontoCompra) as total,
  avg(MontoCompra) as promedio
  From Visitantes
  Group by Ciudad, Sexo
  Having avg(MontoCompra) > 30
  Order by total

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(5,2),
  Cantidad tinyint,
  Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Libros
  Values('El aleph','Borges','Planeta',35,null)
 Insert Into Libros
  Values('Martin Fierro','Jose Hernandez','Emece',22.20,200)
 Insert Into Libros
  Values('Martin Fierro','Jose Hernandez','Planeta',40,200)
 Insert Into Libros
  Values('Antologia Poetica','J.L. Borges','Planeta',null,150)
 Insert Into Libros
  Values('Aprenda PHP','Mario Molina','Emece',18,null)
 Insert Into Libros
  Values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120)
 Insert Into Libros
  Values('Cervantes y el Quijote','Bioy Casares- J.L. Borges','Paidos',null,100)
 Insert Into Libros
  Values('Harry Potter y la Piedra Filosofal','J.K. Rowling',default,45.00,90)
 Insert Into Libros
  Values('Harry Potter y la Camara Secreta','J.K. Rowling','Emece',null,100)
 Insert Into Libros
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos',42,80)
 Insert Into Libros
  Values('PHP de la A a la Z',null,null,110,0)
 Insert Into Libros
  Values('Uno','Richard Bach','Planeta',25,null)

 --Queremos saber la cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, 
 --por ejemplo, los que devuelvan un valor mayor a 2, usamos la siguiente instrucción:
 Select Editorial, count(*) 
  From Libros
  Group by Editorial
  Having count(*) > 2

 --Queremos el promedio de los Precios de los libros agrupados por editorial, 
 --pero solamente de aquellos grupos cuyo promedio supere los 25 pesos:
 Select Editorial, AVG(Precio)
  From Libros
  Group by Editorial
  Having AVG(Precio) > 25

 --Queremos la cantidad de libros, sin considerar los que tienen precio nulo (Where), 
 --agrupados por editorial (Group by), sin considerar la editorial "Planeta" (Having):
 Select Editorial, count(*) 
  From Libros
  Where Precio is not null
  Group by Editorial
  Having Editorial <> 'Planeta'

 --Necesitamos el promedio de los Precios agrupados por editorial, de aquellos editoriales que tienen más de 2 Libros:
 Select Editorial, AVG(Precio) 
  From Libros
  Group by Editorial
  Having count(*) > 2

 --Buscamos el mayor valor de los libros agrupados y ordenados por editorial y Seleccionamos 
 --las filas que tienen un valor menor a 100 y mayor a 30:
 Select Editorial, max(Precio) as 'Mayor' 
  From Libros
  Group by Editorial
  Having max (Precio) < 100 and max (Precio) > 30
  Order by Editorial

  /*********************************************************************************************************************************************/
 
 --43) Registros Duplicados (Distinct).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "Clientes".

 --1- Elimine la tabla "Clientes", si existe:
 if object_id('Clientes') is not null
   Drop Table Clientes

 --2- Créela con la siguiente estructura:
 Create Table Clientes(
   Codigo int identity,
   Nombre varchar(30) not null,
   Domicilio varchar(30),
   Ciudad varchar(20),
   Provincia varchar (20),
   Primary Key(Codigo)
 )

 --3- Ingrese algunos registros:
 Insert Into Clientes 
  Values('Lopez Marcos','Colon 111','Cordoba','Cordoba')
 Insert Into Clientes 
  Values('Perez Ana','San Martin 222','Cruz del Eje','Cordoba')
 Insert Into Clientes 
  Values('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba')
 Insert Into Clientes 
  Values('Perez Luis','Sarmiento 444','Rosario','Santa Fe')
 Insert Into Clientes 
  Values('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba')
 Insert Into Clientes 
  Values('Gomez Ines','San Martin 666','Santa Fe','Santa Fe')
 Insert Into Clientes 
  Values('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba')
 Insert Into Clientes 
  Values('Lopez Carlos',null,'Cruz del Eje','Cordoba')
 Insert Into Clientes 
  Values('Ramos Betina','San Martin 999','Cordoba','Cordoba')
 Insert Into Clientes 
  Values('Lopez Lucas','San Martin 1010','Posadas','Misiones')

 --4- Obtenga las provincias sin repetir (3 registros).
 Select Distinct Provincia 
  From Clientes

 --5- Cuente las distintas Provincias.
 Select count(Distinct Provincia) as Cantidad 
  From Clientes

 --6- Se necesitan los Nombres de las ciudades sin repetir (6 registros).
 Select Distinct Ciudad 
  From Clientes

 --7- Obtenga la cantidad de ciudades distintas.
 Select count(Distinct Ciudad) 
  From Clientes

 --8- Combine con "Where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros).
 Select Distinct Ciudad 
  From Clientes
  Where Provincia = 'Cordoba'

 --9- Contamos las distintas ciudades de cada provincia empleando "Group by"(3 registros).
 Select Provincia,count(Distinct Ciudad)
  From Clientes
  Group by Provincia

 --Ejercicio 2:

 --La provincia almacena en una tabla llamada "Inmuebles" los siguientes datos de los Inmuebles y sus propietarios para cobrar impuestos:

 --1- Elimine la tabla si existe:
  if object_id('Inmuebles') is not null
   Drop Table Inmuebles

  --2- Créela con la siguiente estructura:
 Create Table Inmuebles(
  Documentos varchar(8) not null,
  Apellido varchar(30),
  Nombre varchar(30),
  Domicilio varchar(20),
  Barrio varchar(20),
  Ciudad varchar(20),
  tipo char(1),--b = Baldio, e: Edificado
  Superficie decimal (8,2)
 )

 --3- Ingrese algunos registros:
 Insert Into Inmuebles 
  Values('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100)
 Insert Into Inmuebles 
  Values('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200)
 Insert Into Inmuebles 
  Values('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250)
 Insert Into Inmuebles 
  Values('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200)
 Insert Into Inmuebles 
  Values('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300)
 Insert Into Inmuebles 
  Values('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200)
 Insert Into Inmuebles 
  Values('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500)
 Insert Into Inmuebles 
  Values('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350)
 Insert Into Inmuebles 
  Values('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150)

  --4- Muestre los distintos Apellidos de los propietarios, sin repetir (3 registros).
  Select Distinct Apellido 
   From Inmuebles

  --5- Muestre los distintos documentos de los propietarios, sin repetir (6 registros).
  Select Distinct Documentos 
   From Inmuebles
 
  --6- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5).
  Select count(Distinct Documentos) 
   From Inmuebles
   Where Ciudad = 'Cordoba'

  --7- Cuente la cantidad de inmueble con domicilio en 'San Martin', sin repetir la ciudad (2).
  Select count(Ciudad) From Inmuebles
   Where Domicilio like 'San Martin %'

  --8- Muestre los Apellidos y Nombres, sin repetir (5 registros).
  Select Distinct Apellido, Nombre 
   From Inmuebles

  --9- Muestre la cantidad de inmuebles que tiene cada propietario agrupando por documentos, sin repetir Barrio (6 registros).
  Select Documentos, count(Distinct Barrio) as 'Cantidad'
   From Inmuebles
   Group by documentos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
  if object_id('Libros') is not null
   Drop Table Libros

  --Creamos la tabla:
  Create Table Libros(
   Codigo int identity,
   Titulo varchar(40),
   Autor varchar(30),
   Editorial varchar(15),
   Primary Key(Codigo)
  )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('El aleph','Borges','Planeta')
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Emece')
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Planeta')
 Insert Into Libros 
  Values('Antologia Poetica','Borges','Planeta')
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Emece')
 Insert Into Libros 
  Values('Aprenda PHP','Lopez','Emece')
 Insert Into Libros 
  Values('Manual de PHP', 'J. Paez', null)
 Insert Into Libros 
  Values('Cervantes y el Quijote',null,'Paidos')
 Insert Into Libros 
  Values('Harry Potter y la Piedra Filosofal','J.K. Rowling','Emece')
 Insert Into Libros 
  Values('Harry Potter y la Camara Secreta','J.K. Rowling','Emece')
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Paidos')
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Planeta')
 Insert Into Libros 
  Values('PHP de la A a la Z',null,null)
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta')

 --Para obtener la lista de autores sin repetición tipeamos:
 Select Distinct Autor 
  From Libros

 --note que aparece "null" como un valor para "autor"· 
 --Para obtener la lista de autores conocidos, es decir, no incluyendo "null" en la lista:
 Select Distinct Autor 
  From Libros 
  Where Autor is not null

 --Contamos los distintos autores:
 Select count(Distinct Autor) 
  From Libros

 --Queremos los Nombres de los editoriales sin repetir:
 Select Distinct Editorial 
  From Libros

 --Queremos saber la cantidad de editoriales distintas:
 Select count(Distinct Editorial)
  From Libros

 --La combinamos con "Where" para obtener los distintos autores de la editorial "Planeta":
 Select Distinct Autor 
  From Libros
  Where Editorial = 'Planeta'

 --
 Select Editorial, count(Distinct Autor) 
  From Libros
  Group by Editorial

 --Contamos los distintos autores que tiene cada editorial empleando "Group by":
 Select Distinct Titulo, Editorial 
  From Libros
  Order by Titulo

 --Mostramos los títulos y editoriales de los libros sin repetir títulos ni editoriales:
 Select Distinct Titulo, Editorial
  From Libros
  Order by Titulo
 --note que los registros no están duplicados, aparecen títulos iguales pero con editorial diferente, cada registro es diferente.

 /*********************************************************************************************************************************************/

 --44) Cláusula (TOP).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus empleados en una tabla llamada "Empleados".

 --1- Elimine la tabla si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Créela con la siguiente estructura:
 Create Table Empleados(
  Documentos varchar(8) not null,
  Nombre varchar(30),
  EstadoCivil char(1),--c = Casado, s = Soltero, v = Viudo
  Seccion varchar(20)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('22222222','Alberto Lopez','c','Sistemas')
 Insert Into Empleados 
  Values('23333333','Beatriz Garcia','c','Administracion')
 Insert Into Empleados 
  Values('24444444','Carlos Fuentes','s','Administracion')
 Insert Into Empleados 
  Values('25555555','Daniel Garcia','s','Sistemas')
 Insert Into Empleados 
  Values ('26666666','Ester Juarez','c','Sistemas')
 Insert Into Empleados 
  Values('27777777','Fabian Torres','s','Sistemas')
 Insert Into Empleados 
  Values('28888888','Gabriela Lopez',null,'Sistemas')
 Insert Into Empleados 
  Values('29999999','Hector Garcia',null,'Administracion')

 --4- Muestre los 5 primeros registros (5 registros).
 Select top 5 * From Empleados

 --5- Muestre Nombre y Seccion de los 4 primeros registros ordenados por sección (4 registros).
 Select top 4 Nombre, Seccion
  From Empleados
  Order by Seccion

 --6- Realice la misma consulta anterior pero incluya todos los registros que tengan el mismo valor en "Seccion" que el último (8 registros).
 Select top 4 with ties Nombre, Seccion
  From Empleados
  Order by Seccion

 --7- Muestre Nombre, estado civil y Seccion de los primeros 4 Empleados ordenados por estado civil y sección (4 registros).
 Select top 4 Nombre, EstadoCivil, Seccion
  From Empleados
  Order by EstadoCivil, Seccion

 --8- Realice la misma consulta anterior pero incluya todos los valores iguales al último registro retornado (5 registros).
 Select top 4 with ties Nombre, EstadoCivil, Seccion
  From Empleados
  Order by EstadoCivil, Seccion

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(20),
  Editorial varchar(20)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values ('Uno','Richard Bach','Planeta')
 Insert Into Libros 
  Values ('El aleph','Borges','Emece')
 Insert Into Libros 
  Values ('Alicia en el Pais...','Carroll','Planeta')
 Insert Into Libros 
  Values ('Aprenda PHP','Mario Molina','Siglo XXI')
 Insert Into Libros 
  Values ('Java en 10 minutos','Mario Molina','Siglo XXI')
 Insert Into Libros 
  Values ('Java desde cero','Mario Molina','Emece')
 Insert Into Libros 
  Values ('Ilusiones','Richard Bach','Planeta')

 --Obtenemos todos los datos de los primeros 2 Libros de la tabla:
 Select TOP 2 * From Libros

 --Mostramos los títulos y Autores de los 3 primeros Libros ordenados por Autor:
 Select TOP 3 Titulo, Autor 
  From Libros
  Order by Autor

 --Realizamos la misma consulta anterior pero empleamos la cláusula "with ties", 
 --con lo cual incluiremos en la selección, todos los registros que tengan el mismo Autor 
 --que el último registro retornado, aunque pasemos de 3:
 Select TOP 3 with ties Titulo, Autor 
  From Libros
  Order by Autor

 --note que retorna los 5 primeros registros porque incluye los dos siguientes 
 --que tienen el mismo valor que el último en el campo "autor" (por el cual se ordena).

 --Recuperar la mitad de registros de la tabla 'Libros':
 Select TOP 50 
  percent * From Libros
  Order by Autor

 /*********************************************************************************************************************************************/

 --53) Eliminar Restricciones (ALTER TABLE - DROP).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla llamada "vehiculos".

 --1- Elimine la tabla, si existe:
 if object_id('Vehiculos') is not null
  Drop Table Vehiculos

 --2- Cree la tabla para Vehiculos:

 --Creamos las tablas Vehiculos:
 Create Table Vehiculos(
  Patente char(6) not null,
  tipo char(1),--'a' = Auto, 'm' = Moto
  Horallegada DateTime not null,
  Horasalida DateTime
 )

 --3- EsTablezca una restricción "check" que admita solamente los valores "a" y "m" para el campo "tipo":
 Alter Table Vehiculos
 Add Constraint CK_Vehiculos_tipo
 check (tipo in ('a','m'))

 --4- EsTablezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no ingresarse valor para dicho campo:
 Alter Table Vehiculos
  Add Constraint DF_Vehiculos_tipo
  default 'a'
  for tipo

 --5- EsTablezca una restricción "check" para el campo "Patente" para que acepte 3 letras seguidas de 3 dígitos:
 Alter Table Vehiculos
 Add Constraint CK_Vehiculos_Patente_patrOn
 check (Patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]')

 --6- Agregue una restricción "Primary Key" que incluya los campos "Patente" y "Hora de llegada":
 Alter Table Vehiculos
 Add Constraint PK_Vehiculos_Patentellegada
 Primary Key(Patente,Horallegada)

 --7- Ingrese un vehículo:
 Insert Into Vehiculos 
  Values('SDR456','a','2005/10/10 10:10',null)

 --8- intente ingresar un registro repitiEndo la clave primaria:
 Insert Into Vehiculos 
  Values('SDR456','m','2005/10/10 10:10',null)
 --no se permite.

 --9- Ingrese un registro repitiEndo la Patente pero no la hora de llegada:
 Insert Into Vehiculos 
  Values('SDR456','m','2005/10/10 12:10',null)

 --10- Ingrese un registro repitiEndo la hora de llegada pero no la Patente:
 Insert Into Vehiculos 
  Values('SDR111','m','2005/10/10 10:10',null)

 --11- Vea todas las Restricciones para la tabla "Vehiculos":
 Exec sp_helpConstraint Vehiculos
 --aparecen 4 filas, 2 correspondientes a Restricciones "check", 1 a "default" y 1 a "Primary Key".

 --12- Elimine la restricción "default" del campo "tipo".
 Alter Table Vehiculos
  Drop DF_Vehiculos_tipo

 --13- Vea si se ha eliminado:
 Exec sp_helpConstraint Vehiculos

 --14- Elimine la restricción "Primary Key" y "check".
 Alter Table Vehiculos
  Drop PK_Vehiculos_Patentellegada, CK_Vehiculos_tipo

 --15- Vea si se han eliminado:
 Exec sp_helpConstraint Vehiculos

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --La creamos estableciendo el campo código como clave primaria:

 --Creamos las tablas Libros:
 Create Table Libros(
  Codigo int not null,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(6,2)
 )

 --Definimos una restricción "Primary Key" para nuestra tabla "libros" para asegurarnos que cada libro tEndrá un código diferente y único:
 Alter Table Libros
  Add Constraint PK_Libros_Codigo
  Primary Key(Codigo)

 --Definimos una restricción "check" para asegurarnos que el precio no será negativo:
 Alter Table Libros
  Add Constraint CK_Libros_Precio
  check (Precio >= 0)

 --Definimos una restricción "default" para el campo "autor" para que almacene "Desconocido":
 Alter Table Libros
  Add Constraint Df_Libros_Autor
  default 'Desconocido'
  For Autor

 --Definimos una restricción "default" para el campo "precio" para que almacene 0:
 Alter Table Libros
  Add Constraint Df_Libros_Precio
  default 0
  For Precio

 --Vemos las Restricciones:
 Exec sp_helpConstraint Libros

 --Aparecen 4 Restricciones, 1 "check", 2 "default" y 1 "Primary Key".

 --Eliminamos la restricción "Df_Libros_Autor":
 Alter Table Libros 
   Drop Df_Libros_Autor

 --Eliminamos la restricción "PK_Libros_Codigo":
 Alter Table Libros 
   Drop PK_Libros_Codigo

 --Vemos si se eliminaron:
 Exec sp_helpConstraint Libros

 --Aparecen 2 Restricciones.

 /*********************************************************************************************************************************************/

 --66) Combinación Interna (INNER JOIN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "Clientes", 
 --también tiene una tabla "Provincias" donde registra los Nombres de las provincias.

 --1- Elimine las tablas "Clientes" y "Provincias", si existen:
  if (object_id('Clientes')) is not null
   Drop Table Clientes

  if (object_id('Provincias')) is not null
   Drop Table Provincias

 --2- Créelas con las siguientes estructuras:

 --Creamos las tablas Clientes:
 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  Ciudad varchar(20),
  CodigoProvincia tinyint not null, Primary Key(Codigo)
 )

 --Creamos las tablas Provincias:
 Create Table Provincias(
  Codigo tinyint identity,
  Nombre varchar(20), Primary Key(Codigo)
 )

 --3- Ingrese algunos registros para ambas tablas:
 Insert Into Provincias(Nombre) Values('Cordoba')
 Insert Into Provincias(Nombre) Values('Santa Fe')
 Insert Into Provincias(Nombre) Values('Corrientes')

 Insert Into Clientes Values('Lopez Marcos','Colon 111','Córdoba',1)
 Insert Into Clientes Values('Perez Ana','San Martin 222','Cruz del Eje',1)
 Insert Into Clientes Values('Garcia Juan','Rivadavia 333','Villa Maria',1)
 Insert Into Clientes Values('Perez Luis','Sarmiento 444','Rosario',2);
 Insert Into Clientes Values('Pereyra Lucas','San Martin 555','Cruz del Eje',1)
 Insert Into Clientes Values('Gomez Ines','San Martin 666','Santa Fe',2)
 Insert Into Clientes Values('Torres Fabiola','Alem 777','Ibera',3)

 --4- Obtenga los datos de ambas tablas, usando alias:
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  join Provincias as p
  On c.CodigoProvincia = p.Codigo

 --5- Obtenga la misma información anterior pero ordenada por Nombre de provincia.
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  join Provincias as p
  On c.CodigoProvincia = p.Codigo
  Order by p.Nombre

 --6- Recupere los clientes de la provincia "Santa Fe" (2 registros devueltos).
 Select c.Nombre, Domicilio, Ciudad
  From Clientes as c
  join Provincias as p
  On c.CodigoProvincia = p.Codigo
  Where p.Nombre = 'Santa Fe'

 --Ejercicio 2:

 --Un club dicta clases de distintos Deportes. Almacena la información en una tabla llamada "Inscriptos" 
 --que incluye el Documentos, el nombre, el deporte y si la Matricula esta Paga o no 
 --y una tabla llamada "Inasistencias" que incluye el Documentos, el deporte y la Fecha de la inasistencia.

 --1- Elimine las tablas si existen y cree las tablas:
 if (object_id('Inscriptos')) is not null
  Drop Table Inscriptos

 if (object_id('Inasistencias')) is not null
  Drop Table Inasistencias

 --2- Créelas con las siguientes estructuras:

 --Creamos las tablas Inscriptos:
 Create Table Inscriptos(
  Nombre varchar(30),
  Documentos char(8),
  Deporte varchar(15),
  Matricula char(1), --'s' = Paga 'n' = imPaga
  Primary Key(Documentos, Deporte)
 )

 --Creamos las tablas Inasistencias:
 Create Table Inasistencias(
  Documentos char(8),
  Deporte varchar(15),
  Fecha DateTime
 )

 --3- Ingrese algunos registros para ambas tablas:
 Insert Into Inscriptos Values('Juan Perez','22222222','Tenis','s')
 Insert Into Inscriptos Values('Maria Lopez','23333333','Tenis','s')
 Insert Into Inscriptos Values('Agustin Juarez','24444444','Tenis','n')
 Insert Into Inscriptos Values('Marta Garcia','25555555','Natacion','s')
 Insert Into Inscriptos Values('Juan Perez','22222222','Natacion','s')
 Insert Into Inscriptos Values('Maria Lopez','23333333','Natacion','n')

 Insert Into Inasistencias Values('22222222','Tenis','2006-12-01')
 Insert Into Inasistencias Values('22222222','Tenis','2006-12-08')
 Insert Into Inasistencias Values('23333333','Tenis','2006-12-01')
 Insert Into Inasistencias Values('24444444','Tenis','2006-12-08')
 Insert Into Inasistencias Values('22222222','Natacion','2006-12-02')
 Insert Into Inasistencias Values('23333333','Natacion','2006-12-02')

 --4- Muestre el nombre, el deporte y las Fechas de Inasistencias, ordenado por Nombre y Deporte.
 Select Nombre, insc.Deporte, ina.Fecha
  From Inscriptos as insc
  join Inasistencias as ina
  On insc.Documentos = ina.Documentos and
  insc.Deporte = ina.Deporte
  Order by Nombre, insc.Deporte
 --note que la condición es compuesta porque para identificar los registros de la tabla "Inasistencias" necesitamos ambos campos.

 --5- Obtenga el nombre, Deporte y las Fechas de Inasistencias de un determinado inscripto en un determinado Deporte (3 registros).
 Select Nombre, insc.Deporte, ina.Fecha
  From Inscriptos as insc
  join Inasistencias as ina
  On insc.Documentos = ina.Documentos and
  insc.Deporte = ina.Deporte
  Where insc.Documentos = '22222222'

 --6- Obtenga el nombre, Deporte y las Fechas de Inasistencias de todos los Inscriptos que pagaron la matrícula (4 registros).
 Select Nombre,insc.Deporte, ina.Fecha
  From Inscriptos as insc
  join Inasistencias as ina
  On insc.Documentos = ina.Documentos and
  insc.Deporte = ina.Deporte
  Where insc.Matricula='s'

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

 --Eliminamos ambas tablas, si existen:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos las tablas Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20), Primary Key(Codigo)
 )

 --Ingresamos algunos registros en ambas tablas:
 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')

 Insert Into Libros Values('El aleph','Borges',2,20)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',3,50)
 Insert Into Libros Values('Java en 10 minutos',default,3,45)

 --Recuperamos los datos de libros:
 Select * From Libros

 --vemos que en el campo "editorial" aparece el código, pero no sabemos el nombre de la editorial.

 --Realizamos un join para obtener datos de ambas tablas (Titulo, autor y Nombre de la editorial):
 Select Titulo, Autor, Nombre 
  From Libros
  join Editoriales
  On CodigoEditorial = Editoriales.Codigo

 --Mostramos el código del libro, título, autor, Nombre de la editorial y el precio realizando un join y empleando alias:
 Select l.Codigo, Titulo, Autor, Nombre, Precio 
  From Libros as l
  join Editoriales as e
  On CodigoEditorial = e.Codigo

 --note que al listar el campo "codigo" especificamos a qué tabla pertenece; 
 --si no lo hacemos SQL Server no sabrá si nos referimos al de la tabla "libros" o "editoriales". 
 --Los demás campos no tienen referencia a la tabla porque tienen Nombres que no se repiten.

 --Realizamos la misma consulta anterior agregando un "Where" para obtener solamente los libros de la editorial "Siglo XXI": 
 Select l.Codigo, Titulo, Autor, Nombre, Precio From Libros as l
 join Editoriales as e
 On CodigoEditorial = e.Codigo Where e.Nombre = 'Siglo XXI'

 --Obtenemos título, autor y Nombre de la editorial, esta vez ordenados por título:
 Select Titulo,Autor,Nombre From Libros as l
 join Editoriales as e
 On CodigoEditorial = e.Codigo Order by Titulo

 /*********************************************************************************************************************************************/

 --67) Combinación Externa Izquierda (LEFT JOIN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "Clientes", 
 --también tiene una tabla "Provincias" donde registra los Nombres de las provincias.

 --1- Elimine las tablas "Clientes" y "Provincias", si existen y cree las tablas:
 if (object_id('Clientes')) is not null
  Drop Table Clientes

 if (object_id('Provincias')) is not null
  Drop Table Provincias

 --Creamos la tabla Clientes:
 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  Ciudad varchar(20),
  CodigoProvincia tinyint not null, Primary Key(Codigo)
 )

 --Creamos la tabla Clientes:
 Create Table Provincias(
  Codigo tinyint identity,
  Nombre varchar(20), Primary Key(Codigo)
 )

 --2- Ingrese algunos registros para ambas tablas:
 Insert Into Provincias(Nombre) Values('Cordoba')
 Insert Into Provincias(Nombre) Values('Santa Fe')
 Insert Into Provincias(Nombre) Values('Corrientes')

 Insert Into Clientes Values('Lopez Marcos','Colon 111','Córdoba',1)
 Insert Into Clientes Values('Perez Ana','San Martin 222','Cruz del Eje',1)
 Insert Into Clientes Values('Garcia Juan','Rivadavia 333','Villa Maria',1)
 Insert Into Clientes Values('Perez Luis','Sarmiento 444','Rosario',2)
 Insert Into Clientes Values('Gomez Ines','San Martin 666','Santa Fe',2)
 Insert Into Clientes Values('Torres Fabiola','Alem 777','La Plata',4)
 Insert Into Clientes Values('Garcia Luis','Sucre 475','Santa Rosa',5)

 --3- Muestre todos los datos de los clientes, incluido el nombre de la provincia:
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  left join Provincias as p
  On CodigoProvincia = p.Codigo

 --4- Realice la misma consulta anterior pero Alterando el orden de las tablas:
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Provincias as p
  left join Clientes as c
  On CodigoProvincia = p.Codigo;

 --5- Muestre solamente los clientes de las provincias que existen en "Provincias" (5 registros):
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  left join Provincias as p
  On CodigoProvincia = p.Codigo
  Where p.Codigo is not null;

 --6- Muestre todos los clientes cuyo código de provincia no existe en "Provincias" ordenados por Nombre del cliente (2 registros):
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  left join Provincias as p
  On CodigoProvincia = p.Codigo
  Where p.Codigo is null
  Order by c.Nombre

 --7- Obtenga todos los datos de los clientes de "Cordoba" (3 registros):
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  left join Provincias as p
  On CodigoProvincia = p.Codigo
  Where p.Nombre = 'Cordoba'

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

 --Eliminamos ambas tablas, si existen y las creamos:
 if object_id('Libros') is not null
 Drop Table Libros

 if object_id('Editoriales') is not null
 Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20), Primary Key(Codigo)
 )

 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')

 Insert Into Libros Values('El aleph','Borges',1,20)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',2,50)
 Insert Into Libros Values('Java en 10 minutos',default,4,45)

 --Realizamos una combinación izquierda para obtener los datos de los libros, incluyendo el nombre de la editorial:
 Select Titulo, Nombre From Editoriales as e
 left join Libros as l
 On CodigoEditorial = e.Codigo

 --los editoriales de las cuales no hay Libros, es decir, cuyo código de editorial no está presente en "libros" 
 --aparece en el resultado, pero con el valor "null" en el campo "titulo".

 --Realizamos la misma consulta anterior pero cambiamos el orden de las tablas:
 Select Titulo, Nombre From Libros as l
 left join Editoriales as e
 On CodigoEditorial = e.Codigo

 /*El resultado mostrará el título del libro y el nombre de la editorial; 
 los títulos cuyo código de editorialno está presente en "editoriales" 
 aparecen en el resultado, pero con el valor "null" en el campo "nombre".*/

 --Restringimos el resultado de una consulta considerando solamente los registros que encuentran coincidencia en la tabla de la derecha, 
 --es decir, cuyo valor de código está presente en "libros":
 Select Titulo, Nombre From Editoriales as e
 left join Libros as l
 On e.Codigo = CodigoEditorial 
 Where CodigoEditorial is not null

 --Mostramos los editoriales que no están presentes en "libros", es decir, que no encuentran coincidencia en la tabla de la derecha:
 Select Titulo, Nombre From Editoriales as e
 left join Libros as l
 On e.Codigo = CodigoEditorial 
 Where CodigoEditorial IS null

 /*********************************************************************************************************************************************/

 --68) Combinación Externa Derecha (RIGHT JOIN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "Clientes", 
 --también tiene una tabla "Provincias" donde registra los Nombres de las provincias.

 --1- Elimine las tablas "Clientes" y "Provincias", si existen y cree las tablas:
 if (object_id('Clientes')) is not null
  Drop Table Clientes

 if (object_id('Provincias')) is not null
  Drop Table Provincias

 --Creamos la tabla Clientes:
 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  Ciudad varchar(20),
  CodigoProvincia tinyint not null, Primary Key(Codigo)
 )

 --Creamos la tabla Provincias:
 Create Table Provincias(
  Codigo tinyint identity,
  Nombre varchar(20), Primary Key(Codigo)
 )

 --2- Ingrese algunos registros para ambas tablas:
 Insert Into Provincias(Nombre) Values('Cordoba')
 Insert Into Provincias(Nombre) Values('Santa Fe')
 Insert Into Provincias(Nombre) Values('Corrientes')

 Insert Into Clientes Values ('Lopez Marcos','Colon 111','Córdoba',1)
 Insert Into Clientes Values ('Perez Ana','San Martin 222','Cruz del Eje',1)
 Insert Into Clientes Values ('Garcia Juan','Rivadavia 333','Villa Maria',1)
 Insert Into Clientes Values ('Perez Luis','Sarmiento 444','Rosario',2)
 Insert Into Clientes Values ('Gomez Ines','San Martin 666','Santa Fe',2)
 Insert Into Clientes Values ('Torres Fabiola','Alem 777','La Plata',4)
 Insert Into Clientes Values ('Garcia Luis','Sucre 475','Santa Rosa',5)

 --3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right join".
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Provincias as p
  right join Clientes as c
  On CodigoProvincia = p.Codigo

 --4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Clientes as c
  left join Provincias as p
  On CodigoProvincia = p.Codigo

 --5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en "Provincias" (5 registros).
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Provincias as p
  right join Clientes as c
  On CodigoProvincia = p.Codigo
  Where p.Codigo is not null

 --6- Muestre todos los clientes cuyo código de provincia no existe en "Provincias" ordenados por ciudad (2 registros).
 Select c.Nombre, Domicilio, Ciudad, p.Nombre
  From Provincias as p
  right join Clientes as c
  On CodigoProvincia = p.Codigo
  Where p.Codigo is null
  Order by Ciudad

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

 --Eliminamos ambas tablas, si existen y las creamos:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null 
  Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 ) 

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  Primary Key(Codigo)
 )

 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')

 Insert Into Libros Values('El aleph','Borges',1,20)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',2,50)
 Insert Into Libros Values('Java en 10 minutos',default,4,45)

 --Solicitamos el título y Nombre de la editorial de los libros empleando un "right join":
 Select Titulo, Nombre 
  From Libros as l
  right join Editoriales as e
  On CodigoEditorial = e.Codigo

 --los editoriales de las cuales no hay Libros, es decir, cuyo código de Editorial
 --no está presente en "libros" aparece en el resultado, pero con el valor "null" en el campo "titulo".

 --Realizamos la misma consulta anterior agregando un "Where" 
 --que restringa el resultado considerando solamente los registros que encuentran coincidencia en la tabla izquierda:
 Select Titulo, Nombre 
  From Libros as l
  right join Editoriales as e
  On e.Codigo = CodigoEditorial 
  Where CodigoEditorial is not null

 --Mostramos los editoriales que no están presentes en "libros" (que no encuentran coincidencia en "editoriales"):
 Select Titulo, Nombre From Libros as l
  right join Editoriales as e
  On e.Codigo = CodigoEditorial  
  Where CodigoEditorial is null

 /*********************************************************************************************************************************************/

 --69) Combinación Externa Completa (Full JOIN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta clases de distintos Deportes. Almacena la información en una tabla llamada "Deportes" 
 en la cual incluye el nombre del deporte y el nombre del Profesor y en otra tabla llamada 
 "Inscriptos" que incluye el Documentos del socio que se inscribe, el deporte y si la Matricula está 
 Paga o no.*/

 --1- Elimine las tablas si existen y cree las tablas:
 if (object_id('Deportes')) is not null
  Drop Table Deportes

 if (object_id('Inscriptos')) is not null
  Drop Table Inscriptos

 Create Table Deportes(
  Codigo tinyint identity,
  Nombre varchar(30),
  Profesor varchar(30),
  Primary Key(Codigo)
 )

 Create Table Inscriptos(
  Documentos char(8),
  CodigoDeporte tinyint not null,
  Matricula char(1) --'s'=Paga 'n'=imPaga
 )

 --2- Ingrese algunos registros para ambas tablas:
 Insert Into Deportes Values('Tenis','Marcelo Roca')
 Insert Into Deportes Values('Natacion','Marta Torres')
 Insert Into Deportes Values('Basquet','Luis Garcia')
 Insert Into Deportes Values('Futbol','Marcelo Roca')
 
 Insert Into Inscriptos Values('22222222',3,'s')
 Insert Into Inscriptos Values('23333333',3,'s')
 Insert Into Inscriptos Values('24444444',3,'n')
 Insert Into Inscriptos Values('22222222',2,'s')
 Insert Into Inscriptos Values('23333333',2,'s')
 Insert Into Inscriptos Values('22222222',4,'n')
 Insert Into Inscriptos Values('22222222',5,'n') 

 --3- Muestre todos la información de la tabla "Inscriptos", 
 --y consulte la tabla "Deportes" para obtener el nombre de cada Deporte (6 registros).
 Select Documentos, d.Nombre, Matricula
  From Inscriptos as i
  join Deportes as d
  On CodigoDeporte = Codigo

 --4- Empleando un "left join" con "Deportes" obtenga todos los datos de los Inscriptos (7 registros).
 Select Documentos, d.Nombre, Matricula
  From Inscriptos as i
  left join Deportes as d
  On CodigoDeporte = Codigo

 --5- Obtenga la misma salida anterior empleando un "rigth join".
 Select Documentos, d.Nombre, Matricula
  From Deportes as d
  right join Inscriptos as i
  On CodigoDeporte = Codigo

 --6- Muestre los deportes para los cuales no hay Inscriptos, empleando un "left join" (1 registro).
 Select Nombre
  From Deportes as d
  left join Inscriptos as i
  On CodigoDeporte = Codigo
  Where CodigoDeporte is null

 --7- Muestre los Documentoss de los Inscriptos a Deportes que no existen en la tabla "Deportes" (1 registro).
 Select Documentos
  From Inscriptos as i
  left join Deportes as d
  On CodigoDeporte = Codigo
  Where Codigo is null

 --8- Emplee un "full join" para obtener todos los datos de ambas tablas, 
 --incluyendo las inscripciones a Deportes inexistentes en "Deportes" y los deportes que no tienen Inscriptos (8 registros).
 Select Documentos, Nombre, Profesor, Matricula
  From Inscriptos as i
  full join Deportes as d
  On CodigoDeporte = Codigo 

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

 --Eliminamos ambas tablas, si existen y las creamos:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  Primary Key (Codigo)
 )

 --Ingresamos algunos registros en ambas tablas:
 Insert Into Libros Values('El aleph','Borges',1,20)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',2,50)
 Insert Into Libros Values('Java en 10 minutos',default,4,45)

 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')

 /*Realizamos una combinación externa completa para obtener todos los registros de ambas tablas, 
 incluyendo los libros cuyo código de editorialno existe en la tabla "editoriales" 
 y los editoriales de las cuales no hay correspOndencia en "libros":*/
 Select Titulo, Nombre
  From Editoriales as e
  full join Libros as l
  On CodigoEditorial = e.Codigo

 /*********************************************************************************************************************************************/

 --70) Combinaciones Cruzadas (CROSS JOIN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una agencia matrimonial almacena la información de sus clientes de Sexo femenino en una tabla 
 --llamada "Mujeres" y en otra la de sus clientes de Sexo masculino llamada "Varones".

 --1- Elimine las tablas si existen y créelas:
 if object_id('Mujeres') is not null
  Drop Table Mujeres

 if object_id('Varones') is not null
  Drop Table Varones

 --Creamos la tabla Mujeres:
 Create Table Mujeres(
  Nombre varchar(30),
  Domicilio varchar(30),
  Edad int
 )

 --Creamos la tabla Varones:
 Create Table Varones(
  Nombre varchar(30),
  Domicilio varchar(30),
  Edad int
 )

 --2- Ingrese los siguientes registros:
 Insert Into Mujeres Values('Maria Lopez','Colon 123',45)
 Insert Into Mujeres Values('Liliana Garcia','Sucre 456',35)
 Insert Into Mujeres Values('Susana Lopez','Avellaneda 98',41)

 Insert Into Varones Values('Juan Torres','Sarmiento 755',44)
 Insert Into Varones Values('Marcelo Oliva','San Martin 874',56)
 Insert Into Varones Values('Federico Pereyra','Colon 234',38)
 Insert Into Varones Values('Juan Garcia','Peru 333',50)

 --3- La agencia necesita la combinación de todas las personas de Sexo femenino con las de Sexo masculino. Use un "cross join" (12 registros).
 Select m.Nombre, m.Edad, v.Nombre, v.Edad
  From Mujeres as m
  cross join Varones as v

 --4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 registros).
 Select m.Nombre, m.Edad, v.Nombre, v.Edad
  From Mujeres as m
  cross join Varones as v
  Where m.Edad > 40 and v.Edad > 40

 --5- Forme las parejas pero teniEndo en cuenta que no tengan una diferencia superior a 10 años (8 registros).
 Select m.Nombre, m.Edad, v.Nombre, v.Edad
  From Mujeres as m
  cross join Varones as v
  Where m.Edad-v.Edad between -10 and 10

 --Ejercicio 2:

 --Una empresa de seguridad almacena los datos de sus Guardias de seguridad en una tabla llamada "Guardias". 
 --también almacena los distintos sitios que solicitarOn sus servicios en una tabla llamada "Tareas".

 --1- Elimine las tablas "Guardias" y "Tareas" si existen:
 if object_id('Guardias') is not null
  Drop Table Guardias

 if object_id('Tareas') is not null
  Drop Table Tareas

 --2- Cree las tablas:

 --Creamos la tabla Guardias:
 Create Table Guardias(
  Documentos char(8),
  Nombre varchar(30),
  Sexo char(1), /* 'f' o 'm' */
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 --Creamos la tabla Tareas:
 Create Table Tareas(
  Codigo tinyint identity,
  Domicilio varchar(30),
  Descripcion varchar(30),
  horario char(2), /* 'AM' o 'PM'*/
  Primary Key(Codigo)
 )

 --3- Ingrese los siguientes registros:
 Insert Into Guardias Values('22333444','Juan Perez','m','Colon 123')
 Insert Into Guardias Values('24333444','Alberto Torres','m','San Martin 567')
 Insert Into Guardias Values('25333444','Luis Ferreyra','m','Chacabuco 235')
 Insert Into Guardias Values('23333444','Lorena Viale','f','Sarmiento 988')
 Insert Into Guardias Values('26333444','Irma Gonzalez','f','Mariano Moreno 111')

 Insert Into Tareas Values('Colon 1111','vigilancia exterior','AM')
 Insert Into Tareas Values('Urquiza 234','vigilancia exterior','PM')
 Insert Into Tareas Values('Peru 345','vigilancia interior','AM')
 Insert Into Tareas Values('Avellaneda 890','vigilancia interior','PM')

 --4- La empresa quiere que todos sus empleados realicen todas las Tareas. Realice una "cross join" (20 registros).
  Select Nombre, t.Domicilio, Descripcion
  From Guardias
  cross join Tareas as t

 --5- En este caso, la empresa quiere que todos los Guardias de Sexo femenino realicen 
 --las Tareas de "vigilancia interior" y los de Sexo masculino de "vigilancia exterior". 
 --Realice una "cross join" con un "Where" que controle tal requisito (10 registros).
  Select Nombre, t.Domicilio, Descripcion
  From Guardias as g
  cross join Tareas as t
  Where (g.Sexo='f' and t.Descripcion = 'vigilancia interior') or (g.Sexo='m' and t.Descripcion = 'vigilancia exterior')

 --Ejercicio Resulto:

 --Un pequeño restaurante tiene almacenados los Nombres y precios de sus comidas en una tabla llamada "comidas" 
 --y en una tabla denominada "postres" los mismos datos de sus postres.

 --Eliminamos las tablas, si existen:
 if object_id('Comidas') is not null
  Drop Table Comidas

 if object_id('Postres ') is not null
  Drop Table Postres 

 --Creamos la tabla Comidas:
 Create Table Comidas(
  Codigo tinyint identity,
  Nombre varchar(30),
  Precio decimal(4,2)
 )

 --Creamos la tabla Postres:
 Create Table Postres(
  Codigo tinyint identity,
  Nombre varchar(30),
  Precio decimal(4,2)
 )

 --Ingresamos algunos registros de Comidas:
 Insert Into Comidas Values('Ravioles',5)
 Insert Into Comidas Values('Tallarines',4)
 Insert Into Comidas Values('Milanesa',7)
 Insert Into Comidas Values('Cuarto De Pollo',6)

 --Ingresamos algunos registros de Postres:
 Insert Into Postres Values('Flan',2.5)
 Insert Into Postres Values('Porción Torta',3.5)

 --El restaurante quiere combinar los registros de ambas tablas 
 --para mostrar los distintos menúes que ofrece. Lo hacemos usando un "cross join":
 Select c.Nombre as 'Plato Principal', p.Nombre as 'Postres ',
 c.Precio + p.Precio as 'Total'
 From Comidas as c
 cross join Postres as p

 /*********************************************************************************************************************************************/

 --73) Combinación De Más De Dos Tablas.

 --Ejercicios Propuestos.

 --Ejercicio 1:

  /*Un club dicta clases de distintos Deportes. En una tabla llamada "Socios" guarda los datos de los 
  Socios, en una tabla llamada "Deportes" la información referente a los diferentes Deportes que se 
  dictan y en una tabla denominada "Inscriptos", las inscripciones de los socios a los distintos 
  Deportes.*/

  /*Un socio puede inscribirse en varios Deportes el mismo año. Un socio no puede inscribirse en el 
  mismo Deporte el mismo año. distintos Socios se inscriben en un mismo Deporte en el mismo año.*/

 --1- Elimine las tablas si existen:
 if object_id('Socios') is not null
  Drop Table Socios

 if object_id('Deportes') is not null
  Drop Table Deportes

 if object_id('Inscriptos') is not null
  Drop Table Inscriptos

 --2- Cree las tablas con las siguientes estructuras:

 --Creamos la tabla de Socios:
 Create Table Socios(
  Documentos char(8) not null, 
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 --Creamos la tabla de Deportes:
 Create Table Deportes(
  Codigo tinyint identity,
  Nombre varchar(20),
  Profesor varchar(15),
  Primary Key(Codigo)
 )

 --Creamos la tabla de Deportes:
 Create Table Inscriptos(
  Documentos char(8) not null, 
  CodigoDeporte tinyint not null,
  anio char(4),
  Matricula char(1),--'s' = Paga, 'n' = imPaga
  Primary Key(Documentos,CodigoDeporte,anio)
 )

 --3- Ingrese algunos registros en "Socios":
 Insert Into Socios Values('22222222','Ana Acosta','Avellaneda 111')
 Insert Into Socios Values('23333333','Betina Bustos','Bulnes 222')
 Insert Into Socios Values('24444444','Carlos Castro','Caseros 333')
 Insert Into Socios Values('25555555','Daniel Duarte','DinaMarca 44')

 --4- Ingrese algunos registros en "Deportes":
 Insert Into Deportes Values('Basquet','Juan Juarez')
 Insert Into Deportes Values('Futbol','Pedro Perez')
 Insert Into Deportes Values('Natacion','Marina Morales')
 Insert Into Deportes Values('Tenis','Marina Morales')

 --5- Inscriba a varios Socios en el mismo Deporte en el mismo año:
 Insert Into Inscriptos Values ('22222222',3,'2006','s')
 Insert Into Inscriptos Values ('23333333',3,'2006','s')
 Insert Into Inscriptos Values ('24444444',3,'2006','n')

 --6- Inscriba a un mismo socio en el mismo Deporte en distintos años:
 Insert Into Inscriptos Values ('22222222',3,'2005','s')
 Insert Into Inscriptos Values ('22222222',3,'2007','n')

 --7- Inscriba a un mismo socio en distintos Deportes el mismo año:
 Insert Into Inscriptos Values ('24444444',1,'2006','s')
 Insert Into Inscriptos Values ('24444444',2,'2006','s')

 --8- Ingrese una inscripción con un código de Deporte inexistente y un Documentos de socio que no exista en "Socios":
 Insert Into Inscriptos Values ('26666666',0,'2006','s')

 --9- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando diferentes tipos de join.
 Select s.Nombre, d.Nombre, anio
  From Deportes as d
  right join Inscriptos as i
  On CodigoDeporte = d.Codigo
  left join Socios as s
  On i.Documentos = s.Documentos

 --10- Muestre todos los datos de las inscripciones(excepto los códigos)incluyendo aquellas inscripciones 
 --cuyo código de Deporte no existe en "Deportes" y cuyo Documentos de socio no se encuentra en "Socios".
 Select s.Nombre, d.Nombre, anio, Matricula
  From Deportes as d
  full join Inscriptos as i
  On CodigoDeporte = d.Codigo
  full join Socios as s
  On s.Documentos = i.Documentos

 --11- Muestre todas las inscripciones del socio con Documentos "22222222".
 Select s.Nombre, d.Nombre, anio, Matricula
  From Deportes as d
  join Inscriptos as i
  On CodigoDeporte = d.Codigo
  join Socios as s
  On s.Documentos = i.Documentos
  Where s.Documentos = '22222222'

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en tres tablas, "libros", "autores" y "editoriales".

 --Eliminamos las tablas, si existen y las creamos:
 if object_id('Libros') is not null
  Drop Table Libros

 --Eliminamos las tablas, si existen y las creamos:
 if object_id('Autores') is not null
  Drop Table Autores

 --Eliminamos las tablas, si existen y las creamos:
 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  CodigoAutor int not null,
  CodigoEditorial tinyint not null,
  Precio decimal(5,2),
  Primary Key(Codigo)
 )

 --Creamos la tabla Autores:
 Create Table Autores(
  Codigo int identity,
  Nombre varchar(20),
  Primary Key(Codigo)
 )

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')
 Insert Into Editoriales Values('Plaza')
 
 Insert Into Autores Values ('Richard Bach')
 Insert Into Autores Values ('Borges')
 Insert Into Autores Values ('Jose Hernandez')
 Insert Into Autores Values ('Mario Molina')
 Insert Into Autores Values ('Paenza')
 
 Insert Into Libros Values('El aleph',2,2,20)
 Insert Into Libros Values('Martin Fierro',3,1,30)
 Insert Into Libros Values('Aprenda PHP',4,3,50)
 Insert Into Libros Values('Uno',1,1,15)
 Insert Into Libros Values('Java en 10 minutos',0,3,45)
 Insert Into Libros Values('Matematica estas ahi',0,0,15)
 Insert Into Libros Values('Java de la A a la Z',4,0,50)

 --Recuperamos todos los datos de los libros consultando las tres tablas:
 Select Titulo, a.Nombre, e.Nombre, Precio 
  From Autores as a
  join Libros as l
  On CodigoAutor = a.Codigo
  join Editoriales as e
  On CodigoEditorial = e.Codigo

  /*los libros cuyo código de Autor no se encuentra en "Autores" (caso de "Java en 10 minutos" y "Matematica estas ahi")
    y cuyo editorial no existe en "editoriales" (caso de "Matematica estas ahi" y "Java de la A a la Z"), 
	no aparecen porque realizamos una combinación interna.*/

 --Podemos combinar varios tipos de join en una misma sentencia:
 Select Titulo, a.Nombre, e.Nombre, Precio 
  From Autores as a
  right join Libros as l
  On CodigoAutor = a.Codigo
  left join Editoriales as e
  On CodigoEditorial = e.Codigo

  /*En la consulta anterior solicitamos el título, Autor y Editorial de todos los libros que encuentren o no coincidencia 
  con "Autores"("right join") y a ese resultado lo combinamos con "editoriales", encuentren o no coincidencia.*/

 /*********************************************************************************************************************************************/

 --74) Combinaciones Con (Update y Delete).

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

 --Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

 --Eliminamos ambas tablas, si existen:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30) default 'Desconocido',
  CodigoEditorial tinyint not null,
  Precio decimal(5,2)
 )

 --Creamos la tabla Editoriales:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(20),
  Primary Key(Codigo)
 )

 --Ingresamos algunos registros de Editoriales:
 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Siglo XXI')

 --Ingresamos algunos registros de Libros:
 Insert Into Libros Values('El aleph','Borges',2,20)
 Insert Into Libros Values('Martin Fierro','Jose Hernandez',1,30)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',3,50)
 Insert Into Libros Values('Java en 10 minutos',default,3,45)

 --Aumentamos en un 10% los Precios de los libros de editorial "Planeta":
 Update Libros set Precio = Precio + (Precio*0.1) 
  From Libros 
  join Editoriales as e
  On CodigoEditorial = e.Codigo
  Where Nombre = 'Planeta'

 --Veamos el resultado:
 Select Titulo, Autor, e.Nombre, Precio
  From Libros as l
  join Editoriales as e
  On CodigoEditorial = e.Codigo

 --Eliminamos todos los libros de editorial "Emece":
 Delete Libros 
  From Libros
  join Editoriales
  On CodigoEditorial = Editoriales.Codigo
  Where Editoriales.Nombre = 'Emece'

 --Veamos si se eliminaron:
 Select Titulo, Autor, e.Nombre, Precio 
  From Libros as l
  join Editoriales as e
  On CodigoEditorial = e.Codigo

 /*********************************************************************************************************************************************/

 --82) Union.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un supermercado almacena en una tabla denominada "Proveedores" los datos de las compañías que le 
 proveen de mercaderías; en una tabla llamada "Clientes", los datos de los comercios que le compran y 
 en otra tabla "Empleados" los datos de los empleados.*/

 --1- Elimine las tablas si existen:
 if object_id('Clientes') is not null
  Drop Table Clientes

 if object_id('Proveedores') is not null
  Drop Table Proveedores

 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree las tablas:
 Create Table Proveedores(
  Codigo int identity,
  Nombre varchar (30),
  Domicilio varchar(30),
  Primary Key(Codigo)
 )

 Create Table Clientes(
  Codigo int identity,
  Nombre varchar (30),
  Domicilio varchar(30),
  Primary Key(Codigo)
 )

 Create Table Empleados(
  Documentos char(8) not null,
  Nombre varchar(20),
  Apellido varchar(20),
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Proveedores Values('Bebida cola','Colon 123')
 Insert Into Proveedores Values('Carnes Unica','Caseros 222')
 Insert Into Proveedores Values('Lacteos Blanca','San Martin 987')

 Insert Into Clientes Values('Supermercado Lopez','Avellaneda 34')
 Insert Into Clientes Values('Almacen Anita','Colon 987')
 Insert Into Clientes Values('Garcia Juan','Sucre 345')

 Insert Into Empleados Values('23333333','Federico','Lopez','Colon 987')
 Insert Into Empleados Values('28888888','Ana','Marquez','Sucre 333')
 Insert Into Empleados Values('30111111','Luis','Perez','Caseros 956')

 --4- El supermercado quiere enviar una tarjeta de salutación a todos los Proveedores, 
 --Clientes y Empleados y necesita el nombre y Domicilio de todos ellos. 
 --Emplee el operador "Union" para obtener dicha información de las tres tablas.
 Select Nombre, Domicilio From Proveedores
  Union
  Select Nombre, Domicilio From Clientes
   Union
   Select (Apellido+' '+Nombre), Domicilio From Empleados

 --5- Agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado y ordene por dicha columna.
 Select Nombre, Domicilio, 'proveedor' as categoria From Proveedores
  Union
  Select Nombre, Domicilio, 'cliente' From Clientes
   Union
   Select(Apellido+' '+Nombre), Domicilio , 'empleado' From Empleados
  Order by categoria

 --Ejercicio Resulto:

  /*Una academia de enseñanza almacena los datos de los Alumnos en una tabla llamada "Alumnos" 
   y los datos de los profesores en otra denominada "Profesores".*/

 --Eliminamos las tablas si existen:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 if object_id('Profesores') is not null
  Drop Table Profesores

 --Creamos la tabla:
 Create Table Profesores(
  Documentos varchar(8) not null,
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 --Creamos la tabla:
 Create Table Alumnos(
  Documentos varchar(8) not null,
  Nombre varchar (30),
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 --Ingresamos algunos registros:
 Insert Into Alumnos 
  Values('30000000','Juan Perez','Colon 123')
 Insert Into Alumnos 
  Values('30111111','Marta Morales','Caseros 222')
 Insert Into Alumnos 
  Values('30222222','Laura Torres','San Martin 987')
 Insert Into Alumnos 
  Values('30333333','Mariano Juarez','Avellaneda 34')
 Insert Into Alumnos 
  Values('23333333','Federico Lopez','Colon 987')

 Insert Into Profesores 
  Values('22222222','Susana Molina','Sucre 345')
 Insert Into Profesores 
  Values('23333333','Federico Lopez','Colon 987')

 --La academia necesita el nombre y Domicilio de Profesores y Alumnos para enviarles una tarjeta de invitación.

 --Empleamos el operador "Union" para obtener dicha información de ambas tablas:
 Select Nombre, Domicilio From Alumnos 
  Union 
 Select Nombre, Domicilio From Profesores

 /*note que existe un Profesor que también está presente en la tabla "Alumnos"; 
 dicho registro aparece una sola vez en el resultado de "Union". 
 Si queremos que las filas duplicadas aparezcan, debemos emplear "all":*/

 Select Nombre, Domicilio From Alumnos 
  Union ALL 
 Select Nombre, Domicilio From Profesores

 --ordenamos por Domicilio:
 Select Nombre, Domicilio From Alumnos 
  Union 
 Select Nombre, Domicilio From Profesores 
 Order by Domicilio

 --Podemos agregar una columna extra a la consulta con el encabezado "condicion" 
 --en la que aparezca el literal "Profesor" o "alumno" según si la persona es uno u otro:
 Select Nombre, Domicilio, 'Alumno' as condicion 
 From Alumnos 
  Union 
 Select Nombre, Domicilio,'Profesor' 
 From Profesores 
 Order by condicion

 /*********************************************************************************************************************************************/

 --83) Agregar y Eliminar Campos (ALTER TABLE - ADD - DROP).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con una tabla llamada "Empleados".

 --1- Elimine la tabla, si existe, créela y cargue un registro:
 if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Apellido varchar(20),
  Nombre varchar(20),
  Domicilio varchar(30),
  FechaIngreso DateTime
 )

 Insert Into Empleados(Apellido, Nombre) 
  Values('Rodriguez','Pablo')

 --2- Agregue el campo "Sueldo", de tipo decimal(5,2).
 Alter Table Empleados
  Add Sueldo decimal(5,2)

 --3- Verifique que la estructura de la tabla ha cambiado.
  Exec sp_columns Empleados

 --4- Agregue un campo "codigo", de tipo int con el atributo "identity".
 Alter Table Empleados
  Add Codigo int identity

 --5- intente agregar un campo "Documentos" no nulo.
 Alter Table Empleados
  Add Documentos char(8) not null

 /*no es posible, porque SQL Server no permite agregar campos "not null" a menos que se especifique un 
 valor por defecto.*/

 --6- Agregue el campo del punto anterior especificando un valor por defecto:
 Alter Table Empleados
  Add Documentos char(8) not null default '00000000'

 --7- Verifique que la estructura de la tabla ha cambiado.
  Exec sp_columns Empleados

 --8- Elimine el campo "Sueldo".
 Alter Table Empleados
  Drop column Sueldo

 --9- Verifique la eliminación:
 Exec sp_columns Empleados

 --10- intente eliminar el campo "Documentos".no lo permite.
  Alter Table Empleados
   Drop column Documentos

 --11- Elimine los campos "codigo" y "FechaIngreso" en una sola sentencia.
  Alter Table Empleados
   Drop column Codigo, FechaIngreso

 --12- Verifique la eliminación de los campos:
 Exec sp_columns Empleados

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Titulo varchar(20),
  Editorial varchar(10),
  Edicion DateTime,
  Precio decimal(6,2)
 )

 --Agregamos un registro:
 Insert Into Libros(Titulo, Editorial, Precio)
  Values ('El aleph','Emece',25.50)

 --Agregamos el campo "Cantidad" a la tabla "libros", de tipo tinyint, que acepta valores nulos:
 Alter Table Libros 
  Add Cantidad tinyint

 --Verificamos la estructura de la tabla empleando el procedimiento almacenado "sp_columns":
 Exec sp_columns Libros

 --Agregamos un campo "codigo" a la tabla "libros", de tipo int con el atributo "identity":
 Alter Table Libros 
  Add Codigo int identity
 
 --intentamos agregar un campo llamado "autor" de tipo varchar(30) que no acepte valores nulos:
 Alter Table Libros 
  Add Autor varchar(30) not null

 --no es posible, porque SQL Server no permite agregar campos "not null" a menos que se especifique un valor por defecto:
 Alter Table Libros 
  Add Autor varchar(20) not null default 'Desconocido'
 --En el ejemplo anterior, se agregó una restricción "default" 
 --para el nuevo campo, que puede verificarse ejecutando el procedimiento almacenado "sp_helpConstraint".

 --En el siguiente ejemplo eliminamos el campo "precio" de la tabla "libros":
 Alter Table Libros 
  Drop Column Precio
 
 --Verificamos la eliminación:
 Exec sp_Columns Libros
 --el campo "precio" ya no existe.

 --Recuerde que no pueden eliminarse los campos con Restricciones, intentémoslo:
 Alter Table Libros 
  Drop Column Autor --no lo permite.

 --Podemos eliminar varios campos en una sola sentencia:
 Alter Table Libros 
  Drop Column Editorial, Edicion

 /*********************************************************************************************************************************************/

 --84) Altear Campos (ALTER TABLE - ALTER).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Trabaje con una tabla llamada "Empleados".

 --1- Elimine la tabla, si existe y créela:
 if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Legajo int not null,
  Documentos char(7) not null,
  Nombre varchar(10),
  Domicilio varchar(30),
  Ciudad varchar(20) default 'Buenos Aires',
  Sueldo decimal(6,2),
  CantidadHijos tinyint default 0,
  Primary Key(Legajo)
 )

 --2- Modifique el campo "nombre" extendiendo su longitud.
  Alter Table Empleados
   Alter column Nombre varchar(30)

 --3- controle la modificación:
 Exec sp_columns Empleados

 --4- Modifique el campo "Sueldo" para que no admita valores nulos.
  Alter Table Empleados
   Alter column Sueldo decimal(6,2) not null

 --5- Modifique el campo "Documentos" ampliando su longitud a 8 caracteres.
 Alter Table Empleados
  Alter column Documentos char(8) not null

 --6- intente modificar el tipo de datos del campo "Legajo" a "tinyint":
 Alter Table Empleados
  Alter column Legajo tinyint not null
 --no se puede porque tiene una restricción.

 --7- Ingrese algunos registros, uno con "nombre" nulo:
 Insert Into Empleados 
  Values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3)
 Insert Into Empleados 
  Values(2,'30000000',null,'Sucre 456','Cordoba',600,2)

 --8- intente modificar el campo "nombre" para que no acepte valores nulos:
 Alter Table Empleados
  Alter column Nombre varchar(30) not null
 --no se puede porque hay registros con ese valor.

 --9- Elimine el registro con "nombre" nulo y realice la modificación del punto 7:
 Delete From Empleados Where Nombre is null
 Alter Table Empleados
  Alter column Nombre varchar(30) not null

 --10- Modifique el campo "Ciudad" a 10 caracteres.
  Alter Table Empleados
   Alter column Ciudad varchar(10);

 --11- intente agregar un registro con el valor por defecto para "Ciudad":
 Insert Into Empleados 
  Values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4)
 --no se puede porque el campo acepta 10 caracteres y  el valor por defecto tiene 12 caracteres.

 --12- Modifique el campo "Ciudad" sin que afecte la restricción dándole una longitud de 15 caracteres.
  Alter Table Empleados
   Alter column Ciudad varchar(15)

 --13- Agregue el registro que no pudo ingresar en el punto 10:
 Insert Into Empleados 
  Values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4)

 --14- intente agregar el atributo identity de "Legajo".
 --Alter Table Empleados
 --Alter column Legajo int identity
 --no se puede agregar este atributo.

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe:
 if object_id('Libros') is not null
  Drop Table Libros

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(30),
  Autor varchar(30),
  Editorial varchar(15),
  Precio decimal(6,2) not null default 0
 )

 --Ingresamos algunos registros:
 Insert Into Libros
  Values('El aleph','Borges','Planeta',20)
 Insert Into Libros
  Values('Java en 10 minutos',null,'Siglo XXI',30)
 Insert Into Libros
  Values('Uno','Richard Bach','Planeta',15)
 Insert Into Libros
  Values('Martin Fierro','Jose Hernandez',null,30)
 Insert Into Libros
  Values('Aprenda PHP','Mario Molina','Emece',25)

 --Vamos a efectuar diferentes modificaciOnes a los campos de esta tabla. 
 ---Luego de cada una podemos ver la estructura de la tabla para controlar 
 --si los cambios se realizarOn o no empleando el procedimiento almacenado "sp_columns".

 --Modificamos el campo "titulo" para que acepte una cadena más larga y no admita valores nulos:

 Alter Table Libros 
  Alter Column Titulo varchar(40) not null

 --Si intentamos modificar el campo "autor" para que no admita valores nulos SQL Server 
 --no lo permite porque hay registros con valor nulo en "autor".

 --Eliminamos tal registro y realizamos la modificación:
 Delete From Libros Where Autor IS null
 Alter Table Libros 
  Alter Column Autor varchar(30) not null

 --intentamos quitar el atributo "identity" del campo "codigo" y lo redefinimos como "smallint":
 Alter Table Libros 
  Alter Column Codigo smallint

 --no aparece mensaje de error pero no se realizó el cambio completo, controlémoslo:
 Exec sp_columns Libros
 --el campo "codigo" es "smallint pero aún es "identity".

 --AprEndimos que no se puede modificar el tipo de dato o atributos de un campo que tiene una restricción 
 --si el cambio afecta a la restricción; pero si el cambio no afecta a la restricción, si se realiza:

 Alter Table Libros 
  Alter Column Precio decimal(6,2) null

 --El campo "precio" fue Alterado para que acepte valores nulos:

 /*********************************************************************************************************************************************/

 --86) Campos Calculados.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un comercio almacena los datos de los artículos para la venta en una tabla denominada "Articulos".

 --1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('Articulos') is not null
  Drop Table Articulos

 Create Table Articulos(
  Codigo int identity,
  Descripcion varchar(30),
  Precio decimal(5,2) not null,
  Cantidad smallint not null default 0,
  MontoTotal as Precio * Cantidad
 )

 --El campo "MontoTotal" es un campo calculado que multiplica el precio de cada artículo por la cantidad dispOnible.

 --2- intente ingresar un registro con valor para el campo calculado:
 Insert Into Articulos 
  Values('birome',1.5,100,150) --no lo permite.

 --3- Ingrese algunos registros:
 Insert Into Articulos 
  Values('birome',1.5,100)
 Insert Into Articulos 
  Values('cuaderno 12 hojas',4.8,150)
 Insert Into Articulos 
  Values('lapices x 12',5,200)

 --4- Recupere los registros:
 Select * From Articulos

--5- Actualice un precio y recupere los registros:
 Update Articulos set Precio = 2 
  Where Descripcion = 'birome'
  Select * From Articulos

 --el campo calculado "MontoTotal" recalcula los valores para cada registro automanticamente.

 --6- Actualice una cantidad y vea el resultado:
 Update Articulos set Cantidad = 200 
  Where Descripcion = 'birome'
  Select * From Articulos

 --el campo calculado "MontoTotal" recalcula sus valores.

 --7- intente actualizar un campo calculado:
 Update Articulos set MontoTotal = 300 
  Where Descripcion = 'birome' --no lo permite.

 --Ejercicio Resulto:

 --Trabajamos con la tablas "Empleados".

 --Eliminamos la tabla, si existe, y la creamos:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --Creamos la tabla:
 Create Table Empleados(
  Documentos char(8),
  Nombre varchar(10),
  Domicilio varchar(30),
  SueldoBasico decimal(6,2),
  Hijos tinyint not null default 0,
  SueldoTotal as SueldoBasico + (Hijos * 100)
 )

 --El campo "SueldoTotal" es un campo calculado que suma 
 --al Sueldo básico de cada empleado y la cantidad abOnada por los hijos (100 por cada hijo).

 --no puede ingresarse valor para dicho campo:

 Insert Into Empleados 
  Values('22222222','Juan Perez','Colon 123',300,2)
 Insert Into Empleados 
  Values('23333333','Ana Lopez','Sucre 234',500,0)

 --Veamos los registros:
 Select * From Empleados

 --Veamos lo que sucede si actualizamos un registro:
 Update Empleados set Hijos = 1 
  Where Documentos = '23333333'

 --Recuperamos los registros:
 Select * From Empleados

 --el campo calculado "SueldoTotal" recalcula los valores para cada registro automanticamente.

 --Agregamos un campo calculado:
 Alter Table Empleados 
  Add SalarioFamiliar as Hijos * 100

 --Veamos la estructura de la tabla:
 Exec sp_columns Empleados

 --Recuperemos los registros:
 Select * From Empleados

 /*********************************************************************************************************************************************/

 --92) SubConsultas Como Expresión.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Un Profesor almacena el Documentos, Nombre y la nota final de cada alumno de su clase en una tabla llamada "Alumnos".

 --1- Elimine la tabla, si existe:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 --2- Créela con los campos necesarios. Agregue una restricción "Primary Key" para el campo "Documentos" y 
 --una "check" para validar que el campo "nota" se encuentre entre los valores 0 y 10:
 Create Table Alumnos(
  Documentos char(8),
  Nombre varchar(30),
  nota decimal(4,2),
  Primary Key(Documentos),
  Constraint CK_Alumnos_nota_valores check (nota>=0 and nota <=10),
 )

 --3-Ingrese algunos registros:
 Insert Into Alumnos 
  Values('30111111','Ana Algarbe',5.1)
 Insert Into Alumnos 
  Values('30222222','Bernardo Bustamante',3.2)
 Insert Into Alumnos 
  Values('30333333','Carolina conte',4.5)
 Insert Into Alumnos 
  Values('30444444','Diana Dominguez',9.7)
 Insert Into Alumnos 
  Values('30555555','Fabian Fuentes',8.5)
 Insert Into Alumnos 
  Values('30666666','Gaston Gonzalez',9.70)

 --4- Obtenga todos los datos de los Alumnos con la nota más alta, empleando subconsulta. (2 registros).
  Select Alumnos.*
  From Alumnos
  Where nota = (Select max (nota) From Alumnos)

 --5- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del máximo valor de nota, el nombre. 
 --Mensaje de error, porque la lista de selección de una subconsulta que va luego de un operador de 
 --comparación puede incluir sólo un campo o expresión (excepto si se emplea "exists" o "in").
 Select Documentos ,Nombre, nota
  From Alumnos
  Where nota = (Select Nombre, max(nota) From Alumnos)

 --6- Muestre los Alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el promedio. (3 registros).
 Select Alumnos.*,
  (Select avg (nota) From Alumnos) - nota as diferencia
   From Alumnos
   Where nota < (Select avg(nota) From Alumnos)

 --7- Cambie la nota del alumno que tiene la menor nota por 4.1 registro modificado.
 Update Alumnos set nota = 4
  Where nota = (Select min(nota) From Alumnos)

 --8- Elimine los Alumnos cuya nota es menor al promedio. (3 registros eliminados).
 Delete From Alumnos
 Where nota < (Select avg(nota) From Alumnos)

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe y la creamos:
 if object_id('Libros') is not null
  Drop Table Libros 

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2)
 )

 --Ingresamos los siguientes registros:
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',20.00)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Plaza',35.00)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Siglo XXI',40.00)
 Insert Into Libros 
  Values('El aleph','Borges','Emece',10.00)
 Insert Into Libros 
  Values('Ilusiones','Richard Bach','Planeta',15.00)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Planeta',20.00)
 Insert Into Libros 
  Values('Martin Fierro','Jose Hernandez','Emece',30.00)
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',10.00)

 --Obtenemos el título, Precio de un libro específico y la diferencia entre su precio y el máximo valor:
 Select Titulo, Precio, Precio - (Select max (Precio) From Libros) as Diferencia
  From Libros
  Where Titulo = 'Uno'

 --Mostramos el título y precio del libro más costoso:
 Select Titulo,Autor, Precio 
  From Libros
  Where Precio = (Select max(Precio) From Libros)

 --Actualizamos el precio del libro con máximo valor:
 Update Libros set Precio = 45
  Where Precio = (Select max(Precio) From Libros)

 --Eliminamos los libros con precio menor:
 Delete From Libros 
  Where Precio = (Select min(Precio) From Libros)

 /*********************************************************************************************************************************************/

 --93) SubConsultas Con (IN).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa tiene registrados sus clientes en una tabla llamada "Clientes", 
 --también tiene una tabla "Ciudades" donde registra los Nombres de las ciudades.

 --1- Elimine las tablas "Clientes" y "Ciudades", si existen:
  if (object_id('Ciudades')) is not null
   Drop Table Ciudades

  if (object_id('Clientes')) is not null
   Drop Table Clientes

--2- Cree la tabla "Clientes" 

 /*(Codigo, Nombre, Domicilio, Ciudad, CodigoCiudad) 
 y "Ciudades" (Codigo, Nombre). Agregue una restricción "Primary Key" 
 para el campo "codigo" de ambas tablas y una "foreing Key" 
 para validar que el campo "CodigoCiudad" 
 exista en "Ciudades" con actualización en cascada:*/

 Create Table Ciudades(
  Codigo tinyint identity,
  Nombre varchar(20),
  Primary Key(Codigo)
 )

 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  CodigoCiudad tinyint not null,
  Primary Key(Codigo),
  Constraint FK_Clientes_Ciudad
  Foreign Key(CodigoCiudad)
  references Ciudades(Codigo) On Update cascade,
 )

 --3- Ingrese algunos registros para ambas tablas:
 Insert Into Ciudades(Nombre) 
  Values('Cordoba')
 Insert Into Ciudades(Nombre) 
  Values('Cruz del Eje')
 Insert Into Ciudades(Nombre) 
  Values('Carlos Paz')
 Insert Into Ciudades(Nombre) 
  Values('La Falda')
 Insert Into Ciudades(Nombre) 
  Values('Villa Maria')

 Insert Into Clientes 
  Values ('Lopez Marcos','Colon 111',1)
 Insert Into Clientes 
  Values ('Lopez Hector','San Martin 222',1)
 Insert Into Clientes 
  Values ('Perez Ana','San Martin 333',2)
 Insert Into Clientes 
  Values ('Garcia Juan','Rivadavia 444',3)
 Insert Into Clientes 
  Values ('Perez Luis','Sarmiento 555',3)
 Insert Into Clientes 
  Values ('Gomez Ines','San Martin 666',4)
 Insert Into Clientes 
  Values ('Torres Fabiola','Alem 777',5)
 Insert Into Clientes 
  Values ('Garcia Luis','Sucre 888',5)

 --4- Necesitamos conocer los Nombres de las ciudades 
 --de aquellos clientes cuyo Domicilio es en calle "San Martin", empleando subconsulta. (3 registros).
  Select Nombre
  From Ciudades
  Where Codigo in
   (Select CodigoCiudad
     From Clientes
     Where Domicilio like 'San Martin %')

 --5- Obtenga la misma salida anterior pero empleando join.
 Select Distinct ci.Nombre
  From Ciudades as ci
  join Clientes as cl
  On CodigoCiudad = ci.Codigo
  Where Domicilio like 'San Martin%'

 --6- Obtenga los Nombre de las ciudades de los clientes cuyo apellido 
 --no comienza con una letra específica, empleando subconsulta. (2 registros).
 Select Nombre
  From Ciudades
  Where Codigo not in
   (Select CodigoCiudad
     From Clientes
     Where Nombre like 'G%')

 --7- Pruebe la subconsulta del punto 6 separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo.
 Select CodigoCiudad
  From Clientes
  Where Nombre like 'G%'

 --Ejercicio Resulto:

 --Trabajamos con las tablas "libros" y "editoriales" de una librería.

 --Eliminamos las tablas si existen y las creamos:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  Primary Key (Codigo)
 )

 --Creamos la tabla:
 Create Table Libros (
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15),
  CodigoEditorial tinyint,
  Primary Key(Codigo),
  Constraint FK_Libros_Editorial
  Foreign Key(CodigoEditorial)
  references Editoriales(Codigo) On Update cascade
 )

 --Ingresamos algunos registros:
 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Paidos')
 Insert Into Editoriales Values('Siglo XXI')

 Insert Into Libros Values('Uno','Richard Bach',1)
 Insert Into Libros Values('Ilusiones','Richard Bach',1)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',4)
 Insert Into Libros Values('El aleph','Borges',2)
 Insert Into Libros Values('Puente al Infinito','Richard Bach',2)

 --Queremos conocer el nombre de los editoriales que han publicado libros del autor "Richard Bach":
 Select Nombre From Editoriales
  Where Codigo IN (Select CodigoEditorial 
  From Libros Where Autor = 'Richard Bach')

 --Probamos la subconsulta separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo:
 Select CodigoEditorial 
  From Libros 
  Where Autor = 'Richard Bach'

 --Podemos reemplazar por un "join" la primera consulta:
 Select Distinct Nombre
 From Editoriales as e
 join Libros
 On CodigoEditorial = e.Codigo
 Where Autor = 'Richard Bach'

 --También podemos buscar los editoriales que no han publicado Libros de "Richard Bach":
 Select Nombre From Editoriales
 Where Codigo not in
 (Select CodigoEditorial 
 From Libros Where Autor = 'Richard Bach')

 /*********************************************************************************************************************************************/

 --94) SubConsultas (ANY - SOME - ALL).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta clases de distintos Deportes a sus Socios. El club tiene una tabla llamada 
 "Inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
 y la cantidad de Cuotas Pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
 denominada "Socios" en la que guarda los datos personales de cada socio.*/

 --1- Elimine las tablas si existen:
 if object_id('Inscriptos') is not null
  Drop Table Inscriptos

 if object_id('Socios') is not null
  Drop Table Socios

 --2- Cree las tablas:
 Create Table Socios(
  Numero int identity,
  Documentos char(8),
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Numero)
 )
 
 Create Table Inscriptos (
  NumeroSocio int not null,
  Deporte varchar(20) not null,
  Cuotas tinyint
  Constraint CK_Inscriptos_Cuotas
  check (Cuotas>=0 and Cuotas<=10)
  Constraint DF_Inscriptos_Cuotas default 0,
  Primary Key(NumeroSocio, Deporte),
  Constraint FK_Inscriptos_Socio Foreign Key(NumeroSocio) references Socios(Numero)
  On Update cascade On Delete cascade,
 )

 --3- Ingrese algunos registros:
 Insert Into Socios Values('23333333','Alberto Paredes','Colon 111')
 Insert Into Socios Values('24444444','Carlos conte','Sarmiento 755')
 Insert Into Socios Values('25555555','Fabian Fuentes','Caseros 987')
 Insert Into Socios Values('26666666','Hector Lopez','Sucre 344')

 Insert Into Inscriptos Values(1,'Tenis',1)
 Insert Into Inscriptos Values(1,'Basquet',2)
 Insert Into Inscriptos Values(1,'Natacion',1)
 Insert Into Inscriptos Values(2,'Tenis',9)
 Insert Into Inscriptos Values(2,'Natacion',1)
 Insert Into Inscriptos Values(2,'Basquet',default)
 Insert Into Inscriptos Values(2,'Futbol',2)
 Insert Into Inscriptos Values(3,'Tenis',8)
 Insert Into Inscriptos Values(3,'Basquet',9)
 Insert Into Inscriptos Values(3,'Natacion',0)
 Insert Into Inscriptos Values(4,'Basquet',10)

 --4- Muestre el número de socio, el nombre del socio y el deporte en que está inscripto con un join de ambas tablas.
 Select Numero, Nombre, Deporte
  From Socios as s
  join Inscriptos as i
  On NumeroSocio = Numero

 --5- Muestre los socios que se serán compañeros en tenis y también en natación (empleando subconsulta).
 Select Nombre
  From Socios
  join Inscriptos as i
  On Numero = NumeroSocio
  Where Deporte = 'Natacion' and 
  Numero = any
  (Select NumeroSocio
    From Inscriptos as i
    Where Deporte = 'Tenis') --3 filas devueltas.

 --6- Vea si el socio 1 se ha inscripto en algún deporte en el cual se haya inscripto el socio (2.3 filas).
 Select Deporte
  From Inscriptos as i
  Where NumeroSocio = 1 and
  Deporte = any
   (Select Deporte
    From Inscriptos as i
    Where NumeroSocio = 2)

 --7- Obtenga el mismo resultado anterior pero empleando join.
  Select i1.Deporte
  From Inscriptos as i1
  join Inscriptos as i2
  On i1.Deporte = i2.Deporte
  Where i1.NumeroSocio = 1 and i2.NumeroSocio = 2

 --8- Muestre los deportes en los cuales el socio 2 pagó más cuotas que algun Deporte en los que se inscribió el socio 1.
 Select Deporte
  From Inscriptos as i
  Where NumeroSocio = 2 and Cuotas > any
   (Select Cuotas
    From Inscriptos
    Where NumeroSocio = 1)--(2 registros).

 --9- Muestre los deportes en los cuales el socio 2 pagó más cuotas que todos los deportes en que se inscribió el socio 1.
 Select Deporte
  From Inscriptos as i
  Where NumeroSocio = 2 and Cuotas > all
   (Select Cuotas
    From Inscriptos
    Where NumeroSocio = 1) --(1 registro).

 --10- Cuando un socio no ha Pagado la matrícula de alguno de los deportes en que se ha inscripto, 
 --se lo borra de la inscripción de todos los deportes. Elimine todos los socios que no pagaron ninguna cuota en algún deporte.
  Delete From Inscriptos
  Where NumeroSocio = any
   (Select NumeroSocio 
    From Inscriptos
    Where Cuotas = 0) --(7 registros).

 --Ejercicio Resulto:

 --Trabajamos con las tablas "libros" y "editoriales" de una librería.

 --Eliminamos las tablas si existen y las creamos:
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  Primary Key (Codigo)
 )

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  CodigoEditorial tinyint,
  Precio decimal(5,2),
  Primary Key(Codigo), 
  Constraint FK_Libros_Editorial Foreign Key(CodigoEditorial) references Editoriales(Codigo) On Update cascade,
 )

 --Ingresamos algunos registros de editoriales:
 Insert Into Editoriales Values('Planeta')
 Insert Into Editoriales Values('Emece')
 Insert Into Editoriales Values('Paidos')
 Insert Into Editoriales Values('Siglo XXI')

 --Ingresamos algunos registros de libros:
 Insert Into Libros Values('Uno','Richard Bach',1,15)
 Insert Into Libros Values('Ilusiones','Richard Bach',4,18)
 Insert Into Libros Values('Puente al INfINito','Richard Bach',2,19)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',4,40)
 Insert Into Libros Values('El aleph','Borges',2,10)
 Insert Into Libros Values('Antología','Borges',1,20)
 Insert Into Libros Values('Cervantes y el Quijote','Borges',3,25)

 --Mostramos los títulos de los libros de "Borges" de editoriales que han publicado también Libros de "Richard Bach":
 Select Titulo 
  From Libros
   Where Autor like '%Borges%' and CodigoEditorial = any
    (Select e.Codigo From Editoriales as e 
    join Libros as l On CodigoEditorial = e.Codigo
     Where l.Autor like '%Bach%')

 --Realizamos la misma consulta pero empleando "all" en lugar de "any":
 Select Titulo
  From Libros
  Where Autor like '%Borges%' and
  CodigoEditorial = all
   (Select e.Codigo
    From Editoriales as e
    join Libros as l
    On CodigoEditorial = e.Codigo
    Where l.Autor like '%Bach%')

 --Mostramos los títulos y precios de los libros "Borges" cuyo precio supera a algun precio de los libros de "Richard Bach":
 Select Titulo, Precio 
  From Libros
  Where Autor like '%Borges%' and Precio > any
  (Select Precio From Libros Where Autor like '%Bach%')

 --Veamos la diferencia si empleamos "all" en lugar de "any":
 Select Titulo, Precio 
  From Libros
  Where Autor like '%Borges%' and Precio > ALL
  (Select Precio From Libros Where Autor like '%Bach%')

 --Empleamos la misma subconsulta para eliminación:
 Delete From Libros
  Where Autor like '%Borges%' and Precio > ALL
  (Select Precio From Libros Where Autor like '%Bach%')

 /*********************************************************************************************************************************************/

 --95) SubConsultas Correlacionadas.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta clases de distintos Deportes a sus Socios. El club tiene una tabla llamada 
 "Inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
 y la cantidad de Cuotas Pagas (desde 0 hasta 10 que es el total por todo el año), y una tabla 
 denominada "Socios" en la que guarda los datos personales de cada socio.*/

 --1- Elimine las tablas si existen:
 if object_id('Inscriptos') is not null
  Drop Table Inscriptos

 if object_id('Socios') is not null
  Drop Table Socios

 --2- Cree las tablas:
 Create Table Socios(
  Numero int identity,
  Documentos char(8),
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key (Numero)
 )
 
 Create Table Inscriptos (
  NumeroSocio int not null,
  Deporte varchar(20) not null,
  Cuotas tinyint
  Constraint CK_Inscriptos_Cuotas check (Cuotas>=0 and Cuotas<=10)
  Constraint DF_Inscriptos_Cuotas default 0, Primary Key (NumeroSocio,Deporte),
  Constraint FK_Inscriptos_Socio Foreign Key (NumeroSocio) references Socios(Numero)
  On Update cascade On Delete cascade,
 )

 --3- Ingrese algunos registros:
 Insert Into Socios Values('23333333','Alberto Paredes','Colon 111')
 Insert Into Socios Values('24444444','Carlos conte','Sarmiento 755')
 Insert Into Socios Values('25555555','Fabian Fuentes','Caseros 987')
 Insert Into Socios Values('26666666','Hector Lopez','Sucre 344')

 Insert Into Inscriptos Values(1,'Tenis',1)
 Insert Into Inscriptos Values(1,'Basquet',2)
 Insert Into Inscriptos Values(1,'Natacion',1)
 Insert Into Inscriptos Values(2,'Tenis',9)
 Insert Into Inscriptos Values(2,'Natacion',1)
 Insert Into Inscriptos Values(2,'Basquet',default)
 Insert Into Inscriptos Values(2,'Futbol',2)
 Insert Into Inscriptos Values(3,'Tenis',8)
 Insert Into Inscriptos Values(3,'Basquet',9)
 Insert Into Inscriptos Values(3,'Natacion',0)
 Insert Into Inscriptos Values(4,'Basquet',10)

 --4- Se necesita un listado de todos los socios que incluya Nombre y Domicilio, la cantidad de 
 --Deportes a los cuales se ha inscripto, empleando subconsulta. (4 registros).
 Select Nombre, Domicilio,
  (Select count(*)
    From Inscriptos as i
    Where s.Numero = i.NumeroSocio) as 'Deportes'
   From Socios as s

 --5- Se necesita el nombre de todos los socios, el total de Cuotas que debe Pagar (10 por cada 
 --Deporte) y el total de Cuotas Pagas, empleando subconsulta. (4 registros).
 Select Nombre,
  (Select (count(*)*10)
    From Inscriptos as i
    Where s.Numero = i.NumeroSocio) as total,
  (Select sum (i.Cuotas)
    From Inscriptos as i
    Where s.Numero = i.NumeroSocio) as Pagas
  From Socios as s

 --6- Obtenga la misma salida anterior empleando join.
 Select Nombre,
  count(i.Deporte) * 10 as total,
  sum(i.Cuotas) as Pagas
  From Socios as s
  join Inscriptos as i
  On Numero = NumeroSocio
  Group by Nombre

 --Ejercicio Resulto:
  
  /*Un almacén almacena la información de sus ventas 
  en una tabla llamada "Facturas" en la cual guarda 
  el número de factura, la Fecha y el nombre del cliente
  y una tabla denominada "detalles" en la cual se almacenan 
  los distintos items correspondientes a cada factura: 
  el nombre del artículo, el precio (unitario) y la cantidad.*/

 --Eliminamos las tablas si existen:
 if object_id('Facturas') is not null

 --Las creamos con las siguientes estructuras:
 Create Table Facturas(
  Numero int not null,
  Fecha DateTime,
  Clientes varchar(30),
  Primary Key(Numero)
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  Primary Key(NumeroFactura, NumeroItem),
  Constraint FK_Detalles_NumeroFactura Foreign Key(NumeroFactura) references Facturas(Numero)
  On Update cascade On Delete cascade,
 )

 --Ingresamos algunos registros de facturas:
 Insert Into Facturas Values(1200,'2018-01-15','Juan Lopez')
 Insert Into Facturas Values(1201,'2018-01-15','Luis Torres')
 Insert Into Facturas Values(1202,'2018-01-15','Ana Garcia')
 Insert Into Facturas Values(1300,'2018-01-20','Juan Lopez')

 --Ingresamos algunos registros de detalles:
 Insert Into Detalles Values(1200,1,'Lapiz',1,100)
 Insert Into Detalles Values(1200,2,'Goma',0.5,150)
 Insert Into Detalles Values(1201,1,'Regla',1.5,80)
 Insert Into Detalles Values(1201,2,'Goma',0.5,200)
 Insert Into Detalles Values(1201,3,'Cuaderno',4,90)
 Insert Into Detalles Values(1202,1,'Lapiz',1,200)
 Insert Into Detalles Values(1202,2,'Escuadra',2,100)
 Insert Into Detalles Values(1300,1,'Lapiz',1,300)

 --Se necesita una lista de todas las Facturas que incluya el número, la Fecha, el cliente, la cantidad de artículos comprados y el total:
 Select f.*,
  (Select count(d.NumeroItem)
  From Detalles as d
  Where f.Numero = d.NumeroFactura) as Cantidad,
  (Select sum(d.Precio * Cantidad)
  From Detalles as d
  Where f.Numero = d.NumeroFactura) as Total
  From Facturas as f

 /*********************************************************************************************************************************************/

 --96) Exists y notExists.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta clases de distintos Deportes. En una tabla llamada "Socios" guarda los datos de los 
 Socios, en una tabla llamada "Deportes" la información referente a los diferentes Deportes que se 
 dictan y en una tabla denominada "Inscriptos", las inscripciones de los socios a los distintos 
 Deportes. Un socio puede inscribirse en varios Deportes el mismo año. Un socio no puede inscribirse en el 
 mismo Deporte el mismo año. distintos Socios se inscriben en un mismo Deporte en el mismo año.*/

 --1- Elimine las tablas si existen:
 if object_id('Inscriptos') is not null
  Drop Table Inscriptos

 if object_id('Socios') is not null
  Drop Table Socios

 if object_id('Deportes') is not null
  Drop Table Deportes

 --2- Cree las tablas con las siguientes estructuras:
 Create Table Socios(
  Documentos char(8) not null, 
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Documentos)
 )

 Create Table Deportes(
  Codigo tinyint identity,
  Nombre varchar(20),
  Profesor varchar(15),
  Primary Key(Codigo)
 )

 Create Table Inscriptos(
  Documentos char(8) not null, 
  CodigoDeporte tinyint not null,
  año char(4),
  Matricula char(1),--'s'=Paga, 'n'=imPaga
  Primary Key(Documentos, CodigoDeporte, año),
  Constraint FK_Inscriptos_Socio Foreign Key (Documentos) references Socios(Documentos)
  On Update cascade On Delete cascade
 )

 --3- Ingrese algunos registros en las 3 tablas:
 Insert Into Socios Values('22222222','Ana Acosta','Avellaneda 111')
 Insert Into Socios Values('23333333','Betina Bustos','Bulnes 222')
 Insert Into Socios Values('24444444','Carlos Castro','Caseros 333')
 Insert Into Socios Values('25555555','Daniel Duarte','DinaMarca 44')

 Insert Into Deportes Values('Basquet','Juan Juarez')
 Insert Into Deportes Values('Futbol','Pedro Perez')
 Insert Into Deportes Values('Natacion','Marina Morales')
 Insert Into Deportes Values('Tenis','Marina Morales')

 Insert Into Inscriptos Values('22222222',3,'2006','s')
 Insert Into Inscriptos Values('23333333',3,'2006','s')
 Insert Into Inscriptos Values('24444444',3,'2006','n')
 Insert Into Inscriptos Values('22222222',3,'2005','s')
 Insert Into Inscriptos Values('22222222',3,'2007','n')
 Insert Into Inscriptos Values('24444444',1,'2006','s')
 Insert Into Inscriptos Values('24444444',2,'2006','s')

 --4- Realice una consulta en la cual muestre todos los datos de las inscripciones, incluyendo el nombre del deporte y del Profesor.
 --Esta consulta es un join.
 Select i.Documentos, i.CodigoDeporte, d.Nombre as Deporte, año, Matricula, d.Profesor
  From Deportes as d
  join Inscriptos as i
  On d.Codigo = i.CodigoDeporte

 --5- Utilice el resultado de la consulta anterior 
 --como una tabla derivada para emplear en lugar de una tabla para realizar un "join" 
 --y recuperar el nombre del socio, el deporte en el cual está inscripto, el año, el nombre del Profesor y la matrícula.
  Select s.Nombre, td.Deporte, td.Profesor, td.año, td.Matricula
  From Socios as s
  join (Select i.Documentos, i.CodigoDeporte, d.Nombre as Deporte, año, Matricula, d.Profesor
	From Deportes as d
	join Inscriptos as i
	On d.Codigo = i.CodigoDeporte) as td
    On td.Documentos = s.Documentos

 --Ejercicio Resulto:

 /*Un comercio que vende artículos de librería y papelería 
 almacena la información de sus ventas en una tabla llamada "Facturas" y otra "detalles".*/

 --Eliminamos las tablas si existen:
 if object_id('Detalles') is not null 
  Drop Table Detalles

 if object_id('Facturas') is not null 
  Drop Table Facturas

 --Las creamos con las siguientes estructuras:
 Create Table Facturas(
  Numero int not null,
  Fecha DateTime,
  Clientes varchar(30),
  Primary Key(Numero)
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  Primary Key(NumeroFactura, NumeroItem),
  Constraint FK_Detalles_NumeroFactura Foreign Key(NumeroFactura) references Facturas(Numero)
  On Update cascade On Delete cascade
 )

 --Ingresamos algunos registros de facturas:
 Insert Into Facturas Values(1200,'2018-01-15','Juan Lopez')
 Insert Into Facturas Values(1201,'2018-01-15','Luis Torres')
 Insert Into Facturas Values(1202,'2018-01-15','Ana Garcia')
 Insert Into Facturas Values(1300,'2018-01-20','Juan Lopez')

 --Ingresamos algunos registros de detalles:
 Insert Into Detalles Values(1200,1,'Lapiz',1,100)
 Insert Into Detalles Values(1200,2,'Goma',0.5,150)
 Insert Into Detalles Values(1201,1,'Regla',1.5,80)
 Insert Into Detalles Values(1201,2,'Goma',0.5,200)
 Insert Into Detalles Values(1201,3,'Cuaderno',4,90)
 Insert Into Detalles Values(1202,1,'Lapiz',1,200)
 Insert Into Detalles Values(1202,2,'Escuadra',2,100)
 Insert Into Detalles Values(1300,1,'Lapiz',1,300)

 /*Empleamos una subconsulta correlacionada con un operador "exists" 
 en la cláusula "Where" para devolver la lista de clientes que compraron el artículo "lapiz":*/
 Select Clientes, Numero
  From Facturas as f
  Where exists
  (Select *From Detalles as d
  Where f.Numero = d.NumeroFactura and d.Articulo = 'Lapiz')

 --Buscamos los clientes que no han comprado el artículo "lapiz":
 Select Clientes, Numero
  From Facturas as f
  Where not exists
  (Select *From Detalles as d
  Where f.Numero = d.NumeroFactura and d.Articulo = 'Lapiz')

 --98) Subconsulta En Lugar De Una Tabla.

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

  /*Un comercio que vende artículos de librería y papelería almacena 
  la información de sus ventas en una tabla llamada "Facturas", otra "detalles" y otra "clientes".*/

 --Eliminamos las tablas si existen:
 if object_id('Detalles') is not null 
  Drop Table Detalles

 if object_id('Facturas') is not null 
  Drop Table Facturas

 if object_id('Clientes') is not null 
  Drop Table Clientes

 --Las creamos con las siguientes estructuras:
 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Codigo)
 )

 Create Table Facturas(
  Numero int not null,
  Fecha DateTime,
  CodigoClientes int not null,
  Primary Key(Numero),
  Constraint FK_Facturas_Clientes Foreign Key (CodigoClientes) references Clientes(Codigo)
  On Update cascade
 )

 Create Table Detalles(
  NumeroFactura int not null,
  NumeroItem int not null, 
  Articulo varchar(30),
  Precio decimal(5,2),
  Cantidad int,
  Primary Key(NumeroFactura, NumeroItem),
  Constraint FK_Detalles_NumeroFactura Foreign Key (NumeroFactura) references Facturas(Numero)
  On Update cascade On Delete cascade,
 )

 --Ingresamos algunos registros:
 Insert Into Clientes Values('Juan Lopez','Colon 123')
 Insert Into Clientes Values('Luis Torres','Sucre 987')
 Insert Into Clientes Values('Ana Garcia','Sarmiento 576')

 Insert Into Facturas Values(1200,'2018-01-15',1)
 Insert Into Facturas Values(1201,'2018-01-15',2)
 Insert Into Facturas Values(1202,'2018-01-15',3)
 Insert Into Facturas Values(1300,'2018-01-20',1)

 Insert Into Detalles Values(1200,1,'Lapiz',1,100)
 Insert Into Detalles Values(1200,2,'Goma',0.5,150)
 Insert Into Detalles Values(1201,1,'Regla',1.5,80)
 Insert Into Detalles Values(1201,2,'Goma',0.5,200)
 Insert Into Detalles Values(1201,3,'Cuaderno',4,90)
 Insert Into Detalles Values(1202,1,'Lapiz',1,200)
 Insert Into Detalles Values(1202,2,'Escuadra',2,100)
 Insert Into Detalles Values(1300,1,'Lapiz',1,300)

 --Vamos a realizar un "Select" para recuperar el número de factura, el código de cliente, la Fecha y la suma total de todas las Facturas:
 Select f.*,
  (Select sum(d.Precio * Cantidad)
  From Detalles as d
  Where f.Numero = d.NumeroFactura) as Total
  From Facturas as f
  --Esta consulta contiene una subconsulta correlacionada.

  /*Ahora utilizaremos el resultado de la consulta anterior 
  como una tabla derivada que emplearemos en lugar 
  de una tabla para realizar un "join" y recuperar el número de factura, 
  el nombre del cliente y el Monto Total por factura*/

 Select td.Numero, c.Nombre, td.Total
  From Clientes as c
  join (Select f.*,
  (Select sum(d.Precio * Cantidad)
  From Detalles as d
  Where f.Numero = d.NumeroFactura) as Total
  From Facturas as f) as td
  On td.CodigoClientes = c.Codigo
  --note que para referenciar la tabla derivada debimos colocar un alias a la consulta.

 /*********************************************************************************************************************************************/

 --99) Subconsulta (Update - Delete).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta clases de distintos Deportes a sus Socios. El club tiene una tabla llamada 
 "Inscriptos" en la cual almacena el número de "socio", el código del deporte en el cual se inscribe 
 y si la Matricula está o no Paga, y una tabla denominada "Socios" en la que guarda los datos 
 personales de cada socio.*/

 --1- Elimine las tablas si existen:
 if object_id('Inscriptos') is not null
  Drop Table Inscriptos

 if object_id('Socios') is not null
  Drop Table Socios

 --2- Cree las tablas:
 Create Table Socios(
  Numero int identity,
  Documentos char(8),
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key (Numero)
 )
 
 Create Table Inscriptos (
  NumeroSocio int not null,
  Deporte varchar(20) not null,
  Matricula char(1),-- 'n' o 's'
  Primary Key(NumeroSocio, Deporte),
  Constraint FK_Inscriptos_Socio Foreign Key(NumeroSocio) references Socios(Numero)
 )

 --3- Ingrese algunos registros:
 Insert Into Socios Values('23333333','Alberto Paredes','Colon 111')
 Insert Into Socios Values('24444444','Carlos conte','Sarmiento 755')
 Insert Into Socios Values('25555555','Fabian Fuentes','Caseros 987')
 Insert Into Socios Values('26666666','Hector Lopez','Sucre 344')

 Insert Into Inscriptos Values(1,'Tenis','s')
 Insert Into Inscriptos Values(1,'Basquet','s')
 Insert Into Inscriptos Values(1,'Natacion','s')
 Insert Into Inscriptos Values(2,'Tenis','s')
 Insert Into Inscriptos Values(2,'Natacion','s')
 Insert Into Inscriptos Values(2,'Basquet','n')
 Insert Into Inscriptos Values(2,'Futbol','n')
 Insert Into Inscriptos Values(3,'Tenis','s')
 Insert Into Inscriptos Values(3,'Basquet','s')
 Insert Into Inscriptos Values(3,'Natacion','n')
 Insert Into Inscriptos Values(4,'Basquet','n')

 --4- Actualizamos la cuota ('s') de todas las inscripciones de un socio determinado (por documentos) empleando subconsulta.
 Update Inscriptos set Matricula = 's'
  Where NumeroSocio =
   (Select Numero
     From Socios
     Where Documentos = '25555555')

 --5- Elimine todas las inscripciones de los socios que deben alguna matrícula (5 registros eliminados).
  Delete From Inscriptos
  Where NumeroSocio in
   (Select Numero
    From Socios as s
    join Inscriptos
    On NumeroSocio = Numero
    Where Matricula = 'n')

 --Ejercicio Resulto:

 --Trabajamos con las tablas "libros" y "editoriales" de una librería.

 --Eliminamos las tablas si existen y las creamos.
 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla:
 Create Table Editoriales(
  Codigo tinyint identity,
  Nombre varchar(30),
  Primary Key (Codigo)
 )

 --Creamos la tabla:
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(20),
  Autor varchar(15),
  CodigoEditorial tinyint,
  Precio decimal(5,2),
  Primary Key(Codigo)
 )

 --Ingresamos algunos registros:
 Insert Into Editoriales Values('Planeta') 
 Insert Into Editoriales Values('Emece') 
 Insert Into Editoriales Values('Paidos')
 Insert Into Editoriales Values('Siglo XXI')

 Insert Into Libros Values('Uno','Richard Bach',1,15)
 Insert Into Libros Values('Ilusiones','Richard Bach',2,20)
 Insert Into Libros Values('El aleph','Borges',3,10)
 Insert Into Libros Values('Aprenda PHP','Mario Molina',4,40)
 Insert Into Libros Values('Poemas','Juan Perez',1,20)
 Insert Into Libros Values('Cuentos','Juan Perez',3,25)
 Insert Into Libros Values('Java en 10 minutos','Marcelo Perez',2,30)

 --Actualizamos el precio de todos los libros de editorial"Emece" incrementándolos en un 10%.
 Update Libros set Precio = Precio + (Precio*0.1)
  Where CodigoEditorial = (Select Codigo From Editoriales Where Nombre = 'Emece')

 --Eliminamos todos los libros de los editoriales que tiene publicados Libros de "Juan Perez".
 Delete From Libros
  Where CodigoEditorial IN (Select e.Codigo From Editoriales as e
  join Libros On CodigoEditorial = e.Codigo Where Autor = 'Juan Perez')

 /*********************************************************************************************************************************************/

 --100) Subconsulta (Insert).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un comercio que vende artículos de librería y papelería almacena la información de sus ventas en una 
 tabla llamada "Facturas" y otra "Clientes".*/

 --1- Elimine las tablas si existen:
 if object_id('Facturas') is not null
  Drop Table Facturas

 if object_id('Clientes') is not null
  Drop Table Clientes

 --2-Crée las tabla clientes y facturas:
 Create Table Clientes(
  Codigo int identity,
  Nombre varchar(30),
  Domicilio varchar(30),
  Primary Key(Codigo)
 )

 Create Table Facturas(
  Numero int not null,
  Fecha DateTime,
  CodigoCliente int not null,
  total decimal(6,2),
  Primary Key(Numero),
  Constraint FK_Facturas_cliente Foreign Key(CodigoCliente) references Clientes(Codigo)
  On Update cascade
 )

 --3-Ingrese algunos registros:
 Insert Into Clientes Values('Juan Lopez','Colon 123')
 Insert Into Clientes Values('Luis Torres','Sucre 987')
 Insert Into Clientes Values('Ana Garcia','Sarmiento 576')
 Insert Into Clientes Values('Susana Molina','San Martin 555')

 Insert Into Facturas Values(1200,'2007-01-15',1,300)
 Insert Into Facturas Values(1201,'2007-01-15',2,550)
 Insert Into Facturas Values(1202,'2007-01-15',3,150)
 Insert Into Facturas Values(1300,'2007-01-20',1,350)
 Insert Into Facturas Values(1310,'2007-01-22',3,100)

 --4- El comercio necesita una tabla llamada "ClientesPref" en la cual quiere almacenar el nombre y 
 /*Domicilio de aquellos clientes que han comprado hasta el momento más de 500 pesos en mercaderías. 
 Elimine la tabla si existe y créela con esos 2 campos:*/
 if object_id ('ClientesPref') is not null
  Drop Table ClientesPref

 Create Table ClientesPref(
  Nombre varchar(30),
  Domicilio varchar(30)
 )

 --5- Ingrese los registros en la tabla "ClientesPref" selecciOnando registros de la tabla "Clientes" y "Facturas".
  Insert Into ClientesPref
  Select Nombre, Domicilio
   From Clientes 
   Where Codigo in 
    (Select CodigoCliente
     From Clientes as c
     join Facturas as f
     On CodigoCliente = Codigo
     Group by CodigoCliente
     Having sum(total) > 500)

 --6- Vea los registros de "ClientesPref":
 Select * From ClientesPref

 --Ejercicio Resulto:

 /*Un Profesor almacena las notas de sus Alumnos en una tabla llamada 
 "Alumnos" (Documentos, Nombre, nota). Tiene otra tabla llamada "aprobados" 
 (Documentos,nota) en la que guarda los Alumnos que han aprobado el ciclo.*/

 --Eliminamos las tablas si existen:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 if object_id('Aprobados') is not null
  Drop Table Aprobados

 --Creamos la tabla:
 Create Table Alumnos(
  Documentos char(8) not null,
  Nombre varchar(30),
  nota decimal(4,2)
  Constraint CK_Alumnos_nota_valores check (nota >= 0 and nota <= 10),
  Primary Key(Documentos),
 )

 --Creamos la tabla:
 Create Table Aprobados(
  Documentos char(8) not null,
  nota decimal(4,2)
  Constraint CK_Aprobados_nota_valores check (nota >= 0 and nota <= 10),
  Primary Key(Documentos),
 )

 --Ingresamos registros en "Alumnos":
 Insert Into Alumnos 
  Values('30000000','Ana Acosta',8)
 Insert Into Alumnos 
  Values('30111111','Betina Bustos',9)
 Insert Into Alumnos 
  Values('30222222','Carlos Caseros',2.5)
 Insert Into Alumnos 
  Values('30333333','Daniel Duarte',7.7)
 Insert Into Alumnos 
  Values('30444444','Estela Esper',3.4)

 --Ingresamos registros en la tabla "aprobados" selecciOnando registros de la tabla "Alumnos":
 Insert Into Aprobados 
 Select Documentos, nota
  From Alumnos
 Where nota >= 4

 --note que no se listan los campos en los cuales se cargan los datos porque tienen el mismo Nombre 
 --que los de la tabla de la cual extraemos la información.

 --Veamos si los registros se han cargado:
 Select * From Aprobados

 /*********************************************************************************************************************************************/

 --101) Crear Tabla A Partir De Otra (Select - Into).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un supermercado almacena los datos de sus empleados en una tabla denominada "Empleados" y en una 
 tabla llamada "sucursales" los códigos y Ciudades de las diferentes sucursales.*/

 --1- Elimine las tablas "Empleados" y "sucursales" si existen:
 if object_id('Empleados')is not null
  Drop Table Empleados

 if object_id('sucursales')is not null
  Drop Table sucursales

 --2- Cree la tabla "sucursales".
 Create Table sucursales( 
  Codigo int identity,
  Ciudad varchar(30) not null,
  Primary Key(Codigo)
 )

 --3- Cree la tabla "Empleados".
 Create Table Empleados( 
  Documentos char(8) not null,
  Nombre varchar(30) not null,
  Domicilio varchar(30),
  Seccion varchar(20),
  Sueldo decimal(6,2),
  CodigoSucursal int,
  Primary Key(Documentos),
  Constraint FK_Empleados_sucursal Foreign Key(CodigoSucursal) references sucursales(Codigo)
  On Update cascade
 )

 --4- Ingrese algunos registros para ambas tablas.
 Insert Into sucursales Values('Cordoba')
 Insert Into sucursales Values('Villa Maria')
 Insert Into sucursales Values('Carlos Paz')
 Insert Into sucursales Values('Cruz del Eje')

 Insert Into Empleados Values('22222222','Ana Acosta','Avellaneda 111','Secretaria',500,1)
 Insert Into Empleados Values('23333333','Carlos Caseros','Colon 222','Sistemas',800,1)
 Insert Into Empleados Values('24444444','Diana Dominguez','DinaMarca 333','Secretaria',550,2)
 Insert Into Empleados Values('25555555','Fabiola Fuentes','Francia 444','Sistemas',750,2)
 Insert Into Empleados Values('26666666','Gabriela Gonzalez','Guemes 555','Secretaria',580,3)
 Insert Into Empleados Values('27777777','Juan Juarez','Jujuy 777','Secretaria',500,4)
 Insert Into Empleados Values('28888888','Luis Lopez','Lules 888','Sistemas',780,4)
 Insert Into Empleados Values('29999999','Maria Morales','Marina 999','Contaduria',670,4)

 --5- Realice un join para mostrar todos los datos de "Empleados" incluyendo la ciudad de la sucursal.
 Select Documentos, Nombre, Domicilio, Seccion, Sueldo, Ciudad
  From Empleados
  join sucursales On CodigoSucursal = Codigo

 --6-Cree una tabla llamada "Secciones" que contenga las secciones de la empresa (primero elimínela, si existe).
 if object_id('Secciones') is not null
  Drop Table Secciones

 Select Distinct Seccion as Nombre
  Into Secciones
  From Empleados

 --7- Recupere la información de "Secciones".
 Select * From Secciones
 --3 registros.

 --8- Se necesita una nueva tabla llamada "SueldosxSeccion" que contenga la suma de los Sueldos de los empleados por sección. 
 --Primero elimine la tabla, si existe:
 if object_id('SueldosxSeccion') is not null
  Drop Table SueldosxSeccion

 Select Seccion, sum(Sueldo) as total
  Into SueldosxSeccion
  From Empleados
  Group by Seccion

 --9- Recupere los registros de la nueva tabla:
 Select * From SueldosxSeccion

 --10- Se necesita una tabla llamada "MaximosSueldos" que contenga los mismos campos que "Empleados" y 
 --guarde los 3 Empleados con Sueldos más altos. Primero eliminamos, si existe, la tabla "MaximosSueldos":
 if object_id('MaximosSueldos') is not null
  Drop Table MaximosSueldos

  Select top 3 *
  Into MaximosSueldos
  From Empleados
  Order by Sueldo

 --11- Vea los registros de la nueva tabla:
 Select * From MaximosSueldos

 --12- Se necesita una nueva tabla llamada "sucursalCordoba" que contenga los Nombres y sección de los empleados de la ciudad de Córdoba. 
 --En primer lugar, eliminamos la tabla, si existe. Luego, consulte las tablas "Empleados" y "sucursales" y guarde el resultado en la nueva tabla:
 if object_id('sucursalCordoba') is not null
  Drop Table sucursalCordoba

 Select Nombre, Ciudad
  Into sucursalCordoba
  From Empleados
  join sucursales
  On CodigoSucursal = Codigo
  Where Ciudad = 'Cordoba'

 --13- consulte la nueva tabla:
 Select * From sucursalCordoba

 --Ejercicio Resulto:

 --Eliminamos las tablas "libros" y "editoriales" si existen:

 if object_id('Libros') is not null
  Drop Table Libros

 if object_id('Editoriales') is not null
  Drop Table Editoriales

 --Creamos la tabla Libros:
 Create Table Libros( 
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2),
  Primary Key(Codigo)
 )

 --Ingresamos algunos registros
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',15)
 Insert Into Libros 
  Values('El aleph','Borges','Emece',25)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Nuevo siglo',18)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',45)
 Insert Into Libros 
  Values('Ilusiones','Richard Bach','Planeta',14)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Nuevo siglo',50)

 --Creamos una tabla llamada "editoriales" que contenga los Nombres de los editoriales:
 Select Distinct Editorial as Nombre
 Into Editoriales
 From Libros

 Select * From Editoriales

 --Necesitamos una nueva tabla llamada "LibrosporEditorial" que contenga la cantidad de libros de cada editorial. 
 --Primero eliminamos la tabla, si existe:
 if object_id('CantidadPorEditorial') is not null
  Drop Table CantidadPorEditorial
  
 --Creamos la nueva tabla:
 Select Editorial as Nombre, count(*) as Cantidad
 Into CantidadPorEditorial
  From Libros
 Group by Editorial

 --Veamos los registros de la nueva tabla:
 Select * From CantidadPorEditorial

 /*La tabla "CantidadporEditorial" se ha creado 
 con el campo llamado "nombre" 
 selecciOnado del campo "editorial" de "libros" 
 y con el campo "Cantidad" con el valor calculado con count(*) de la tabla "libros".*/

 /*Queremos una tabla llamada "ofertas4" que contenga 
 los mismos campos que "libros" y guarde los 4 Libros más económicos. 
 Primero eliminamos, si existe, la tabla "ofertas4":*/

 if object_id('Ofertas4') is not null
  Drop Table Ofertas4

 --Creamos "ofertas4" e Insertamos la consulta de "libros":
 Select TOP 4 * Into Ofertas4
  From Libros
 Order by precio asC
 /*La consulta anterior retorna los 4 primeros Libros de la tabla "libros", 
 ordenados en forma ascendente por Precio y los almacena en la nueva tabla ("ofertas4"). 
 note que no se listan los campos a extraer, se coloca un asterisco para indicar que se incluyen todos los campos.*/

 --Veamos los registros de la nueva tabla:
 Select * From Ofertas4

 --Agregamos una columna a la tabla "editoriales" que contiene la ciudad en la cual está la casa central de cada editorial:
 
 --Queremos una nueva tabla llamada "Librosdecordoba" 
 --que contenga los títulos y Autores de los libros de editoriales de Cordoba. 
 --En primer lugar, la eliminamos, si existe:
 if object_id('LibrosDeCordoba') is not null
  Drop Table LibrosDeCordoba

 --consultamos las 2 tablas y guardamos el resultado en la nueva tabla que estamos creando:
 Select Titulo, Autor Into LibrosDeCordoba
 From Libros
 join Editoriales
 On Editorial = Nombre 

 --consultamos la nueva tabla:
 Select * From LibrosDeCordoba

 /*********************************************************************************************************************************************/

 --103) Vistas.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 /*Un club dicta Cursos de distintos Deportes. Almacena la información en varias tablas.
 El director no quiere que los empleados de administración conozcan la estructura de las tablas ni 
 algunos datos de los profesores y Socios, por ello se crean vistas a las cuales tEndrán acceso.*/

 --1- Elimine las tablas y créelas nuevamente:
 if object_id('Inscriptos') is not null  
  Drop Table Inscriptos

 if object_id('Socios') is not null  
  Drop Table Socios

 if object_id('Profesores') is not null  
  Drop Table Profesores

 if object_id('Cursos') is not null  
  Drop Table Cursos

 Create Table Socios(
  Documentos char(8) not null,
  Nombre varchar(40),
  Domicilio varchar(30),
  Constraint PK_Socios_Documentos
  Primary Key(Documentos)
 )

 Create Table Profesores(
  Documentos char(8) not null,
  Nombre varchar(40),
  Domicilio varchar(30),
  Constraint PK_Profesores_Documentos 
  Primary Key(Documentos)
 )

 Create Table Cursos(
  Numero tinyint identity,
  Deporte varchar(20),
  Dia varchar(15),
  Constraint CK_Inscriptos_Dia check(Dia in('Lunes','Martes','Miercoles','Jueves','Viernes','Sabado')),
  DocumentosProfesor char(8),
  Constraint PK_Cursos_Numero Primary Key(Numero),
 )

 Create Table Inscriptos(
  DocumentosSocio char(8) not null,
  Numero tinyint not null,
  Matricula char(1),
  Constraint CK_Inscriptos_Matricula check(Matricula in('s','n')),
  Constraint PK_Inscriptos_Documentos_Numero Primary Key(DocumentosSocio, Numero)
 )

 --2- Ingrese algunos registros para todas las tablas:
 Insert Into Socios Values('30000000','Fabian Fuentes','Caseros 987')
 Insert Into Socios Values('31111111','Gaston Garcia','Guemes 65')
 Insert Into Socios Values('32222222','Hector Huerta','Sucre 534')
 Insert Into Socios Values('33333333','Ines Irala','Bulnes 345')

 Insert Into Profesores Values('22222222','Ana Acosta','Avellaneda 231')
 Insert Into Profesores Values('23333333','Carlos Caseres','Colon 245')
 Insert Into Profesores Values('24444444','Daniel Duarte','Sarmiento 987')
 Insert Into Profesores Values('25555555','Esteban Lopez','Sucre 1204')

 Insert Into Cursos Values('Tenis','Lunes','22222222')
 Insert Into Cursos Values('Tenis','Martes','22222222')
 Insert Into Cursos Values('Natacion','Miercoles','22222222')
 Insert Into Cursos Values('Natacion','Jueves','23333333')
 Insert Into Cursos Values('Natacion','Viernes','23333333')
 Insert Into Cursos Values('Futbol','Sabado','24444444')
 Insert Into Cursos Values('Futbol','Lunes','24444444')
 Insert Into Cursos Values('Basquet','Martes','24444444')

 Insert Into Inscriptos Values('30000000',1,'s')
 Insert Into Inscriptos Values('30000000',3,'n')
 Insert Into Inscriptos Values('30000000',6,null)
 Insert Into Inscriptos Values('31111111',1,'s')
 Insert Into Inscriptos Values('31111111',4,'s')
 Insert Into Inscriptos Values('32222222',8,'s')

 --3- Elimine la vista "Vista_Club" si existe:
 if object_id('Vista_Club') is not null 
  Drop View Vista_Club

 --4- Cree una vista en la que aparezca el nombre y documentos del socio, el deporte, el día y el nombre del Profesor.
 GO
  Create View Vista_Club as
  Select s.Nombre as socio, s.Documentos as docsocio, s.Domicilio as domsocio, c.Deporte, Dia,
   p.Nombre as Profesor, Matricula
   From Socios as s
   full join Inscriptos as i
   On s.Documentos = i.DocumentosSocio
   full join Cursos as c
   On i.Numero = c.Numero
   full join Profesores as p
   On c.DocumentosProfesor = p.Documentos
  GO

 --5- Muestre la información contenida en la vista.
 Select * From Vista_Club

 --6 Realice una consulta a la vista donde muestre la cantidad de socios inscriptos en cada Deporte ordenados por cantidad.
 Select Deporte, Dia, count(socio) as Cantidad
  From Vista_Club
  Where Deporte is not null
  Group by Deporte, Dia
  Order by Cantidad

 --7- Muestre (consultando la vista) los cursos (deporte y día) para los cuales no hay inscriptos.
  Select Deporte, Dia 
   From Vista_Club
   Where socio is null and Deporte is not null

 --8- Muestre los Nombres de los socios que no se han inscripto en ningún curso (consultando la vista).
 Select socio 
  From Vista_Club
  Where Deporte is null and socio is not null

 --9- Muestre (consultando la vista) los profesores que no tienen asignado ningún deporte aún.
  Select Profesor 
   From Vista_Club 
   Where Deporte is null and Profesor is not null

 --10- Muestre (consultando la vista) el nombre y documentos de los socios que deben matrículas.
 Select socio, docsocio 
  From Vista_Club Where 
  Deporte is not null and Matricula <> 's'

 --11- Consulte la vista y muestre los Nombres de los profesores y los días en que asisten al club para dictar sus clases.
 Select Distinct Profesor, Dia
  From Vista_Club Where Profesor is not null

 --12- Muestre la misma información anterior pero ordenada por día.
 Select Distinct Profesor,Dia
  From Vista_Club Where Profesor is not null
  Order by Dia

 --13- Muestre todos los socios que son compañeros en tenis los Lunes.
 Select socio From Vista_Club
  Where Deporte = 'Tenis' and Dia = 'Lunes'

 --14- Elimine la vista "Vista_Inscriptos" si existe y créela para que muestre la cantidad 
 --de Inscriptos por curso, incluyendo el número del curso, el nombre del deporte y el día.
  if object_id('Vista_Inscriptos') is not null
   Drop View Vista_Inscriptos

  GO
  Create View Vista_Inscriptos as
  Select Deporte, Dia,(Select count(*)
    From Inscriptos as i
    Where i.Numero = c.Numero) as Cantidad
    From Cursos as c
  GO

 --15- Consulte la vista:
 Select * From Vista_Inscriptos

 --Ejercicio Resulto:

 if object_id('Empleados') is not null
  Drop Table Empleados

 if object_id('Secciones') is not null
  Drop Table Secciones

 --Creamos la tabla:
 Create Table Secciones(
   Codigo tinyint identity,
   Nombre varchar(20),
   Sueldo decimal(5,2),
   Constraint CK_Secciones_Sueldo check(Sueldo>=0),
   Constraint PK_Secciones Primary Key(Codigo)
 )

 --Creamos la tabla:
 Create Table Empleados(
  Legajo int identity,
  Documentos char(8)
  Constraint CK_Empleados_Documentos check(Documentos like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  Sexo char(1)
  Constraint CK_Empleados_Sexo check(Sexo IN ('f','m')),
  Apellido varchar(20),
  Nombre varchar(20),
  Domicilio varchar(30),
  Seccion tinyint not null,
  CantidadHijos tinyint
  Constraint CK_Empleados_Hijos check(CantidadHijos>=0),
  EstadoCivil char(10)
  Constraint CK_Empleados_EstadoCivil check(EstadoCivil IN ('Casado','Divorciado','Soltero','Viudo')),
  FechaIngreso DateTime,
  Constraint PK_Empleados Primary Key(Legajo),
  Constraint FK_Empleados_Seccion Foreign Key(Seccion) references Secciones(Codigo)
  On Update cascade,
  Constraint UQ_Empleados_Documentos
  unique(Documentos)
 )

 Insert Into Secciones 
  Values('Administración',300)
 Insert Into Secciones 
  Values('contaduría',400)
 Insert Into Secciones 
  Values('Sistemas',500)

 Insert Into Empleados 
  Values('22222222','f','Lopez','Ana','Colon 123',1,2,'Casado','1990-10-10') 
 Insert Into Empleados 
  Values('23333333','m','Lopez','Luis','Sucre 235',1,0,'Soltero','1990-02-10')
 Insert Into Empleados 
  Values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'Divorciado','1998-07-12')
 Insert Into Empleados 
  Values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'Casado','1998-10-09')
 Insert Into Empleados 
  Values('26666666','f','Perez','Laura','Peru 1254',3,3,'Casado','2000-05-09')

 if object_id('Vista_Empleados') is not null
  Drop View Vista_Empleados

 --Es para evitar raya roja en Create View.
 GO

 Create View Vista_Empleados as
 Select (Apellido+' '+e.Nombre) as Nombre, Sexo,
 s.Nombre as Seccion, CantidadHijos
 From Empleados as e
 join Secciones as s
 On Codigo = Seccion

 --Es para evitar raya roja en Create View.
 GO

 Select * From Vista_Empleados

 Select Seccion, count(*) as Cantidad
  From Vista_Empleados
  Group by Seccion

 if object_id('Vista_Empleados_Ingreso') is not null
  Drop View Vista_Empleados_Ingreso

 --Es para evitar raya roja en Create View.
 GO

 Create View Vista_Empleados_Ingreso(Fecha, Cantidad)
 as
 Select DatePart(Year, FechaIngreso),
  count(*)
  From Empleados
  Group by DatePart(Year, FechaIngreso)
 --Es para evitar raya roja en Create View.
 GO

 Select * From Vista_Empleados_Ingreso

 /*********************************************************************************************************************************************/

 --104) Vistas (Información).

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

 --Una empresa almacena la información de sus empleados en dos tablas llamadas "Empleados" y "Secciones".

 --Eliminamos las tablas, si existen:

 if object_id('Empleados') is not null
  Drop Table Empleados

 if object_id('Secciones') is not null
  Drop Table Secciones

 --Creamos la tabla:
 Create Table Secciones(
  Codigo tinyint identity,
  Nombre varchar(20),
  Sueldo decimal(5,2)
  Constraint CK_Secciones_Sueldo check(Sueldo >= 0),
  Constraint PK_Secciones Primary Key(Codigo)
 )

 Create Table Empleados(
  Legajo int identity,
  Documentos char(8)
  Constraint CK_Empleados_Documentos check(Documentos like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  Sexo char(1)
  Constraint CK_Empleados_Sexo check(Sexo IN ('f','m')),
  Apellido varchar(20),
  Nombre varchar(20),
  Domicilio varchar(30),
  Seccion tinyint not null,
  CantidadHijos tinyint
  Constraint CK_Empleados_Hijos check(CantidadHijos>=0),
  EstadoCivil char(10)
  Constraint CK_Empleados_EstadoCivil check(EstadoCivil IN ('Casado','Divorciado','Soltero','Viudo')),
  FechaIngreso DateTime,
  Constraint PK_Empleados Primary Key(Legajo),
  Constraint FK_Empleados_Seccion Foreign Key(Seccion) references Secciones(Codigo) On Update cascade,
  Constraint UQ_Empleados_Documentos unique(Documentos)
 )

 --Ingresamos algunos registros de Secciones:
 Insert Into Secciones 
  Values('Administración',300)
 Insert Into Secciones 
  Values('contaduría',400)
 Insert Into Secciones 
  Values('Sistemas',500)

 --Ingresamos algunos registros de Empleados:
 Insert Into Empleados 
  Values('22222222','f','Lopez','Ana','Colon 123',1,2,'Casado','1990-10-10')
 Insert Into Empleados 
  Values('23333333','m','Lopez','Luis','Sucre 235',1,0,'Soltero','1990-02-10')
 Insert Into Empleados 
  Values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'Divorciado','1998-07-12')
 Insert Into Empleados 
  Values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'Casado','1998-10-09')
 Insert Into Empleados 
  Values('26666666','f','Perez','Laura','Peru 1254',3,3,'Casado','2000-05-09')

 --Eliminamos la vista "vista_Empleados" si existe: 
 if object_id('Vista_Empleados') is not null
  Drop View Vista_Empleados

 --Es para evitar una raya roja en Create View.
 GO

 --Creamos la vista "vista_Empleados", que es resultado de una combinación en la cual se muestran 5 campos:
 Create View Vista_Empleados as
  Select (Apellido+' '+e.Nombre) as Nombre, Sexo,
  s.Nombre as Seccion, CantidadHijos
  From Empleados as e
  join Secciones as s
  On Codigo = Seccion

 --Es para evitar una raya roja en Create View.
 GO 

 --Vemos la información de la vista:
 Select * From Vista_Empleados

 --Ejecutamos "sp_help" enviándole como argumento el nombre de la vista:
 Exec sp_help Vista_Empleados

 --Vemos el texto que define la vista:
 Exec sp_helptext Vista_Empleados

 --Ejecutamos el procedimiento almacenado del sistema "sp_depends" seguido del nombre de la vista:
 Exec sp_depends Vista_Empleados

 --aparecen las tablas y campos de las cuales depEnde la vista, es decir, las tablas referenciadas en la misma.
 --Ejecutamos el procedimiento "sp_depends" seguido del nombre de la tabla "Empleados":
 Exec sp_depends Empleados

 --aparece la vista "vista_Empleados" y las Restricciones que depEnden de ella.
 --consultamos la tabla del sistema "sysobjects":
 Select * From sysobjects

 --Si queremos ver todas las vistas creadas por nosotros, podemos tipear:
 Select * From sysobjects
  Where xtype = 'V' and -- tipo Vista.
  name like 'Vista%' --búsqueda con comodín.

 /*********************************************************************************************************************************************/

 --110) Lenguaje De control De Flujo (Case).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa registra los datos de sus empleados en una tabla llamada "Empleados".
 
 --1- Elimine la tabla "Empleados" si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
  Documentos char(8) not null,
  Nombre varchar(30) not null,
  Sexo char(1),
  FechaNacimiento DateTime,
  FechaIngreso DateTime,
  CantidadHijos tinyint,
  Sueldo decimal(5,2),
  Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados Values ('22333111','Juan Perez','m','1970-05-10','1987-04-05',2,550)
 Insert Into Empleados Values ('25444444','Susana Morales','f','1975-11-06','1990-04-06',0,650)
 Insert Into Empleados Values ('20111222','Hector Pereyra','m','1965-03-25','1997-04-12',3,510)
 Insert Into Empleados Values ('30000222','Luis LUque','m','1980-03-29','1999-11-06',1,700)
 Insert Into Empleados Values ('20555444','Laura Torres','f','1965-12-22','2003-11-06',3,400)
 Insert Into Empleados Values ('30000234','Alberto Soto','m','1989-10-10','1999-11-06',2,420)
 Insert Into Empleados Values ('20125478','Ana Gomez','f','1976-09-21','1998-11-06',3,350)
 Insert Into Empleados Values ('24154269','Ofelia Garcia','f','1974-05-12','1990-11-06',0,390)
 Insert Into Empleados Values ('30415426','Oscar Torres','m','1978-05-02','1997-11-06',1,400)

 --4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
 /*cumplen ese mes. Si los empleados son de Sexo femenino, se les regala un ramo de rosas, si son de 
 Sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
 cuántas corbatas debe comprar para el mes de mayo.*/

 Select Sexo, count(*) as Cantidad, obsequio = 
 case 
   When Sexo = 'f' Then 'rosas'
   else 'corbata'
  End
  From Empleados
  Where DatePart(month, FechaNacimiento) = 5
  Group by Sexo

 --5- Además, si el empleado cumple 10,20,30,40... años de servicio, se le regala una placa 
 /*recordatoria. La secretaria de Gerencia necesita saber la cantidad de años de servicio que cumplen 
 los empleados que ingresaron en el mes de abril para encargar dichas placas.*/

 Select Nombre,DatePart(Year, FechaIngreso) as añoingreso,
  DatePart(Year,GetDate()) - DatePart(Year,FechaIngreso) 
  as 
  AñosdeServicio, placa = case (DatePart(Year, GetDate()) - DatePart(Year, FechaIngreso)) % 10
     When 0 Then 'Si'  --si la cantidad de años es divisible por 10
     else 'no'
   End
  From Empleados
  Where DatePart(month, FechaIngreso) = 4

 --6- La empresa Paga un Sueldo adiciOnal por hijos a cargos. Para un Sueldo menor o igual a $500 el 
 /*Salario familiar por hijo es de $200, para un Sueldo superior, el monto es de $100 por hijo. Muestre 
 el nombre del empleado, el Sueldo básico, la cantidad de hijos a cargo, el valor del Salario por 
 hijo, el valor total del Salario familiar y el Sueldo final con el Salario familiar incluido de 
 todos los empleados.*/
  
  Select Nombre, Sueldo, CantidadHijos, porhijo=
  case 
   When Sueldo <= 500 Then 200
   else 100
  End,
 Salariofamilar =
  case
   When Sueldo <= 500 Then 200 * CantidadHijos
   else 100 * CantidadHijos
  End,
 SueldoTotal =
  case
   When Sueldo <= 500 Then Sueldo + (200 * CantidadHijos)
   else Sueldo + (100 * CantidadHijos)
  End
  From Empleados
  Order by SueldoTotal

 --Ejercicio Resulto:

 --Un Profesor guarda las notas de sus Alumnos de un curso en una tabla llamada "Alumnos" que consta de los siguientes campos:

 --Eliminamos la tabla si existe y la creamos nuevamente:
 if object_id('Alumnos') is not null
  Drop Table Alumnos

 Create Table Alumnos(
  Nombre varchar(40),
  nota tinyint,
  Constraint CK_Alumnos_nota check (nota >= 0 and nota <= 10)
 )

 --Ingresamos algunos registros:
 Insert Into Alumnos 
  Values('Ana Acosta',8)
 Insert Into Alumnos 
  Values('Carlos Caseres',4)
 Insert Into Alumnos 
  Values('Federico Fuentes',2)
 Insert Into Alumnos 
  Values('Gaston Guzman',3)
 Insert Into Alumnos 
  Values('Hector Herrero',5)
 Insert Into Alumnos 
  Values('Luis Luna',10)
 Insert Into Alumnos 
  Values('Marcela Morales',7)
 Insert Into Alumnos 
  Values('Marcela Morales',null)

 /*Queremos mostrar el nombre y nota 
 de cada alumno y en una columna extra llamada "condicion"
 empleamos un case que testee la nota y muestre un mensaje 
 diferente si en dicho campo hay un valor:*/

 -- 0, 1, 2 ó 3: 'libre';
 -- 4, 5 ó 6: 'regular';
 -- 7, 8, 9 ó 10: 'promocionado';
 --Esta es la sentencia:

 Select Nombre, nota, condicion =
  Case nota
   When 0 Then 'Libre'
   When 1 Then 'Libre'
   When 2 Then 'Libre'
   When 3 Then 'Libre'
   When 4 Then 'Regular'
   When 5 Then 'Regular'
   When 6 Then 'Regular'
   When 7 Then 'promocionado'
   When 8 Then 'promocionado'
   When 9 Then 'promocionado'
   When 10 Then 'promocionado'
  End
 From Alumnos

 --Obtenemos la misma salida pero empleando el "case" con operadores de comparación:
 Select Nombre, nota, condicion =
   Case 
    When nota < 4 Then 'Libre'
    When nota >= 4 and nota < 7 Then 'Regular'
    When nota >= 7 Then 'promocionado'
    else 'sin nota'
   End
 From Alumnos
 
 --Vamos a agregar el campo "condicion" a la tabla:
 Alter Table Alumnos
  Add condicion varchar(20)

 --Veamos la tabla:
 Select * From Alumnos

 /*********************************************************************************************************************************************/
 
 --111) Lenguaje De control De Flujo (if).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa registra los datos de sus empleados en una tabla llamada "Empleados".

 --1- Elimine la tabla "Empleados" si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla:
 Create Table Empleados(
  Documentos char(8) not null,
  Nombre varchar(30) not null,
  Sexo char(1),
  FechaNacimiento DateTime,
  Sueldo decimal(5,2),
  Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados Values('22333111','Juan Perez','m','1970-05-10',550)
 Insert Into Empleados Values('25444444','Susana Morales','f','1975-11-06',650)
 Insert Into Empleados Values('20111222','Hector Pereyra','m','1965-03-25',510)
 Insert Into Empleados Values('30000222','Luis LUque','m','1980-03-29',700)
 Insert Into Empleados Values('20555444','Laura Torres','f','1965-12-22',400)
 Insert Into Empleados Values('30000234','Alberto Soto','m','1989-10-10',420)
 Insert Into Empleados Values('20125478','Ana Gomez','f','1976-09-21',350)
 Insert Into Empleados Values('24154269','Ofelia Garcia','f','1974-05-12',390)
 Insert Into Empleados Values('30415426','Oscar Torres','m','1978-05-02',400)

 --4- Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los empleados que 
 /*cumplen ese mes. Si los empleados son de Sexo femenino, se les regala un ramo de rosas, si son de 
 Sexo masculino, una corbata. La secretaria de la Gerencia necesita saber cuántos ramos de rosas y 
 cuántas corbatas debe comprar para el mes de mayo.*/

 if exists(Select * From Empleados
 Where DatePart(month, FechaNacimiento) = 5) --si hay Empleados que cumplan en mayo.
  (Select Sexo, count(*) as Cantidad 
   From Empleados
   Where DatePart(month, FechaNacimiento) = 5 Group by Sexo)
 else 
   Select 'no hay Empleados que cumplan en mayo'

 --Ejercicio 2:

 --Un teatro con varias Salas guarda la información de las Entradas vEndidas en una tabla llamada "Entradas".

 --1- Elimine la tabla, si existe:
 if object_id('Entradas') is not null
  Drop Table Entradas

 --2- Cree la tabla:
 Create Table Entradas(
  Sala tinyint,
  FechaHora DateTime,
  Capacidad smallint,
  EntradasVendidas smallint, 
  Primary Key(Sala, FechaHora)
 )

 --3- Ingrese algunos registros:
 Insert Into Entradas Values(1,'2006-05-10 20:00',300,50)
 Insert Into Entradas Values(1,'2006-05-10 23:00',300,250)
 Insert Into Entradas Values(2,'2006-05-10 20:00',400,350)
 Insert Into Entradas Values(2,'2006-05-11 20:00',400,380)
 Insert Into Entradas Values(2,'2006-05-11 23:00',400,400)
 Insert Into Entradas Values(3,'2006-05-12 20:00',350,350)
 Insert Into Entradas Values(3,'2006-05-12 22:30',350,100)
 Insert Into Entradas Values(4,'2006-05-12 20:00',250,0)

 --4- Muestre, si existen, todas las funciones para la cuales hay Entradas disponible, sino un mensaje que indique que están agotadas.
  if exists
  (Select * From Entradas Where Capacidad > EntradasVendidas)
  Select Sala, FechaHora, Capacidad - EntradasVendidas as disponible
   From Entradas
   Where Capacidad > EntradasVendidas
 else 
   Select 'Todas las Entradas estan agotadas'

 --Ejercicio Resulto:

 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40) not null,
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2),
  Cantidad tinyint,
  Primary Key (Codigo)
 )

 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',15,100)
 Insert Into Libros 
  Values('El aleph','Borges','Emece',20,150)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',50,200)
 Insert Into Libros 
  Values('Alicia en el Pais de las Maravillas','Lewis Carroll','Emece',15,0)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Emece',40,200)

  Select * From Libros 

 if exists (Select * From Libros 
  Where Cantidad = 0)
   (Select Titulo From Libros Where Cantidad = 0)
  else
   Select 'no hay Libros sin stock'

 if exists (Select * From Libros Where Editorial = 'Emece')
  Begin
   Update Libros set Precio = Precio - (Precio*0.1) Where Editorial = 'Emece'
   Select 'Libros actualizados'
  End
  else
   Select 'no hay Registros actualizados'

 Select * From Libros Where Editorial = 'Emece'

 if exists (Select * From Libros Where Cantidad = 0)
   Delete From Libros Where Cantidad = 0
  else
   Select 'no hay Registros Eliminados'

 if exists (Select * From Libros Where Cantidad = 0)
   Delete From Libros Where Cantidad = 0
  else
   Select 'no hay Registros Eliminados'

  Select * From Libros 
  Select Titulo, Costo = iif(Precio < 38,'Barato','Caro') From Libros

 /*********************************************************************************************************************************************/

 --120 - Procedimientos Almacenados (Crear - Ejecutar).

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

 if object_id('Pa_Crear_Libros') is not null
 Drop PROCEDURE Pa_Crear_Libros

 --Es para evitar rayas rojas en Create PROCEDURE.
 GO

 Create PROCEDURE Pa_Crear_Libros 
 as
 if object_id('Libros')is not null
 Drop Table Libros
 
 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(5,2),
  Cantidad smallint,
  Primary Key(Codigo)
 )

 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',15,5)
 Insert Into Libros 
  Values('Ilusiones','Richard Bach','Planeta',18,50)
 Insert Into Libros 
  Values('El aleph','Borges','Emece',25,9)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
 Insert Into Libros 
  Values('Java en 10 minutos','Mario Molina','Paidos',35,300)

 Exec Pa_Crear_Libros

 Select *From Libros

 Exec sp_help Pa_Crear_Libros

 if object_id('Pa_Libros_Limite_Stock') is not null
  Drop PROCEDURE Pa_Libros_Limite_Stock

 --Es para evitar rayas rojas en Create proc.
 GO

 Create proc Pa_Libros_Limite_Stock
  as
  Select * From Libros

  Where Cantidad <= 10

 Exec sp_help Pa_Libros_Limite_Stock

 Exec Pa_Libros_Limite_Stock

 Update Libros set Cantidad = 2 Where Codigo = 4
  Exec Pa_Libros_Limite_Stock

 /*********************************************************************************************************************************************/

 --135) Funciones Escalares (Crear y llamar).

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una clínica almacena los turnos para los distintos médicos 
 --en una tabla llamada "Consultas" y en otra tabla "Medicos" los datos de los médicos.

 --1- Elimine las tablas si existen:
 if object_id('Consultas') is not null
  Drop Table Consultas

 if object_id('Medicos') is not null
  Drop Table Medicos

 --2- Cree las tablas con las siguientes estructuras:
 Create Table Medicos (
  Documentos char(8) not null,
  Nombre varchar(30),
  Constraint PK_Medicos 
  Primary Key clustered(Documentos)
 )

 Create Table Consultas(
   Fecha DateTime,
   Medico char(8) not null,
   Paciente varchar(30),
   Constraint PK_Consultas Primary Key(Fecha, Medico),
   Constraint FK_Consultas_Medico Foreign Key(Medico) references Medicos(Documentos) 
   On Update cascade
   On Delete cascade
 )

 --3- Ingrese algunos registros:
 Insert Into Medicos Values('22222222','Alfredo Acosta')
 Insert Into Medicos Values('23333333','Pedro Perez')
 Insert Into Medicos Values('24444444','Marcela Morales')

 Insert Into Consultas Values('2007/03/26 8:00','22222222','Juan Juarez')
 Insert Into Consultas Values('2007/03/26 8:00','23333333','Gaston Gomez')
 Insert Into Consultas Values('2007/03/26 8:30','22222222','nora norte')
 Insert Into Consultas Values('2007/03/28 9:00','22222222','Juan Juarez')
 Insert Into Consultas Values('2007/03/29 8:00','24444444','nora norte')
 Insert Into Consultas Values('2007/03/24 8:30','22222222','Hector Huerta')
 Insert Into Consultas Values('2007/03/24 9:30','23333333','Hector Huerta')

 --4- Elimine la función "f_NombreDia" si existe:
 if object_id('f_NombreDia') is not null
  Drop Function f_NombreDia

 --5- Cree la función "f_NombreDia" que recibe una Fecha (tipo string) y nos retorne el nombre del día en Español.
 if object_id('f_NombreDia') is not null
  Drop Function f_NombreDia

 --Es para evitar rayas rojas en Create Function.
 GO
 Create Function f_NombreDia
 (@Fecha varchar(30))
  Returns varchar(10)
  as
  Begin
    declare @Nombre varchar(10)
    set @Nombre = 'Fecha Inválida'   
    if (isdate(@Fecha) = 1)
    Begin
      set @Fecha=Cast(@Fecha as DateTime)
      set @Nombre=
      case DateName(weekday,@Fecha)
       When 'Monday' Then 'Lunes'
       When 'Tuesday' Then 'Martes'
       When 'Wednesday' Then 'miércoles'
       When 'Thursday' Then 'Jueves'
       When 'Friday' Then 'Viernes'
       When 'Saturday' Then 'sábado'
       When 'Sunday' Then 'domingo'
      End--case
    End--si es una Fecha válida
    Return @Nombre
 End

 --Es para evitar rayas rojas en Create Function.
 GO

 --6- Elimine la función "f_horario" si existe:
 if object_id('f_horario') is not null
  Drop Function f_horario

 --7- Cree la función "f_horario" que recibe una Fecha (tipo string) y nos retorne la hora y minutos.

 --Es para evitar rayas rojas en Create Function.
  GO
  Create Function f_horario
  
 (@Fecha varchar(30))
  Returns varchar(5)
  as
  Begin
    declare @Nombre varchar(5)
    set @Nombre = 'Fecha Inválida'   
    if (isdate(@Fecha) = 1)
    Begin
      set @Fecha = Cast(@Fecha as DateTime)
      set @Nombre = rtrim(Cast(DatePart(hour, @Fecha) as char(2))) + ':'
      set @Nombre = @Nombre + rtrim(Cast(DatePart(minute, @Fecha) as char(2)))
    End--si es una Fecha válida
    Return @Nombre
 End

 --Es para evitar rayas rojas en Create Function.
 GO

 --8- Elimine la función "f_Fecha" si existe:
 if object_id('f_Fecha') is not null
  Drop Function f_Fecha

 --9- Cree la función "f_Fecha" que recibe una Fecha (tipo string) y nos retorne la Fecha (sin hora ni minutos).

 --Es para evitar rayas rojas en Create Function.
 GO
 Create Function f_Fecha
 (@Fecha varchar(30))
  Returns varchar(12)
  as
  Begin
    declare @Nombre varchar(12)
    set @Nombre = 'Fecha Inválida'   
    if (isdate(@Fecha) = 1)
    Begin
      set @Fecha = Cast(@Fecha as DateTime)
      set @Nombre = rtrim(Cast(DatePart(day, @Fecha) as char(2)))+'/'
      set @Nombre = @Nombre + rtrim(Cast(DatePart(month, @Fecha) as char(2)))+'/'
      set @Nombre = @Nombre + rtrim(Cast(DatePart(Year, @Fecha) as char(4)))
    End--si es una Fecha válida
    Return @Nombre
 End

 --Es para evitar rayas rojas en Create Function.
 GO

 --10- Envíe a la función "f_NombreDia" una Fecha y muestre el valor retornado:
 declare @valor char(30)
 set @valor = '2007/04/09'
 Select dbo.f_NombreDia(@valor)

 --Ejercicio 2:

  set lenguage us_english

 --Una empresa almacena datos de sus empleados en una tabla denominada "Empleados".

 --1- Elimine la tabla si existe y créela con la siguiente estructura:
 if object_id('Empleados') is not null
  Drop Table Empleados

  Create Table Empleados(
  Documentos char(8) not null,
  Nombre varchar(30),
  FechaIngreso DateTime,
  Mail varchar(50),
  Telefono char(12)
 )

 GO

 --fijamos el formato fecha
 set dateformat ymd

 --2- Ingrese algunos registros:
 Insert Into Empleados 
  Values('22222222','Ana Acosta','1985/10/10','anitaacosta@hotmail.com','4556677')
 Insert Into Empleados 
  Values('23333333','Bernardo Bustos','1986/01/15',null,'45588877')
 Insert Into Empleados 
  Values('24444444','Carlos Caseros','1999/12/02',null, null)
 Insert Into Empleados 
  Values('25555555','Diana Dominguez',null, null,'4252525')

 Select * from Empleados

 --3- Elimine la función "f_fechaCadena" si existe:
 if object_id('dbo.f_fechaCadena') is not null
  Drop Function dbo.f_fechaCadena

 --4- Cree la función "f_fechaCadena" que reciba 2 Fechas (de tipo DateTime) y nos retorne un valor positivo 
  /*correspOndiente a la diferencia entre ambas.
  Recuerde que en las funciones definidas por el usuario no pueden incluir funciones no 
  determinísticas (como GetDate), por ello, debemos enviar la Fecha actual.
  note que la función retorna un valor positivo (tinyint), en ella se valida que la primera Fecha a la 
  cual se le  resta la segunda Fecha sea mayor. Si quisiéramos calcular la cantidad de años entre dos 
  Fechas podríamos emplear la función del sistema "datediff" que retorna un int, esta función (ya 
  vista) retorna un valor negativo si la primera Fecha es menor a la segunda Fecha enviada. Pero 
  nosotros queremos la Edad de una persona, así que siempre enviaremos como primera Fecha una 
  posterior a la segunda.*/

 --Es para evitar rayas rojas en Create Function.
  GO
  Create Function f_fechaCadena
 (@Fecha varchar(25))
  returns varchar(25)
  as
  begin
    declare @Nombre varchar(25)
    set @Nombre = 'Fecha Invalida'
	--if (isdate(@Fecha)-1)
    Begin
      set @Fecha = cast(@Fecha as datetime)
	  set @Nombre = 
        Case DateName(month, @Fecha)
         When 'January' Then 'Enero'
         When 'February' Then 'Febrero'
         When 'March' Then 'Marzo'
         When 'April' Then 'Abril'
         When 'May' Then 'Mayo'
         When 'June' Then 'Junio'
         When 'July' Then 'Julio'
         When 'August' Then 'Agosto'
         When 'September' Then 'Septiembre'
         When 'October' Then 'Octubre'
         When 'november' Then 'noviembre'
         When 'December' Then 'Diciembre'
    end--case.
	set @Nombre = rtrim(cast(datepart(day, @Fecha) as char(2))) + ' de ' +@Nombre
	set @Nombre = @Nombre + ' de '+rtrim(cast(datepart(year,@Fecha) as char(4)))
	end--si es una fecha valida.
    return @Nombre
  End
  GO

  --5- Recuperamos los registros de empleados, mostrando el nombre y la fecha
  --de ingresos empleado la funcion creada anteriormente.
  Select Nombre, dbo.f_fechaCadena(FechaIngreso) as Ingreso From Empleados

 --6- Empleamos la funcion en otro contexto. 
  Select dbo.f_fechaCadena(GetDate())

 --Ejercicio Resulto:

 --Una empresa tiene almacenados los datos de sus empleados en una tabla denominada "Empleados".

 --Eliminamos la tabla, si existe y la creamos con la siguiente estructura:

 if object_id('Empleados') is not null
  Drop Table Empleados

 Create Table Empleados(
  Documentos char(8) not null,
  Nombre varchar(30),
  FechaIngreso DateTime,
  Mail varchar(50),
  Telefono varchar(12)
 )

 --Ingresamos algunos registros:
 Insert Into Empleados 
  Values('22222222','Ana Acosta','1985/10/10','anaacosta@gMail.com','4556677')
 Insert Into Empleados 
  Values('23333333','Bernardo Bustos', '1986/02/15',null,'4558877')
 Insert Into Empleados 
  Values('24444444','Carlos Caseros','1999/12/02',null,null)
 Insert Into Empleados 
  Values('25555555','Diana Dominguez',null,null,'4252525')

 --Eliminamos, si existe, la función "f_FechaCadena":
 if object_id('dbo.F_FechaCadena') is not null
  Drop Function dbo.F_FechaCadena

  /*Creamos una función a la cual le enviamos una Fecha (de tipo varchar), 
  en el cuerpo de la función se analiza si el dato enviado correspOnde a una Fecha, 
  si es así, se almacena en una variable el mes (en Español) 
  y se le concatenan el día y el año y se retorna esa cadena;
  en caso que el valor enviado no correspOnda a una Fecha, 
  la función retorna la cadena 'Fecha Inválida':*/
 
 --Es para evitar rayas rojas en Create Function.
 GO 

 Create Function F_FechaCadena
 (@Fecha varchar(25))

 Returns varchar(25)
 as
 Begin
   DECLARE @Nombre varchar(25)
    set @Nombre = 'Fecha Inválida'
     if (isdate(@Fecha) = 1)
      Begin
        set @Fecha = Cast(@Fecha as DateTime)
        set @Nombre =
        Case DateName(month, @Fecha)
         When 'January' Then 'Enero'
         When 'February' Then 'Febrero'
         When 'March' Then 'Marzo'
         When 'April' Then 'Abril'
         When 'May' Then 'Mayo'
         When 'June' Then 'Junio'
         When 'July' Then 'Julio'
         When 'August' Then 'Agosto'
         When 'September' Then 'Septiembre'
         When 'October' Then 'Octubre'
         When 'november' Then 'noviembre'
         When 'December' Then 'Diciembre'
      End --Case
       set @Nombre = rtrim(Cast(DatePart(day,@Fecha) as char(2)))+' de '+@Nombre
       set @Nombre = @Nombre +' de '+ rtrim(Cast(DatePart(Year,@Fecha)as char(4)))
    End --Si es una Fecha válida.
    Return @Nombre
 End--Begin

 --GO es para evitar rayas rojas en PROCEDURE y proc.
 GO

 --Recuperamos los registros de "Empleados", mostrando el nombre y la Fecha de ingreso empleando la función creada anteriormente:
 Select Nombre, dbo.F_FechaCadena(FechaIngreso) as Ingreso 
 From Empleados

 --note que el registro con valor nulo en el campo "FechaIngreso" muestra "Fecha Inválida". Empleamos la función en otro contexto:
 Select dbo.F_FechaCadena(GetDate())

 /*********************************************************************************************************************************************/

 --136) Funciones De tabla De Varias Instrucciones.

 --Ejercicios Propuestos.

 --Ejercicio 1:

 --Una empresa almacena los datos de sus empleados en una tabla denominada "Empleados".

 --1- Elimine la tabla si existe:
 if object_id('Empleados') is not null
  Drop Table Empleados

 --2- Cree la tabla con la siguiente estructura:
 Create Table Empleados(
  Documentos char(8) not null,
  Apellido varchar(30) not null,
  Nombre varchar(30) not null,
  Domicilio varchar(30),
  Ciudad varchar(30),
  FechaNacimiento DateTime,
  Constraint PK_Empleados Primary Key(Documentos)
 )

 --3- Ingrese algunos registros:
 Insert Into Empleados 
  Values('22222222','Acosta','Ana','Avellaneda 123','Cordoba','1970/10/10')
 Insert Into Empleados 
  Values('23333333','Bustos','Bernardo','Bulnes 234','Cordoba','1972/05/15')
 Insert Into Empleados 
  Values('24444444','Caseros','Carlos','Colon 356','Carlos Paz','1980/02/25')
 Insert Into Empleados 
  Values('25555555','Fuentes','Fabiola','Fragueiro 987','Jesus Maria','1984/06/12')

 --4- Elimine la función "f_Empleados" si existe:
 if object_id('f_Empleados') is not null
  Drop Function f_Empleados

 --GO arriba del Create para evitar rayas rojas en Create Function.
 GO

 --5- Cree una función que reciba como parámetro el texto "total" o "parcial" y muestre, en el primer 
 --caso, todos los datos de los empleados y en el segundo caso (si recibe el valor "parcial"): el 
 --Documentos, Apellido, Ciudad y año de Nacimiento.
 Create Function f_Empleados
  (@opcion varchar(10))

  Returns @listado Table
  (Documentos char(8),
  Nombre varchar(60),
  Domicilio varchar(60),
  Nacimiento varchar(12))
  as 
  Begin
   if @opcion not in ('total','parcial')
     set @opcion = 'parcial'
   if @opcion = 'total'
    Insert @listado 
     Select Documentos,
     (Apellido+' '+Nombre),
     (Domicilio+'('+Ciudad+')'), 
     Cast(FechaNacimiento as varchar(12))
      From Empleados
   else
    Insert @listado
     Select Documentos,Apellido,Ciudad, 
	Cast(DatePart(Year,FechaNacimiento) as char(4))
     From Empleados
   Return
 End

 --Se coloca otro debajo del End para evitar rayas rojas en Create Function.
 GO 

 --6- Llame a la función creada anteriormente enviándole "total".
 Select * From dbo.f_Empleados('total')

 --7- Llame a la función anteriormente creada sin enviar argumento. Mensaje de error.
 --Select * From dbo.f_Empleados()

 --8- Llame a la función enviándole una cadena vacía.
 Select * From dbo.f_Empleados('')

 --9- Ejecute la función "f_Empleados" enviando "parcial" como argumento y recupere solamente los registros cuyo Domicilio es "Cordoba".
 Select * From dbo.f_Empleados('parcial')
  Where Domicilio = 'Cordoba'

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla, si existe y la creamos con la siguiente estructura:
 if object_id('Libros') is not null
  Drop Table Libros 

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20),
  Precio decimal(6,2)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta',15) 
 Insert Into Libros 
  Values('Ilusiones','Richard Bach','Planeta',10)
 Insert Into Libros 
  Values('El aleph','Borges','Emece',25)
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Siglo XXI',55)
 Insert Into Libros 
  Values('Alicia en el Pais','Lewis Carroll','Paidos',35)
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Nuevo siglo',25)

 --Eliminamos la función "f_ofertas" si existe":
 if object_id('f_ofertas') is not null
  Drop Function f_ofertas

 --Es para evitar rayas rojas en Create Function.
 GO 

 --Creamos la función "f_ofertas" 
  /*que reciba un parámetro correspOndiente 
  a un precio y nos retorne una tabla 
  con código, título, Autor y precio 
  de todos los libros cuyo precio 
  sea inferior al parámetro:*/

 Create Function f_ofertas
  (@minimo decimal(6,2))

  Returns @ofertas Table
  --Nombre de la tabla.
  --Formato de la tabla.
  (Codigo int,
   Titulo varchar(40),
   Autor varchar(30),
   Precio decimal(6,2)
  )
  as
  Begin
    Insert @ofertas
     Select Codigo, Titulo, Autor, Precio
      From Libros
     Where Precio < @minimo
    Return
 End

 --Es para evitar rayas rojas en PROCEDURE y proc.
 GO

 Select * From Libros

 --Llamamos a la función como si fuera una tabla, recuerde que podemos omitir el nombre del propietario:
 Select * From f_ofertas(30)

 /*Realizamos un join entre "libros" y la tabla retornada por la función 
  "f_ofertas" y mostramos todos los campos de "libros". 
  Incluimos una condición para el Autor:*/

 Select l.Titulo, l.Autor, l.Editorial
 From Libros as l
 join dbo.f_ofertas(25) as o
 On l.Codigo = o.Codigo
 Where l.Autor = 'Richard Bach'

 --La siguiente consulta nos retorna algunos campos de la tabla retornada por "f_ofertas" 
 --y algunos registros que cumplen con la condición "Where":
 Select Titulo, Precio 
  From f_ofertas(40)
 Where Autor like '%B%'

 --Eliminamos la función "f_ListadoLibros" si existe":
 if object_id('f_ListadoLibros') is not null
  Drop Function f_ListadoLibros 

  --Es para evitar rayas rojas en Create FunciOn.
  GO

  --Creamos otra función que retorna una tabla:
  Create Function f_ListadoLibros
  (@opcion varchar(10))

  Returns @listado Table(
   Titulo varchar(40),
   Detalles varchar(60)
  )
  as 
  Begin
   if @opcion not in ('Autor','Editorial')
     set @opcion = 'Autor'
   if @opcion = 'Editorial'
    Insert @listado 
     Select Titulo,
    (Editorial +'-'+ Autor) 
    From Libros
    Order by 2
   else
     if @opcion = 'Autor'
      Insert @listado
      Select Titulo,
      (Autor +'-'+ Editorial) 
	   From Libros  
      Order by 2
   Return
 End
 --note que si el valor enviado al parámetro no está incluido en la lista de valores especificada, se setea el parámetro con el valor "autor".

 --Es para evitar un error en Create Function.
 GO

 --Llamamos a la función enviando el valor "autor":
 Select * From dbo.f_ListadoLibros('Autor')

 --Llamamos a la función enviando el valor "editorial":
 Select * From dbo.f_ListadoLibros('Editorial')

 --Llamamos a la función enviando un valor inválido:
 Select * From dbo.f_ListadoLibros('Precio')

 /*********************************************************************************************************************************************/

 --137) Funciones Con Valores De Tabla En Línea.

 --Ejercicio Propuesto.

 --Ejercicio Resulto:

 --Trabajamos con la tabla "libros" de una librería.

 --Eliminamos la tabla si existe y la creamos con la siguiente estructura:
 if object_id('Libros') is not null
  Drop Table Libros

 Create Table Libros(
  Codigo int identity,
  Titulo varchar(40),
  Autor varchar(30),
  Editorial varchar(20)
 )

 --Ingresamos algunos registros:
 Insert Into Libros 
  Values('Uno','Richard Bach','Planeta')
 Insert Into Libros 
  Values('El aleph','Borges','Emece')
 Insert Into Libros 
  Values('Ilusiones','Richard Bach','Planeta')
 Insert Into Libros 
  Values('Aprenda PHP','Mario Molina','Nuevo siglo')
 Insert Into Libros 
  Values('Matematica estas ahi','Paenza','Nuevo siglo')

 --Eliminamos, si existe la función "f_Libros":
 if object_id('f_Libros') is not null
  Drop Function f_Libros

 --Es para evitar un error en Create Function.
 GO

  --Creamos una función con valores de tabla en línea que recibe un valor de Autor como parámetro:
  Create Function f_Libros
   (@Autor varchar(30) = 'Borges')
  Returns Table
  as
  Return(
   Select Titulo, Editorial
    From Libros
   Where Autor like '%'+@Autor+'%'
 )
 --Es para evitar un error en Create Function.
 GO 

 --Llamamos a la función creada anteriormente enviando un Autor:
 Select * From f_Libros('Bach')

 --Eliminamos, si existe la función "f_Libros_AutorEditorial":
 if object_id('f_Libros_AutorEditorial') is not null
  Drop Function f_Libros_AutorEditorial

--Es para evitar un error en create function.
 GO

 --Creamos una función con valores de tabla en línea que recibe dos parámetros: 
 Create Function f_Libros_AutorEditorial
  (@Autor varchar(30) = 'Borges',
  @Editorial varchar(20) = 'Emece')
  Returns Table
  as
  Return(
   Select Titulo, Autor, Editorial
    From Libros
   Where Autor like '%'+ @Autor +'%' and Editorial like '%'+ @Editorial +'%'
 )

 --Es para evitar un error en create function.
 GO

 --Llamamos a la función creada anteriormente:
 Select * From f_Libros_AutorEditorial('','Nuevo Siglo')

 --Llamamos a la función creada anteriormente enviando "default" para que tome los valores por defecto: 
 Select * From f_Libros_AutorEditorial(default, default)
