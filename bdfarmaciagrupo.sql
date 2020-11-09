---ALUMNOS---
---LISETH GIRALDO--
---ALEJANDRO MONTOYA---
---LUZ TATIANA ZAPATA---
-- CREACION BASE DE DATOS--
create database farmacia
use farmacia
create table cliente(
cod_cliente int unique,
id_cliente bigint,
nombrecliente varchar(50) not null,
telefono bigint not null,
direccion varchar(60) not null,
constraint apdocliente primary key(cod_cliente))

insert into cliente values(1,32101903,'Juan Perez',3005121314, 'Cr 42 # 54-36')
insert into cliente values(2,4310190,'Juanita del Mar',3135121314, 'Cr 67 # 54-36')
insert into cliente values(3,3240190,'Flor Jimenez',314121314, 'Calle 42 # 54-36')
insert into cliente values(4,710434,'Pepe Rodriguez',301234314, 'Avenida 80 # 54-36')
insert into cliente values(5,70019034,'Juan Porras',3155121314, 'Circular 42 # 54-36')

select * from cliente
alter table cliente add fecha_nac date
update cliente set fecha_nac='1990-08-12' where cod_cliente=1
update cliente set fecha_nac='1997-04-02' where cod_cliente=2
update cliente set fecha_nac='1999-11-01' where cod_cliente=3
update cliente set fecha_nac='2005-01-13' where cod_cliente=4
update cliente set fecha_nac='1988-05-12' where cod_cliente=5
alter table cliente add email_cliente varchar(60)
update cliente set email_cliente='juan@hotmail.com' where cod_cliente=1
update cliente set email_cliente='pedrito@hotmail.com' where cod_cliente=2
update cliente set email_cliente='flor@hotmail.com' where cod_cliente=3
update cliente set email_cliente='pepe@hotmail.com' where cod_cliente=4
update cliente set email_cliente='porras@hotmail.com' where cod_cliente=5
create table empleado(
cod_empleado int unique,
id_empleado bigint,
nombreempleado varchar(60) not null,
tel_empleado bigint not null,
dir_empleado varchar (80),
email_empleado varchar(40),
constraint apodoempleado primary key (cod_empleado))

drop table empleado
insert into empleado values(1,32101903,'Carlos Perez',3145121314, 'Cr 45 # 54-36', 'carlosperez@hotmail.com')
insert into empleado values(2,43101903,'Pilar Perez',3165121314, 'Cr 45 # 54-36', 'Pilarerez@hotmail.com')
alter table empleado add fecha_nacempl date
update empleado set fecha_nacempl='2000-12-12' where cod_empleado=1
update empleado set fecha_nacempl='1978-01-12' where cod_empleado=2
select * from empleado

create table proveedor(
cod_proveedor int unique,
tipo_idprov varchar(10) not null,
id_prov int not null,
nombreproveedor varchar(60) not null,
contactoproveedor varchar(60) not null,
tel_proveedor bigint not null,
dir_proveedor varchar (80)not null,
email_proveedor varchar(40)not null,
constraint apodoprove primary key (cod_proveedor))
alter table proveedor add ciudad varchar (60)
insert into proveedor values(1,'nit',900081765,'Laboratorios America','Luz Lopez',3123453432,'Avenida 80 #30-50', 'luzlopez@labamerica.com','Medellin')
insert into proveedor values(2,'nit',800043545,'Laboratorios Cruz','Angel Gomez',321453432,'Carrera 56 #30-50', 'angelgomez@labcruz.com','Bogota')
select * from proveedor


