--/*Creando BD*/
create database biblioteca;
--/*Marcando la BD para trabajarla*/
use biblioteca;
--/*Creando Tablas*/
ALTER TABLE autores
ADD COLUMN id_libro INTEGER NOT NULL,
ADD FOREIGN KEY (id_libro) REFERENCES libros(idlibro);

RENAME TABLE libro TO libros;



create table libros(
idlibro int auto_increment not null primary key,
titulo varchar(70),
autor varchar(70),
editorial varchar(70),
fechaPublicacion date,
genero varchar(70),
cantidad int,
estado tinyint);

create table ejemplares(
idEjemplar int auto_increment not null,
id_libro int not null,
estado varchar(30),
ubicacion varchar(50) not null,
fechaVencimiento date,
primary key(idEjemplar),
foreign key(id_libro) references libros(idlibro));

create table usuarios(
idUsuario int auto_increment not null,
nombre varchar(70) not null,
direccion varchar(70) not null,
email varchar(25) not null,
telefono varchar(25) not null,
password_hash varchar(255) not null,
salt varchar(255) not null,
primary key(idUsuario));

create table prestamos(
idPrestamo int auto_increment not null,
id_usuario int not null,
id_ejemplar int not null,
fechaPrestamo date not null,
fechaDevolucion date not null,
estado varchar (30) not null,
primary key(idPrestamo),
foreign key(id_usuario) references usuarios(idUsuario),
foreign key(id_ejemplar) references ejemplares(idEjemplar));

create table autores(
idAutor int auto_increment,
nombre varchar(70) NOT NULL,
fechaNacimiento date not null,
pais varchar(35) NOT NULL,
genero VARCHAR(1000) NOT NULL,
biografia TEXT NOT NULL,
primary key(idAutor));

create table editoriales(
idEditorial int auto_increment not null,
nombre varchar(70) not null,
direccion varchar(70) not null,
pais varchar(35) not null,
id_libro int not null,
id_autor int not null,
primary key(idEditorial),
foreign key (id_libro) references libros(idlibro),
foreign key (id_autor) references autores(idAutor));




--/*Consultas*/
select * from libros;

select autor from libro;
select autor,titulo from libro;


--/*CRUD*/
--/*Insertar libros*/
insert into libros(titulo,autor,editorial,fechaPublicacion,genero,cantidad,estado) 
values('El principito', 'Antoine de Saint-Exupéry', 'Éditions Gallimard', '1943-04-06', 'Narrativa', 8, 1);

--/*Insertar otros...*/

--/*Actualizar*/



update libro 
set titulo = 'lenguaje' 
where idlibro=1;

update libro 
set titulo = 'dias pasados', autor = 'Miguel' 
where idlibro = 1;

update libro 
set estado =0, titulo='amigos' 
where idlibro=1;

--/*Eliminar*/
delete from libro where idlibro = 3;
