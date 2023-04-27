create database sistemEducati;
use sistemEducati;

Create table grado (
id_grado int primary key auto_increment,
grado varchar(30) not null 
);
---- Insertar datos a la tablas grado ----------

----------------- -------------------------
create table grupo (
id_grupo int primary key auto_increment,
id_gradoFK int,
id_estudianteFK int
);

------------ insertar datos a la tabla grupo ---------

----------------- --------------------------

create table estudiante (
id_estudiante int primary key auto_increment,
tipoDoc enum('Tarjeta de identidad', 'Cedula de ciudadania', 'Cedula de extranjeria') not null,
numDoc int(11) not null,
NombreEstudiante varchar(30) not null, 
ApellidoEstudiante varchar(20)  not null, 
fechaNacimiento date not null
);
------------------------------- ------------------------------ ----------------------- --------------- -------
create table maestro_por_grupo(
id_maestroFK int,
id_grupoFk int
);
------------------ ------------------------ ------------------- ---------------- ------------------ ------------ -
create table Profesor(
id_maestro int primary key auto_increment,
nombreMaestro varchar(30) not null,
direccion varchar(30) not null,
telefono int(10) not null,
correoElectronico varchar(30) not null,
id_asignaturaFk int
);
---------------------------------- ----------------------------------------------- ---------------------------
create table asignatura (
id_asignatura int primary key auto_increment,
nombre_Materia varchar(30) not null
);

------------------------- --------------------------------------------------------------- -------------
create table asistencia (
id_asignaturaFK int ,
id_grupoFK int
);
------------------------------- -------------------------------------------------------------------
Create table calificacion (
id_calificacion int primary key auto_increment,
calificacion int not null,
id_asignaturaFk int
);
-------------------------------- --------------------------------------------- ------------------------------
create table estudiante_Calificacion(
id_estudianteFk int,
id_calificacionFk int
);
---------- Relaciones---------------------------------------------- -------------------------------- ----------
alter table grupo add constraint grupoGrado
foreign key(id_gradoFK) references grado(id_grado); 
---------------------------------------------
alter table grupo add constraint grupoEstudiante 
foreign key (id_estudianteFk) references estudiante(id_estudiante);
-------------------------------------------
alter table maestro_por_grupo add constraint maestroGrupo
foreign key(id_grupoFk) references grupo(id_grupo);
---------------------------------------
alter table maestro_por_grupo add constraint maestroConjunto
foreign key(id_maestroFk) references profesor(id_maestro);
-----------------------------------------
alter table profesor add constraint profesorAsignatura
foreign key (id_asignaturaFk) references asignatura(id_asignatura);
----------------------------------------
alter table asistencia add constraint asistenciaAsignatura
foreign key(id_asignaturaFk) references asignatura(id_asignatura);
----------------------------------------
alter table asistencia add constraint asistenciaGrupo
foreign key(id_grupoFk) references grupo(id_grupo);
----------------------------------------
alter table calificacion add constraint califiAsisgnatura
foreign key (id_asignaturaFk) references asignatura(id_asignatura);
------------------------------------------
alter table estudiante_calificacion add constraint estuCalificaion
foreign key (id_estudianteFk) references estudiante(id_estudiante);
-----------------------------------------
alter table estudiante_calificacion add constraint estuCalificacion
foreign key (id_calificacionFk) references calificacion(id_calificacion);
------------------ insertar datos a las tablas------------ ---------
insert into estudiante values(1,'Tarjeta de identidad', 1016946873, 'Jaider Steven', 'Quimbaya Mendez', '2003-11-06' );
insert into estudiante values(2,'Cedula de Ciudadania', 1025467820, 'Santiago David', 'Cuellar cruz ', '2004-01-31');
insert into estudiante values(3,'Cedula de extranjeria', 1026946580, 'Johan David', 'Rodriguez martinez', '2005-10-15');
insert into estudiante values(4,'Tarjeta de identidad', 1020567875, 'Pily carolina', 'Barbosa martinez', '2006-06-25');
insert into estudiante values(5,'Cedula de Ciudadania',1064876320, 'Yeison david ', 'Rodriguez Rodriguez', '2007-03-30');
insert into estudiante values(6,'Cedula de Extranjeria',1065598720, 'Esteben ', 'Martinez Barrera', '2008-05-26');
insert into estudiante values(7,'Tarjeta de identidad', 1002694522, 'Valentina', 'Forero Barrera', '2005-11-30');
insert into estudiante values(8,'Cedula de Ciudadania', 1065987423, 'Daniel', 'Vargas Quimbaya', '1998-03-07');
insert into estudiante values(9, 'Cedula de Extranjeria', 1036987456, 'Juan Pablo', 'Franco Rojas', '2000-06-25');
insert into estudiante values(10,'Tarjeta de identidad',1026987421,'Luis','Coronado Revolledo', '2003-07-14');
-------------------------------- ---------------------------------------- ----------------------