create table producto(
cod_producto int unique,
nombre_producto varchar(60) not null,
precio_compra bigint not null,
precio_venta bigint not null,
reg_invima varchar(60) null,
lote varchar (20) null,
fecha_venci date null,
cod_proveedor1 int not null,
cod_pres1 int null,
cod_lab1 int null,
constraint apodoproducto primary key (cod_producto),
constraint apodoprov foreign key(cod_proveedor1) references proveedor(cod_proveedor),
constraint apodopresenta foreign key(cod_pres1) references presentacion(cod_pres),
constraint apodolabora foreign key (cod_lab1) references laboratorio(cod_lab)

drop table producto
select * from producto
insert into producto values(1,'Acetaminofen',500,1000,'2009M-0009447','L02869','2022-04-01',1,1,1)
insert into producto values(2,'Acetaminofen',5000,10000,'2009M-0009447','L02869','2022-04-01',1,2,1)
insert into producto values(3,'Noraver Garganta Menta',10000,12000,'2007M-006195 R1','8R9019A','2020-12-01',1,5,2)
insert into producto values(4,'Beclometasona Dipropionato Nasal',20000,25000,'2010M-0010923','801321','2021-04-01',1,5,1)
create table presentacion(
cod_pres int unique,
nombre_prese varchar(60) not null,
constraint apodoprese primary key (cod_pres))

insert into presentacion values(1,'Tabletas x 10')
insert into presentacion values(2,'Tabletas x 100')
insert into presentacion values(3,'Jarabe x 500 ML')
insert into presentacion values(4,'Jarabe x 120ML')
insert into presentacion values(5,'Spray 120ML')

select * from presentacion

create table laboratorio(
cod_lab int unique,
nombre_lab varchar(60) not null,
constraint apodolab primary key (cod_lab))

insert into laboratorio values (1, 'Genfar')
insert into laboratorio values (2,'Tecnofar')
insert into laboratorio values (3,'Coaspharma')

select * from laboratorio

create table forma_pago(
cod_formapago int unique,
nombre_formapago varchar(60) not null,
constraint apodoformapago primary key (cod_formapago))
drop table forma_pago
insert into forma_pago values (1,'efectivo')
insert into forma_pago values (2,'credito')
insert into forma_pago values (3,'Tarjetas')
select * from forma_pago
create table pedido_compra(
cod_pedido int unique,
fecha_pedido date not null,
cod_formapago1 int not null,
cod_empleado1 int not null,
cod_proveedor2 int not null,
cod_producto1 int not null,
cant int not null,
precio_compra1 bigint not null,
total_pedido bigint not null,
dto_pedido bigint not null,
impuesto bigint null,
constraint apodopedido primary key (cod_pedido),
constraint apodoformapagocompra foreign key(cod_formapago1) references forma_pago(cod_formapago),
constraint apodoemp foreign key(cod_empleado1) references empleado(cod_empleado),
constraint apodopr foreign key(cod_proveedor2) references proveedor(cod_proveedor),
constraint apodoprod foreign key(cod_producto1) references producto(cod_producto))
drop table pedido_compra
insert into pedido_compra values (1,'2020-11-09',1,1,1,1,100,500,50000,0,0)
select * from pedido_compra

nombre varchar(60) not null,
constraint apodolab primary key (cod_lab))



create table tripulacion_vuelo(
ide_tripulacion1 int,
ide_vuelo2 int,
constraint apodotripu_vuelo foreign key(ide_tripulacion1) references tripulacion (ide_tripulacion),
constraint apodovuelo_tripu foreign key(ide_vuelo2) references vuelo(ide_vuelo))
insert into tripulacion_vuelo values(01,1)
insert into tripulacion_vuelo values(02,2)

create table avion_base(
ide_base1 int,
placa_avion1 int,
constraint apodoavion_base foreign key(ide_base1) references base (ide_base),
constraint apodobase_avion foreign key(placa_avion1) references avion (placa_avion))
insert into avion_base values (1,100)
insert into avion_base values (2,100)
---filtro para traer valores no repetidos
select distinct nombrepiloto from piloto
---traer en un orden especifico
select * from piloto order by nombrepiloto, horavuelos
---modificar informacion
update piloto set nombrepiloto='ani' where ide_piloto=5
---borrar informacion
delete from piloto where nombrepiloto='ani'
---agregar otro atributo o campo
alter table piloto add telefono varchar(10)
---renombrar columna a la tabla
exec sp_rename 'piloto.horasvuelo','horavuelos','column'
---borrar columna
alter table piloto drop column telefono
---renombrar tabla
exec sp_rename