insert into profesor values(1,'Alverto','Calle 121 # 34-56', 321982458,'alverto123@gmail.com', 1);
insert into profesor values(2,'luis','carrera 100 # 63 - 56', 32000569,'LuisW12@gmail.com', 2);
insert into profesor values(3,'Fabio','Calle 122 # 70-90', 331988448,'Fabivvv13@gmail.com', 3);
insert into profesor values(4,'Lorena','Carrera 121 # 40-50', 325972258,'LoreCastro@gmail.com', 4);
insert into profesor values(5,'Adolfo','avenida 21 # 44-99', 329902255,'AdolfoLopez@gmail.com', 5);
insert into profesor values(6,'Jaime','Av Calle 56 # 78-20', 329988463,'JaimeXd@gmail.com', 6);
insert into profesor values(7,'Carlos','Calle 266 # 04-02', 326987132,'CarlosMt@gmail.com', 7);
insert into profesor values(8,'Leonardo','Calle 68 # 10-23',326987410,'LeonaCastillo@gmail.com', 8);
insert into profesor values(9,'Adriana','Carrera  # 134-56', 300974561,'Adriana_5698@gmail.com', 9);
insert into profesor values(10,'carolina','calle 75 # 63-69', 301698742,'alverto123@gmail.com', 10);
-----------------------------------------------------------------------------------------------------
insert into asignatura values(1,'Matematicas');
insert into asignatura values(2, 'Lengua castellana');
insert into asignatura values(3, 'Humanidades ingles');
insert into asignatura values(4, 'Ciencias Naturales');
insert into asignatura values(5, 'Ciencias Sociales ');
insert into asignatura values(6, 'Tecnologia ');
insert into asignatura values(7, 'Educacion Artistica');
insert into asignatura values(8, 'Etica y Relegion');
insert into asignatura values(9, 'Educacion Fisica');
insert into asignatura values(10, 'Ciencias politica');
------------------------------------------------------------------------------------------------------
insert into grupo values (1,10,1);
insert into grupo values (2,9,5);
insert into grupo values (3,8,9 );
insert into grupo values (4,7,7);
insert into grupo values (5,1,6);
insert into grupo values (6,2,4);
insert into grupo values (7, 3,2);
insert into grupo values (8, 4,3);
insert into grupo values (9, 5,8);
insert into grupo values (10, 6,10);
-------------------------------------- ------------------------------------------------------------------
insert into grado values(1,'6°');
insert into grado values(2,'7°');
insert into grado values(3,'8°');
insert into grado values(4,'9°');
insert into grado values(5,'10°');
insert into grado values(6,'11°');
insert into grado values(7,'5°');
insert into grado values(8,'4°');
insert into grado values(9,'3°');
insert into grado values(10,'2°');
------------------------------------ -------------------------------------------- -------------------------
insert into calificacion values(1,100,5);
insert into calificacion values(2,99,6);
insert into calificacion values(3,55,7);
insert into calificacion values(4,75,8);
insert into calificacion values(5,60,9);
insert into calificacion values(6,30,10);
insert into calificacion values(7,10,4);
insert into calificacion values(8,80,3);
insert into calificacion values(9,78,2);
insert into calificacion values(10,65,1);
-------------------------------------------------- ----------------------------------------------------- 
insert into asistencia values(10,9);
insert into asistencia values(9,7);
insert into asistencia values(8,8);
insert into asistencia values(7,6);
insert into asistencia values(5,4);
insert into asistencia values(6,5);
insert into asistencia values(4,3);
insert into asistencia values(3,1);
insert into asistencia values(2,10);
insert into asistencia values(1,2);
------------------- ------------------------------ ----------------------- -----------------------
insert into estudiante_calificacion values(1,10);
insert into estudiante_calificacion values(2,9);
insert into estudiante_calificacion values(3,7);
insert into estudiante_calificacion values(4,8);
insert into estudiante_calificacion values(5,6);
insert into estudiante_calificacion values(6,4);
insert into estudiante_calificacion values(7,5);
insert into estudiante_calificacion values(8,3);
insert into estudiante_calificacion values(9,2);
insert into estudiante_calificacion values(10,1);
-------------------------------------- --------------------------------------- ------------------
insert into maestro_por_grupo values(10,1);
insert into maestro_por_grupo values(9,5);
insert into maestro_por_grupo values(8,6);
insert into maestro_por_grupo values(7,8);
insert into maestro_por_grupo values(6,9);
insert into maestro_por_grupo values(5,10);
insert into maestro_por_grupo values(4,2);
insert into maestro_por_grupo values(3,4);
insert into maestro_por_grupo values(2,3);
insert into maestro_por_grupo values(1,7);
--------- Consultar cambiando el encabezado del campo--------------------------------------------
alter table asignatura 
change nombre_Materia nombreasignatura varchar(30);
-------------------------------------- ------------------------------------------------ 
alter table calificacion 
change calificacion nota varchar(30);
---------------------------------- --------------------------------------- 
alter table estudiante
change numDoc NumeroDocumento varchar(30);
----------------------------------------- ---------
alter table profesor 
change nombreMaestro nombreProfesor varchar(30);
------------ traer los primeros 5 registros de una tabla -------------
select*from profesor limit 5;
select*from asignatura limit 5;
select*from calificacion limit 5;
select*from estudiante limit 5;
--------------------- contar cuantos registros tiene un id par -----------

------ Consultas multitablas---------
Select id_maestro,nombreProfesor,direccion,NumeroDocumento,ApellidoEstudiante from profesor join estudiante;

